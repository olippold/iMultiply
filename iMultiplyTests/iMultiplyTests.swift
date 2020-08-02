//
//  iMultiplyTests.swift
//  iMultiplyTests
//
//  Created by Oliver Lippold on 02/08/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import XCTest
@testable import iMultiply

class iMultiplyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testQuestionOperandsWithinBounds() {
        let question = Question()
        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.right, 12)
    }
    
    func testQuestionStringIsFormattedCorrectly() {
        let question = Question(left: 5, right: 5, operation: .multiply)
        XCTAssertEqual(question.string, "What is 5 multiplied by 5?")
    }
    
    func testAddingWorks() {
         let question = Question(left: 5, right: 5, operation: .add)
        XCTAssertEqual(question.answer, 10)
    }
    
    func testStringInputWorks() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        let result = game.process("10", for: question)
        XCTAssertEqual(result, "Correct!")
    }
    
    func testAnsweringQuestionIncrementsCounter() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        _ = game.process("10", for: question)
        XCTAssertEqual(game.questionNumber, 2)
    }
    
    func testGameCompletesAt11thQuestion() {
        let game = iMultiply()
        game.answerFunction = { "556" }
        game.start()
        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }

}
