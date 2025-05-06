part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class SpeechToTextInitializedState extends NoteState {}

class SpeechToTextListeningState extends NoteState {}

class SpeechToTextResultState extends NoteState {
  final SpeechResult speechResult;

  const SpeechToTextResultState({
    required this.speechResult,
  });
}

class SpeechToTextStoppedState extends NoteState {}

class SpeechToTextErrorState extends NoteState {
  final String error;

  const SpeechToTextErrorState(
    this.error,
  );
}
