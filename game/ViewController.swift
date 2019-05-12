//
//  ViewController.swift
//  game
//
//  Created by User11 on 2019/5/7.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation
import UserNotifications
class ViewController: UIViewController , SFSafariViewControllerDelegate {
    
    var looper: AVPlayerLooper?
    @IBOutlet weak var highestScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let highest = UserDefaults.standard.integer(forKey: "highest")
        highestScore.text = String(highest)
        if let url = URL(string: "https://r2---sn-ipoxu-un5s.googlevideo.com/videoplayback?id=o-AGEh_tEifByfvO6PUZ6CmQhDaCCM43Tb13UN1Vknyfkx&itag=140&source=youtube&requiressl=yes&mm=31,29&mn=sn-ipoxu-un5s,sn-un57sn76&ms=au,rdu&mv=m&pl=24&ei=FzHYXNXrHoin4ALv7ZSACw&gcr=tw&initcwndbps=1091250&mime=audio/mp4&gir=yes&clen=846015&otfp=1&dur=52.221&lmt=1541860943712796&mt=1557672119&fvip=4&keepalive=yes&c=WEB&txp=2211222&ip=114.35.111.239&ipbits=0&expire=1557693816&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,ei,gcr,initcwndbps,mime,gir,clen,otfp,dur,lmt&signature=08A1FDD6ED1B990DAAD7ABD2EEF4BA80AF050B4D.D91C82E48E471D777DA89E9711ACBC6EDA0AF6C6&key=yt8&signature=undefined&title=%E6%91%A9%E7%88%BE%E8%8E%8A%E5%9C%92-%E9%96%8B%E5%BF%83%E8%BE%B2%E5%A0%B4%E8%83%8C%E6%99%AF%E9%9F%B3%E6%A8%82+%E9%A6%96%E6%92%AD%E6%B8%AC%E8%A9%A6") {
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
    }

    
    @IBAction func goToWeb(_ sender: AnyObject)
    {
        if let url = URL(string: "https://medium.com/@apppeterpan")
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

