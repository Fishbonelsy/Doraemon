import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayHelper {
  static AudioPlayHelper instance;

  static AudioPlayHelper getInstance() {
    if (instance == null) {
      instance = AudioPlayHelper();
    }

    return instance;
  }

  AudioPlayer player;
  AudioCache audioCache;

  AudioPlayHelper() {
    player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    audioCache = AudioCache(fixedPlayer: player);
  }

  void playLocal(String path) async {
    audioCache.play(path);
  }
}
