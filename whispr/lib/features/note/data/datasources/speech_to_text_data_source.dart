import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:whispr/injection.dart';

import '../../domain/entities/speech_result.dart';

abstract interface class SpeechToTextDataSource {
  Future<bool> initialize();
  Stream<SpeechResult> listen();
  Future<void> stop();
}

final class SpeechToTextDataSourceImpl implements SpeechToTextDataSource {
  final _speechToText = injection<SpeechToText>();

  @override
  Future<bool> initialize() async {
    return await _speechToText.initialize();
  }

  @override
  Stream<SpeechResult> listen() async* {
    final controller = StreamController<SpeechResult>();
    _speechToText.listen(
      onResult: (val) {
        final speechResult = SpeechResult(
          recognizedWords: val.recognizedWords,
          confidence: val.hasConfidenceRating ? val.confidence : 1.0,
        );
        controller.add(speechResult);
      },
    );
    // print(controller.stream);
    yield* controller.stream;
  }

  @override
  Future<void> stop() async {
    await _speechToText.stop();
  }
}
