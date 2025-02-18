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
    
    override func didMove(to view: SKView) {
        
        
        physicsWorld.contactDelegate = self
        player = (self.childNode(withName: "Player") as! SKSpriteNode)
 
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("something COOL just happened")
        
        if contact.bodyA.node?.name == "Ground"{
            
        }
        
        if contact.bodyA.node?.name == "Player"{
            
        }
    }
 
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
