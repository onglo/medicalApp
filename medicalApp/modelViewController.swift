//
//  modelViewController.swift
//  medicalApp
//
//  Created by Edouard Long on 16/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import Foundation

var patients = circularPriorityQueue(lengthOfQueue: 100)

var patientData:[Patient] = [Patient(name: "Edouard", DOB: "02.23.23", doctor: "James", dateAdmitted: "23.12.12", natureOfInjury: "Broken Leg", injurySeriousIndex: 1, idNumber: 328172),Patient(name: "James", DOB: "02.23.23", doctor: "James", dateAdmitted: "23.12.12", natureOfInjury: "Broken Leg", injurySeriousIndex: 2, idNumber: 99281),Patient(name: "Ned", DOB: "02.23.23", doctor: "James", dateAdmitted: "23.12.12", natureOfInjury: "Broken Leg", injurySeriousIndex: 3, idNumber: 121232),Patient(name: "Jake", DOB: "02.23.23", doctor: "James", dateAdmitted: "23.12.12", natureOfInjury: "Broken Leg", injurySeriousIndex: 4, idNumber: 221100)]

