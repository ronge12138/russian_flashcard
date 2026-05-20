// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordCardAdapter extends TypeAdapter<WordCard> {
  @override
  final int typeId = 0;

  @override
  WordCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordCard()
      ..id = fields[0] as String
      ..word = fields[1] as String
      ..wordForTts = fields[2] as String
      ..phonetic = fields[3] as String
      ..meaning = fields[4] as String
      ..partOfSpeech = fields[5] as String
      ..examplesRu = (fields[6] as List).cast<String>()
      ..examplesZh = (fields[7] as List).cast<String>()
      ..reviewStage = fields[8] as int
      ..nextReviewAt = fields[9] as int
      ..easeFactor = fields[10] as double
      ..reviewCount = fields[11] as int
      ..consecutiveCorrect = fields[12] as int
      ..category = fields[13] as WordCategory
      ..masteryStatus = fields[14] as MasteryStatus
      ..isStarred = fields[15] as bool
      ..createdAt = fields[16] as int
      ..lastReviewedAt = fields[17] as int;
  }

  @override
  void write(BinaryWriter writer, WordCard obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.wordForTts)
      ..writeByte(3)
      ..write(obj.phonetic)
      ..writeByte(4)
      ..write(obj.meaning)
      ..writeByte(5)
      ..write(obj.partOfSpeech)
      ..writeByte(6)
      ..write(obj.examplesRu)
      ..writeByte(7)
      ..write(obj.examplesZh)
      ..writeByte(8)
      ..write(obj.reviewStage)
      ..writeByte(9)
      ..write(obj.nextReviewAt)
      ..writeByte(10)
      ..write(obj.easeFactor)
      ..writeByte(11)
      ..write(obj.reviewCount)
      ..writeByte(12)
      ..write(obj.consecutiveCorrect)
      ..writeByte(13)
      ..write(obj.category)
      ..writeByte(14)
      ..write(obj.masteryStatus)
      ..writeByte(15)
      ..write(obj.isStarred)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.lastReviewedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WordCategoryAdapter extends TypeAdapter<WordCategory> {
  @override
  final int typeId = 1;

  @override
  WordCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WordCategory.daily;
      case 1:
        return WordCategory.travel;
      case 2:
        return WordCategory.business;
      case 3:
        return WordCategory.grammar;
      case 4:
        return WordCategory.custom;
      default:
        return WordCategory.daily;
    }
  }

  @override
  void write(BinaryWriter writer, WordCategory obj) {
    switch (obj) {
      case WordCategory.daily:
        writer.writeByte(0);
        break;
      case WordCategory.travel:
        writer.writeByte(1);
        break;
      case WordCategory.business:
        writer.writeByte(2);
        break;
      case WordCategory.grammar:
        writer.writeByte(3);
        break;
      case WordCategory.custom:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MasteryStatusAdapter extends TypeAdapter<MasteryStatus> {
  @override
  final int typeId = 2;

  @override
  MasteryStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MasteryStatus.newWord;
      case 1:
        return MasteryStatus.learning;
      case 2:
        return MasteryStatus.reviewing;
      case 3:
        return MasteryStatus.mastered;
      default:
        return MasteryStatus.newWord;
    }
  }

  @override
  void write(BinaryWriter writer, MasteryStatus obj) {
    switch (obj) {
      case MasteryStatus.newWord:
        writer.writeByte(0);
        break;
      case MasteryStatus.learning:
        writer.writeByte(1);
        break;
      case MasteryStatus.reviewing:
        writer.writeByte(2);
        break;
      case MasteryStatus.mastered:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasteryStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
