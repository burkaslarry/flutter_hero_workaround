import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'song.dart';

class Album {
  final String id;
  final String title;
  final String artist;
  final Color color;
  final List<Song> songs;

  Album(this.id, this.title, this.artist, this.color, this.songs);
}
