package com.flashisobar.events
{
  import flash.events.Event;

  /**
   * switcher event
   *
   * @author flashisobar
   */
  public class SwitcherEvent extends Event 
  {
    public static const CHANGE:String = "SwitcherChange";

    public var value:int;

    public function SwitcherEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, idx:int=0) 
    { 
      super(type, bubbles, cancelable);

      value = idx;
    } 

    public override function clone():Event 
    { 
      return new SwitcherEvent(type, bubbles, cancelable);
    } 

    public override function toString():String 
    { 
      return formatToString("SwitcherEvent", "type", "bubbles", "cancelable", "eventPhase"); 
    }

  }

}

