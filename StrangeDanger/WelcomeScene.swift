//
//  GameScene.swift
//  StrangeDanger
//
//  Created by Apple on 16/7/14.
//  Copyright (c) 2016年 NJU. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let PictureOfGirl = [SKSpriteNode(imageNamed: "girl1"), SKSpriteNode(imageNamed: "girl2")]
    let welcom = SKSpriteNode(imageNamed:"Image1")
    var myInterval:Double = 0
    
    var ScopeOfPictureOfgirl:CGRect = CGRect()
    var ScopeOfkaishi:CGRect = CGRectMake(550, 320, 170, 80)
    var ScopeOfxuanxiang: CGRect = CGRectMake(440, 230, 125, 60)
    var ScopeOfguanyu: CGRect = CGRectMake(710, 230, 120, 60)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let welcom = SKSpriteNode(imageNamed:"Image1")
        welcom.setScale(1.6)
        welcom.position = CGPointMake(size.width/2, size.height/2)
        self.addChild(welcom)
        
        /*picture*/
        for girl in PictureOfGirl {
            girl.position = CGPointMake(247, 306)
            girl.setScale(3.5)
            girl.hidden=true
            girl.accessibilityElementsHidden = true
            self.addChild(girl)
            //girl.hidden=true
            
        }
        ScopeOfPictureOfgirl.size.height = 140
        ScopeOfPictureOfgirl.size.width = 140
        ScopeOfPictureOfgirl.origin = CGPointMake(170, 240)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        for touch in touches {
            let location = touch.locationInNode(self)
            /*照片*/
            if CGRectContainsPoint(ScopeOfPictureOfgirl, location) {
                if PictureOfGirl[1].hidden == true{
                    PictureOfGirl[1].hidden = false
                }
                else {
                    PictureOfGirl[1].hidden=true
                }
                PictureOfGirl[0].hidden=true
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            let location = touche.locationInNode(self)
            /*按钮反应*/
            if CGRectContainsPoint(ScopeOfkaishi, location) {
                let nextScene = KaishiScene(size: self.size)
                nextScene.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene, transition: doors)
            }
            if CGRectContainsPoint(ScopeOfxuanxiang, location){
                let nextScene = XuanxiangScene(size: self.size)
                nextScene.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene, transition: doors)
            }
            if CGRectContainsPoint(ScopeOfguanyu, location){
                let nextScene = GuanyuScene(size: self.size)
                nextScene.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene, transition: doors)
                
            }
           
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        myInterval++
        if myInterval>20 {
            
            if PictureOfGirl[0].hidden == true{
                PictureOfGirl[0].hidden = false
            }
            else {
                PictureOfGirl[0].hidden=true
            }
            myInterval = 0
            PictureOfGirl[1].hidden = true
        }
    }
}

class GuanyuScene: SKScene {
    let guanyu = SKSpriteNode(imageNamed: "guanyu")
    var ScopeOfhoutui: CGRect = CGRectMake(730, 200, 140, 70)
    
    override func didMoveToView(view: SKView){
        guanyu.setScale(1.6)
        guanyu.position = CGPointMake(size.width/2, size.height/2)
        addChild(guanyu)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
        for touche in touches {
            let location = touche.locationInNode(self)
            if CGRectContainsPoint(ScopeOfhoutui, location){
                let nextScene = GameScene(fileNamed: "GameScene")
                nextScene!.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene!, transition: doors)
                
            }
        }
    }
}

class XuanxiangScene: SKScene {
    let xuanxiang = SKSpriteNode(imageNamed: "xuanxiang")
    var ScopeOfhoutui: CGRect = CGRectMake(530, 200, 110, 50)
    
    override func didMoveToView(view: SKView){
        xuanxiang.setScale(1.6)
        xuanxiang.position = CGPointMake(size.width/2, size.height/2)
        addChild(xuanxiang)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
        for touche in touches {
            let location = touche.locationInNode(self)
            if CGRectContainsPoint(ScopeOfhoutui, location){
                let nextScene = GameScene(fileNamed: "GameScene")
                nextScene!.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene!, transition: doors)
                
            }
        }
    }
  
}

class KaishiScene: SKScene {
    let stage = [SKSpriteNode(imageNamed: "stage_1"),SKSpriteNode(imageNamed: "stage_0")]
    
    let stageLast = 1
    var stageNO:Int = 0
    var rectRet: CGRect = CGRectMake(6, 590, 80, 80)
    var rectLeft: CGRect = CGRectMake(64, 333, 74, 110)
    var rectRight: CGRect = CGRectMake(884, 330, 80, 110)
    
    let x1:CGFloat = 348
    let x2:Float = 468
    let x3:Float = 589
    let y1:Float = 365
    let y2:Float = 257
    let len:Float = 73
    var lev1: CGRect = CGRectMake(348, 257, 73, 73)
    
    
    override func didMoveToView(view: SKView){
        for sta in stage {
            sta.setScale(1.6)
            sta.position = CGPointMake(size.width/2, size.height/2)
            sta.hidden = true
            addChild(sta)
        }
        stage[0].hidden = false
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
        for touche in touches {
            let location = touche.locationInNode(self)
            print(location)
            if CGRectContainsPoint(rectRet, location){
                let nextScene = GameScene(fileNamed: "GameScene")
                nextScene!.scaleMode = .AspectFill
                let doors = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene!, transition: doors)
            }
            if CGRectContainsPoint(rectLeft, location){
                if stageNO != 0 {
                    stage[stageNO].hidden = true
                    stageNO--
                    stage[stageNO].hidden = false
                }
            }
            if CGRectContainsPoint(rectRight, location){
                if stageNO != stageLast{
                    stage[stageNO].hidden = true
                    stageNO++
                    stage[stageNO].hidden = false
                }
            }
            /*switch(stageNO) if rect...*/
            if CGRectContainsPoint(lev1, location){
                
            }
        }
    }
}
