import 'dart:developer';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:music_api/models/track_details.dart';
import 'package:music_api/models/track_lyrics.dart';
import 'package:music_api/models/tracks.dart';
import 'package:http/http.dart' as http;

class TrackService {
  Future<List<TrackList>> getTracks() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;

      // log('$json');

      // return [];
      return Body.fromJson(json).trackList;
    } else {
      return [];
    }
  }

  Future<TrackDetails?> getTrackDetails({required String trackId}) async {
    var client = http.Client();

    String url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    url = url.replaceFirst("TRACK_ID", trackId);

    var uri = Uri.parse(url);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;

      // log('$json');

      // return [];
      return TrackDetails.fromJson(json['message']['body']['track']);
    } else {
      return null;
    }
  }

  Future<TrackLyrics?> getTrackLyrics({required String trackId}) async {
    var client = http.Client();

    String url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=TRACK_ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    url = url.replaceFirst("TRACK_ID", trackId);

    var uri = Uri.parse(url);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;

      // log('$json');

      // return [];
      return TrackLyrics.fromJson(json['message']['body']['lyrics']);
    } else {
      return null;
    }
  }
}
