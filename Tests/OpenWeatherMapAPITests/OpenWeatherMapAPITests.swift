import XCTest
@testable import OpenWeatherMapAPI

final class OpenWeatherMapAPITests: XCTestCase {
    func testCreateClient() {

        let client = OpenWeatherMapAPI.initialize(apiKey: "")
        
        XCTAssertNotNil(client, "Initialization failed")
    }

    static var allTests = [
        ("testCreateClient", testCreateClient),
    ]
}
