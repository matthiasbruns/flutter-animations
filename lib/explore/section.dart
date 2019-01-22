class Section {
  final String name;
  final List<Destination> cells;

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

class Destination {
  final String tag;
  final String imageUrl;
  final String city;
  final String country;
  final String flagUrl;
  final int availableFlights;
  final List<String> additionalImageUrls;

  List<String> get galleryUrls {
    return <String>[imageUrl]..addAll(additionalImageUrls);
  }

  Destination(this.tag, this.city, this.country, this.imageUrl,
      this.availableFlights, this.flagUrl, this.additionalImageUrls);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Destination &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          city == other.city &&
          country == other.country &&
          availableFlights == other.availableFlights &&
          flagUrl == other.flagUrl;

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      city.hashCode ^
      country.hashCode ^
      availableFlights.hashCode ^
      flagUrl.hashCode;
}
