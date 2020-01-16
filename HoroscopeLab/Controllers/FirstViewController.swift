//
//  FirstViewController.swift
//  HoroscopeLab
//
//  Created by Melinda Diaz on 1/15/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var helloName: UILabel!
    @IBOutlet weak var textOutlet: UILabel!
    @IBOutlet weak var horoscopeOutlet: UITextView!
    
    var todaysHoroscope: Horoscope?
    
    
    var leo = "leo"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let horoscopeEx = Wrapper.shared.getData() else {
            horoscopeOutlet.text = "Hello New User please go to settings and add the missing information"
            textOutlet.text = "NA"
            helloName.text = "NA"
            return
        }
        helloName.text = "Hello \(horoscopeEx.name)"
        textOutlet.text = "Today's Horoscope"
        //change the zodiac sign to user default
        APIClient.getStuff(for:  "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscopeEx.sunSign.rawValue)/today") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "no zodiacs \(appError)")
                }
            case .success(let yourHoroscope):
                DispatchQueue.main.async {
                    self?.todaysHoroscope = yourHoroscope
                    self?.horoscopeOutlet.text = yourHoroscope.horoscope
                }
            }
            
        }
        
    }
    
    //every VC has a property called storyboard
    @IBAction func settings(_ sender: UIBarButtonItem) {
        guard let settingVC = storyboard?.instantiateViewController(identifier: "settings") as? ViewController else {
            fatalError("could not segue")}
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    
    
    
    
}
