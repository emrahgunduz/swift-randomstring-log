import Foundation

extension String {
  public func leftPadding(toLength: Int, withPad character: Character) -> String {
    let stringLength = self.count
    if stringLength < toLength {
      return String(repeatElement(character, count: toLength - stringLength)) + self
    } else {
      return String(self.suffix(toLength))
    }
  }

  public func rightPadding(toLength: Int, withPad character: Character) -> String {
    return self.padding(toLength: toLength, withPad: String(character), startingAt: 0)
  }
}