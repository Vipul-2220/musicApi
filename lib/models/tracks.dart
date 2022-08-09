import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

// List<Track> getTracks(Map<String, dynamic> json) => Track.fromJson(json);

class Welcome {
  Welcome({
    required this.message,
  });

  Message message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.header,
    required this.body,
  });

  Header header;
  Body body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    required this.trackList,
  });

  List<TrackList> trackList;

  factory Body.fromJson(Map<String, dynamic> json) {
    // log('Json in body : $json');
    // for (var i in json.keys) {
    //   log(i);
    // }
    // return Body(trackList: []);
    return Body(
      trackList: List<TrackList>.from(json['message']['body']['track_list']
          .map((x) => TrackList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "track_list": List<dynamic>.from(trackList.map((x) => x.toJson())),
      };
}

class TrackList {
  TrackList({
    required this.track,
  });

  Track track;

  factory TrackList.fromJson(Map<String, dynamic> json) => TrackList(
        track: Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track.toJson(),
      };
}

class Track {
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackNameTranslationList,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
  });

  int trackId;
  String trackName;
  List<TrackNameTranslationList> trackNameTranslationList;
  int trackRating;
  int commontrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichsync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  DateTime updatedTime;
  PrimaryGenres primaryGenres;

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackId: json["track_id"],
      trackName: json["track_name"],
      trackNameTranslationList: List<TrackNameTranslationList>.from(
          json["track_name_translation_list"]
              .map((x) => TrackNameTranslationList.fromJson(x))),
      trackRating: json["track_rating"],
      commontrackId: json["commontrack_id"],
      instrumental: json["instrumental"],
      explicit: json["explicit"],
      hasLyrics: json["has_lyrics"],
      hasSubtitles: json["has_subtitles"],
      hasRichsync: json["has_richsync"],
      numFavourite: json["num_favourite"],
      albumId: json["album_id"],
      albumName: json["album_name"],
      artistId: json["artist_id"],
      artistName: json["artist_name"],
      trackShareUrl: json["track_share_url"],
      trackEditUrl: json["track_edit_url"],
      restricted: json["restricted"],
      updatedTime: DateTime.parse(json["updated_time"]),
      primaryGenres: PrimaryGenres.fromJson(json["primary_genres"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_name": trackName,
        "track_name_translation_list":
            List<dynamic>.from(trackNameTranslationList.map((x) => x.toJson())),
        "track_rating": trackRating,
        "commontrack_id": commontrackId,
        "instrumental": instrumental,
        "explicit": explicit,
        "has_lyrics": hasLyrics,
        "has_subtitles": hasSubtitles,
        "has_richsync": hasRichsync,
        "num_favourite": numFavourite,
        "album_id": albumId,
        "album_name": albumName,
        "artist_id": artistId,
        "artist_name": artistName,
        "track_share_url": trackShareUrl,
        "track_edit_url": trackEditUrl,
        "restricted": restricted,
        "updated_time": updatedTime.toIso8601String(),
        "primary_genres": primaryGenres.toJson(),
      };
}

class PrimaryGenres {
  PrimaryGenres({
    required this.musicGenreList,
  });

  List<MusicGenreList> musicGenreList;

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) => PrimaryGenres(
        musicGenreList: List<MusicGenreList>.from(
            json["music_genre_list"].map((x) => MusicGenreList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "music_genre_list":
            List<dynamic>.from(musicGenreList.map((x) => x.toJson())),
      };
}

class MusicGenreList {
  MusicGenreList({
    required this.musicGenre,
  });

  MusicGenre musicGenre;

  factory MusicGenreList.fromJson(Map<String, dynamic> json) => MusicGenreList(
        musicGenre: MusicGenre.fromJson(json["music_genre"]),
      );

  Map<String, dynamic> toJson() => {
        "music_genre": musicGenre.toJson(),
      };
}

class MusicGenre {
  MusicGenre({
    required this.musicGenreId,
    required this.musicGenreParentId,
    required this.musicGenreName,
    required this.musicGenreNameExtended,
    required this.musicGenreVanity,
  });

  int musicGenreId;
  int musicGenreParentId;
  String musicGenreName;
  String musicGenreNameExtended;
  String musicGenreVanity;

  factory MusicGenre.fromJson(Map<String, dynamic> json) => MusicGenre(
        musicGenreId: json["music_genre_id"],
        musicGenreParentId: json["music_genre_parent_id"],
        musicGenreName: json["music_genre_name"],
        musicGenreNameExtended: json["music_genre_name_extended"],
        musicGenreVanity: json["music_genre_vanity"],
      );

  Map<String, dynamic> toJson() => {
        "music_genre_id": musicGenreId,
        "music_genre_parent_id": musicGenreParentId,
        "music_genre_name": musicGenreName,
        "music_genre_name_extended": musicGenreNameExtended,
        "music_genre_vanity": musicGenreVanity,
      };
}

class TrackNameTranslationList {
  TrackNameTranslationList({
    required this.trackNameTranslation,
  });

  TrackNameTranslation trackNameTranslation;

  factory TrackNameTranslationList.fromJson(Map<String, dynamic> json) =>
      TrackNameTranslationList(
        trackNameTranslation:
            TrackNameTranslation.fromJson(json["track_name_translation"]),
      );

  Map<String, dynamic> toJson() => {
        "track_name_translation": trackNameTranslation.toJson(),
      };
}

class TrackNameTranslation {
  TrackNameTranslation({
    required this.language,
    required this.translation,
  });

  String language;
  String translation;

  factory TrackNameTranslation.fromJson(Map<String, dynamic> json) =>
      TrackNameTranslation(
        language: json["language"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "translation": translation,
      };
}

class Header {
  Header({
    required this.statusCode,
    required this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}
