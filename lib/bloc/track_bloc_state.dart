part of 'track_bloc_bloc.dart';

@immutable
abstract class TrackBlocState {}

class TrackBlocLoading extends TrackBlocState {
  // final bool isLoading;
  TrackBlocLoading(
      // {required this.isLoading}
      );
}

class TrackBlocLoaded extends TrackBlocState {
  final List<TrackList> trackList;
  TrackBlocLoaded({required this.trackList});
}

class TrackBlocNoConnection extends TrackBlocState {
  TrackBlocNoConnection();
}
