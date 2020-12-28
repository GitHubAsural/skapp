import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:skapp/iconfont/IconFont.dart';
import 'package:skapp/routers/application.dart';
import 'package:skapp/utils/cache.dart';
import './../../store/type/type.dart';
import './../../utils/map.dart';
import './../classify/index.dart';
import './../../widgets/search_text_field_widget_app.dart';
import './../../widgets/smart_drawer.dart';
import './../../store/root.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  final Type store = Type();

  //创建页面控制器
  PageController _pageController;
  int _selectIndex = 0;

  List<Widget> _pageList;

  List<BottomNavigationBarItem> itemList = [];
  List<BottomNavigationBarItem> itemDarkList = [];

  String size;

  Future<dynamic> requestAPI() async {
    await store.fetchData();
    if (store.type != null &&
        store.type.code == 200 &&
        store.type.data.length > 1) {
      itemList = store.type.data
          .map((item) => BottomNavigationBarItem(
              icon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['normalIcon']
                  : typeMap['normal']['normalIcon'],
              // ignore: deprecated_member_use
              title: Text(
                item.typeName,
                style: TextStyle(fontSize: 11),
              ),
              // label: item.typeName,
              activeIcon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['activeIcon']
                  : typeMap['normal']['activeIcon']))
          .toList();

      // 暗黑单独处理
      itemDarkList = store.type.data
          .map((item) => BottomNavigationBarItem(
              icon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['normalDarkIcon']
                  : typeMap['normal']['normalDarkIcon'],
              // ignore: deprecated_member_use
              title: Text(
                item.typeName,
                style: TextStyle(fontSize: 11),
              ),
              // label: item.typeName,
              activeIcon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['activeDarkIcon']
                  : typeMap['normal']['activeDarkIcon']))
          .toList();
      if (_pageList == null) {
        _pageList = store.type.data
            .map((f) => Classify(
                  typeId: f.typeId,
                ))
            .toList();
      }
      store.changeLoading();
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _selectIndex);
    requestAPI();
  }

  @override
  void didUpdateWidget(App oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  Future getCacheInfo() async {
    String sizeStr = await loadCache();
    if (mounted) {
      setState(() {
        size = sizeStr;
      });
    }
  }

  // 左侧抽屉
  renderDrawer(context, _global) {
    getCacheInfo();
    return SmartDrawer(
      widthPercent: 0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child:
                      Text('换肤', style: Theme.of(context).textTheme.bodyText2),
                ),
                Expanded(
                  flex: 1,
                  child: MaterialColorPicker(
                    elevation: 1,
                    circleSize: 36,
                    iconSelected: Icons.color_lens,
                    allowShades: false,
                    spacing: 16,
                    onMainColorChange: (Color color) {
                      _global.changeTheme(color);
                    },
                    selectedColor: _global.theme,
                    colors: _global.colorList,
                  ),
                )
              ],
            ),
          ),
          SwitchListTile(
            value: _global.isDark,
            onChanged: (value) {
              _global.changeThemeMode(value);
            },
            title: Text('暗黑模式'),
            secondary: IconFont(IconNames.iconyejianduoyun, size: 26),
            selected: _global.isDark,
          ),
          ListTile(
            title: Text('视频解析'),
            leading: IconFont(IconNames.iconshishishipinliujiexi, size: 26),
            onTap: () {
              Navigator.of(context).pop();
              Application.router.navigateTo(
                context,
                "/vipvideo",
                transition: TransitionType.native,
                transitionDuration: Duration(milliseconds: 100),
              );
            },
          ),
          /* _global.appConfig.showlive
              ? ListTile(
                  title: Text('直播'),
                  leading: IconFont(IconNames.iconzhibo, size: 26),
                  onTap: () {
                    Navigator.of(context).pop();
                    Application.router.navigateTo(
                      context,
                      "/live",
                      transition: TransitionType.native,
                      transitionDuration: Duration(milliseconds: 100),
                    );
                  },
                )
              : Container(
                  width: 0,
                  height: 0,
                ), */
          ListTile(
            title: Text('自定义片源'),
            // leading: Icon(Icons.extension),
            leading: IconFont(IconNames.iconzidingyi_2, size: 26),
            onTap: () {
              Navigator.of(context).pop();
              Application.router.navigateTo(
                context,
                "/custom",
                transition: TransitionType.native,
                transitionDuration: Duration(milliseconds: 100),
              );
            },
          ),
          ListTile(
            title: Text('分享SK'),
            leading: IconFont(IconNames.iconfenxiang, size: 26),
            onTap: () {
              Share.share(
                '【SKAPP，一款视频播放软件】\n https://github.com/Mockingbird1234/skapp',
              );
            },
          ),
          ListTile(
            title: Text('清除缓存($size)'),
            leading: IconFont(IconNames.iconqingchu_1, size: 26),
            onTap: () {
              clearCache();
            },
          ),
        ],
      ),
    );
  }

  renderAppBar() {
    return AppBar(
      elevation: 0,
      title: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SearchTextFieldWidget(
                hintText: '搜索',
                onTab: () {
                  Application.router.navigateTo(
                    context,
                    "/search",
                    transition: TransitionType.native,
                    transitionDuration: Duration(milliseconds: 100),
                  );
                  // Router.push(context, Router.searchPage, '电影/电视剧/影人');
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.history),
              color: Colors.white,
              padding: EdgeInsets.only(left: 18),
              onPressed: () {
                Application.router.navigateTo(
                  context,
                  "/history",
                  transition: TransitionType.native,
                  transitionDuration: Duration(milliseconds: 100),
                );
              },
            )
          ],
        ),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }

  renderBody() {
    return PageView(
      controller: _pageController,
      children: _pageList,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        _selectIndex = index;
      },
    );
  }

  renderBottomNavigationBar(context, _global) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
      items: _global.isDark ? itemDarkList : itemList,
      onTap: (int index) {
        if (mounted) {
          setState(() {
            _selectIndex = index;
          });
        }
        //点击下面tabbar的时候执行动画跳转方法
        _pageController.animateToPage(index,
            duration: new Duration(milliseconds: 500),
            curve: new ElasticOutCurve(4));
      },
      //图标大小
      iconSize: 24,
      //当前选中的索引
      currentIndex: _selectIndex,
      //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
      fixedColor: _global.isDark ? Colors.white : Colors.teal,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    Global _global = Provider.of<Global>(context);

    return store.isLoading
        ? Container(
            width: 0,
            height: 0,
          )
        : Scaffold(
            drawer: renderDrawer(context, _global),
            appBar: renderAppBar(),
            body: SafeArea(
              child: renderBody(),
            ), // https://www.jianshu.com/p/86d29a939624
            bottomNavigationBar: renderBottomNavigationBar(context, _global),
          );
  }
}
