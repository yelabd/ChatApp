//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Youssef Elabd on 2/23/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var messages : [PFObject] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ChatViewController.query), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSend(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["text"] = messageTextfield.text
        message.saveInBackground { (succes: Bool, error: Error?) in
            if let error = error{
                print(error)
            }
            else{
                print("Yaas")
            }
        }
        
    }
    
    func query(){
        var query = PFQuery(className: "Message")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    self.messages = objects
                }
            } else {
                
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        tableView.reloadData()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageViewCell
        
        let row = indexPath.row
        
       let message = messages[row]
        
        
        //        if (businessInfo.rating < 4.0 && businessInfo.rating > 2){
        //            let yellowColor = UIColor(red: 255/255.0, green: 223/255.0, blue: 0/255.0, alpha: 1.0)
        //            cell.ratingView.backgroundColor = yellowColor
        //        }else if(businessInfo.rating <= 2){
        //            cell.ratingView.backgroundColor = UIColor.red
        //        }
        
        
        cell.messageLabel.text = message["text"] as? String
        
        return cell
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
