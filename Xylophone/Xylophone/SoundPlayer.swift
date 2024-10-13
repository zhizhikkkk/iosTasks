//
//  SoundPlayer.swift
//  Xylophone
//
//  Created by Arman Sarvardin on 12.10.2024.
//

import Foundation
import AVFoundation

enum SoundPlayerError: Error {
    case invalidFile
}

@globalActor actor SoundPlayer {
    
    static let shared: SoundPlayer = .init()
    
    static private var soundPlayer: AVAudioPlayer?
    
    private init() {}
    
    @MainActor
    func play(sound: Sound) throws {
        
        SoundPlayer.soundPlayer?.stop()
        SoundPlayer.soundPlayer = nil
        
        guard let file = Bundle.main.url(
            forResource: sound.filename,
            withExtension: "wav"
        ) else {
            throw SoundPlayerError.invalidFile
        }
        
        SoundPlayer.soundPlayer = try .init(contentsOf: file)
        SoundPlayer.soundPlayer?.play()
        
    }
}
