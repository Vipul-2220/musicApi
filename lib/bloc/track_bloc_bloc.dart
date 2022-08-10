import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/tracks.dart';
import '../models/tracks_service.dart';

part 'track_bloc_event.dart';
part 'track_bloc_state.dart';

class TrackBlocBloc extends Bloc<TrackBlocEvent, TrackBlocState> {
  TrackBlocBloc() : super(TrackBlocLoading()) {
    // on<TrackBlocEvent>((event, emit) {

    // });
    on<FetchTrack>((event, emit) async {
      await _onEventFetchTrack(event, emit);
    });
  }

  Future<void> _onEventFetchTrack(
      FetchTrack event, Emitter<TrackBlocState> emit) async {
    emit(TrackBlocLoading());
    try {
      var list = await TrackService().getTracks();

      emit(TrackBlocLoaded(trackList: list));
    } catch (er) {
      emit(TrackBlocNoConnection());
    }
  }
}
