//
//  BPMManager.swift
//  BPM
//
//  Created by Bruna Baudel on 12/17/20.
//

import Foundation

class BPMManager {
    private static let MILLISECONDS_IN_A_MINUTE: Float = 60000.0
    private(set) var bpm: BPM?
    
    init() {
        self.bpm = BPM.init()
    }
    
    func recordTime() {
        if let bpm = self.bpm {
            let curr = Int64(Date().timeIntervalSince1970 * 1000.0)
            bpm.recordTimes(curr)
        }
    }
    
    func tempo() {
        if let bpm = self.bpm {
            bpm.countTempo(self.calcBPM())
        }
    }
    
    func time() {
        if let bpm = self.bpm {
            bpm.countTime()
        }
    }
    
    func taps() {
        if let bpm = self.bpm  {
            bpm.countTaps()
        }
    }
    
    func clear() {
        self.bpm = nil
    }
    
    fileprivate func calcBPM() -> Float {
        guard let bpm = self.bpm, bpm.times.count >= 2 else {
            return 0
        }
        let dt = self.deltas()
        return self.calculateBPM(deltas: dt)
    }
    
    fileprivate func deltas() -> [Int64] {
        guard let bpm = self.bpm else {
            return []
        }
        var deltas: [Int64] = []
        let count = bpm.times.count - 1
        for i in 0..<count {
            let delta = bpm.times[i + 1] - bpm.times[i]
            deltas.append(Int64(delta))
        }
        return deltas
    }
    
    fileprivate func calculateBPM(deltas: [Int64]) -> Float {
        var sum: Int64 = 0
        for d in deltas {
            sum += d
        }
        let avarage: Float = Float(sum / Int64(deltas.count))
        return Float((BPMManager.MILLISECONDS_IN_A_MINUTE / avarage))
    }
}
