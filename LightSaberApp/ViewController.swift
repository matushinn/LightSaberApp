//
//  ViewController.swift
//  LightSaberApp
//
//  Created by 大江祥太郎 on 2018/10/27.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    
    //加速度センサーを使うためのオブジェクトを格納します
    let motionManager:CMMotionManager = CMMotionManager()
    //iPhoneを降った音を出すための再生オブジェクトを格納します
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    //ボタンを押した時の音を出すための再生オブジェクトを格納します
    var startAudioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    func setupSound(){
        //ボタンを押した時の音を設定する
        if let sound = Bundle.main.path(forResource: "light_saber1", ofType: ".mp3"){
            startAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            startAudioPlayer.prepareToPlay()
        }
        //iPhoneを振った時の音を設定する
        if let sound = Bundle.main.path(forResource: "light_saber3", ofType: ".mp3"){
            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            audioPlayer.prepareToPlay()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //音の準備
        setupSound()
    }

    @IBAction func tappedStartButton(_ sender: Any) {
        startAudioPlayer.play()
    }
    
}

