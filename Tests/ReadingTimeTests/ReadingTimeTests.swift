import XCTest
@testable import ReadingTime

enum ReadingTime {
    static func calculate(for content: String) -> TimeInterval {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = content.components(separatedBy: chararacterSet)
        let words = components.filter { !$0.isEmpty }
        let timeIntervalInMinutes = Double(words.count) / 265.0
        let timeIntervalInMilliseconds = timeIntervalInMinutes * 60 * 1000

        return round(timeIntervalInMilliseconds * 100) / 100.0
    }
}

final class ReadingTimeTests: XCTestCase {
    func test_WhenContentsOfAFileAreProvider_ThenReadingTimeIsReturned() {
        let contents = "Hello World! This is my article!"
        let calculatedTime = ReadingTime.calculate(for: contents)
        
        XCTAssertEqual(calculatedTime, 1358.49)
    }
}
