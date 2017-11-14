//
//  ViewController.swift
//  Clicker
//
//  Created by NZ on 07.09.17.
//  Copyright © 2017 NZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var pressmeButton: UIButton!
    @IBOutlet var coinsLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var autoclickupgradetimesLabel: UILabel!
    @IBOutlet var autoclickupgradeprizeLabel: UILabel!
    @IBOutlet var clickupgradetimesLabel: UILabel!
    @IBOutlet var clickupgradeprizeLabel: UILabel!
    @IBOutlet var clickupgradeButton: UIButton!
    @IBOutlet var clickvalueLabel: UILabel!
    @IBOutlet var autoclickvalueLabel: UILabel!
    @IBOutlet var progressbarupgradeButton: UIButton!
    @IBOutlet var progressbarupgradeprizeLabel: UILabel!
    @IBOutlet var progressbarupgradetimesLabel: UILabel!
    @IBOutlet var stage1progressView: UIProgressView!
    @IBOutlet var stage1progressLabel: UILabel!
    
    var counterVar: Float = 0
    var progressVar: Float = 0.0
    var substractor: Float = 0.0
    var multiplier: Float = 1
    var divider: Float = 10
    var coins: Float = 0
    var barreward : Float = 1
    var clickupgradeVar: Float = 1
    var clickupgradeprizeVar: Float = 10
    var clickupgradetimesVar: Float = 0
    var clickupgrademaxBool: Bool = false
    var clickupgradeplusVar: Float = 1
    var autoclickupgradeVar: Float = 0
    var autoclickupgradeplusVar: Float = 1
    var autoclickupgradetimesVar: Float = 0
    var autoclickupgrademaxBool: Bool = false
    var autoclickupgradeprizeVar: Float = 20
    var progressbarupgradeVar: Float = 0
    var progressbarupgradetimesVar: Float = 0
    var progressbarupgradeprizeVar: Float = 50
    var progressbarupgradeplusVar: Float = 1
    var progressbarupgrademaxBool: Bool = false
    var stage1progressVar: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
        progressView.progressTintColor = UIColor.blue
        
            }
    
    @objc func updateCounter(timer:Timer){

                counterVar = counterVar + autoclickupgradeVar
                counterLabel.text = String(Int(counterVar))
                stage1progressLabel.text = String(Int(counterVar))
                progressVar = (counterVar - substractor) / divider
                progressView.progress = progressVar
                stage1progressVar = counterVar / 1000000
                stage1progressView.progress = stage1progressVar
       
            if counterVar >= divider * multiplier
            {
                substractor = substractor + divider
                coins = coins + barreward
                progressVar = 0.0
                multiplier = multiplier + 1
            }
            if coins >= 1000
            {
                coinsLabel.text = "Coins: " + String(format: "%.1f", coins / 1000) + "k"
            }
            else
            {
                coinsLabel.text = "Coins: " + String(Int(coins))
            }
            if counterVar >= 1000000
            {
                self.performSegue(withIdentifier: "GameOver", sender: nil)
            }
        }
    
   
    
    @IBAction func autoclickupgradeButton(sender: AnyObject) {
            if coins >= autoclickupgradeprizeVar
            {
                if autoclickupgrademaxBool == false
                {
                autoclickupgradeVar = autoclickupgradeVar + autoclickupgradeplusVar
                coins = coins - autoclickupgradeprizeVar
                autoclickupgradetimesVar = autoclickupgradetimesVar + 1
                
                autoclickupgradetimesLabel.text = String(Int(autoclickupgradetimesVar)) + "x"
                }
            }
            if autoclickupgradetimesVar == 1
            {
                autoclickupgradeprizeVar = 40
                autoclickupgradeplusVar = 2
            }
            if autoclickupgradetimesVar == 2
            {
                autoclickupgradeprizeVar = 60
                autoclickupgradeplusVar = 2
            }
            if autoclickupgradetimesVar == 3
            {
                autoclickupgradeprizeVar = 80
                autoclickupgradeplusVar = 4
            }
            if autoclickupgradetimesVar == 4
            {
                autoclickupgradeprizeVar = 150
                autoclickupgradeplusVar = 6
            }
            if autoclickupgradetimesVar == 5
            {
                autoclickupgradeprizeVar = 200
                autoclickupgradeplusVar = 8
            }
            if autoclickupgradetimesVar == 6
            {
                autoclickupgradeprizeVar = 500
                autoclickupgradeplusVar = 15
            }
            if autoclickupgradetimesVar == 7
            {
                autoclickupgradeprizeVar = 1200
                autoclickupgradeplusVar = 17
            }
            if autoclickupgradetimesVar == 8
            {
                autoclickupgradeprizeVar = 2000
                autoclickupgradeplusVar = 25
            }
            if autoclickupgradetimesVar == 9
            {
                autoclickupgradeprizeVar = 4000
                autoclickupgradeplusVar = 50
            }
            if autoclickupgradetimesVar == 10
            {
                autoclickupgradeprizeVar = 8000
                autoclickupgradeplusVar = 120
            }
            if autoclickupgradetimesVar == 11
            {
                autoclickupgradeprizeVar = 20000
                autoclickupgradeplusVar = 500
            }
            if autoclickupgradetimesVar == 12
            {
                autoclickupgradeprizeVar = 50000
                autoclickupgradeplusVar = 1000
            }
            if autoclickupgradetimesVar == 13
            {
                autoclickupgradeprizeVar = 100000
                autoclickupgradeplusVar = 1500
            }
            if autoclickupgradetimesVar == 14
            {
                autoclickupgrademaxBool = true
                autoclickupgradeplusVar = 2000
            }
            if autoclickupgradeprizeVar >= 1000
            {
                if autoclickupgrademaxBool == false
                {
                    autoclickupgradeprizeLabel.text = String(format: "%.1f",autoclickupgradeprizeVar / 1000) + "kC"
                }
                else
                {
                    autoclickupgradeprizeLabel.text = "max"
                }
            }
            else
            {
                autoclickupgradeprizeLabel.text = String(Int(autoclickupgradeprizeVar)) + "C"
            }
            if coins >= 1000
            {
                 coinsLabel.text = "Coins: " + String(format: "%.1f", coins / 1000) + "k"
            }
            else
            {
                coinsLabel.text = "Coins: " + String(Int(coins))
            }
            if autoclickupgradeVar >= 1000
            {
                autoclickvalueLabel.text = "Auto-Click: " + String(format: "%.1f", autoclickupgradeVar / 1000) + "k"
            }
            else
            {
                autoclickvalueLabel.text = "Auto-Click: " + String(Int(autoclickupgradeVar))
            }
        }
    
    
    @IBAction func clickupgradeButton(sender: Any) {
    
            if clickupgrademaxBool == false
            {
            if coins >= clickupgradeprizeVar
            {
    
                clickupgradetimesVar = clickupgradetimesVar + 1
                clickupgradeVar = clickupgradeVar + clickupgradeplusVar
                coins = coins - clickupgradeprizeVar
        
                clickupgradetimesLabel.text = String(Int(clickupgradetimesVar)) + "x"
                }
            }
            if clickupgradetimesVar == 1
            {
                clickupgradeprizeVar = 30
                clickupgradeplusVar = 1
            }
            if clickupgradetimesVar == 2
            {
                clickupgradeprizeVar = 50
                clickupgradeplusVar = 1
            }
            if clickupgradetimesVar == 3
            {
                clickupgradeprizeVar = 150
                clickupgradeplusVar = 2
            }
            if clickupgradetimesVar == 4
            {
                clickupgradeprizeVar = 300
                clickupgradeplusVar = 3
            }
            if clickupgradetimesVar == 5
            {
                clickupgradeprizeVar = 500
                clickupgradeplusVar = 5
            }
            if clickupgradetimesVar == 6
            {
                clickupgradeprizeVar = 1000
                clickupgradeplusVar = 7
            }
            if clickupgradetimesVar == 7
            {
                clickupgradeprizeVar = 1500
                clickupgradeplusVar = 10
            }
            if clickupgradetimesVar == 8
            {
                clickupgradeprizeVar = 2500
                clickupgradeplusVar = 15
            }
            if clickupgradetimesVar == 9
            {
                clickupgradeprizeVar = 4000
                clickupgradeplusVar = 30
            }
            if clickupgradetimesVar == 10
            {
                clickupgradeprizeVar = 6000
                clickupgradeplusVar = 50
            }
            if clickupgradetimesVar == 11
            {
                clickupgradeprizeVar = 8500
                clickupgradeplusVar = 70
            }
            if clickupgradetimesVar == 12
            {
                clickupgradeprizeVar = 10000
                clickupgradeplusVar = 100
            }
            if clickupgradetimesVar == 13
            {
                clickupgradeprizeVar = 20000
                clickupgradeplusVar = 500
            }
            if clickupgradetimesVar == 14
            {
                clickupgradeprizeVar = 50000
                clickupgradeplusVar = 700
            }
            if clickupgradetimesVar == 15
            {
                clickupgradeprizeVar = 100000
                clickupgradeplusVar = 1000
            }
            if clickupgradetimesVar == 16
            {
                clickupgrademaxBool = true
                clickupgradeplusVar = 1200
            }
            if clickupgradeprizeVar >= 1000
            {
                if clickupgrademaxBool == false
                {

                    clickupgradeprizeLabel.text = String(format: "%.1f", clickupgradeprizeVar / 1000) + "kC"
                }
                else
                {
                    clickupgradeprizeLabel.text = "max"
                }
            }
            else
            {
                clickupgradeprizeLabel.text = String(Int(clickupgradeprizeVar)) + "C"
            }
            if coins >= 1000
            {
                coinsLabel.text = "Coins: " + String(format: "%.1f", coins / 1000) + "k"
            }
            else
            {
                coinsLabel.text = "Coins: " + String(Int(coins))
            }
            if clickupgradeVar >= 1000
            {
                clickvalueLabel.text = "Click: " + String(format: "%.1f", clickupgradeVar / 1000) + "k"
            }
            else
            {
                clickvalueLabel.text = "Click: " + String(Int(clickupgradeVar))
            }
        }
    
    @IBAction func pressmeButton(sender: Any) {
    
                    counterVar = counterVar + clickupgradeVar
                    counterLabel.text = String(Int(counterVar))
                    stage1progressLabel.text = String(Int(counterVar))
                    progressVar = (counterVar - substractor) / divider
                    progressView.progress = progressVar
                    stage1progressVar = counterVar / 1000000
                    stage1progressView.progress = stage1progressVar
        
            if counterVar >= divider * multiplier
            {
                substractor = substractor + divider
                coins = coins + barreward
                progressVar = 0.0

                multiplier = multiplier + 1
            }
        
            if coins >= 1000
            {
                coinsLabel.text = "Coins: " + String(format: "%.1f", coins / 1000) + "k"
            }
            else
            {
                coinsLabel.text = "Coins: " + String(Int(coins))
            }
            if counterVar >= 1000000
            {
                self.performSegue(withIdentifier: "GameOver", sender: nil)
            }
        }

    @IBAction func progressupgradebarButton(sender: AnyObject) {
        
            if coins >= Float(progressbarupgradeprizeVar)
            {
                if progressbarupgrademaxBool == false
                {
                    progressbarupgradeVar = progressbarupgradeVar + progressbarupgradeplusVar
                    progressbarupgradetimesVar = progressbarupgradetimesVar + 1
                    coins = coins - Float(progressbarupgradeprizeVar)
                    progressbarupgradetimesLabel.text = String(Int(progressbarupgradetimesVar)) + "x"
                    progressbarupgradeplusVar = progressbarupgradeplusVar + 1
                    
                }
            }
            if progressbarupgradeVar == 1
            {
                progressView.progressTintColor = UIColor.yellow
                divider = 20
                barreward = 5
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeprizeVar = 200
                progressbarupgradeVar = 0
            }
            if progressbarupgradeVar == 2
            {
                progressView.progressTintColor = UIColor.red
                divider = 100
                barreward = 40
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeprizeVar = 1000
                progressbarupgradeVar = 0
            }
            if progressbarupgradeVar == 3
            {
                progressView.progressTintColor = UIColor.green
                divider = 500
                barreward = 300
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeprizeVar = 2000
                progressbarupgradeVar = 0
                
            }
            if progressbarupgradeVar == 4
            {
                progressView.progressTintColor = UIColor.purple
                divider = 2000
                barreward = 1500
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeprizeVar = 7000
                progressbarupgradeVar = 0
            }
            if progressbarupgradeVar == 5
            {
                progressView.progressTintColor = UIColor.black
                divider = 5000
                barreward = 4000
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeprizeVar = 50000
                progressbarupgradeVar = 0
            }
            if progressbarupgradeVar == 6
            {
                progressView.progressTintColor = UIColor.brown
                divider = 20000
                barreward = 17500
                counterVar = 0
                progressVar = 0.0
                progressView.progress = progressVar
                substractor = 0.0
                multiplier = 1
                progressbarupgradeVar = 0
                progressbarupgradeprizeVar = 200000
                progressbarupgrademaxBool = true
            }
            if progressbarupgradeprizeVar >= 1000
            {
                if progressbarupgrademaxBool == false
                {
                  
                    progressbarupgradeprizeLabel.text = String(format: "%.1f", progressbarupgradeprizeVar / 1000) + "kC"
                }
                else
                {
                    progressbarupgradeprizeLabel.text = "max"
                }
            }
            else
            {
                progressbarupgradeprizeLabel.text = String(Int(progressbarupgradeprizeVar)) + "C"
            }
            if coins >= 1000
            {
                coinsLabel.text = "Coins: " + String(format: "%.1f", coins / 1000) + "k"
            }
            else
            {
                coinsLabel.text = "Coins: " + String(Int(coins))
            }
        }
    
}


