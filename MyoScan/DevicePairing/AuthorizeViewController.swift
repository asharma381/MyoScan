//
//  AuthorizeViewController.swift
//  MyoScan
//
//  Created by Yatharth Chhabra on 8/2/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit
import HealthKit

class AuthorizeViewController: UIViewController {

    @IBOutlet weak var authorizeButton: UIButton!
    
    @IBOutlet weak var algorithmButton: UIButton!
    
    var isAuthorized: Bool = false {
        didSet{
            if(isAuthorized == true){
                // reveal button if authorized
                algorithmButton.isHidden = false
            }
        }
    }
    
    let healthStore = HKHealthStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure authorization button
        authorizeButton.setTitle("Authorize", for: .normal)
        
        // configure algorithm button
        algorithmButton.setTitle("Plug & Chug", for: .normal)
        algorithmButton.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    @IBAction func authorizeTapped(_ sender: UIButton) {
        // ask for authorization
       isAuthorized = authorizeHealthKit()
    }
    
    
    
    func authorizeHealthKit() -> Bool{
        // MARK: Add Sleep Data Later
        let read: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!
        ]
            
            
        let share: Set<HKSampleType> = [
                   HKObjectType.quantityType(forIdentifier: .heartRate)!,
                   HKObjectType.quantityType(forIdentifier: .stepCount)!
               ]
        if !HKHealthStore.isHealthDataAvailable(){
            print("Health Kit Not Available")
            return false
        }
        var checkPermission = false
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in
            if(chk){
                print("Permission Granted")
                checkPermission = true
            }
        }
        return checkPermission
    }
    func latestHeartRate(){
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else{
            return
        }
        
        // MARK: Placeholder value is -2. 2 weeks back.                    Subject to change.
        let startDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) { (sample, result, error) in
            guard error == nil else{
                return
            }
            //let data = result
            
        }
        healthStore.execute(query)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
