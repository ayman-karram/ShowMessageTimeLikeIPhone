//
//  MessagesLabel.swift
//  MintParent
//
//  Created by Ayman Karram on 8/11/15.
//  Copyright © 2015 ayman mohamed. All rights reserved.

import UIKit

class MessagesLabel: UILabel {
  
  override func drawTextInRect(rect: CGRect) {
    let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    super.drawTextInRect(UIEdgeInsetsInsetRect(rect, edgeInsets))
  }
  
  override func awakeFromNib() {
    self.textAlignment = NSTextAlignment.Natural
    self.layer.cornerRadius = 12
    self.clipsToBounds = true
  }
  
  override func intrinsicContentSize() -> CGSize {
    var intrinsicSuperViewContentSize = super.intrinsicContentSize()
    intrinsicSuperViewContentSize.height += 10
    intrinsicSuperViewContentSize.width += 20
    return intrinsicSuperViewContentSize
    
  }
}