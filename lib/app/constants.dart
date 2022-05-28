const appwriteEndpoint = "https://localhost:4004/v1";
const appwriteProjectId = "6283bd6cbd2b80ef23b3";
const usersearchKey = 'c3b08f03ed58d8ecde1dedfbbbac3f7ba712e7c6316d9f16097ce954db9bb5f4772822a2e05e641338deedd1c882b6d8e226dee9a9511009295a08099a574a2f1a97f876a6198356fdb9e8f334547d17404fbe55f0f96a0f3ada04e8f948a503a5ae49cfa079c51e9b4b9e70dbbb48857362a1cfeb8a81222e06448b0f80a258';

abstract class CollectionNames {
  static String get delta => 'delta';
  static String get deltaDocumentsPath => 'collections.$delta.documents';
  static String get pages => 'pages';
  static String get pagesDocumentsPath => 'collections.$pages.documents';
}