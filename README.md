as3-switch-button
=================

as3 quick switch button controller

### Usage -Flash IDE

* setting movieclip
![Step1](https://raw.github.com/wwwins/as3-switch-button/master/screenshots/Step1.png)

* setting class
![Step2](https://raw.github.com/wwwins/as3-switch-button/master/screenshots/Step2.png)

### Usage -FlashDevelop

* Convert to Compiled Clip
Library -> QuickSwitcher -> Convert to Compiled Clip
![Step3](https://raw.github.com/wwwins/as3-switch-button/master/screenshots/Step3.png)
![Step4](https://raw.github.com/wwwins/as3-switch-button/master/screenshots/Step4.png)

* remove btn0/1/2... Class and Base Class

* include swc in FlashDevelop

### Example

```
stage.addEventListener(SwitcherEvent.CHANGE, function(e:SwitcherEvent):void { trace("output id:" + e.value); } );
// output id:1
```
