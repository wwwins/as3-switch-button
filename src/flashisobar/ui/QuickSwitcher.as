package com.flashisobar.ui 
{
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  import flash.events.Event;
  import flash.events.MouseEvent;

  /**
   * quick switch button
   * Usage:
   * BaseSwitchBtn - set switch button movieclip Base Class:BaseSwitchBtn
   * QuickSwitcher - set switch buttons container movieclip Class: QuickSwitcher
   * 
   * 
   * @author flashisobar
   */
  public class QuickSwitcher extends MovieClip
  {
    /*
       public var btn_type0:MovieClip;
       public var btn_type1:MovieClip;
       public var btn_type2:MovieClip;
       public var btn_type3:MovieClip;
     */

    // switch btn
    private var _indexSwitch:int = -1;
    //private var _arrSwitchBtn:Array = ["btn_type0", "btn_type1", "btn_type2", "btn_type3"];
    private var _arrSwitchBtn:Array;
    private var _switchSelectedType:int;

    //private static var instance:QuickSwitch = QuickSwitch;

    public function QuickSwitcher()
    {
      if (stage)
        init();
      else
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event = null):void 
    {
      removeEventListener(Event.ADDED_TO_STAGE, init);

      addEventListener(Event.REMOVED_FROM_STAGE, destroy);
      trace("QuickSwitcher init");
      initSwitchBtn();
    }

    private function destroy(e:Event = null):void 
    {
      removeEventListener(Event.REMOVED_FROM_STAGE, destroy);

      removeSwitchBtn();
    }

    // Returns the single global instance of this class.
    /*
       public static function getInstance():QuickSwitcher
       {
       if (instance == null)
       instance = new QuickSwitcher();
       return instance;
       }
     */

    //{# switch button start
    private function initSwitchBtn(__index:int = 0):void
    {
      _arrSwitchBtn = [];
      for (var j:int = 0; j < this.numChildren; j++) 
      {
        _arrSwitchBtn.push(this.getChildAt(j));
      }
      for (var i:int = 0; i < _arrSwitchBtn.length; i++)
      {
        _arrSwitchBtn[i].addEventListener(MouseEvent.CLICK, mySwitchClick);
      }
      if (__index > -1)
      {
        _arrSwitchBtn[__index].selected = true;
        _indexSwitch = __index;
        resetSwitchBtn();
      }
    }

    private function resetSwitchBtn():void
    {
      for (var i:int = 0; i < _arrSwitchBtn.length; i++)
      {
        if (_indexSwitch != i)
        {
          _arrSwitchBtn[i].selected = false;
        }
      }
    }

    private function removeSwitchBtn():void
    {
      for (var i:int = 0; i < _arrSwitchBtn.length; i++)
      {
        _arrSwitchBtn[i].removeEventListener(MouseEvent.CLICK, mySwitchClick);
      }
    }

    private function mySwitchClick(e:MouseEvent):void
    {

      if (e.target is Object)
      {
        var displayObj:DisplayObject = e.target as DisplayObject;
        _switchSelectedType = _indexSwitch = this.getChildIndex(displayObj);
        resetSwitchBtn();
      }
    }

    private function setSwitchBtn(__id:int):void
    {
      _indexSwitch = __id;
      _arrSwitchBtn[__id].selected = true;
      resetSwitchBtn();
    }
    //}# switch button end

  }

}
