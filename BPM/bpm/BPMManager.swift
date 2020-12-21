//
//  BPMManager.swift
//  BPM
//
//  Created by Bruna Baudel on 12/17/20.
//

import Foundation

class BPMManager {
    private static let MILLISECONDS_IN_A_MINUTE: Float = 60000.0
    private(set) static var bpm: BPM?
    
    init() {
        BPMManager.bpm = BPM.init()
    }
    
    func recordTime() {
        guard let bpm = BPMManager.bpm else {
            return
        }
        let curr = Int64(Date().timeIntervalSince1970 * 1000.0)
        bpm.times.append(curr)
    }
    
    func calcBPM() {
        guard let bpm = BPMManager.bpm, bpm.times.count >= 2 else {
            return
        }
        let dt = self.deltas()
        bpm.tempo = self.calculateBPM(deltas: dt)
    }
    
    func time() {
        guard let bpm = BPMManager.bpm else {
            return
        }
        let count = bpm.times.count
        bpm.time = Float(bpm.times[count - 1] - bpm.times[0])
    }
    
    func taps() {
        guard let bpm = BPMManager.bpm else {
            return
        }
        bpm.taps += 1
    }
    
    func clear() {
        BPMManager.bpm = nil
    }
    
    fileprivate func deltas() -> [Int64] {
        guard let bpm = BPMManager.bpm else {
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
