//
//  ViewController.swift
//  outlet, action and gesture
//
//  Created by Judy chen on 2021/12/23.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
   

    @IBOutlet weak var minionImageView: UIImageView!
    @IBOutlet weak var nameSegmentedControl: UISegmentedControl!
    @IBOutlet weak var minionPageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    
    @IBOutlet weak var attributeView: UIView!
    @IBOutlet weak var pitchStepper: UIStepper!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var pitchValueLabel: UILabel!
    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var volumeValueLabel: UILabel!
    
    
  
    
    //array中放圖片名稱，用變數index記錄現在是第幾個圖片
    let minions = ["Stuart","Bob","Jerry","Mel"]
    var index = 0
    
    let sythesizer = AVSpeechSynthesizer()
    let speechUtterence = AVSpeechUtterance(string: "Bello I love banana ")
   

    
    
    func setViewAttribute(){
        attributeView.layer.borderWidth = 5
        attributeView.layer.borderColor = UIColor.systemGray4.cgColor
        attributeView.layer.cornerRadius = 10
        attributeView.clipsToBounds = true
    }
     

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setViewAttribute()

 
    }
    
    
    

    @IBAction func pageControlTapped(_ sender: UIPageControl) {
        index = sender.currentPage
        let name = minions[index]
        minionImageView.image = UIImage(named: name)
        nameSegmentedControl.selectedSegmentIndex = index
    }
    
    @IBAction func nextImage(_ sender: Any) {
    
            
        index = (index + 1) % minions.count
        let name = minions[index]
        minionImageView.image = UIImage(named: name)
        //點下一張按鈕時讓分頁控制跟著切換
        minionPageControl.currentPage = index
        //點下一張按鈕時讓分段控制跟著切換
        nameSegmentedControl.selectedSegmentIndex = index
    }
    
    
    @IBAction func preImage(_ sender: Any) {
        index = (index + minions.count - 1) % minions.count
        let name = minions[index]
        print(index,name)
        minionImageView.image = UIImage(named: name)
        
        //點上一張按鈕時讓分頁控制跟著切換
        minionPageControl.currentPage = index
        //點上一張按鈕時讓分段控制跟著切換
        nameSegmentedControl.selectedSegmentIndex = index
    }
    
    
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        let name = minions[index]
        minionImageView.image = UIImage(named: name)
        
        //從分段控制選名字時，讓分頁控制跟著對應切換
        minionPageControl.currentPage = index
    }
    

    @IBAction func speak(_ sender: UIButton) {
        sythesizer.speak(speechUtterence)
        
        speechUtterence.pitchMultiplier = Float(pitchStepper.value)
        speechUtterence.rate = Float(speedStepper.value)
        speechUtterence.volume = Float(volumeSlider.value)
        speechUtterence.voice = AVSpeechSynthesisVoice(language:  "en-GB")
        print(pitchStepper.value,speedStepper.value,volumeSlider.value)
        
    }


    @IBAction func adjustPitch(_ sender: UIStepper) {
        
        pitchValueLabel.text = String(format: "%.2f", sender.value)
        print("pitchStepper",sender.value)
    }

    @IBAction func adjustSpeed(_ sender: UIStepper) {
        
        speedValueLabel.text = String(format: "%.2f", sender.value)
        print("rateStepper",sender.value)
    }
    
    @IBAction func adjustVolume(_ sender: UISlider) {
     
        volumeValueLabel.text = String(format: "%.2f", sender.value)
        print("volumeSlider",sender.value)
    }
    

}

