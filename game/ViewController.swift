//
//  ViewController.swift
//  game
//
//  Created by User11 on 2019/5/7.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SafariServices
import UserNotifications
class ViewController: UIViewController , SFSafariViewControllerDelegate {

    @IBOutlet weak var highestScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let highest = UserDefaults.standard.integer(forKey: "highest")
        highestScore.text = String(highest)
    }

    
    @IBAction func goToWeb(_ sender: AnyObject)
    {
        if let url = URL(string: "https://medium.com/")
        {
            let safari = SFSafariViewController(url: url)
            safari.delegate = self
            present(safari, animated: true, completion: nil)
        }
        
        let content = UNMutableNotificationContent()
        content.title = "驚喜"
        content.subtitle = "Picking Apples"
        content.body = "快點來玩遊戲囉"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func gameRule(_ sender: Any) {
        let controller = UIAlertController(title: "遊戲說明", message: "請使用你的生命去點選『健康』的蘋果，若不幸點選到死亡蘋果．．．．．哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈！！！！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}

