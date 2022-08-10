import 'dart:developer';
// import 'package:bloc/bloc.dart';
// import 'flutter_bloc';

import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_api/Screens/lyrics_screen.dart';
import 'package:music_api/models/tracks_service.dart';
import 'package:music_api/widget/track_list_tile.dart';

import '../bloc/track_bloc_bloc.dart';
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
      // emit();
      // trackList = await TrackService().getTracks().then((value) {
      //   setState(() => isLoading = false);
      //   return value;
      // });
      BlocProvider.of<TrackBlocBloc>(context).add(FetchTrack());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBlocBloc, TrackBlocState>(
      builder: (context, state) {
        if (state is TrackBlocLoaded) {
          trackList = state.trackList;
        }
        // var isLoading = BlocProvider.of<TrackBlocBloc>(context).state
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            title: const Text(
              'Trending',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: state is TrackBlocLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is TrackBlocLoaded
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        var track = trackList[index].track;
                        return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LyricsScreen(
                                        trackId: track.trackId.toString()))),
                            child: TrackListTile(
                              albumName: track.albumName,
                              artistName: track.artistName,
                              trackName: track.trackName,
                            ));
                      },
                      itemCount: trackList.length)
                  : const Center(
                      child: Text('No Internet Connection'),
                    ),
        );
      },
    );
  }
}
