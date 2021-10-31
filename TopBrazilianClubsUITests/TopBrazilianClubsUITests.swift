//
//  TopBrazilianClubsUITests.swift
//  TopBrazilianClubsUITests
//
//  Created by hugo.coutinho on 25/10/21.
//

import XCTest

class TopBrazilianClubsUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDownWithError() throws {
        continueAfterFailure = false
        takeScreenshot(named: self.name)
      }
    
    func testCollectionViewContainsFlamengoCell() {
        XCTAssertTrue(app.collectionViews.cells["Flamengo"].children(matching: .other).firstMatch.exists)
    }
    
    func testClubDetailContainsImageView() {
        app.collectionViews.cells["Flamengo"].children(matching: .other).element.tap()
        let clubImage = app.staticTexts.element(matching: .image, identifier: "ClubImage")
        XCTAssertNotNil(clubImage)
    }
    
    func testClubDetailContainsWinsCountLabel() {
        app.collectionViews.cells["Flamengo"].children(matching: .other).element.tap()
        let winsLabel = app.staticTexts.element(matching: .any, identifier: "clubWins").label
        XCTAssertNotNil(winsLabel)
        XCTAssertTrue(winsLabel.isEqual("Flamengo have been champion of national league 8 times"))
    }
    
    func testClubDetailContainsDescriptionLabel() {
        app.collectionViews.cells["Flamengo"].children(matching: .other).element.tap()
        let descriptionLabel = app.staticTexts.element(matching: .any, identifier: "ClubDescription").label
        XCTAssertNotNil(descriptionLabel)
        XCTAssertTrue(descriptionLabel.isEqual("Clube de Regatas do Flamengo, commonly referred to as Flamengo, is a Brazilian sports club based in Rio de Janeiro, in the neighbourhood of Gávea, best known for their professional football team"))
    }
    
    func takeScreenshot(named name: String) {        
        let mainScreenScreenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: mainScreenScreenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}


