# fule_swiper
![Pub Version](https://img.shields.io/pub/v/fule_view?style=flat-square)
![GitHub](https://img.shields.io/github/license/Yang-Xuhao/fule_view?style=flat-square)

一个简单的视图容器组件，它允许你监听onTap事件。

## 开始
### 安装
在pubspec.yaml中添加引用
``` yaml
fule_view: ^0.1.0
```
下载插件
```shell
$ flutter pub get
```
### 引入
``` dart
import 'package:fule_view/fule_view.dart';
```

### 参数
*  margin 和 padding 类型为List&lt;double&gt;，接收1-4个参数，顺序为上右下左
* 使用 border 后， borderWidth 、 borderColor 、 borderStyle 会无效
* 使用 borderRadius 后， borderRadiusWidth 会无效

| 属性 | 类型 | 默认值 | 必填 | 说明 | 组件版本 |
| --- | --- | --- | :---: | --- | :---: |
| width| double | - | 否 | 宽度 | 0.1.0 |
| height | double | - | 否 | 高度 | 0.1.0 |
| margin | List&lt;double&gt; | [0] | 否 | 外边距 | 0.1.0 |
| padding | List&lt;double&gt; | [0] | 否 | 内边距 | 0.1.0 |
| child | Widget | - | 否 | 子组件 | 0.1.0 |
| backgroundColor | Color | Colors.transparent | 否 | 背景颜色 | 0.1.0 |
| onTap | VoidCallback | - | 否 | 点击事件 | 0.1.0 |
| splashColor | Color | Colors.transparent | 否 | 滑动动画时长 | 0.1.0 |
| focusColor | Color | Colors.transparent | 否 | 滑动动画 | 0.1.0 |
| highlightColor | Color | Colors.transparent | 否 | 是否显示指示点 | 0.1.0 |
| hoverColor | Color | Colors.transparent | 否 | 指示点默认颜色 | 0.1.0 |
| border | Border | - | 否 | 边框自定义设置 | 0.1.0 |
| borderWidth | double | 0 | 否 | 边框宽度 | 0.1.0 |
| borderColor | Color | Colors.black | 否 | 边框颜色 | 0.1.0 |
| borderStyle | BorderStyle | - | 否 | 边框样式 | 0.1.0 |
| borderRadius | BorderRadius | - | 否 | 圆角自定义设置 | 0.1.0 |
| borderRadiusWidth | double | 0 | 否 | 圆角半径 | 0.1.0 |
| boxShadowColor | Color | Colors.transparent | 否 | 阴影颜色 | 0.1.0 |
| boxShadowBlurRadius | double | 0 | 否 | 切换回调函数 | 0.1.0 |
| boxShadowSpreadRadius | double | 0 | 否 | 切换回调函数 | 0.1.0 |


## TODO
- [ ] 实现更多种事件监听