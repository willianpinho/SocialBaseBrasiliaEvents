//
//  ViewController.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Michel Monteiro on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import AlamofireImage

class EventListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let results = try! Realm().objects(Event.self).sorted(byProperty: "id")
    var notificationToken: NotificationToken?
    var eventSelected: Event = Event()
    let sendEvent = "sendEvent"
    
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        let event = results[indexPath.section]
        
        var imageUrl: URL?
        imageUrl = URL(string: event.eventCover!)
        
        cell.eventImage?.af_setImage(withURL: imageUrl!)
        
        cell.eventTitle?.text = event.eventName
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.eventSelected = results[indexPath.section]
        
        
        if (indexPath as NSIndexPath).section == indexPath.section  {
            
            self.performSegue(withIdentifier: sendEvent, sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendEvent" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! EventViewController
                controller.event = results[indexPath.section]
            }
            
            
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
    
}
