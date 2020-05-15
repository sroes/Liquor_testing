import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

    testWidgets('Items are displayed', (WidgetTester tester) async {
 
    // Inject data provider
    ListBloc().injectDataProviderForTest(TestDataProvider());
 
    // Build widget
    await tester.pumpWidget(ListPageWrapper());
 
    // This causes the stream builder to get the data
    await tester.pump(Duration.zero);
 
    final item1Finder = find.text(ITEM_TITLE_ALPHA_1);
    final item2Finder = find.text(ITEM_TITLE_ALPHA_2);
    final item3Finder = find.text(ITEM_TITLE_ALPHA_3);
    expect(item1Finder, findsOneWidget);
    expect(item2Finder, findsOneWidget);
    expect(item3Finder, findsOneWidget);
 
    // Under the hood, Container uses BoxDecoration when setting color
    WidgetPredicate widgetSelectedPredicate = (Widget widget) => widget is Container && widget.decoration == BoxDecoration(color: Colors.green.shade200);
    WidgetPredicate widgetUnselectedPredicate = (Widget widget) => widget is Container && widget.decoration == BoxDecoration(color: Colors.white);
 
    expect(find.byWidgetPredicate(widgetSelectedPredicate), findsOneWidget);
    expect(find.byWidgetPredicate(widgetUnselectedPredicate), findsNWidgets(2));
  });
 
  
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
