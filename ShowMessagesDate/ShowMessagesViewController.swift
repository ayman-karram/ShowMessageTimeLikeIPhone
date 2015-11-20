//
//  ShowMessagesViewController.swift
//  ShowMessagesDate
//
//  Created by Ayman  on 10/2/15.
//  Copyright © 2015 ayman mohamed. All rights reserved.
//

import Foundation
import UIKit

class ShowMessagesViewController: UIViewController {
  
  var messages : [Message] = []
  
  //MARK: Instance Variables
  override func viewDidLoad() {
    
  }
  
  //MARK: Helper Methods
  func setMessages(){
    
    messages.append(Message(messageContent: "Hi", messageDate: "", type: MessageType.Send))
    messages.append(Message(messageContent: "Hi", messageDate: "", type: MessageType.Recived))
    messages.append(Message(messageContent: "how are you", messageDate: "", type: MessageType.Send))
    messages.append(Message(messageContent: "I am fian", messageDate: "", type: MessageType.Recived))
    messages.append(Message(messageContent: "did you go to word today?", messageDate: "", type: MessageType.Send))
    messages.append(Message(messageContent: "Yes i did", messageDate: "", type: MessageType.Recived))

  }

}

extension ShowMessagesViewController:UITableViewDataSource , UITableViewDelegate {
  
  // table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell") as? MessageTableViewCell
    cell!.setCell(messages[indexPath.row])
    return cell!
  }

}