//
//  DeviceSelectViewController.swift
//  MyoScan
//
//  Created by Yatharth Chhabra on 7/27/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit
import WatchConnectivity

class DeviceSelectViewController: UIViewController{//, WCSessionDelegate {
    
//    var badWatchAlert = UIAlertController(title: "Warning", message: "Apple Watch not paired. \n Please connect Apple Watch", preferredStyle: UIAlertController.Style.alert)
//
//    var goodWatchAlert: UIAlertController!
//
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//
//        if error != nil{
//            //show error message if no watch paired
//            badWatchAlert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: dismissBadWatchAlert))
//            self.present(badWatchAlert, animated: true, completion: nil)
//        }
//    }
//
//    func sessionDidBecomeInactive(_ session: WCSession) {
//        print("Apple Watch session become inactive")
//    }
//
//    func sessionDidDeactivate(_ session: WCSession) {
//        print("Apple Watch session was deactivated")
//    }
//
    @IBOutlet weak var aWatchButton: UIButton!
    
    @IBOutlet weak var movesenseButton: UIButton!
    
    @IBOutlet weak var selectionLabel: UILabel!
    
    var watchOrMove: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure selection Label
        selectionLabel.text = DevicePairingConstants.SELECT_DEVICE_TEXT
        // Configure Apple watch Button
        aWatchButton.setTitle(DevicePairingConstants.APPLE_WATCH_TEXT, for: .normal)
        // Configure Movesense Button
        movesenseButton.setTitle(DevicePairingConstants.MOVESENSE_TEXT, for: .normal)
    }
    @IBAction func watchPressed(_ sender: UIButton) {
        //checkWatchConnection()
        watchOrMove = true
    }
    
    @IBAction func movesensePressed(_ sender: UIButton) {
        watchOrMove = false
        self.performSegue(withIdentifier: "pairSegue", sender: nil)
    }
    
//    private func checkWatchConnection(){
//        if WCSession.isSupported() { // check if the device support to handle an Apple Watch
//            let session = WCSession.default
//            session.delegate = self
//            session.activate() // activate the session
//
//            if session.isPaired { // Check applewatch pairing
//                goodWatchAlert = UIAlertController(title: "Connected", message: "Apple Watch is paired. \n Continue to stream data", preferredStyle: UIAlertController.Style.alert)
//                goodWatchAlert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: dismissGoodWatchAlert))
//            }
//            else{
//                //show error message if no watch paired
//                badWatchAlert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: dismissBadWatchAlert))
//                self.present(badWatchAlert, animated: true, completion: nil)
//            }
//        }
//    }
//    private func dismissBadWatchAlert(action: UIAlertAction){
//        badWatchAlert.dismiss(animated: true, completion: nil)
//    }
//    private func dismissGoodWatchAlert(action: UIAlertAction){
//        goodWatchAlert.dismiss(animated: true, completion: nil)
//        self.performSegue(withIdentifier: "watchStreamSegue", sender: nil)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}
