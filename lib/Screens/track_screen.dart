import 'dart:developer';

import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:music_api/Screens/lyrics_screen.dart';
import 'package:music_api/models/tracks_service.dart';
import 'package:music_api/widget/track_list_tile.dart';

import '../models/tracks.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  bool isLoading = true;
  List<TrackList> trackList = [];
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      trackList = await TrackService().getTracks().then((value) {
        setState(() => isLoading = false);
        return value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'Trending',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                var track = trackList[index].track;
                return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            LyricsScreen(trackId: track.trackId.toString()))),
                    child: TrackListTile(
                      albumName: track.albumName,
                      artistName: track.artistName,
                      trackName: track.trackName,
                    ));
              },
              itemCount: trackList.length),
    );
  }
}
