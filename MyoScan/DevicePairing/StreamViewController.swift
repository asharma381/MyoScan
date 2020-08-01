//
//  StreamViewController.swift
//  MyoScan
//
//  Created by Yatharth Chhabra on 7/27/20.
//  Copyright © 2020 Aditya Sharma. All rights reserved.
//

import UIKit
import HealthKit
class StreamViewController: UIViewController {

    let healthStore = HKHealthStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        authorizeHealthKit()
        
        // Do any additional setup after loading the view.
    }
    func authorizeHealthKit(){
        let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])

        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in
            if(chk){
                print("Permission Granted")
                self.latestHeartRate()
            }
        }
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
