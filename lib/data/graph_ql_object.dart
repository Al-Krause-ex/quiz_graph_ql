import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quiz_graph_ql/const/keys.dart';

class GraphQlObject {
  static HttpLink httpLink = HttpLink(
    'https://relative-terrier-67.hasura.app/v1/graphql',
    defaultHeaders: {'x-hasura-admin-secret': kSecretKey},
  );

  // static const String token =
  //     'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjdsS25QZURxcUJoOFRUN0ExeWtJUyJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS1hbGxvd2VkLXJvbGVzIjpbInVzZXIiXSwieC1oYXN1cmEtdXNlci1pZCI6Imdvb2dsZS1vYXV0aDJ8MTA1MTY5MTUzNTE0NjE2MjQyNzE1In0sImlzcyI6Imh0dHBzOi8vZGV2LTBoc3cxLXd2LmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJnb29nbGUtb2F1dGgyfDEwNTE2OTE1MzUxNDYxNjI0MjcxNSIsImF1ZCI6WyJodHRwczovL2hhc3VyYS5pby9sZWFybiIsImh0dHBzOi8vZGV2LTBoc3cxLXd2LmV1LmF1dGgwLmNvbS91c2VyaW5mbyJdLCJpYXQiOjE2NDc1Mjc1MjMsImV4cCI6MTY0NzUzNDcyMywiYXpwIjoiNW1GY0dRamlmbWV2S3hmb1hTaDg3V0FubkVHM0M5MTIiLCJzY29wZSI6Im9wZW5pZCBlbWFpbCJ9.EoVktU2VgRc05VPwxckTmoAlF6QO7U644h1a4aF_8zxIVZr5Xlk18V6T3enf1nzCTDtpvOiBgP9E2kdHEGw03_lvzbRBznI1BRIIlO91-GqKInDk9wrfBeKobvFcEP9eKwe5bJQoYwNZpWDwMSnUqz6yHtDOtCvz8n47wV5L7_ow_HMPzzoc3ExpBEQyImG7D2FlfLnQ55-ZI6a3gH-L3zaf89vS6RzV8TvB8J0zcZCdQORA3JM9iVL7ANDFGUJ2M_KRh5BlfVJeFaWgXA7FOuPw86E8hBIPYPbi60u_zKB6rqVBLEdWo76hQ6thdBl1DUCX1CMiJZ2jDAr2eOZ-dQ';
  //
  // static AuthLink authLink = AuthLink(
  //   getToken: () async => 'Bearer $token',
  // );

  // static Link link = authLink.concat(httpLink);

  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      // link: link,
      link: httpLink,
    ),
  );
}

GraphQlObject graphQlObject = GraphQlObject();
