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
    


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
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

