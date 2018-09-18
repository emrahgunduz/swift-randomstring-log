#if os(macOS) || os(iOS) || os(tvOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif

import Foundation

public enum Color: UInt {
  case foregroundDefault      = 39
  case foregroundBlack        = 30
  case foregroundRed          = 31
  case foregroundGreen        = 32
  case foregroundYellow       = 33
  case foregroundBlue         = 34
  case foregroundMagenta      = 35
  case foregroundCyan         = 36
  case foregroundLightGray    = 37
  case foregroundDarkGray     = 90
  case foregroundLightRed     = 91
  case foregroundLightGreen   = 92
  case foregroundLightYellow  = 93
  case foregroundLightBlue    = 94
  case foregroundLightMagenta = 95
  case foregroundLightCyan    = 96
  case foregroundWhite        = 97
  case backgroundRed          = 41
  case backgroundGreen        = 42
  case backgroundBlue         = 44
  case backgroundDefault      = 49

  public var asString: String {
    return "\u{001B}[0;\(rawValue)m"
  }
};

public struct Log {

  private static func dateString () -> String {
    let date     = Date()
    let calendar = Calendar.current
    let day      = String(format: "%02d", calendar.component(.day, from: date))
    let month    = String(format: "%02d", calendar.component(.month, from: date))
    let year     = String(format: "%04d", calendar.component(.year, from: date))
    let hour     = String(format: "%02d", calendar.component(.hour, from: date))
    let minute   = String(format: "%02d", calendar.component(.minute, from: date))
    let second   = String(format: "%02d", calendar.component(.second, from: date))

    return "\(day)-\(month)-\(year) \(hour):\(minute):\(second)"
  }

  private static func padTitle (title: String) -> String {
    let tag    = " \(title) ]"
    let padded = tag.leftPadding(toLength: 20, withPad: " ")
    return "[" + padded
  }

  public static func end (message: String) -> Void {
    let a: String = Color.foregroundBlue.asString
    let b: String = Color.foregroundRed.asString
    let c: String = Color.foregroundDarkGray.asString
    let d: String = Color.foregroundDefault.asString

    print(a, dateString(), c, padTitle(title: "ERROR"), b, message, d)
    exit(1)
  }

  public static func log (title: String, message: String) -> Void {
    let a: String = Color.foregroundBlue.asString
    let b: String = Color.foregroundGreen.asString
    let c: String = Color.foregroundDarkGray.asString
    let d: String = Color.foregroundDefault.asString

    print(a, dateString(), c, padTitle(title: title), b, message, d)
  }

  public static func debug (title: String, message: String) -> Void {
#if DEBUG
    let a: String = Color.foregroundBlue.asString
    let b: String = Color.foregroundCyan.asString
    let c: String = Color.foregroundDarkGray.asString
    let d: String = Color.foregroundDefault.asString

    print(a, dateString(), c, padTitle(title: title), b, message, d)
#endif
  }

  public static func warning (title: String, message: String) -> Void {
    let a: String = Color.foregroundBlue.asString
    let b: String = Color.foregroundCyan.asString
    let c: String = Color.foregroundDarkGray.asString
    let d: String = Color.foregroundDefault.asString

    print(a, dateString(), c, padTitle(title: title), b, message, d)
  }

  public static func error (title: String, message: String) -> Void {
    let a: String = Color.foregroundBlue.asString
    let b: String = Color.foregroundRed.asString
    let c: String = Color.foregroundDarkGray.asString
    let d: String = Color.foregroundDefault.asString

    print(a, dateString(), c, padTitle(title: title), b, message, d)
  }
}