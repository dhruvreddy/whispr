import 'package:whispr/features/note/domain/entities/speech_result.dart';
import 'package:whispr/features/note/domain/repositories/speech_to_text_repositories.dart';
import 'package:whispr/injection.dart';

abstract class SpeechToTextUseCase {
  final _repository = injection<SpeechToTextRepositories>();
}

class InitializeSpeechToTextUseCase extends SpeechToTextUseCase {
  Future<bool> call() async {
    return await _repository.initialize();
  }
}

class StartListeningUseCase extends SpeechToTextUseCase {
  Stream<SpeechResult> call() async* {
    yield* _repository.listen();
  }
}

class StopListeningUseCase extends SpeechToTextUseCase {
  Future<void> call() async {
    return _repository.stop();
  }
}
