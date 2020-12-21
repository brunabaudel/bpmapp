//
//  BPM.swift
//  BPM
//
//  Created by Bruna Baudel on 12/15/20.
//

import Foundation

class BPM {
    private(set) var times: [Int64]
    private(set) var tempo: Float
    private(set) var taps: Int
    private(set) var time: Float
    
    init() {
        self.times = []
        self.taps = 0
        self.tempo = 0.0
        self.time = 0.0
    }
    
    func recordTimes(_ time: Int64) {
        self.times.append(time)
    }
    
    func countTempo(_ tempo: Float) {
        self.tempo = tempo
    }
    
    func countTaps() {
        self.taps += 1
    }
    
    func countTime() {
        let count = self.times.count
        self.time = Float(self.times[count - 1] - self.times[0])
    }
}
