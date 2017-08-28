## MyIOSApp4
8-1  & 8-2<br/>




keyboard type 软键盘的类型 可以选择 小数点类型  整数类型等<br/>
![image](https://github.com/xuhuawei131/MyIOSApp4/blob/master/raw/master/ScreenShots/editInputType.png)<br/>
TextField类型中 有一个placeholder  他相当于android中的hint 提示<br/>

如果想实现 点击空白处 关闭软键盘 那么必须监听根View 的点击事件 <br/>
但是根View UIView只绘制 没有事件响应事件<br/>
ViewController的根View UIViewew 只是显示控件 只有绘画功能 没有触发回调功能 ，按住control键拖拽的时候没有正常的效果，表示UIView是没有事件功能的<br/>
如果想触发回调 那么在Custom Class中的class ，由原来的UIView，修改成UIControl <br/>
![image](https://github.com/xuhuawei131/MyIOSApp4/blob/master/raw/master/ScreenShots/modifyUIClass.png)<br/>

关闭输入框对应的软键盘 例如editHeight 输入框<br/>
[self.editHeight resignFirstResponder]<br/>
FirstResponser 输入框的第一响应者是 软键盘 ，所以resignFirstResponser 就是释放输入焦点 关闭软键盘<br/>

UIImageView 的用法<br/>

首先我们学习如何导入一个图片到我们的工程中<br/>
[如何导入图片](https://www.crifan.com/add_custom_image_picture_into_ios_project_and_use_uiimageview_to_show_that_uiimage/)<br/>
获取图片的对象类<br/>
UIImage* image=[UIImage imageNamed:@"normalman.jpg"]<br/>
self.imageView.image=image;<br/>

