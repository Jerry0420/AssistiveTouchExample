//
//  CustomUIWindow.swift
//  AssistiveTouchExample
//
//  Created by JerryWang on 2017/4/29.
//  Copyright © 2017年 Jerrywang. All rights reserved.
//

import UIKit

class CustomUIWindow: UIWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.contents = UIImage(named: "ball1")?.cgImage
        windowLevel = UIWindowLevelAlert + 1
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        pan.delaysTouchesBegan = true
        addGestureRecognizer(pan)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handlePanGesture(pan: UIPanGestureRecognizer){
        
        let translation = pan.translation(in: UIApplication.shared.keyWindow)
        let originalCenter = center
        center = CGPoint(x:originalCenter.x + translation.x, y:originalCenter.y + translation.y)
        pan.setTranslation(CGPoint.zero, in: UIApplication.shared.keyWindow)
    }

}
