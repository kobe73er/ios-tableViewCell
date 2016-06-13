//
//  ViewController.swift
//  TableViewTutorail
//
//  Created by kobe73er on 16/6/13.
//  Copyright © 2016年 kobe73er. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var tableView: UITableView!
    // These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    let images:[String] = ["meal1","meal2","meal3"]
    
    // These are the colors of the square views in our table view cells.
    // In a real project you might use UIImages.
    let colors = [UIColor.blueColor(), UIColor.yellowColor(), UIColor.magentaColor(), UIColor.redColor(), UIColor.brownColor()]
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row%2==0{
            
            
            let cell:MyCustomCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! MyCustomCell
            
            cell.myView.backgroundColor = self.colors[indexPath.row]
            //        if(indexPath.row<images.count){
            //            cell.myImageView.image  = UIImage(named: self.images[indexPath.row])!
            //        }
            cell.myCellLabel.text = self.animals[indexPath.row]
            
            
            return cell
        }else{
            let imageCell:ImageViewCell = self.tableView.dequeueReusableCellWithIdentifier("cellImage") as! ImageViewCell
            
            imageCell.secondImageView.image = UIImage(named:"meal1")!
            imageCell.secondLabel.text = "text1"
            
            
            return imageCell
        }
        
    }
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
    
    
    
}

