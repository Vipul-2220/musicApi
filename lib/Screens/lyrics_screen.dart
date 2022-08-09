import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:music_api/models/track_details.dart';
import 'package:music_api/models/track_lyrics.dart';
import 'package:music_api/models/tracks_service.dart';

class LyricsScreen extends StatefulWidget {
  final String trackId;
  const LyricsScreen({Key? key, required this.trackId}) : super(key: key);

  @override
  State<LyricsScreen> createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  bool isLoading = true;

  TrackDetails? trackDetails;

  TrackLyrics? trackLyrics;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      trackDetails = await TrackService()
          .getTrackDetails(trackId: widget.trackId)
          .then((value) {
        return value;
      });

      trackLyrics = await TrackService()
          .getTrackLyrics(trackId: widget.trackId)
          .then((value) {
        setState(() => isLoading = false);
        return value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : trackDetails != null
              ? Column(
                  children: [
                    Text(trackDetails!.albumName),
                    Text(trackLyrics!.lyricsBody),
                  ],
                )
              : const Center(
                  child: Text('No Internet'),
                ),
    );
  }
}
