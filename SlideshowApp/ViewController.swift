//
//  ViewController.swift
//  SlideshowApp
//
//  Created by MikaYamashita on 2020/11/07.
//  Copyright © 2020 mika.yamashita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    var play = "再生"

    // タイマー
    var timer: Timer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapAction(_ sender: Any) {
        stop()
        performSegue(withIdentifier: "subView",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "subView") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewControllerのnumにcountを設定
            subVC.num = count
        }
    }
    
    func stop(){
        playBtn.setTitle("再生", for: .normal)
        play = "再生"
        self.timer.invalidate()   // タイマーを停止する
        self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        goBtn.isEnabled = true
        backbtn.isEnabled = true
    }
    
    func next(){
        if count == 5{
            count = 1
        }else{
            count += 1
        }
        imageView.image = UIImage(named: "\(count).png")
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    @objc func slideshow(_ timer: Timer) {
        next()
    }
    
    //再生、停止ボタン
    @IBAction func play(_ sender: Any) {
        if play == "再生"{
            playBtn.setTitle("停止", for: .normal)
            play = "停止"
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true)
            }
            goBtn.isEnabled = false
            backbtn.isEnabled = false
            
        }else{
            stop()
        }
        
    }
    
    //進むボタン
    @IBAction func next(_ sender: Any) {
        next()
    }
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        if count == 1{
            count = 5
        }else{
            count -= 1
        }
        imageView.image = UIImage(named: "\(count).png")
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

