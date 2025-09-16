import 'dart:collection';

class Validator {
  const Validator._();

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool isNullOrWhiteSpace(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool isNullOrEmptyList<T>(List<T>? list) {
    return list == null || list.isEmpty;
  }

  static bool isNullOrEmptyMap<K, V>(Map<K, V>? map) {
    return map == null || map.isEmpty;
  }

  static bool isNull(dynamic value) {
    return value == null;
  }

  static bool isNotNullOrEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  static bool isNotNullOrWhiteSpace(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static bool isNotNullOrEmptyList<T>(List<T>? list) {
    return list != null && list.isNotEmpty;
  }

  static bool isNotNullOrEmptyMap<K, V>(Map<K, V>? map) {
    return map != null && map.isNotEmpty;
  }

  static bool isNotNull(dynamic value) {
    return value != null;
  }

  static bool isNotNullOrEmptyIterable(Iterable? iterable) {
    return iterable != null && iterable.isNotEmpty;
  }

  static bool isNotNullOrEmptySet<T>(Set<T>? set) {
    return set != null && set.isNotEmpty;
  }

  static bool isNotNullOrEmptyQueue<T>(Queue<T>? queue) {
    return queue != null && queue.isNotEmpty;
  }
}
