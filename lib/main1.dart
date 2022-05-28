import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:google_doc/models/members_page_data.dart';

void main() { // Init SDK
  Client client = Client();
  Users users = Users(client);

  client
    .setEndpoint('https://localhost:4004/v1') // Your API Endpoint
    .setProject('6283bd6cbd2b80ef23b3') // Your project ID
    .setKey('c3b08f03ed58d8ecde1dedfbbbac3f7ba712e7c6316d9f16097ce954db9bb5f4772822a2e05e641338deedd1c882b6d8e226dee9a9511009295a08099a574a2f1a97f876a6198356fdb9e8f334547d17404fbe55f0f96a0f3ada04e8f948a503a5ae49cfa079c51e9b4b9e70dbbb48857362a1cfeb8a81222e06448b0f80a258') // Your secret API key
  ;

  // final res = users.list(search: Query.equal('email', 
  //   'nadeem@test.com'));

  // res.then((response) {
  //   print(response.users[0].toMap());
  // }).catchError((error) {
  //   print(error);
  // });
  // Future result = users.list(
  //   search: Query.equal('id','628cf1f8ba1d14f525cd')
  // );
Future result = users.get(userId: "628ca47a9944d8f89c01");
User s;
result
    .then((response) {
      s = response;
      print(s.name);
    }).catchError((error) {
      print(error.response);
  });
  

}