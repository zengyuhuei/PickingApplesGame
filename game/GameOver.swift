//
//  GameOver.swift
//  game
//
//  Created by User11 on 2019/5/7.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class GameOver: UIViewController {

    @IBOutlet weak var overHighestScore: UIImageView!
    @IBOutlet weak var angel2: UIImageView!
    @IBOutlet weak var angel1: UIImageView!
    @IBOutlet weak var killer: UIImageView!
    @IBOutlet weak var bad_score: UILabel!
    @IBOutlet weak var good_score: UILabel!
    @IBOutlet weak var score: UILabel!
    var win : String?
    var lose : String?
    
    func ShowResult()
    {
        overHighestScore.isHidden = true
        let highest = UserDefaults.standard.integer(forKey: "highest")
        if let win_score = win, let lose_score = lose, let good = Int(win_score), let bad = Int(lose_score)
        {
            
            good_score.text = win_score
            bad_score.text = lose_score
            if good - bad > 0
            {
                angel1.isHidden = false
                angel2.isHidden = false
                killer.isHidden = true
                score.text = String(good - bad)
                if good - bad > highest{
                    UserDefaults.standard.set(good - bad, forKey: "highest")
                    overHighestScore.isHidden = false
                }
                
            }
            else
            {
                angel1.isHidden = true
                angel2.isHidden = true
                killer.isHidden = false
                score.text = String("你對不起社會大眾！")
                score.font = UIFont.boldSystemFont(ofSize: 21)
                score.textColor = UIColor.red
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowResult()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restart(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "second") {
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func homePage(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "first") {
            present(controller, animated: true, completion: nil)
        }
    }
    

}
