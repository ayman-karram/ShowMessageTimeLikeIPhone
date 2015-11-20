//
//  MessageTableViewCell.swift
//  ShowMessagesDate
//
//  Created by Ayman  on 10/2/15.
//  Copyright © 2015 ayman mohamed. All rights reserved.
//

import Foundation
import UIKit

class MessageTableViewCell: UITableViewCell {
  
  //MARK: Instance Variables
  @IBOutlet var messageContentLabel: MessagesLabel!
  @IBOutlet var messageTimeLabel: UILabel!
  @IBOutlet var messageTimeTrailingConstraint: NSLayoutConstraint!
  
  var messageType : MessageType?
  
  //MARK: Helper Methods
  func setCell (messageObject : Message) {
    guard let messageT = messageType else {
      return
    }
    switch messageT {
    case .Recived :
      messageContentLabel.backgroundColor = UIColor.grayColor()
    default :
      messageContentLabel.backgroundColor = UIColor.blueColor()
    }
    messageContentLabel.text = messageObject.content
    messageTimeLabel.text = messageObject.time
  }
  
}