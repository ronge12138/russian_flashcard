import 'package:hive/hive.dart';

part 'word_card.g.dart';

const List<int> kSrsIntervalMinutes = [
  5, 30, 720, 1440, 2880, 5760, 10080, 21600,
];

@HiveType(typeId: 1)
enum WordCategory {
  @HiveField(0) daily,
  @HiveField(1) travel,
  @HiveField(2) business,
  @HiveField(3) grammar,
  @HiveField(4) custom,
}

@HiveType(typeId: 2)
enum MasteryStatus {
  @HiveField(0) newWord,
  @HiveField(1) learning,
  @HiveField(2) reviewing,
  @HiveField(3) mastered,
}

@HiveType(typeId: 0)
class WordCard extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String word;

  @HiveField(2)
  late String wordForTts;

  @HiveField(3)
  late String phonetic;

  @HiveField(4)
  late String meaning;

  @HiveField(5)
  late String partOfSpeech;

  @HiveField(6)
  late List<String> examplesRu;

  @HiveField(7)
  late List<String> examplesZh;

  @HiveField(8)
  int reviewStage = 0;

  @HiveField(9)
  int nextReviewAt = 0;

  @HiveField(10)
  double easeFactor = 2.5;

  @HiveField(11)
  int reviewCount = 0;

  @HiveField(12)
  int consecutiveCorrect = 0;

  @HiveField(13)
  WordCategory category = WordCategory.custom;

  @HiveField(14)
  MasteryStatus masteryStatus = MasteryStatus.newWord;

  @HiveField(15)
  bool isStarred = false;

  @HiveField(16)
  late int createdAt;

  @HiveField(17)
  int lastReviewedAt = 0;

  WordCard();

  factory WordCard.create({
    required String word,
    required String phonetic,
    required String meaning,
    required String partOfSpeech,
    required List<String> examplesRu,
    required List<String> examplesZh,
    WordCategory category = WordCategory.custom,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return WordCard()
      ..id = now.toString()
      ..word = word
      ..wordForTts = stripAccents(word)
      ..phonetic = phonetic
      ..meaning = meaning
      ..partOfSpeech = partOfSpeech
      ..examplesRu = examplesRu
      ..examplesZh = examplesZh
      ..category = category
      ..nextReviewAt = now
      ..createdAt = now;
  }

  static String stripAccents(String text) {
    return text.replaceAll('\u0301', '');
  }

  bool get isDue =>
      DateTime.now().millisecondsSinceEpoch >= nextReviewAt;

  MasteryStatus get computedMastery {
    if (reviewCount == 0) return MasteryStatus.newWord;
    if (reviewStage <= 1) return MasteryStatus.learning;
    if (reviewStage >= 6) return MasteryStatus.mastered;
    return MasteryStatus.reviewing;
  }

  String get nextReviewReadable {
    final diff = nextReviewAt - DateTime.now().millisecondsSinceEpoch;
    if (diff <= 0) return '现在';
    final minutes = diff ~/ 60000;
    if (minutes < 60) return '$minutes 分钟后';
    final hours = minutes ~/ 60;
    if (hours < 24) return '$hours 小时后';
    return '${hours ~/ 24} 天后';
  }
}
