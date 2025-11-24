import 'package:flutter/material.dart';
import '../models/note.dart';
import '../data/api_client.dart';
import '../data/notes_repository.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final NotesRepository repo;
  final List<Note> _items = [];
  int _page = 1;
  bool _canLoadMore = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    // ✅ Твой URL
    final client = ApiClient(
      baseUrl: 'https://691c4f723aaeed735c905921.mockapi.io/api/',
    );
    repo = NotesRepository(client);
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() {
      _page = 1;
      _canLoadMore = true;
      _items.clear();
    });
    await _loadMore();
  }

  Future<void> _loadMore() async {
    if (!_canLoadMore || _loading) return;
    setState(() => _loading = true);
    try {
      final batch = await repo.list(page: _page, limit: 20);
      if (mounted) {
        setState(() {
          _items.addAll(batch);
          _canLoadMore = batch.isNotEmpty;
          if (_canLoadMore) _page++;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка загрузки')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showCreateDialog() {
    final nameController = TextEditingController();
    final avatarController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Новая заметка'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Имя'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: avatarController,
                decoration: const InputDecoration(hintText: 'URL аватара'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final avatar = avatarController.text.trim();

              if (name.isEmpty) return;

              Navigator.of(context).pop(); // закрыть диалог

              try {
                final note = await repo.create(name, avatar);
                if (mounted) {
                  setState(() {
                    _items.insert(0, note); // добавить в начало
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Создано!')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ошибка создания')),
                  );
                }
              }
            },
            child: const Text('Создать'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заметки')),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateDialog,
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: _items.isEmpty && _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: _items.length + (_canLoadMore ? 1 : 0),
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  if (i == _items.length) {
                    // футер для дозагрузки
                    _loadMore();
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final note = _items[i];
                  return Card(
                    child: ListTile(
                      leading: note.avatar.isNotEmpty
                          ? CircleAvatar(
                              child: Image.network(
                                note.avatar,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CircularProgressIndicator(strokeWidth: 2);
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person, size: 30);
                                },
                              ),
                            )
                          : const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(note.name),
                      subtitle: Text(note.createdAt.split('T').first), // только дата
                      onTap: () {
                        // Можно открыть детали, если сделаешь NoteDetailsPage
                        // Пока пропустим или покажи SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ID: ${note.id}')),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () async {
                          try {
                            await repo.delete(note.id);
                            if (mounted) {
                              setState(() {
                                _items.removeWhere((n) => n.id == note.id);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Удалено')),
                              );
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Ошибка удаления')),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}