//
//  GameViewController.swift
//  VideoGameMickle
//
//  Created by PETER MICKLE on 2/18/25.
//

import UIKit
import SpriteKit
import GameplayKit

class AppData{
    
    static var canJump = false
    static var gameView: GameViewController!
    
}

class GameViewController: UIViewController {

    
    var play: GameScene!
    
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBAction func jumpAction(_ sender: UIButton) {
        if AppData.canJump{
            play.player.physicsBody?.velocity.dy = 1100
            AppData.canJump = false
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppData.gameView = self
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
                    UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                play = scene as? GameScene
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func leftAction(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = -1000
    }
    
    
    @IBAction func leftActionEnd(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = 0
    }
    
    
    @IBAction func rightAction(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = 1000
    }
    
    
    @IBAction func rightActionEnd(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = 0
    }
    
    @IBAction func leftActionEndOutside(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = 0
    }
    
    
    @IBAction func rightActionEndOutside(_ sender: UIButton) {
        play.player.physicsBody?.velocity.dx = 0
    }
    
    
    
}
