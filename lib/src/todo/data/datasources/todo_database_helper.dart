import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:todos_app/objectbox.g.dart';
import 'package:todos_app/src/todo/domain/entities/todo_entity.dart';

class TodoDatabaseHelper {
  static TodoDatabaseHelper? _databaseHelper;
  TodoDatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory TodoDatabaseHelper() => _databaseHelper ?? TodoDatabaseHelper._instance();

  static Store? _store;

  Future<Store?> get store async {
    _store ??= await _create();
    return _store;
  }

  Future<Store> _create() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, "TodoObjectBox");
    final store = await openStore(directory: dbPath);
    return store;
  }

  void close() async {
    try {
      _store?.close();
    } catch (e) {
      return;
    }
  }

  /// ////////////////////////
  /// Todo Store Functions ///
  /// ////////////////////////

  Future<List<TodoEntity>> getAllTodosLocal() async {
    final db = await store;
    final query = db!.box<TodoEntity>().query().order(TodoEntity_.createdAt, flags: Order.descending).build();
    final results = await query.findAsync();
    query.close();
    return results;
  }

  Future<TodoEntity> insertTodoLocal(TodoEntity userItem) async {
    final db = await store;
    return db!.box<TodoEntity>().putAndGetAsync(userItem, mode: PutMode.insert);
  }

  Future<bool> updateTodoLocal(TodoEntity userItem) async {
    final db = await store;
    await db!.box<TodoEntity>().putAsync(userItem, mode: PutMode.update);
    return true;
  }

  Future<bool> removeTodoLocal(int id) async {
    final db = await store;
    final query = db!.box<TodoEntity>().query(TodoEntity_.id.equals(id)).build();
    final results = await query.findAsync();
    query.close();
    await db.box<TodoEntity>().removeAsync(results[0].id);
    return true;
  }
}
