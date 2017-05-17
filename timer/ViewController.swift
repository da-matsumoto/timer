//
//  ViewController.swift
//  timer
//
//  Created by 松本大佑 on 2017/05/17.
//  Copyright © 2017年 daisuke.matsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var timerLabel: UILabel!
  
  var timer: Timer!
		
  //タイマー用の時間のための変数
  var timer_sec: Float = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //selector: #selector(updatetimer)で指定された関数
  //timeInterval: 0.1, repeats: true で指定された通り、0.1秒ごとに呼び出され続ける
  func updateTimer(timer: Timer){
    self.timer_sec += 0.1
    self.timerLabel.text = String(format: "%.1f", timer_sec)
  }
  
  //再生ボタン
  @IBAction func startTimer(_ sender: Any) {
    //動作中のタイマーを一つに保つために、timerが存在しない場合だけタイマーを生成して動作させる
    if self.timer == nil {
    self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
  }
  
  //一時停止ボタン
  @IBAction func stopTimer(_ sender: Any) {
    self.timer.invalidate() //現在のタイマーを破壊
    self.timer = nil //startTimer()の　timer == nil で判断するために timer = nilとしておく
  }
  
  //リセットボタン
  @IBAction func resetTimer(_ sender: Any) {
    self.timer_sec = 0
    self.timerLabel.text = String(format: "%.1f", timer_sec)
    
    if self.timer != nil {
      self.timer.invalidate() //現在のタイマーを破壊
      self.timer = nil
    }
  }
  


}

