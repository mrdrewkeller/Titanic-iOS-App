//
//  XMLParser.swift
//  Titanic
//
//  Created by Travis on 12/1/15.
//  Copyright © 2015 Drew Keller AND TRAVIS. All rights reserved.
//

import Foundation

class XMLParser: NSObject, NSXMLParserDelegate {
    
    // vars
    var passengers : [Passenger];
    var currentPassenger : Passenger!;
    var currentElementValue: String!;
    
    override init() {
        passengers = [Passenger]( );
    }
    
    func doParse(data: NSData) {
        let nsXMLParser : NSXMLParser = NSXMLParser(data: data);
        nsXMLParser.delegate = self;
        
        let success : Bool = nsXMLParser.parse();
        if (success) {
            print("No errors during data parsing", terminator: "");
        } else {
            print("Error(s) occured during parsing!", terminator: "");
        }
    }
    
    // TODO func parser overrides
    
    func getPassengers() -> [Passenger] {
        return passengers;
    }

}