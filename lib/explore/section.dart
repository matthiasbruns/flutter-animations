class Section {
  final String name;
  final List<Cell> cells;

  Section(this.name, this.cells);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Section &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              cells == other.cells;

  @override
  int get hashCode => name.hashCode ^ cells.hashCode;
}

class Cell {
  final String imageUrl;
  final String city;
  final String country;
  final int availableFlights;

  Cell(this.city, this.country, this.imageUrl, this.availableFlights);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Cell &&
              runtimeType == other.runtimeType &&
              imageUrl == other.imageUrl &&
              city == other.city &&
              country == other.country &&
              availableFlights == other.availableFlights;

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      city.hashCode ^
      country.hashCode ^
      availableFlights.hashCode;
}