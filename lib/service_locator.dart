import 'package:get_it/get_it.dart';

import 'data/respository/auth/auth_repository_impl.dart';
import 'data/respository/song/song_repo_impl.dart';
import 'data/source/auth/auth_firebase_service.dart';
import 'data/source/song/song_firebase_service.dart';
import 'domain/respository/auth/auth.dart';
import 'domain/respository/song/song.dart';
import 'domain/usecases/auth/get_user.dart';
import 'domain/usecases/auth/signin.dart';
import 'domain/usecases/auth/signup.dart';
import 'domain/usecases/song/add_or_remove_song.dart';
import 'domain/usecases/song/get_favorites_songs.dart';
import 'domain/usecases/song/get_news_songs.dart';
import 'domain/usecases/song/get_playlist.dart';
import 'domain/usecases/song/is_faviorte_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  sl.registerSingleton<AuthFirebaseService>(
      AuthFirebaseServiceImpl()
  );
  //
  sl.registerSingleton<SongFirebaseService>(
      SongFirebaseServiceImpl()
  );
  //
  //
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  //
  sl.registerSingleton<SongsRepository>(
      SongRepositoryImpl()
  );
  //
  //
  //
  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );
  //
  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );
  //
  sl.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase()
  );
  //
  sl.registerSingleton<GetPlayListUseCase>(
      GetPlayListUseCase()
  );
  //
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase()
  );
  //
  sl.registerSingleton<IsFavoriteSongUseCase>(
      IsFavoriteSongUseCase()
  );
  //
  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );
  //
  sl.registerSingleton<GetFavoriteSongsUseCase>(
      GetFavoriteSongsUseCase()
  );

}