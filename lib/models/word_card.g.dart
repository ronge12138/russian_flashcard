// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_card.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordCardCollection on Isar {
  IsarCollection<WordCard> get wordCards => this.collection();
}

const WordCardSchema = CollectionSchema(
  name: r'WordCard',
  id: -6516251138330599728,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
      enumMap: _WordCardcategoryEnumValueMap,
    ),
    r'consecutiveCorrect': PropertySchema(
      id: 1,
      name: r'consecutiveCorrect',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'easeFactor': PropertySchema(
      id: 3,
      name: r'easeFactor',
      type: IsarType.double,
    ),
    r'examplesRu': PropertySchema(
      id: 4,
      name: r'examplesRu',
      type: IsarType.stringList,
    ),
    r'examplesZh': PropertySchema(
      id: 5,
      name: r'examplesZh',
      type: IsarType.stringList,
    ),
    r'isStarred': PropertySchema(
      id: 6,
      name: r'isStarred',
      type: IsarType.bool,
    ),
    r'lastReviewedAt': PropertySchema(
      id: 7,
      name: r'lastReviewedAt',
      type: IsarType.long,
    ),
    r'masteryStatus': PropertySchema(
      id: 8,
      name: r'masteryStatus',
      type: IsarType.string,
      enumMap: _WordCardmasteryStatusEnumValueMap,
    ),
    r'meaning': PropertySchema(
      id: 9,
      name: r'meaning',
      type: IsarType.string,
    ),
    r'nextReviewAt': PropertySchema(
      id: 10,
      name: r'nextReviewAt',
      type: IsarType.long,
    ),
    r'partOfSpeech': PropertySchema(
      id: 11,
      name: r'partOfSpeech',
      type: IsarType.string,
    ),
    r'phonetic': PropertySchema(
      id: 12,
      name: r'phonetic',
      type: IsarType.string,
    ),
    r'reviewCount': PropertySchema(
      id: 13,
      name: r'reviewCount',
      type: IsarType.long,
    ),
    r'reviewStage': PropertySchema(
      id: 14,
      name: r'reviewStage',
      type: IsarType.long,
    ),
    r'word': PropertySchema(
      id: 15,
      name: r'word',
      type: IsarType.string,
    ),
    r'wordForTts': PropertySchema(
      id: 16,
      name: r'wordForTts',
      type: IsarType.string,
    )
  },
  estimateSize: _wordCardEstimateSize,
  serialize: _wordCardSerialize,
  deserialize: _wordCardDeserialize,
  deserializeProp: _wordCardDeserializeProp,
  idName: r'id',
  indexes: {
    r'word': IndexSchema(
      id: -2031626334120420267,
      name: r'word',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'word',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'reviewStage': IndexSchema(
      id: 4098605731764601852,
      name: r'reviewStage',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reviewStage',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'nextReviewAt': IndexSchema(
      id: -3214419740154650383,
      name: r'nextReviewAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nextReviewAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'masteryStatus': IndexSchema(
      id: 6196450160421297827,
      name: r'masteryStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'masteryStatus',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _wordCardGetId,
  getLinks: _wordCardGetLinks,
  attach: _wordCardAttach,
  version: '3.1.0+1',
);

int _wordCardEstimateSize(
  WordCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.examplesRu.length * 3;
  {
    for (var i = 0; i < object.examplesRu.length; i++) {
      final value = object.examplesRu[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.examplesZh.length * 3;
  {
    for (var i = 0; i < object.examplesZh.length; i++) {
      final value = object.examplesZh[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.masteryStatus.name.length * 3;
  bytesCount += 3 + object.meaning.length * 3;
  bytesCount += 3 + object.partOfSpeech.length * 3;
  bytesCount += 3 + object.phonetic.length * 3;
  bytesCount += 3 + object.word.length * 3;
  bytesCount += 3 + object.wordForTts.length * 3;
  return bytesCount;
}

void _wordCardSerialize(
  WordCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category.name);
  writer.writeLong(offsets[1], object.consecutiveCorrect);
  writer.writeLong(offsets[2], object.createdAt);
  writer.writeDouble(offsets[3], object.easeFactor);
  writer.writeStringList(offsets[4], object.examplesRu);
  writer.writeStringList(offsets[5], object.examplesZh);
  writer.writeBool(offsets[6], object.isStarred);
  writer.writeLong(offsets[7], object.lastReviewedAt);
  writer.writeString(offsets[8], object.masteryStatus.name);
  writer.writeString(offsets[9], object.meaning);
  writer.writeLong(offsets[10], object.nextReviewAt);
  writer.writeString(offsets[11], object.partOfSpeech);
  writer.writeString(offsets[12], object.phonetic);
  writer.writeLong(offsets[13], object.reviewCount);
  writer.writeLong(offsets[14], object.reviewStage);
  writer.writeString(offsets[15], object.word);
  writer.writeString(offsets[16], object.wordForTts);
}

WordCard _wordCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WordCard();
  object.category =
      _WordCardcategoryValueEnumMap[reader.readStringOrNull(offsets[0])] ??
          WordCategory.daily;
  object.consecutiveCorrect = reader.readLong(offsets[1]);
  object.createdAt = reader.readLong(offsets[2]);
  object.easeFactor = reader.readDouble(offsets[3]);
  object.examplesRu = reader.readStringList(offsets[4]) ?? [];
  object.examplesZh = reader.readStringList(offsets[5]) ?? [];
  object.id = id;
  object.isStarred = reader.readBool(offsets[6]);
  object.lastReviewedAt = reader.readLong(offsets[7]);
  object.masteryStatus =
      _WordCardmasteryStatusValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          MasteryStatus.newWord;
  object.meaning = reader.readString(offsets[9]);
  object.nextReviewAt = reader.readLong(offsets[10]);
  object.partOfSpeech = reader.readString(offsets[11]);
  object.phonetic = reader.readString(offsets[12]);
  object.reviewCount = reader.readLong(offsets[13]);
  object.reviewStage = reader.readLong(offsets[14]);
  object.word = reader.readString(offsets[15]);
  object.wordForTts = reader.readString(offsets[16]);
  return object;
}

P _wordCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_WordCardcategoryValueEnumMap[reader.readStringOrNull(offset)] ??
          WordCategory.daily) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_WordCardmasteryStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MasteryStatus.newWord) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WordCardcategoryEnumValueMap = {
  r'daily': r'daily',
  r'travel': r'travel',
  r'business': r'business',
  r'grammar': r'grammar',
  r'custom': r'custom',
};
const _WordCardcategoryValueEnumMap = {
  r'daily': WordCategory.daily,
  r'travel': WordCategory.travel,
  r'business': WordCategory.business,
  r'grammar': WordCategory.grammar,
  r'custom': WordCategory.custom,
};
const _WordCardmasteryStatusEnumValueMap = {
  r'newWord': r'newWord',
  r'learning': r'learning',
  r'reviewing': r'reviewing',
  r'mastered': r'mastered',
};
const _WordCardmasteryStatusValueEnumMap = {
  r'newWord': MasteryStatus.newWord,
  r'learning': MasteryStatus.learning,
  r'reviewing': MasteryStatus.reviewing,
  r'mastered': MasteryStatus.mastered,
};

Id _wordCardGetId(WordCard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordCardGetLinks(WordCard object) {
  return [];
}

void _wordCardAttach(IsarCollection<dynamic> col, Id id, WordCard object) {
  object.id = id;
}

extension WordCardQueryWhereSort on QueryBuilder<WordCard, WordCard, QWhere> {
  QueryBuilder<WordCard, WordCard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhere> anyWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'word'),
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhere> anyReviewStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'reviewStage'),
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhere> anyNextReviewAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nextReviewAt'),
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension WordCardQueryWhere on QueryBuilder<WordCard, WordCard, QWhereClause> {
  QueryBuilder<WordCard, WordCard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordEqualTo(String word) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'word',
        value: [word],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordNotEqualTo(
      String word) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [],
              upper: [word],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [word],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [word],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [],
              upper: [word],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordGreaterThan(
    String word, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [word],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordLessThan(
    String word, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [],
        upper: [word],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordBetween(
    String lowerWord,
    String upperWord, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [lowerWord],
        includeLower: includeLower,
        upper: [upperWord],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordStartsWith(
      String WordPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [WordPrefix],
        upper: ['$WordPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'word',
        value: [''],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'word',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'word',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'word',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'word',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> reviewStageEqualTo(
      int reviewStage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reviewStage',
        value: [reviewStage],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> reviewStageNotEqualTo(
      int reviewStage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewStage',
              lower: [],
              upper: [reviewStage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewStage',
              lower: [reviewStage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewStage',
              lower: [reviewStage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reviewStage',
              lower: [],
              upper: [reviewStage],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> reviewStageGreaterThan(
    int reviewStage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewStage',
        lower: [reviewStage],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> reviewStageLessThan(
    int reviewStage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewStage',
        lower: [],
        upper: [reviewStage],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> reviewStageBetween(
    int lowerReviewStage,
    int upperReviewStage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reviewStage',
        lower: [lowerReviewStage],
        includeLower: includeLower,
        upper: [upperReviewStage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> nextReviewAtEqualTo(
      int nextReviewAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nextReviewAt',
        value: [nextReviewAt],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> nextReviewAtNotEqualTo(
      int nextReviewAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextReviewAt',
              lower: [],
              upper: [nextReviewAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextReviewAt',
              lower: [nextReviewAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextReviewAt',
              lower: [nextReviewAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextReviewAt',
              lower: [],
              upper: [nextReviewAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> nextReviewAtGreaterThan(
    int nextReviewAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextReviewAt',
        lower: [nextReviewAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> nextReviewAtLessThan(
    int nextReviewAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextReviewAt',
        lower: [],
        upper: [nextReviewAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> nextReviewAtBetween(
    int lowerNextReviewAt,
    int upperNextReviewAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextReviewAt',
        lower: [lowerNextReviewAt],
        includeLower: includeLower,
        upper: [upperNextReviewAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> masteryStatusEqualTo(
      MasteryStatus masteryStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'masteryStatus',
        value: [masteryStatus],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> masteryStatusNotEqualTo(
      MasteryStatus masteryStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'masteryStatus',
              lower: [],
              upper: [masteryStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'masteryStatus',
              lower: [masteryStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'masteryStatus',
              lower: [masteryStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'masteryStatus',
              lower: [],
              upper: [masteryStatus],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> createdAtEqualTo(
      int createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> createdAtNotEqualTo(
      int createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> createdAtGreaterThan(
    int createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> createdAtLessThan(
    int createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterWhereClause> createdAtBetween(
    int lowerCreatedAt,
    int upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WordCardQueryFilter
    on QueryBuilder<WordCard, WordCard, QFilterCondition> {
  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryEqualTo(
    WordCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryGreaterThan(
    WordCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryLessThan(
    WordCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryBetween(
    WordCategory lower,
    WordCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      consecutiveCorrectEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consecutiveCorrect',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      consecutiveCorrectGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consecutiveCorrect',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      consecutiveCorrectLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consecutiveCorrect',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      consecutiveCorrectBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consecutiveCorrect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> createdAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> createdAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> createdAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> createdAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> easeFactorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> easeFactorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> easeFactorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> easeFactorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'easeFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examplesRu',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examplesRu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examplesRu',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examplesRu',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examplesRu',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> examplesRuIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesRuLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesRu',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examplesZh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examplesZh',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examplesZh',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examplesZh',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examplesZh',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> examplesZhIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      examplesZhLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'examplesZh',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> isStarredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStarred',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> lastReviewedAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      lastReviewedAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      lastReviewedAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> lastReviewedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReviewedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusEqualTo(
    MasteryStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      masteryStatusGreaterThan(
    MasteryStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusLessThan(
    MasteryStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusBetween(
    MasteryStatus lower,
    MasteryStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'masteryStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      masteryStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'masteryStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> masteryStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'masteryStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      masteryStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masteryStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      masteryStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'masteryStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meaning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meaning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaning',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> meaningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meaning',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> nextReviewAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextReviewAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      nextReviewAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextReviewAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> nextReviewAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextReviewAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> nextReviewAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextReviewAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      partOfSpeechGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partOfSpeech',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      partOfSpeechStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> partOfSpeechMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partOfSpeech',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      partOfSpeechIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partOfSpeech',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      partOfSpeechIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partOfSpeech',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phonetic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phonetic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phonetic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phonetic',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> phoneticIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phonetic',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      reviewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewStageEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewStage',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      reviewStageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewStage',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewStageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewStage',
        value: value,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> reviewStageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewStage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'word',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'word',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordForTts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordForTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordForTts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition> wordForTtsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordForTts',
        value: '',
      ));
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterFilterCondition>
      wordForTtsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordForTts',
        value: '',
      ));
    });
  }
}

extension WordCardQueryObject
    on QueryBuilder<WordCard, WordCard, QFilterCondition> {}

extension WordCardQueryLinks
    on QueryBuilder<WordCard, WordCard, QFilterCondition> {}

extension WordCardQuerySortBy on QueryBuilder<WordCard, WordCard, QSortBy> {
  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByConsecutiveCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveCorrect', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy>
      sortByConsecutiveCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveCorrect', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByIsStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStarred', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByIsStarredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStarred', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByMasteryStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryStatus', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByMasteryStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryStatus', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByNextReviewAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByNextReviewAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByPartOfSpeech() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByPartOfSpeechDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByPhonetic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonetic', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByPhoneticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonetic', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByReviewStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewStage', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByReviewStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewStage', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByWordForTts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordForTts', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> sortByWordForTtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordForTts', Sort.desc);
    });
  }
}

extension WordCardQuerySortThenBy
    on QueryBuilder<WordCard, WordCard, QSortThenBy> {
  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByConsecutiveCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveCorrect', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy>
      thenByConsecutiveCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveCorrect', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByIsStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStarred', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByIsStarredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStarred', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByMasteryStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryStatus', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByMasteryStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryStatus', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByNextReviewAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewAt', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByNextReviewAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReviewAt', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByPartOfSpeech() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByPartOfSpeechDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByPhonetic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonetic', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByPhoneticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phonetic', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByReviewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewCount', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByReviewStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewStage', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByReviewStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewStage', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByWordForTts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordForTts', Sort.asc);
    });
  }

  QueryBuilder<WordCard, WordCard, QAfterSortBy> thenByWordForTtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordForTts', Sort.desc);
    });
  }
}

extension WordCardQueryWhereDistinct
    on QueryBuilder<WordCard, WordCard, QDistinct> {
  QueryBuilder<WordCard, WordCard, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByConsecutiveCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consecutiveCorrect');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'easeFactor');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByExamplesRu() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examplesRu');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByExamplesZh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examplesZh');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByIsStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isStarred');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewedAt');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByMasteryStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masteryStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByMeaning(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaning', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByNextReviewAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextReviewAt');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByPartOfSpeech(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partOfSpeech', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByPhonetic(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phonetic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByReviewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewCount');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByReviewStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewStage');
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'word', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordCard, WordCard, QDistinct> distinctByWordForTts(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordForTts', caseSensitive: caseSensitive);
    });
  }
}

extension WordCardQueryProperty
    on QueryBuilder<WordCard, WordCard, QQueryProperty> {
  QueryBuilder<WordCard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WordCard, WordCategory, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> consecutiveCorrectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consecutiveCorrect');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WordCard, double, QQueryOperations> easeFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easeFactor');
    });
  }

  QueryBuilder<WordCard, List<String>, QQueryOperations> examplesRuProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examplesRu');
    });
  }

  QueryBuilder<WordCard, List<String>, QQueryOperations> examplesZhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examplesZh');
    });
  }

  QueryBuilder<WordCard, bool, QQueryOperations> isStarredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isStarred');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> lastReviewedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewedAt');
    });
  }

  QueryBuilder<WordCard, MasteryStatus, QQueryOperations>
      masteryStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masteryStatus');
    });
  }

  QueryBuilder<WordCard, String, QQueryOperations> meaningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaning');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> nextReviewAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextReviewAt');
    });
  }

  QueryBuilder<WordCard, String, QQueryOperations> partOfSpeechProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partOfSpeech');
    });
  }

  QueryBuilder<WordCard, String, QQueryOperations> phoneticProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phonetic');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> reviewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewCount');
    });
  }

  QueryBuilder<WordCard, int, QQueryOperations> reviewStageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewStage');
    });
  }

  QueryBuilder<WordCard, String, QQueryOperations> wordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'word');
    });
  }

  QueryBuilder<WordCard, String, QQueryOperations> wordForTtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordForTts');
    });
  }
}
