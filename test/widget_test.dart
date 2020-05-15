import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquor/services/auth.dart';

void main() {

  // Defining tests.  The WidgetTester builds and interacts with widgets
  testWidgets('LiquorMeTimbers has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(LiquorMeTimbers(title: 'T', message: 'M'));

    // Creating the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // `findsOneWidget` matcher and ' findsOneWidget'
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    // Define the test key.
    final testKey = Key('K');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

////////////


}

class LiquorMeTimbers extends StatelessWidget {
  final String title;
  final String message;

  const LiquorMeTimbers({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
