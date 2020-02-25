//
//  SoundManager.swift
//  MatchApp
//
//  Created by 이민건 on 2/25/20.
//  Copyright © 2020 KRMing. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect: SoundEffect) {
        
        var soundFilename = ""
        
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        case .shuffle:
            soundFilename = "shuffle"
        }
        
        // get the file path to the resource
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: ".wav")
        
        // exception handling to make sure bundlePath is not nil
        guard bundlePath != nil else {
            return
        }
        
        // create an URL object
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            // create the audioPlayer object
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            // play the sound
            audioPlayer?.play()
        }
        catch {
            print("Couldn't create an audio player")
            return
        }
        
        
    }
    
}
