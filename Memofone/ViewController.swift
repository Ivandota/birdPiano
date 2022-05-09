//
//  ViewController.swift
//  Memofone
//
//  Created by иван Бирюков on 02.04.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        
        
        if let buttonName = sender.titleLabel?.text {
            playSound(soundName: buttonName)
        }
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        //func asyncAfter(deadline: DispatchTime, execute: DispatchWorkItem)
        // Планирует выполнение рабочего элемента в указанное время и немедленно возвращает его.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
    }
    
    func playSound(soundName: String) {

        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            return
        }
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
        
    }

}

