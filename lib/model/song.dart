class Song {
  final String id;
  final String albumId;
  final String title;
  final Duration duration;

  Song(this.id, this.albumId, this.title, this.duration);

  String get fullId => '$albumId-$id';
}
