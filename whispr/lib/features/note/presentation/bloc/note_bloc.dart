import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:whispr/features/note/domain/entities/speech_result.dart';
import 'package:whispr/features/note/domain/usecases/speech_to_text_use_case.dart';
import 'package:whispr/injection.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  // final _initializeUseCase = injection<InitializeSpeechToTextUseCase>();
  // final _startListeningUseCase = injection<StartListeningUseCase>();
  // final _stopListeningUseCase = injection<StopListeningUseCase>();

  // StreamSubscription<SpeechResult>? _speechSub;

  NoteBloc() : super(NoteInitial()) {
    // on<SpeechToTextInitEvent>(_onSpeechToTextInitEvent);
    // on<AddSpeechToTextEvent>(_onAddSpeechToTextEvent);
    // on<SpeechToTextStopEvent>(_onStopSpeechToTextEvent);
  }

  // Future<void> _onSpeechToTextInitEvent(
  //   SpeechToTextInitEvent event,
  //   Emitter<NoteState> emit,
  // ) async {
  //   try {
  //     await _initializeUseCase.call();
  //     emit(SpeechToTextInitializedState());
  //   } catch (e) {
  //     emit(SpeechToTextErrorState(e.toString()));
  //   }
  // }

  // Future<void> _onAddSpeechToTextEvent(
  //   AddSpeechToTextEvent event,
  //   Emitter<NoteState> emit,
  // ) async {
  //   emit(SpeechToTextListeningState());

  //   _speechSub?.cancel();
  //   _speechSub = _startListeningUseCase.call().debounceTime(const Duration(milliseconds: 300)).listen(
  //     (speechResult) {
  //       print('Speech: ${speechResult.recognizedWords}');
  //       emit(SpeechToTextResultState(speechResult: speechResult));
  //     },
  //     onError: (error) {
  //       emit(SpeechToTextErrorState(error.toString()));
  //     },
  //   );
  // }

  // Future<void> _onStopSpeechToTextEvent(
  //   SpeechToTextStopEvent event,
  //   Emitter<NoteState> emit,
  // ) async {
  //   await _stopListeningUseCase.call();
  //   await _speechSub?.cancel();
  //   _speechSub = null;
  //   emit(NoteInitial());
  // }

  // @override
  // Future<void> close() {
  //   _speechSub?.cancel();
  //   return super.close();
  // }
}


/**
 * For those who enjoy photography, an app that analyzes your photos and suggests editing techniques or composition improvements based on photography principles and your style could elevate your skills.
 * 
 */