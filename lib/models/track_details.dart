import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';

class TrackDetails {
  TrackDetails({
    required this.trackName,
    required this.trackRating,
    required this.explicit,
    required this.albumName,
    required this.artistName,
  });

  String trackName;
  int trackRating;
  int explicit;
  String albumName;
  String artistName;

  factory TrackDetails.fromJson(Map<String, dynamic> json) {
    return TrackDetails(
      trackName: json["track_name"],
      trackRating: json["track_rating"],
      explicit: json["explicit"],
      albumName: json["album_name"],
      artistName: json["artist_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "track_name": trackName,
        "track_rating": trackRating,
        "explicit": explicit,
        "album_name": albumName,
        "artist_name": artistName,
      };
}
