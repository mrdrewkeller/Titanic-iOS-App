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
    
    func parseFileWithURL(url: NSURL) {
        let nsXMLParser : NSXMLParser = NSXMLParser(contentsOfURL: url)!;
        nsXMLParser.delegate = self;
        
        let success : Bool = nsXMLParser.parse();
        if (success) {
            print("No errors during data parsing", terminator: "");
        } else {
            print("Error(s) occured during parsing!", terminator: "");
        }
    }
    
    /* XML document structure
    <document>
        <passenger id="1">
            <name>...</name>
            <sex>...</sex>
            ....
        </passenger>
        ...
    </document>
    */
    
    // find openning tags
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        // start a new Passenger object
        print("start element:" + elementName + "\n", terminator: "");
        if (elementName == "passenger") {
            currentPassenger = Passenger()
        }
    }
    
    // find closing tags & set values for passengers
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("end element: " + elementName + "\n", terminator: "")
        switch elementName {
            case "passengers": // root XML tag
                return // don't do anything
            case "passenger":
                passengers.append(currentPassenger);
            default:
                if (currentPassenger != nil) {
                    currentPassenger.setValue(currentElementValue, forKey: elementName);
                }            
        }
    }
    
    // find tag content
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        // found characters
        print( "found characters: " + string + "\n", terminator: "")
        currentElementValue = string;
    }
    
    func getPassengers() -> [Passenger] {
        return passengers;
    }

}