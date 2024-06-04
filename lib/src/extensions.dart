extension RangeNum on num {
  bool isBetween(num a, num b) {
    //not  ( both greater || both lesser )
    return !((a > this && b > this) || (a < this && b < this));
  }

  bool isBetweenExclusive(num a, num b) {
    return !((a >= this && b >= this) || (a <= this && b <= this));
  }
}

extension StringAletheiaExtension on String? {
  /// Capitalize the first letter in a string.
  String get capitalize {
    return (this!.length > 1) ? this![0].toUpperCase() + this!.substring(1) : this!.toUpperCase();
  }

  /// returns true if the list is null
  get isNull => this == null;

  /// returns true if the list is null or empty
  bool get isEmptyOrNull => (isNull || (this != null && this?.isEmpty == true)) ? true : false;

  /// returns true if the list is not null and not empty
  bool get isNotEmptyOrNull => !isEmptyOrNull;
}

extension ListExtension<T> on List<T?>? {
  /// returns the last element of the list or Null if the list is null or empty
  T? get lastOrNull => !this.isNull && this!.isNotEmptyOrNull ? this!.last : null;

  /// returns true if the list is null
  get isNull => this == null;

  /// returns true if the list is null or empty
  bool get isEmptyOrNull => (this.isNull || (this != null && this?.isEmpty == true)) ? true : false;

  /// returns true if the list is not null and not empty
  bool get isNotEmptyOrNull => !this.isEmptyOrNull;
}
