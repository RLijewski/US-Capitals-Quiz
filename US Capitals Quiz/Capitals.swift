//
//  Capitals.swift
//  US Capitals Quiz
//
//  Created by Ryan Lijewski on 5/28/15.
//  Copyright (c) 2015 Developed By Ryan. All rights reserved.
//

import Foundation

struct CapitalsQuiz {

    // dictionary of states and their capitals
    let stateCapitals = [
        "Alabama" : "Montgomery",
        "Alaska" : "Juneau",
        "Arizona" : "Phoenix",
        "Arkansas" : "Little Rock",
        "California" : "Sacramento",
        "Colorado" : "Denver",
        "Connecticut" : "Hartford",
        "Delaware" : "Dover",
        "Florida" : "Tallahassee",
        "Georgia" : "Atlanta",
        "Hawaii" : "Honolulu",
        "Idaho" : "Boise",
        "Illinois" : "Springfield",
        "Indiana" : "Indianapolis",
        "Iowa" : "Des Moines",
        "Kansas" : "Topeka",
        "Kentucky" : "Frankfort",
        "Louisiana" : "Baton Rouge",
        "Maine" : "Augusta",
        "Maryland" : "Annapolis",
        "Massachusetts" : "Boston",
        "Michigan" : "Lansing",
        "Minnesota" : "Saint Paul",
        "Mississippi" : "Jackson",
        "Missouri" : "Jefferson City",
        "Montana" : "Helena",
        "Nebraska" : "Lincoln",
        "Nevada" : "Carson City",
        "New Hampshire" : "Concord",
        "New Jersey" : "Trenton",
        "New Mexico" : "Santa Fe",
        "New York" : "Albany",
        "North Carolina" : "Raleigh",
        "North Dakota" : "Bismarck",
        "Ohio" : "Columbus",
        "Oklahoma" : "Oklahoma City",
        "Oregon" : "Salem",
        "Pennsylvania" : "Harrisburg",
        "Rhode Island" : "Providence",
        "South Carolina" : "Columbia",
        "South Dakota" : "Pierre",
        "Tennessee" : "Nashville",
        "Texas" : "Austin",
        "Utah" : "Salt Lake City",
        "Vermont" : "Montpelier",
        "Virginia" : "Richmond",
        "Washington" : "Olympia",
        "West Virginia" : "Charleston",
        "Wisconsin" : "Madison",
        "Wyoming" : "Cheyenne"
    ]
    
    //array of the 50 states
    var states = [
        "Alabama",
        "Alaska",
        "Arizona",
        "Arkansas",
        "California",
        "Colorado",
        "Connecticut",
        "Delaware",
        "Florida",
        "Georgia",
        "Hawaii",
        "Idaho",
        "Illinois",
        "Indiana",
        "Iowa",
        "Kansas",
        "Kentucky",
        "Louisiana",
        "Maine",
        "Maryland",
        "Massachusetts",
        "Michigan",
        "Minnesota",
        "Mississippi",
        "Missouri",
        "Montana",
        "Nebraska",
        "Nevada",
        "New Hampshire",
        "New Jersey",
        "New Mexico",
        "New York",
        "North Carolina",
        "North Dakota",
        "Ohio",
        "Oklahoma",
        "Oregon",
        "Pennsylvania",
        "Rhode Island",
        "South Carolina",
        "South Dakota",
        "Tennessee",
        "Texas",
        "Utah",
        "Vermont",
        "Virginia",
        "Washington",
        "West Virginia",
        "Wisconsin",
        "Wyoming"
    ]
    
    //array of 50 capitals
    var capitals = [
        "Montgomery",
        "Juneau",
        "Phoenix",
        "Little Rock",
        "Sacramento",
        "Denver",
        "Hartford",
        "Dover",
        "Tallahassee",
        "Atlanta",
        "Honolulu",
        "Boise",
        "Springfield",
        "Indianapolis",
        "Des Moines",
        "Topeka",
        "Frankfort",
        "Baton Rouge",
        "Augusta",
        "Annapolis",
        "Boston",
        "Lansing",
        "Saint Paul",
        "Jackson",
        "Jefferson City",
        "Helena",
        "Lincoln",
        "Carson City",
        "Concord",
        "Trenton",
        "Santa Fe",
        "Albany",
        "Raleigh",
        "Bismarck",
        "Columbus",
        "Oklahoma City",
        "Salem",
        "Harrisburg",
        "Providence",
        "Columbia",
        "Pierre",
        "Nashville",
        "Austin",
        "Salt Lake City",
        "Montpelier",
        "Richmond",
        "Olympia",
        "Charleston",
        "Madison",
        "Cheyenne"
    ]
    
    
    // *********************************************
    // Generate question containing a random state *
    // *********************************************
    
    // Generate random number
    func getRandomNumber() -> Int {
        var unsignedArrayCount = UInt32(states.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        return randomNumber
    }
    
    // Use random number to pull a state from the states array
    func getRandomState(randomNumber: Int) -> String {
        return states[randomNumber]
    }
    
    // Display question using the randomly pulled state
    func createQuestion(state: String) -> String {
        var question = "Which city is the capital of"
        return "\(question) \(state)?"
    }
    
    
    // ********************************
    // Generate four possible answers *
    // ********************************
    
    //find state in dictionary and return capital
    func findState(selectedState: String) -> String? {
        for state in stateCapitals.keys {
            if state == selectedState {
                return stateCapitals[selectedState]
            }
        }
        return nil
    }
    
    
    // Randomly generate three wrong answers
    func pickCapitals(correctAnswer: String) -> [String] {
        var answers = [correctAnswer]
        
        for var i = 0; i < 3; i++ {
            //generate random index
            var rdmIndex = self.getRandomNumber()
            //check if random index is equal to correct answer
            if capitals[rdmIndex] != correctAnswer {
                answers.append(capitals[rdmIndex])
            }
            //if random index is equal to correct answer, generate new random
            while capitals[rdmIndex] == correctAnswer {
                //generate new random number
                rdmIndex = self.getRandomNumber()
                //check if random index is equal to correct answer
                if capitals[rdmIndex] != correctAnswer {
                    answers.append(capitals[rdmIndex])
                }
            }
        }
        //sort and return array
        return answers.sorted {$0 < $1}
    }
}





