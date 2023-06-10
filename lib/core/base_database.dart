abstract class BaseDatabase {
  Future<void> init();

  Future<void> close();

  Future<List<Map<String, dynamic>>?> retrieve({
    required String table,
    required String id,
  });

  Future<void> upsert({
    required String table,
    required Map<String, dynamic> data,
    String id,
  });
}
