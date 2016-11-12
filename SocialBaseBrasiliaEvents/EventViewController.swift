//
//  EventDetailViewController.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Willian Pinho on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import UIKit

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    let sections = ["Main Photo", "Event Title", "Event Description"]
    
    var event : Event =  Event()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
        self.view.bringSubview(toFront: closeButton)
        
        self.tableView.estimatedRowHeight = 77.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func close(_ sender: UIButton) {
        if ((self.navigationController) != nil) {
            self.navigationController?.popViewController(animated: true)
        } else {
            [self .dismiss(animated: true, completion: nil)]
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).section == 0 {
            return 250
        }
            
        else if (indexPath as NSIndexPath).section == 1 {
            return 80
        }
            
        else if (indexPath as NSIndexPath).section == 2 {
            return 280
            
        }
        
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as UITableViewCell!
        if (cell == nil) {
            cell = UITableViewCell(style:.default, reuseIdentifier: "CELL")
        }
        
        if (indexPath as NSIndexPath).section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as! EventImageTableViewCell
            
            var imageUrl: URL?
            imageUrl = URL(string: self.event.eventCover!)
            cell.eventImage.af_setImage(withURL: imageUrl!)
            
            
            return cell
        }
        else if (indexPath as NSIndexPath).section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventTitleTableViewCell", for: indexPath) as! EventTitleTableViewCell
            
            cell.title.text = self.event.eventName
            
            return cell
            
        }
        
        else if (indexPath as NSIndexPath).section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventDescriptionTableViewCell", for: indexPath) as! EventDescriptionTableViewCell
            
            cell.eventDescription.delegate = self
            cell.eventDescription.isScrollEnabled = false
            
            cell.eventDescription.text = event.eventDescription
            
            return cell
            
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected cell number: \((indexPath as NSIndexPath).section)!")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}

extension EventViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}
