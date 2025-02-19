//
//  GameScene.swift
//  VideoGameMickle
//
//  Created by PETER MICKLE on 2/18/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
  
    var player : SKSpriteNode!
    
    let cam = SKCameraNode()

    
    override func didMove(to view: SKView) {
        
        
        physicsWorld.contactDelegate = self
        self.camera = cam
        player = (self.childNode(withName: "Player") as! SKSpriteNode)
 
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("something COOL just happened")
        
        if (contact.bodyB.node?.name == "Ground" && contact.bodyA.node?.name == "Player") || (contact.bodyA.node?.name == "Ground" && contact.bodyB.node?.name == "Player"){
            AppData.canJump = true
        }
        
        if contact.bodyB.node?.name == "cheeseburger" && contact.bodyA.node?.name == "Player"{
            print("cheeseburger apocalypse")
        }
    }
 
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.y = player.position.y + 50
        cam.position.x = player.position.x + 300
    }
    
    
}
