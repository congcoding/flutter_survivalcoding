import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dynamic_color_theme/dynamic_color_theme.dart';
import 'package:dynamic_color_theme/color_picker_dialog.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2018/11/12/18/44/thanksgiving-3811492_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/10/30/15/33/tajikistan-4589831_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/11/25/16/15/safari-4652364_1280.jpg',
];

const kWhite = Colors.white;
const kLightGrey = const Color(0xFFE8E8E8);
const kDarkGrey = const Color(0xFF303030);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorTheme(
      data: (Color color, bool isDark) {
        return _buildTheme(color, isDark);
      },
      defaultColor: Colors.yellow,
      defaultIsDark: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          home: MyHomePage(),
          theme: theme,
          title: 'Flutter Demo',
        );
      },
    );
  }

  ThemeData _buildTheme(Color accentColor, bool isDark) {
    final ThemeData base = isDark ? ThemeData.dark() : ThemeData.light();
    final Color primaryColor = isDark ? kDarkGrey : kWhite;

    return base.copyWith(
      accentColor: accentColor,
      accentTextTheme: _buildTextTheme(base.accentTextTheme, accentColor, isDark),
      cardColor: primaryColor,
      cursorColor: accentColor,
      iconTheme: base.iconTheme.copyWith(
        color: accentColor,
      ),
      primaryColor: primaryColor,
      primaryIconTheme: base.primaryIconTheme.copyWith(
        color: accentColor,
      ),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, accentColor, isDark),
      scaffoldBackgroundColor: primaryColor,
      textSelectionColor: isDark ? kDarkGrey : kLightGrey,
      textSelectionHandleColor: accentColor,
      textTheme: _buildTextTheme(base.textTheme, accentColor, isDark),
    );
  }

  TextTheme _buildTextTheme(TextTheme base, Color color, bool isDark) {
    return base.copyWith(
      bodyText2: base.bodyText2.copyWith(
        fontSize: 16,
      ),
      bodyText1: base.bodyText1.copyWith(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      button: base.button.copyWith(
        color: isDark ? kDarkGrey : kLightGrey,
      ),
      caption: base.caption.copyWith(
        color: isDark ? kLightGrey : kDarkGrey,
        fontSize: 14,
      ),
      headline5: base.headline5.copyWith(
        color: color,
        fontSize: 24,
      ),
      subtitle1: base.subtitle1.copyWith(
        color: color,
        fontSize: 18,
      ),
      headline6: base.headline6.copyWith(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('복잡한 UI'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {},
          )
        ]
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('홈', style: Theme.of(context).textTheme.caption),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: DynamicColorTheme.of(context).color),
          ),
          BottomNavigationBarItem(
            title: Text('이용서비스', style: Theme.of(context).textTheme.caption),
            icon: Icon(Icons.assignment),
            activeIcon: Icon(Icons.assignment, color: DynamicColorTheme.of(context).color),
          ),
          BottomNavigationBarItem(
            title: Text('내 정보', style: Theme.of(context).textTheme.caption),
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle, color: DynamicColorTheme.of(context).color),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('대리'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('대리'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항입니다'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}

class Page2 extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        CarouselSlider(
          items: dummyItems.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            // enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 60,
              child: RaisedButton(
                color: DynamicColorTheme.of(context).color,
                onPressed: () => buttonCarouselController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: Text('<-', style: Theme.of(context).textTheme.button),
              )
            ),
            SizedBox(
              width: 60,
              child: RaisedButton(
                color: DynamicColorTheme.of(context).color,
                onPressed: () => buttonCarouselController.animateToPage(
                  1, duration: Duration(milliseconds: 300), curve: Curves.linear),
                child: Text('1', style: Theme.of(context).textTheme.button),
              )
            ),
            SizedBox(
                width: 60,
                child: RaisedButton(
                  color: DynamicColorTheme.of(context).color,
                  onPressed: () => buttonCarouselController.animateToPage(
                      2, duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Text('2', style: Theme.of(context).textTheme.button),
                )
            ),
            SizedBox(
                width: 60,
                child: RaisedButton(
                  color: DynamicColorTheme.of(context).color,
                  onPressed: () => buttonCarouselController.animateToPage(
                      3, duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Text('3', style: Theme.of(context).textTheme.button),
                )
            ),
            SizedBox(
                width: 60,
                child: RaisedButton(
                  color: DynamicColorTheme.of(context).color,
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Text('->', style: Theme.of(context).textTheme.button),
                )
            ),
          ],
        )
      ]
  );
}

class Page3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color color = DynamicColorTheme.of(context).color;
    bool isDark = DynamicColorTheme.of(context).isDark;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('현재 색상 : $color\n다크 모드 : $isDark'),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text(
                isDark ? '다크 모드 해제' : '다크 모드로 변경',
                style: Theme.of(context).textTheme.button,
              ),
              color: color,
              onPressed: () {
                DynamicColorTheme.of(context).setIsDark(
                  isDark: !isDark,
                  shouldSave: true,
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
        backgroundColor: color,
        icon: Icon(Icons.color_lens),
        label: Text('색 선택'),
        onPressed: () {
          showDialog(
            builder: (BuildContext context) {
              return WillPopScope(
                child: ColorPickerDialog(
                  defaultColor: Colors.yellow,
                  defaultIsDark: false,
                  title: '테마 색을 선택하세요',
                  cancelButtonText: '취소',
                  confirmButtonText: '저장',
                  shouldAutoDetermineDarkMode: true,
                  shouldShowLabel: true,
                ),
                onWillPop: () async {
                  DynamicColorTheme.of(context).resetToSharedPrefsValues();
                  return true;
                },
              );
            },
            context: context,
          );
        },
      ),
    );
  }
}
