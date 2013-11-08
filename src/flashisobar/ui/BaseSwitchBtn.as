package com.flashisobar.ui 
{

  import flash.display.*
  import flash.events.*

  import com.greensock.*;
  import com.greensock.easing.*;

  /**
   * button effect
   */
  public class BaseSwitchBtn extends MovieClip
  {

    private var _selected:Boolean;

    public function BaseSwitchBtn()
    {
      stop();
      buttonMode = true;
      // 避免 children 的元件干擾
      mouseChildren = false;
      _selected = false;

      addEventListener(MouseEvent.ROLL_OVER, overHandler)
      addEventListener(MouseEvent.ROLL_OUT, outHandler)
      addEventListener(MouseEvent.MOUSE_DOWN, downHandler)
      addEventListener(Event.REMOVED_FROM_STAGE, destroy);
    }

    public function destroy(e:Event = null):void {
      removeEventListener(MouseEvent.ROLL_OVER, overHandler);
      removeEventListener(MouseEvent.ROLL_OUT, outHandler);
      removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
    }

    private function overHandler(e:MouseEvent)
    {
      if (!_selected) {
        gotoAndPlay("in");
      }
    }

    private function outHandler(e:MouseEvent)
    {
      if (!_selected) {
        gotoAndPlay("out");
      }
    }

    private function downHandler(e:MouseEvent)
    {
      _selected = true;
      gotoAndStop("down");
    }

    public function get selected():Boolean 
    {
      return _selected;
    }

    public function set selected(value:Boolean):void 
    {
      _selected = value;
      if (!_selected) {
        gotoAndStop(1);
      }
      else {
        gotoAndStop("down");
      }
    }
  }
}
