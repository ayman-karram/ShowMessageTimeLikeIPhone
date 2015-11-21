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
  
  var timeShown = false

  //MARK: Helper Methods
  func setCell (messageObject : Message) {
    guard let messageT = messageObject.messageType else {
      return
    }
    switch messageT {
    case .Recived :
      messageContentLabel.textColor = UIColor.whiteColor()
      if !timeShown{
        messageTimeTrailingConstraint.constant = -messageTimeLabel.bounds.width
      }
    default :
      messageContentLabel.textColor = UIColor.blackColor()
      if !timeShown{
        messageTimeTrailingConstraint.constant = -messageTimeLabel.bounds.width
      }
    }
    messageContentLabel.text = messageObject.content
    messageTimeLabel.text = messageObject.time
  }
  
}