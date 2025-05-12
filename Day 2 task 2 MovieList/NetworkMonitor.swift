//
//  NetworkMonitor.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 08/05/2025.
//

import Foundation
import Network

class NetworkMonitor{
    
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    private (set) var isConnected:Bool = false
    
    
    private init(){
        
        monitor.pathUpdateHandler = {[weak self] path in self?.isConnected = path.status
            
            == .satisfied
            print(self?.isConnected == true ? "Online": "offline")
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
           monitor.cancel()
       }
    
}
