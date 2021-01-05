import 'package:shared_preferences/shared_preferences.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  static SharedPreferences _prefs;
  static const BASE_SK_URL = 'https://sk.ncer.top';
  // static const BASE_SK_URL = 'http://192.168.0.108:8000';
  // static const BASE_SK_URL = 'http://192.168.5.190:8000';
  // static const BASE_SK_URL = 'http://192.168.0.111:8000';
  // static const BASE_SK_URL = 'http://192.168.2.201:8000';
  // static const BASE_SK_URL = 'http://192.168.2.127:8000';
  // static const BASE_SK_URL = 'http://192.168.43.237:8000';
  static const PRE_API_URL = '/sk-api';
  static const TYPE_URL = '/type/list'; // 分类
  static const CLASSIFY_TYPE_URL = '/type/one?typeId='; // 子分类
  static const VOD_LIST_URL = '/vod/list'; // 列表页
  static const VOD_DETAILS_URL = '/vod/one?vodId='; // 详情页
  static const SEARCH_URL = '/search/list?keyword='; // 搜索
  static const SEARCH_PAGES_URL = '/search/pages?keyword='; // 搜索分页
  static const TYPE_ALL = '/type/all'; // 所有分类信息
  static const MOVIE_ALL = '/vod/total'; // 所有电影总数和今日更新数
  // app配置
  // static const APP_CONFIG = '/app/config';
  static const APP_ADS = '/app/ads';
  static const APP_VIDEO_INFO = '/app/vipvideoforapp';
  // static const APP_SECRET_LIVE_KEY = 'app/secretlivecheck';
  // app更新配置
  static const APP_UPDATE_URL = '/assets/app/appcast.xml';

  // 直播接口
  // static const BASE_LIVE_URL = 'http://api.vipmisss.com:81/xcdsw';
  // static const LIVE_ALL_URL = '/json.txt';
}
