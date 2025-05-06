part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class SpeechToTextInitEvent extends NoteEvent {}

class AddSpeechToTextEvent extends NoteEvent {}

class SpeechToTextStopEvent extends NoteEvent {}
