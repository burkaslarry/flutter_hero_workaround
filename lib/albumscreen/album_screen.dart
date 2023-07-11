import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../hero_gorouter.dart';

//Detail Page of Album
class AlbumScreen extends StatelessWidget {
  final String? albumId;

  const AlbumScreen({
    required this.albumId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final albumIdInt = int.tryParse(albumId ?? '');
    final album = database.albums[albumIdInt!];
    return Scaffold(
      appBar: AppBar(
        title: Text('Album - ${album.title}'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                //Destination Hero Object
                Hero(
                    tag: albumId ?? '',
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Container(
                        color: album.color,
                        margin: const EdgeInsets.all(8),
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        album.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        album.artist,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final song = album.songs[index];
                  return ListTile(
                    title: Text(song.title),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        color: album.color,
                        margin: const EdgeInsets.all(8),
                      ),
                    ),
                    trailing: SongDuration(
                      duration: song.duration,
                    ),
                    onTap: () {
                      GoRouter.of(context)
                          .go('/library/album/$albumId/song/${song.fullId}');
                    },
                  );
                },
                itemCount: album.songs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback? onTap;

  const AlbumTile({Key? key, required this.album, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Startpoint Hero Object
      leading: Hero(
        tag: album
            .id, // <---object has unique memory address under same navigation stack
        child: SizedBox(
          width: 50,
          height: 50,
          child: Container(
            color: album.color,
          ),
        ),
      ),
      title: Text(album.title),
      subtitle: Text(album.artist),
      onTap: onTap,
    );
  }
}
