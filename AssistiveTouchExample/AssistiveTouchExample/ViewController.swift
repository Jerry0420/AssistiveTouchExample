//
//  ViewController.swift
//  AssistiveTouchExample
//
//  Created by JerryWang on 2017/4/29.
//  Copyright © 2017年 Jerrywang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    let screenBounds = UIScreen.main.bounds
    
    var ballWindow : CustomUIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballWindow = CustomUIWindow(frame: CGRect(x: screenBounds.width - 68, y: 65, width: 65, height: 65))
        
        textField.delegate = self
        
        print(UIWindowLevelAlert) //2000
        print(UIWindowLevelNormal) //0
        print(UIWindowLevelStatusBar) //1000
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowDidBecomeVisible(_:)), name: NSNotification.Name.UIWindowDidBecomeVisible, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIWindowDidBecomeVisible, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ballWindow?.isHidden = false
        
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Alert", message: "TestTest", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "ActionSheet", message: "TestTest", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func windowDidBecomeVisible(_ notification:Notification){
        
        let window = notification.object as! UIWindow
        let windows = UIApplication.shared.windows
        
        print("\nwindow目前總數：\(windows.count)")
        print("Become Visible資訊：\(window)")
        print("windowLevel數值：\(window.windowLevel)\n")
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
