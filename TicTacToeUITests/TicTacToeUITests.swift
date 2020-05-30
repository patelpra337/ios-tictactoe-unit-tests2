//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by patelpra on 5/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    func testFirstXMark() throws {
        // UI tests must launch the application that they test.
        // 1.  We have the application
        let app = XCUIApplication()
        app.launch()
        
        // Add the identifer to the button in Main.storyboard
        // Tap to generate an X
        // 2.  We have the query and a single element
        let topleftButton = app.buttons["com.tictactoe.board.topleft"]
        topleftButton.tap()
        
        // Test whether we did indeed tap an X.
        
        // To prove that something is true.
        // If it isn't true, then stop execution and fail the test.
        // Messages is why you failed the test.
        
        // XCUIApplication().staticTexts["com.tictactoe.turnPlayer"].tap()
        
        // Test that it's O player's turn.  Testing the Label
        // 3.  We have the Assert
        let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
        XCTAssert(statusLabel.label == "Player O's turn", "Next player is incorrect")
        
        // Test that the button has an X in it.
        XCTAssertEqual(topleftButton.label, "X")
    
    }
    
    func testTie() {
        
        let app = XCUIApplication()
        app.launch()
        
        validatePlacement(app: app, identifier: "com.tictactoe.board.topleft", expectedButtonLabel: "X", nextPlayer: "O")
        validatePlacement(app: app, identifier: "com.tictactoe.board.middlecenter", expectedButtonLabel: "O", nextPlayer: "X")
        validatePlacement(app: app, identifier: "com.tictactoe.board.bottomleft", expectedButtonLabel: "X", nextPlayer: "O")
        validatePlacement(app: app, identifier: "com.tictactoe.board.bottomright", expectedButtonLabel: "O", nextPlayer: "X")
        validatePlacement(app: app, identifier: "com.tictactoe.board.middleright", expectedButtonLabel: "X", nextPlayer: "O")
        validatePlacement(app: app, identifier: "com.tictactoe.board.middleleft", expectedButtonLabel: "O", nextPlayer: "X")
        validatePlacement(app: app, identifier: "com.tictactoe.board.topcenter", expectedButtonLabel: "X", nextPlayer: "O")
        validatePlacement(app: app, identifier: "com.tictactoe.board.topright", expectedButtonLabel: "O", nextPlayer: "X")
        validatePlacement(app: app, identifier: "com.tictactoe.board.bottomcenter", expectedButtonLabel: "X", nextPlayer: "O")
        
        // What do I want to test?
        // The topLeft button received an X
        // It's player's o turn now.
        // Bottomright received an O
        // It's player's x turn now
        
        // Transpose below app.buttons above using the func validatePlacement
        // app.buttons["com.tictatoe.board.topleft"].staticTexts[" "].tap()
        
        // app.buttons["com.tictatoe.board.middleRight"].tap()
        // app.buttons["com.tictatoe.board.middleCenter"].tap()
        
        // app.buttons["com.tictatoe.board.topCenter"].tap()
        // app.buttons["com.tictatoe.board.topRight"].tap()
        
        // app.buttons["com.tictatoe.board.middleLeft"].tap()
        
        // app.buttons["com.tictatoe.board.bottomCenter"].tap()
        // app.buttons["com.tictatoe.board.bottomLeft"].tap()
        // app/*@START_MENU_TOKEN@*/.buttons["com.tictatoe.board.bottomRight"]/*[[".buttons[\" \"]",".buttons[\"com.tictatoe.board.bottomRight\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        //        let app = XCUIApplication()
        //        app.buttons["com.tictatoe.board.topleft"].staticTexts[" "].tap()
        //        app.buttons["com.tictatoe.board.middleCenter"].staticTexts[" "].tap()
        //        app.buttons["com.tictatoe.board.bottomLeft"].staticTexts[" "].tap()
        //        app.buttons["com.tictatoe.board.bottomRight"].staticTexts[" "].tap()
        //        app.buttons["com.tictatoe.board.middleRight"].tap()
        //        app.buttons["com.tictatoe.board.middleLeft"].tap()
        //        app.buttons["com.tictatoe.board.topCenter"].staticTexts[" "].tap()
        //        app.buttons["com.tictatoe.board.topRight"].staticTexts[" "].tap()
        //        app/*@START_MENU_TOKEN@*/.staticTexts[" "]/*[[".buttons[\" \"].staticTexts[\" \"]",".buttons[\"com.tictatoe.board.bottomCenter\"].staticTexts[\" \"]",".staticTexts[\" \"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
    func validatePlacement(app: XCUIApplication, identifier: String, expectedButtonLabel: String, nextPlayer: String) {
        
        // The button received an X/O
        
        let tappedButton = app.buttons[identifier]
        tappedButton.tap()
        XCTAssertEqual(tappedButton.label, expectedButtonLabel)
        
        // It's player's O/X turn now.
        let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
        XCTAssert(statusLabel.label == "Player \(nextPlayer)'s turn", "Next player is incorrect")
    }
}
