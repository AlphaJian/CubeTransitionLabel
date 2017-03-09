//
//  CubeLabel.swift
//  CubeTransitionLabel
//
//  Created by Jian Zhang on 3/9/17.
//  Copyright © 2017 AZ. All rights reserved.
//

import UIKit

enum TransitionDirection : Int
{
    case Up = 1
    case Down = -1
}

class CubeLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


    func cubeTransition(newText : String, direction : TransitionDirection, duration : CGFloat)
    {
        self.superview?.clipsToBounds = true
        let auxLabel = UILabel(frame: self.frame)
        auxLabel.text = newText
        auxLabel.backgroundColor = self.backgroundColor
        auxLabel.font = self.font
        auxLabel.textColor = self.textColor
        auxLabel.textAlignment = self.textAlignment
        self.superview?.addSubview(auxLabel)
        
        let auxLabelOffset = auxLabel.frame.height / 2 * CGFloat(direction.rawValue)
        auxLabel.transform = (CGAffineTransform(scaleX: 1, y: 0.1)).concatenating(CGAffineTransform(translationX: 0, y: auxLabelOffset))
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: .curveEaseOut, animations: {
            auxLabel.transform = CGAffineTransform.identity
            
            self.transform = (CGAffineTransform(scaleX: 1, y: 0.1)).concatenating(CGAffineTransform.init(translationX: 0, y: -auxLabelOffset))
        }) { _ in
            self.text = newText
            self.transform = CGAffineTransform.identity
            
            auxLabel.removeFromSuperview()
        }
    }
}
