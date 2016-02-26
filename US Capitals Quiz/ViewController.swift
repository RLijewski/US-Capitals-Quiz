//
//  ViewController.swift
//  US Capitals Quiz
//
//  Created by Ryan Lijewski on 5/28/15.
//  Copyright (c) 2015 Developed By Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    // ***********************
    // Variables and Outlets *
    // ***********************
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var startOverButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var playAgain: UIButton!
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    @IBOutlet var answerD: UIButton!
    
    var capitalsQuiz = CapitalsQuiz()
    var usedStates = [String]()
    var currentCorrectAnswer = String()
    let quizLength = 10
    var numberOfQuestionsAnswered = 0
    var score = 0
    var redButtonColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    var greenButtonColor = UIColor(red: 51/255, green: 204/255, blue: 51/255, alpha: 1)
    var greenTextColor = UIColor(red: 36/255, green: 143/255, blue: 36/255, alpha: 1)
    var redTextColor = UIColor(red: 184/255, green: 0/255, blue: 0/255, alpha: 1)
    var blueTextColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
    
    
    // **************
    // My functions *
    // **************
    
    func populateQuiz() {
        //hide next button
        nextButton.hidden = true
        
        //hide play again button
        playAgain.hidden = true
        
        //show question
        questionLabel.hidden = false
        
        //Show score
        scoreLabel.hidden = false
        scoreLabel.text = "Score: \(score)/\(numberOfQuestionsAnswered)"
        
        //show start over button
        startOverButton.hidden = false
        
        //show buttons
        enableButtons()
        answerA.hidden = false
        answerA.layer.cornerRadius = 5
        answerB.hidden = false
        answerB.layer.cornerRadius = 5
        answerC.hidden = false
        answerC.layer.cornerRadius = 5
        answerD.hidden = false
        answerD.layer.cornerRadius = 5
        
        //change button color to white
        answerA.backgroundColor = UIColor.whiteColor()
        answerB.backgroundColor = UIColor.whiteColor()
        answerC.backgroundColor = UIColor.whiteColor()
        answerD.backgroundColor = UIColor.whiteColor()
        
        //change button text to blue
        answerA.setTitleColor(blueTextColor, forState: UIControlState.Normal)
        answerB.setTitleColor(blueTextColor, forState: UIControlState.Normal)
        answerC.setTitleColor(blueTextColor, forState: UIControlState.Normal)
        answerD.setTitleColor(blueTextColor, forState: UIControlState.Normal)
        
        // Load question
        // Generate random number
        var randomNumber = capitalsQuiz.getRandomNumber()
        //pick a random state
        var state = capitalsQuiz.getRandomState(randomNumber)
        capitalsQuiz.states.removeAtIndex(randomNumber)
        usedStates.append(state)
        //display question
        var question = capitalsQuiz.createQuestion(state)
        questionLabel.text = question
        
        //load possible answers
        //get capital of selected state and assign it to currentCorrectAnswer
        var capital = capitalsQuiz.findState(state)
        currentCorrectAnswer = capital!
        //add possible answers to array
        var answers = capitalsQuiz.pickCapitals(capital!)
        //display possible answers in button labels
        answerA.setTitle(answers[0], forState: UIControlState.Normal)
        answerB.setTitle(answers[1], forState: UIControlState.Normal)
        answerC.setTitle(answers[2], forState: UIControlState.Normal)
        answerD.setTitle(answers[3], forState: UIControlState.Normal)
        
    }
    
    func checkAnswer(answer: String) -> Bool {
        //check to see if selected answer = correct answer
        if answer == currentCorrectAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func showNextButton() {
        nextButton.hidden = false
    }
    
    func hideQuestion() {
        questionLabel.hidden = true
    }
    
    func displayEndOfGameScreen(playerScore: Int) {
        scoreLabel.hidden = true
        startOverButton.hidden = true
        nextButton.hidden = true
        questionLabel.hidden = false
        playAgain.hidden = false
        answerA.hidden = true
        answerB.hidden = true
        answerC.hidden = true
        answerD.hidden = true
        
        if playerScore == quizLength {
            questionLabel.text = "Congradulations!\nYou got a perfect score!\n\(score)/\(numberOfQuestionsAnswered)"
        } else {
            questionLabel.text = "You answered \(score)/\(numberOfQuestionsAnswered) questions correctly"
        }
    }
    
    func resetQuiz() {
        capitalsQuiz.states += usedStates
        usedStates.removeAll()
        score = 0
        numberOfQuestionsAnswered = 0
        viewDidLoad()
    }
    
    func answerSelected(choice: UIButton) {
        if checkAnswer(choice.currentTitle!) {
            choice.backgroundColor = greenButtonColor
            choice.setTitleColor(greenTextColor, forState: UIControlState.Normal)
        } else {
            choice.backgroundColor = redButtonColor
            choice.setTitleColor(redTextColor, forState: UIControlState.Normal)
        }
        disableButtons()
        showNextButton()
        hideQuestion()
    }
    
    func disableButtons() {
        answerA.enabled = false
        answerB.enabled = false
        answerC.enabled = false
        answerD.enabled = false
    }
    
    func enableButtons() {
        answerA.enabled = true
        answerB.enabled = true
        answerC.enabled = true
        answerD.enabled = true
    }
    
    
    
    // ***********************
    // Default App functions *
    // ***********************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if numberOfQuestionsAnswered != quizLength {
            populateQuiz()
        } else {
            displayEndOfGameScreen(score)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // *********************
    // button click events *
    // *********************
    
    
    //Option A
    @IBAction func checkAnswerA() {
        answerSelected(answerA)
    }
    
    //Option B
    @IBAction func checkAnswerB() {
        answerSelected(answerB)
    }
    
    //Option C
    @IBAction func checkAnswerC() {
        answerSelected(answerC)
    }
    
    //Option D
    @IBAction func checkAnswerD() {
        answerSelected(answerD)
    }
    
    //Next question button
    @IBAction func repopulateQuiz() {
        numberOfQuestionsAnswered += 1
        viewDidLoad()
    }
    
    //play again button
    @IBAction func reset() {
        resetQuiz()
    }
    
    //start over button
    @IBAction func startQuizOver() {
        resetQuiz()
    }
    
    
    
    
}

