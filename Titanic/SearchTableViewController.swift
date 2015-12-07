//
//  SearchTableViewController.swift
//  Titanic
//
//  Created by Drew Keller and Travis Grammer on 12/1/15.
//  Copyright © 2015 Drew Keller. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    @IBOutlet weak var nameUITextField: UITextField!
    
    @IBOutlet weak var genderUISegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var maxAgeUISlider: UISlider!
    
    @IBOutlet weak var minAgeUISlider: UISlider!
    
    @IBOutlet weak var searchUIButton: UIButton!
    
    @IBOutlet weak var maxAgeLabel: UILabel!
    @IBOutlet weak var minAgeLabel: UILabel!
    
    
    var customSearch : Int = 0;
    var newMinAge : Double = 1.0;
    var newMaxAge : Double = 1.0;
    var newNameSearch : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        nameUITextField.text = "";
        
        maxAgeUISlider.maximumValue = 100;
        maxAgeUISlider.minimumValue = 1;
        maxAgeUISlider.value = 100.0;
        
        minAgeUISlider.maximumValue = 99;
        minAgeUISlider.minimumValue = 0;
        minAgeUISlider.value = 0.0;
        
        maxAgeLabel.text = "Maximum Age: 100";
        minAgeLabel.text = "Minimum Age: 0";
    }
    
    @IBAction func searchAction(sender: AnyObject) {
        //let mvc = MasterViewController();
        //print ("INSIDE SEARCH ACTION")
        self.newMaxAge = Double (maxAgeUISlider.value)
        self.newMinAge = Double (minAgeUISlider.value)
        self.newNameSearch = String (nameUITextField.text)
        //mvc.newMinAge = self.newMinAge
        //mvc.newMaxAge = self.newMaxAge
        //mvc.newCustomSearch = 1;
        //mvc.nameSearch = nameUITextField.text!;
        //mvc.updateValue(self.newMinAge)
        //print ("MVC NEW MIN AGE")
        //print (mvc.newMinAge)
        //print ("MVC NEW MAX AGE")
        //print (mvc.newMaxAge)
        //mvc.viewDidLoad();
        //self.dismissViewControllerAnimated(true, completion: nil );
        
        let mvc : MasterViewController = self.storyboard?.instantiateViewControllerWithIdentifier( "mvc" ) as! MasterViewController;
        
        mvc.updateMinAge( self.newMinAge );
        mvc.updateMaxAge( self.newMaxAge );
        mvc.updateNameSearch(self.newNameSearch)
        
        mvc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal;
        
        self.presentViewController(mvc, animated: true, completion: nil);
        
    }
    
    
    @IBAction func maxAgeChanged(sender: AnyObject) {
        // round to nearest whole number
        let interval = 1
        let maxSlideValue = Int(maxAgeUISlider.value / Float(interval) ) * interval
        maxAgeUISlider.value = Float(maxSlideValue)
        
        let maxAgeSliderValue = String(maxAgeUISlider.value);
        maxAgeLabel.text = "Maximum Age: \(maxAgeSliderValue)";
    }
    
    @IBAction func minAgeChanged(sender: AnyObject) {
        
        // round to nearest whole number
        let interval = 1
        let minSlideValue = Int(minAgeUISlider.value / Float(interval) ) * interval
        minAgeUISlider.value = Float(minSlideValue)
        
        let minAgeSliderValue = String(minAgeUISlider.value);
        minAgeLabel.text = "Minimum Age: \(minAgeSliderValue)";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    //  return 0
    //}
    
    //override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    //    return 0
    //}
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
