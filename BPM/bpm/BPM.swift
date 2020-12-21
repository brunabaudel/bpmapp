//
//  BPM.swift
//  BPM
//
//  Created by Bruna Baudel on 12/15/20.
//

import Foundation

class BPM {
    var times: [Int64]
    var taps: Int
    var tempo: Float
    var time: Float
    
    init() {
        self.times = []
        self.taps = 0
        self.tempo = 0.0
        self.time = 0.0
    }
}
