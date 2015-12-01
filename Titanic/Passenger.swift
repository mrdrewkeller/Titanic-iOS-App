//
//  Passenger.swift
//  Titanic
//
//  Created by Travis on 12/1/15.
//  Copyright © 2015 Drew Keller AND TRAVIS. All rights reserved.
//

import Foundation

class Passenger: NSObject {
    var name : String = "";
    var sex : String = "";
    var age : Double = 0.0;
    var survived : Bool = true; // optimistism
    var pclass : Int = 0;
    var sibsp : Int = 0;
    var parch : Int = 0;
    var ticket : String? = "";
    var fare : Double? = 0;
    var cabin : String? = "";
    var embarked : String? = "";
    
    func toString() -> String {
        return ""; // TODO
    }
    
}