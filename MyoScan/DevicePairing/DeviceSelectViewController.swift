//
//  DeviceSelectViewController.swift
//  MyoScan
//
//  Created by Yatharth Chhabra on 7/27/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit
import WatchConnectivity

class DeviceSelectViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        if error != nil{
            //show error
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        <#code#>
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        <#code#>
    }
    
    @IBOutlet weak var aWatchButton: UIButton!
    
    @IBOutlet weak var movesenseButton: UIButton!
    
    @IBOutlet weak var selectionLabel: UILabel!
    
    var watchOrMove: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure selection Label
        selectionLabel.text = DevicePairingConstants.SELECT_DEVICE_TEXT
        // Configure Apple watch Button
        aWatchButton.titleLabel?.text = DevicePairingConstants.APPLE_WATCH_TEXT
        // Configure Movesense Button
        movesenseButton.titleLabel?.text = DevicePairingConstants.MOVESENSE_TEXT
    }
    @IBAction func watchPressed(_ sender: UIButton) {
        checkWatchConnection()
        watchOrMove = true
    }
    
    @IBAction func movesensePressed(_ sender: UIButton) {
        watchOrMove = false
        self.performSegue(withIdentifier: "pairSegue", sender: nil)
    }
    
    private func checkWatchConnection(){
        if WCSession.isSupported() { // check if the device support to handle an Apple Watch
            let session = WCSession.default
            session.delegate = self
            session.activate() // activate the session
            
            if session.isPaired { // Check applewatch pairing
                  self.performSegue(withIdentifier: "watchStreamSegue", sender: nil)
            }
            else{
                //show error message
            }
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}
