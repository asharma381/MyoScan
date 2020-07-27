//
//  BLEControl.swift
//  MyoScan
//
//  Created by Yatharth Chhabra on 7/27/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth
//import Movesense

class BLEControl : NSObject, CBCentralManagerDelegate
{
    //singleton
    static let BLESingleton = BLEControl()
    private override init(){}

//MARK: variables
    // BLE manager
    var manager: CBCentralManager?
    // connected device, if any
    var connectedPeripheral: CBPeripheral?
    
    //array of detected movesense devices
    var detectedPeripherals: [CBPeripheral] = []
    
    var peripheralCount: Int = 0
        
    //mds library object, if any
   // var mds: MDSWrapper?
    
    //serial number of connected devices, if any
    var serial: String?
    
    // CBUUID to narrow BLE scan
    var movesenseCBUUIDString: String = DevicePairingConstants.MOVESENSE_CBUUID_STRING
    // When manager chanages state
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
      case .unknown:
        print("central.state is .unknown")
      case .resetting:
        print("central.state is .resetting")
      case .unsupported:
        print("central.state is .unsupported")
      case .unauthorized:
        print("central.state is .unauthorized")
      case .poweredOff:
        print("central.state is .poweredOff")
      case .poweredOn:
        print("central.state is .poweredOn")
        
        //start scanning for devices when manager is connected
        manager?.scanForPeripherals(withServices: [CBUUID(string: movesenseCBUUIDString)])
        }
//MARK: End
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        // Add all discovered devices to array
        detectedPeripherals.append(peripheral)
        //Post notification that the number of peripherals is updated
        NotificationCenter.default.post(name: Notification.Name("didReceiveData"), object: nil)
        print(detectedPeripherals)
    }
}
