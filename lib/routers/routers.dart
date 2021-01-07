import 'package:fluro/fluro.dart' as CustomRouter;
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  //  首页
  static String root = "/";
  // 详情页面
  static String details = "/details";
  // 搜索页面
  static String search = "/search";
  // 自定义设置
  static String custom = "/custom";
  // 电影预览界面
  static String preview = "/preview";
  // 视频解析
  static String vipvideo = "/vipvideo";
  // 投屏界面
  static String dlna = "/dlna";
  // 历史记录
  static String history = "/history";
  // 登录页
  static String login = "/login";

  static void configureRoutes(CustomRouter.Router router) {
    router.notFoundHandler = CustomRouter.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(details, handler: detailsRouteHandler);
    router.define(search, handler: searchRouteHandler);
    router.define(custom, handler: customRouteHandler);
    router.define(preview, handler: previewRouteHandler);
    router.define(vipvideo, handler: vipvideoRouteHandler);
    router.define(dlna, handler: dlnaRouteHandler);
    router.define(history, handler: historyRouteHandler);
    router.define(login, handler: loginRouteHandler);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }
}
