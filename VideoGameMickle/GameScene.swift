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
    var burgers = 0
    var burgersprites: [SKSpriteNode] = []
    var trampoline: SKSpriteNode!

    
    override func didMove(to view: SKView) {
        
        
        physicsWorld.contactDelegate = self
        self.camera = cam
        player = (self.childNode(withName: "Player") as! SKSpriteNode)
        burgersprites.append(self.childNode(withName: "cheeseburger0") as! SKSpriteNode)
        burgersprites.append(self.childNode(withName: "cheeseburger1") as! SKSpriteNode)
        trampoline = (self.childNode(withName: "Trampoline") as! SKSpriteNode)
        trampoline.physicsBody?.restitution = 1.5
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("something COOL just happened")
        
        if (contact.bodyB.node?.name == "Ground" && contact.bodyA.node?.name == "Player") || (contact.bodyA.node?.name == "Ground" && contact.bodyB.node?.name == "Player"){
            AppData.canJump = true
        }
        
        if ((contact.bodyB.node?.name!.contains("cheeseburger")) != nil) && contact.bodyA.node?.name == "Player" && contact.bodyA.node?.name != "Trampoline" && contact.bodyB.node?.name != "Trampoline"{
            print("cheeseburger apocalypse")
            burgers += 1
            AppData.gameView.labelOutlet.text = "X \(burgers)"
            contact.bodyB.node?.removeFromParent()
            
        }
    }
 
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.y = player.position.y + 50
        cam.position.x = player.position.x + 300
    }
    
    
}
