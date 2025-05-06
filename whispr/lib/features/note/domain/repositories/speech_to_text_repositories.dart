import '../entities/speech_result.dart';

abstract class SpeechToTextRepositories {
  Future<bool> initialize();
  Stream<SpeechResult> listen();
  Future<void> stop();
}
