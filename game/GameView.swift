//
//  GameView.swift
//  game
//
//  Created by User11 on 2019/5/7.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import AudioToolbox
var timer: Timer?
var gameTimer: Timer?

var down: Timer?
var oldTime = "00"
var i = 0
class GameView: UIViewController {

    @IBOutlet weak var lose: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var finish_button: UIButton!
    @IBOutlet weak var time_out: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    var apples: [UIButton] = [UIButton]()
    class Apple{
        var type:Int
        var x:Int
        var y:Int
        init(){
            self.type = Int.random(in: 0...1)
            self.x = ((Int.random(in: 1...300)%3)*100)+10
            self.y = Int.random(in: 100...200)
        }
    }
    
    @objc func press(sender: UIButton!)
    {
        if sender.currentImage == UIImage(named:"apple-removebg.png"){
            if let win_score = win.text, let good = Int(win_score){
                AudioServicesPlaySystemSound(1057)
                win.text = String(good+1)
            }
            
        }
        else
        {
            if let lose_score = lose.text, let bad = Int(lose_score){
                AudioServicesPlaySystemSound(1006)
                lose.text = String(bad+1)
            }
            
        }
        sender.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sec = 30
        time_out.isHidden = true
        finish_button.isHidden = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
    
            self.timeLabel.text = String(sec)
            if sec > 0
            {
                sec = sec - 1
            }
            else
            {
                for item in self.apples{
                    item.isHidden = true
                }
                
                self.time_out.isHidden = false
                self.finish_button.isHidden = false
                self.timeLabel.isHidden = true
                if timer != nil {
                    timer?.invalidate()
                    gameTimer?.invalidate()
                    down?.invalidate()
                }
            }
            
        }
        
        down = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            for item in self.apples{
                item.center.y += 10
            }
            
        }
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (_) in
            if Int.random(in:  0...100)%2 == 0
            {
                let button = UIButton()
                let fruit = Apple()
                if fruit.type == 1{
                    button.setImage(UIImage(named: "apple-removebg.png"), for: .normal)
                }
                else{
                    button.setImage(UIImage(named: "badapple-removebg.png"), for: .normal)
                }
                button.frame = CGRect(x: fruit.x, y:fruit.y, width:123,height:86)
                button.addTarget(self, action: #selector(self.press(sender:)), for: .touchUpInside)
                self.apples.append(button)
                self.view.addSubview(button)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? GameOver
        controller?.win = win.text
        controller?.lose = lose.text
    }
    

    

}
