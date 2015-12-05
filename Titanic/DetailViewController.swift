//
//  DetailViewController.swift
//  Titanic
//
//  Created by Drew Keller AND TRAVIS on 12/1/15.
//  Copyright © 2015 Drew Keller AND ALSO TRAVIS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var survivedLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sibspLabel: UILabel!
    @IBOutlet weak var parchLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!
    @IBOutlet weak var cabinLabel: UILabel!
    @IBOutlet weak var embarkedLabel: UILabel!
    
    var row:Int!;
    var passengers: [Passenger]!;
    
    func setRow(newRow: Int) {
        row = newRow;
    }
    
    func assignPassengers(newPassengers : [Passenger]) {
        passengers = newPassengers;
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            //self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
        self.title = passengers[row].name;
        if (passengers[row].survived) {
            self.survivedLabel.text = "Survived";
        } else {
            self.survivedLabel.text = "Died";
        }
        self.sexLabel.text = passengers[row].sex
        self.ageLabel.text = "\(passengers[row].age)"
        self.sibspLabel.text = "\(passengers[row].sibsp)"
        self.parchLabel.text = "\(passengers[row].parch)"
        self.classLabel.text = "\(passengers[row].pclass)"
        self.ticketLabel.text = passengers[row].ticket
        self.fareLabel.text = "\(passengers[row].fare)"
        self.cabinLabel.text = passengers[row].cabin
        self.embarkedLabel.text = passengers[row].embarked
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

