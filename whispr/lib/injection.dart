import 'package:get_it/get_it.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:whispr/features/note/data/datasources/speech_to_text_data_source.dart';
import 'package:whispr/features/note/data/repositories/speech_to_text_repositories_impl.dart';
import 'package:whispr/features/note/domain/repositories/speech_to_text_repositories.dart';
import 'package:whispr/features/note/domain/usecases/speech_to_text_use_case.dart';

final GetIt injection = GetIt.instance;

void service() {
  injection.registerSingleton<SpeechToText>(SpeechToText());
  injection.registerSingleton<SpeechToTextDataSource>(SpeechToTextDataSourceImpl());
  injection.registerSingleton<SpeechToTextDataSourceImpl>(SpeechToTextDataSourceImpl());
  injection.registerSingleton<SpeechToTextRepositories>(SpeechToTextRepositoriesImpl());
  injection.registerSingleton<SpeechToTextRepositoriesImpl>(SpeechToTextRepositoriesImpl());
  injection.registerSingleton<InitializeSpeechToTextUseCase>(InitializeSpeechToTextUseCase());
  injection.registerSingleton<StartListeningUseCase>(StartListeningUseCase());
  injection.registerSingleton<StopListeningUseCase>(StopListeningUseCase());
}
