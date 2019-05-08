//
//  GameView.swift
//  game
//
//  Created by User11 on 2019/5/7.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
var timer: Timer?
var oldTime = "00"
let images = ["1","2","3","4","5"]
var i = 0
class GameView: UIViewController {

    @IBOutlet weak var lose: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var finish_button: UIButton!
    @IBOutlet weak var time_out: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var apple: UIButton!
    class Apple{
        var type:Int
        var left:Int
        
        init(){
            self.type = Int.random(in: 0...1)
            self.left = Int.random(in: 1...360)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sec = 3
        time_out.isHidden = true
        finish_button.isHidden = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
    
            self.timeLabel.text = String(sec)
            if sec > 0
            {
                sec = sec - 1
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3.5, delay: 0, animations: {
                    self.apple.center = CGPoint(x: Int.random(in: 100..<410), y: 890)
                })
            }
            else
            {
                if timer != nil {
                    timer?.invalidate()
                    self.time_out.isHidden = false
                    self.finish_button.isHidden = false
                    self.timeLabel.isHidden = true
                }
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? GameOver
        controller?.win = win.text
        controller?.lose = lose.text
    }
    

    

}
