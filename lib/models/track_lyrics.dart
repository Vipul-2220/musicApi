import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';

class TrackLyrics {
  TrackLyrics({
    required this.lyricsBody,
  });

  String lyricsBody;

  factory TrackLyrics.fromJson(Map<String, dynamic> json) {
    return TrackLyrics(
      lyricsBody: json["lyrics_body"],
    );
  }

  Map<String, dynamic> toJson() => {
        "lyrics_body": lyricsBody,
      };
}
