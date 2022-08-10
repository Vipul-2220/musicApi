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
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Track Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : trackDetails != null
              ? Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackDetails!.trackName),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Artist Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackDetails!.artistName),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Album Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackDetails!.albumName),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Explicit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackDetails!.explicit == 0 ? 'False' : 'True'),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Ratings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackDetails!.trackRating.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Lyrics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(trackLyrics!.lyricsBody),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text('No Internet'),
                ),
    );
  }
}
