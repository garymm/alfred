import Quartz

let NX_KEYTYPE_PLAY: UInt32 = 16

func HIDPostAuxKey() {
  func keyDown(_ down: Bool) {
    let flags = NSEvent.ModifierFlags(rawValue: (down ? 0xa00 : 0xb00))
    let data1 = Int((NX_KEYTYPE_PLAY << 16) | (down ? 0xa00 : 0xb00))

    let ev = NSEvent.otherEvent(with: NSEvent.EventType.systemDefined,
                                location: NSPoint(x:0,y:0),
                                modifierFlags: flags,
                                timestamp: 0,
                                windowNumber: 0,
                                context: nil,
                                subtype: 8,
                                data1: data1,
                                data2: -1)
    let cev = ev?.cgEvent
    cev?.post(tap: CGEventTapLocation.cghidEventTap)
  }

  keyDown(true)
  keyDown(false)
}

HIDPostAuxKey()