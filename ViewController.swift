import UIKit
import AVFoundation
//dictionarys are a key value pair


class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var proggressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle! // Soft, Medium & Hard
        totalTime = eggTimes[hardness]!
        
        proggressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        if secondsPassed < totalTime{
            secondsPassed += 1
            proggressBar.progress = Float(secondsPassed) / Float(totalTime)
//          print(Float(secondsPassed) / Float(totalTime))
        }else{
            timer.invalidate()
            titleLable.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
