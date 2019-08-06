-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2019-08-04 01:52:05
-- 服务器版本： 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp5`
--

-- --------------------------------------------------------

--
-- 表的结构 `yt_admin`
--

DROP TABLE IF EXISTS `yt_admin`;
CREATE TABLE IF NOT EXISTS `yt_admin` (
  `admin_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yt_admin`
--

INSERT INTO `yt_admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112'),
(2, 'yteng', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- 表的结构 `yt_article`
--

DROP TABLE IF EXISTS `yt_article`;
CREATE TABLE IF NOT EXISTS `yt_article` (
  `article_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cate_id` mediumint(9) NOT NULL COMMENT '栏目ID',
  `author` varchar(10) NOT NULL COMMENT '文章作者',
  `title` varchar(30) NOT NULL COMMENT '文章标题',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文章关键词',
  `description` varchar(200) NOT NULL COMMENT '文章描述',
  `pic` varchar(100) NOT NULL COMMENT '文章缩略图',
  `content` text NOT NULL COMMENT '文章内容',
  `publish_date` datetime NOT NULL COMMENT '发布时间',
  `read_times` mediumint(9) NOT NULL COMMENT '阅读量',
  `like_nums` mediumint(9) NOT NULL COMMENT '点赞数',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yt_article`
--

INSERT INTO `yt_article` (`article_id`, `cate_id`, `author`, `title`, `keywords`, `description`, `pic`, `content`, `publish_date`, `read_times`, `like_nums`) VALUES
(13, 1, '萧逸小杨', '图片实验', '图片', '上传图片试试', '20190302/c129f7a862814ba7d2e0d9bcf7200190.jpg', '**文章内容也可以上传图片吗**\r\n![](上传错误)', '2019-03-02 15:51:50', 25, 1),
(6, 1, '萧逸小杨', 'PHP上传文件问题', '文件', ' 文件上传遇到的问题', 'yteng.jpg', '# 解决办法\r\n**问题所在： 不会使用PHP文件上传**\r\n**解决办法  : 官方手册有解决办法**\r\n- 粘贴大量代码测试\r\n```\r\n<div class=\"sider\">\r\n  <div class=\"right\">\r\n    <div class=\"author\">\r\n      <div class=\"topauthor\"> <img alt=\"\" src=\"__INDEX__/img/yteng.jpg\" class=\"avatar avatar-100 photo\" height=\"100\" width=\"100\"> <span class=\"intag\">作者</span><span class=\"names\">萧逸小杨</span></br>\r\n        <span class=\"talk\"> 计算机专业，熟悉C/C++语言，了解Java PHP SQL  Python 汇编语言等</span>\r\n      </div>\r\n      <span class=\"bot\"></span>\r\n    </div>\r\n    <div class=\"butauthor author\">\r\n      <li> <span class=\"bignum\"> 000 </span>文章总数 </li>\r\n      <li> <span class=\"bignum\">000</span>访问次数 </li>\r\n      <li> <span class=\"bignum\">000</span>建站天数 </li>\r\n    </div>\r\n    <div class=\"subblock\">\r\n      <script src=__INDEX__/js/thea2.js></script>\r\n    </div>\r\n    <!--  随即文章 -->\r\n    <div class=\"subblock\">\r\n      <script src=__INDEX__/js/thea3.js></script>\r\n    </div>\r\n    <!-- 热门文章 -->\r\n    <div class=\"subblock\">\r\n      <script src=__INDEX__/js/thea4.js></script>\r\n    </div>\r\n    <div class=\"subblock\">\r\n      <h3>标签</h3>\r\n      <ul class=\"tag_cloud\">\r\n        {volist name=\"articleRes\" id=\"article\"}\r\n        <a href=\"\"  target=\"_blank\" title=\"9个话题\" class=\"tag-link-9\" >{$article.keywords}</a>  \r\n        {/volist}\r\n      </ul>\r\n    </div>\r\n    <div class=\"subblock linkcat\">\r\n      <h3>友情链接</h3>\r\n      <ul>\r\n       \r\n        {volist name=\"linkres\" id=\"linkres\"}\r\n          <li><a href=\"{$linkres.url}\" target=\"_blank\">{$linkres.title}</a></li>\r\n        {/volist}\r\n        <li><a href=\"\"> 友情链接位招租 </a></li>\r\n      </ul>\r\n    </div>\r\n    <ul class=\"widgets\">\r\n    </ul>\r\n  </div>\r\n</div>\r\n```', '2019-03-01 20:43:51', 34, 0),
(10, 1, '萧逸小杨', '网站实验', '实验', ' 咋就是显示不全呢', '20190301/718f5244690a14e2bd958a77987af45e.jpg', '## 重要的事情说三遍\r\n- 网站开始运营啦\r\n- 网站开始运营啦\r\n- 网站开始运营啦\r\n\r\n------------\r\n### 顺便分享一下开发过程遇到的坑\r\n- **PHP文件上传问题**\r\n我给每篇文章都设置了一个缩略图，但是要上传文件，代码参考了ThinkPHP5.0框架开发的代码，下面也把代码粘贴出来\r\n```\r\n$file = request()->file(\'pic\');\r\nif($file){\r\n// 移动到框架应用根目录/public/uploads/ 目录下\r\n $info = $file->move(ROOT_PATH . \'public\' . DS . \'/static/uploads\');\r\n if($info){\r\n  //拼接文件路径\r\n  //使用date()方法计算出八位时间上传到uploads的文件所在的文件名就是这八位时间\r\n //使用$info->getFilename()方法获取文件名\r\n $data[\'pic\'] = date(\'Ymd\').\'/\'.$info->getFilename();\r\n }else{\r\n  // 上传失败返回错误信息\r\n   return $this->error($file->getError());\r\n  }\r\n};\r\n```\r\n直接使用了PHP提供的move函数将图片文件上传，并且将图片的时间命名和文件名存储在数据库，方便在取出后加上前面都一样的路径即可读出。\r\n\r\n------------\r\n\r\n- **MarkDown编辑器嵌入问题**\r\n这个问题很是麻烦，我首先开发的管理员界面，在管理员后台页面嵌入MarkDown编辑器，还是比较简单，照着百度的方法\r\n1. 引入所需css jquery js文件\r\n1. 引入html元素textarea文本框\r\n1. 引入js代码，使用了editor.md编辑器\r\n这部分虽然简单，但是在存储的形式依然采用了MarkDown语法\r\n\r\n在前台部分读出文章内容还需要将MarkDown语法转换为HTML格式，又遇到一些小坑\r\n这里我展示一下我学习到的方法\r\n1. 同样需要先引入一堆js文件\r\n```\r\n<link rel=\"stylesheet\" href=\"__ADMIN__/markdown/css/editormd.css\" />\r\n         <link rel=\"shortcut icon\" href=\"https://pandao.github.io/editor.md/favicon.ico\" type=\"image/x-icon\" />\r\n         <link rel=\"stylesheet\" href=\"__ADMIN__/markdown/css/editormd.preview.css\" />\r\n         \r\n         <script src=\"__ADMIN__/markdown/examples/js/jquery.min.js\"\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/marked.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/prettify.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/raphael.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/underscore.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/sequence-diagram.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/flowchart.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/editormd.min.js\"></script>\r\n```\r\n然后这里为啥会出错\r\n1. 引入textarea元素\r\n我来加入两行汉字 汉字再多也没事，错误的是下一行\r\n\r\n```\r\n<div id=\"layout\"  class=\"editor\">\r\n <div id=\"test-editormd\" >\r\n 引入了textarea元素就崩了，难道是textarea里面不能有textarea？？？  </div>\r\n</div>\r\n```\r\n测试到底，为啥删了几行代码就对了\r\n1. 引入js代码\r\n\r\n```\r\n<script type=\"text/javascript\">\r\n          testEditor = editormd.markdownToHTML(\"test-editormd\", {\r\n         // markdown:$scope.apidetails.content,\r\n          htmlDecode      : \"style,script,iframe\",  // you can filter tags decode\r\n          emoji           : true,\r\n          taskList        : true,\r\n          tex             : true,  // 默认不解析\r\n          flowChart       : true,  // 默认不解析\r\n          sequenceDiagram : true,  // 默认不解析\r\n          });\r\n</script>\r\n```\r\n以上代码也是我参考了好几个CSDN博客得到的，但是不知道我注释的那一句有什么作用，当不注释其的时候就不可以正常显示转换后的HTML页面\r\n\r\n------------\r\n\r\n*今日分享就到这里* \r\n*2019-03-01 21:07:55 星期五* \r\n*萧逸小杨*', '2019-03-01 21:25:10', 21, 1),
(9, 1, '萧逸小杨', 'MarkDown', '关键词', ' markdown', '', '# 摘要\r\n- 上次居然出现了 文本长，显示不全的问题，忘记查看数据库是啥样的了\r\n- 这次也写长一点\r\n\r\n------------\r\n\r\n- 首先引入样式文件\r\n``` \r\n<!--引入样式文件-->\r\n<link rel=\"stylesheet\" href=\"__ADMIN__/markdown/css/editormd.css\" />\r\n<!--引入js文件-->\r\n<script type=\"text/javascript\" src=\"__ADMIN__/markdown/examples/js/jquery.min.js\"></script>\r\n<script type=\"text/javascript\" src=\"__ADMIN__/markdown/editormd.js\"></script>\r\n<script type=\"text/javascript\" src=\"__ADMIN__/markdown/editormd.amd.js\"></script>\r\n```\r\n\r\n- 其次引入文本框\r\n```\r\n <div id=\"editormd\">\r\n<textarea style=\"display:none;\" name=\"content\">{$article.content}\r\n```', '2019-03-02 15:46:53', 13, 0),
(11, 3, '萧逸小杨', '网站试验', '关键词', ' 网站啊', '20190301/ca59bce59e6d5a4453ff824693265d69.jpg', '## 重要的事情说三遍\r\n- 网站开始运营啦\r\n- 网站开始运营啦\r\n- 网站开始运营啦\r\n\r\n------------\r\n### 顺便分享一下开发过程遇到的坑\r\n- **PHP文件上传问题**\r\n我给每篇文章都设置了一个缩略图，但是要上传文件，代码参考了ThinkPHP5.0框架开发的代码，下面也把代码粘贴出来\r\n```\r\n$file = request()->file(\'pic\');\r\nif($file){\r\n// 移动到框架应用根目录/public/uploads/ 目录下\r\n $info = $file->move(ROOT_PATH . \'public\' . DS . \'/static/uploads\');\r\n if($info){\r\n  //拼接文件路径\r\n  //使用date()方法计算出八位时间上传到uploads的文件所在的文件名就是这八位时间\r\n //使用$info->getFilename()方法获取文件名\r\n $data[\'pic\'] = date(\'Ymd\').\'/\'.$info->getFilename();\r\n }else{\r\n  // 上传失败返回错误信息\r\n   return $this->error($file->getError());\r\n  }\r\n};\r\n```\r\n直接使用了PHP提供的move函数将图片文件上传，并且将图片的时间命名和文件名存储在数据库，方便在取出后加上前面都一样的路径即可读出。\r\n\r\n------------\r\n\r\n- **MarkDown编辑器嵌入问题**\r\n这个问题很是麻烦，我首先开发的管理员界面，在管理员后台页面嵌入MarkDown编辑器，还是比较简单，照着百度的方法\r\n1. 引入所需css jquery js文件\r\n1. 引入html元素textarea文本框\r\n1. 引入js代码，使用了editor.md编辑器\r\n这部分虽然简单，但是在存储的形式依然采用了MarkDown语法\r\n\r\n在前台部分读出文章内容还需要将MarkDown语法转换为HTML格式，又遇到一些小坑\r\n这里我展示一下我学习到的方法\r\n1. 同样需要先引入一堆js文件\r\n\r\n```\r\n<link rel=\"stylesheet\" href=\"__ADMIN__/markdown/css/editormd.css\" />\r\n         <script src=\"__ADMIN__/markdown/lib/underscore.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/sequence-diagram.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/lib/flowchart.min.js\"></script>\r\n         <script src=\"__ADMIN__/markdown/editormd.min.js\"></script>\r\n```\r\n1. 引入textarea元素\r\n```\r\n<div id=\"layout\"  class=\"editor\">\r\n<a>什么超链接</a>\r\n好\r\n像\r\n又\r\n可\r\n以\r\n  </div>\r\n```\r\n\r\n------------\r\n\r\n\r\n*今日分享就到这里* \r\n*2019-03-01 21:07:55 星期五* \r\n*萧逸小杨*', '2019-03-01 21:26:40', 33, 0),
(12, 1, '萧逸小杨', '博客文章含有textarea标签显示bug', 'textarea', ' 就是有了textarea标签会有显示bug错', '20190302/99870abe324f0e89a35f02fd766f1eed.jpg', '#### 先来文字版本的\r\n<textarea> 好家伙，markdown编辑器还支持html元素自动补齐</textarea>\r\n\r\n------------\r\n#### 再来代码版本\r\n\r\n```\r\n<textarea>能不能正常显示呢，我估计是不可以的啦</textarea>\r\n```\r\n\r\n------------\r\n\r\n最后来什么版本\r\n到此为止\r\n2019-03-02 09:49:18 星期六', '2019-03-02 09:49:34', 27, 7);

-- --------------------------------------------------------

--
-- 表的结构 `yt_cate`
--

DROP TABLE IF EXISTS `yt_cate`;
CREATE TABLE IF NOT EXISTS `yt_cate` (
  `cate_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `catename` varchar(30) NOT NULL COMMENT '栏目名称',
  `cate_keywords` varchar(150) NOT NULL COMMENT '栏目关键字',
  `cate_description` text NOT NULL COMMENT '栏目描述',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yt_cate`
--

INSERT INTO `yt_cate` (`cate_id`, `catename`, `cate_keywords`, `cate_description`) VALUES
(1, '技术分享', '技术', '分享一些技术干货和学习心得'),
(3, '生活趣事', '生活', ' 分享一些生活中的有趣的事'),
(2, '学习笔记', '笔记', '分享学习计算机课程中的笔记'),
(4, '其他', '其他', ' 记录其他杂七杂八的事情');

-- --------------------------------------------------------

--
-- 表的结构 `yt_comment`
--

DROP TABLE IF EXISTS `yt_comment`;
CREATE TABLE IF NOT EXISTS `yt_comment` (
  `comment_id` mediumint(9) NOT NULL COMMENT '评论id',
  `article_id` mediumint(9) NOT NULL COMMENT '文章id',
  `name` varchar(30) NOT NULL COMMENT '评论人名称',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `yt_guest`
--

DROP TABLE IF EXISTS `yt_guest`;
CREATE TABLE IF NOT EXISTS `yt_guest` (
  `guest_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL COMMENT '留言人名称',
  `content` text NOT NULL COMMENT '内容',
  `guest_time` datetime NOT NULL COMMENT '留言时间',
  `reply` text NOT NULL COMMENT '回复',
  PRIMARY KEY (`guest_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yt_guest`
--

INSERT INTO `yt_guest` (`guest_id`, `nickname`, `content`, `guest_time`, `reply`) VALUES
(1, '龙的传人', '我们都是龙的传人', '2019-02-25 00:00:00', '同意  是的哦'),
(3, '小龙', '写得好', '2019-02-28 21:53:52', '谢谢夸奖'),
(5, '腾', 'sad', '2019-03-06 11:59:11', '0'),
(6, '腾 ', '但近段时间', '2019-03-07 11:42:25', '0');

-- --------------------------------------------------------

--
-- 表的结构 `yt_link`
--

DROP TABLE IF EXISTS `yt_link`;
CREATE TABLE IF NOT EXISTS `yt_link` (
  `link_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '链接标题',
  `url` varchar(60) NOT NULL COMMENT '链接地址',
  `description` varchar(255) NOT NULL COMMENT '链接描述',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yt_link`
--

INSERT INTO `yt_link` (`link_id`, `title`, `url`, `description`) VALUES
(2, '腾讯', 'http://qq.com', '腾讯QQ'),
(3, '阿里巴巴', 'http://alibaba.com', '阿里巴巴网站'),
(5, '十九大', 'http://shijiuda.com', '十九大好'),
(6, '淘宝', 'www.taobao.com', '淘宝网站');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
