import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../hero_gorouter.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final songs = database.recentlyPlayed;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Played'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final song = songs[index];
          final albumIdInt = int.tryParse(song.albumId)!;
          final album = database.albums[albumIdInt];
          return SongTile(
            album: album,
            song: song,
            onTap: () {
              GoRouter.of(context).go('/recents/song/${song.fullId}');
            },
          );
        },
        itemCount: songs.length,
      ),
    );
  }
}
