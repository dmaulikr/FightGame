//
//  ViewController.swift
//  FightGame
//
//  Created by Kaleb Bataran on 3/1/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	//UI Display
	@IBOutlet weak var startGameBtn: UIButton!
	@IBOutlet weak var startGameLbl: UILabel!
	@IBOutlet weak var updateLbl: UILabel!
	@IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var attackTxt1: UILabel!
	@IBOutlet weak var attackTxt2: UILabel!
	
	//UI Characters
	@IBOutlet weak var enemyImg: UIImageView!
	@IBOutlet weak var enemyHpLbl: UILabel!
	@IBOutlet weak var enemyAttackBtn: UIButton!
	@IBOutlet weak var playerImg: UIImageView!
	@IBOutlet weak var playerHpLbl: UILabel!
	@IBOutlet weak var playerAttackBtn: UIButton!
	
	var player: Character!
	var enemy: Character!
	
	//App Loads
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	//Buttons
	@IBAction func startGamePressed(sender: UIButton) {
		updateLbl.text = "Fight!"
		startGame()
		runGame()
	}
	
	func startGame() {
		//UI Hiding
		startGameBtn.hidden = !startGameBtn.hidden
		startGameLbl.hidden = !startGameLbl.hidden
		stackView.hidden = !stackView.hidden
		attackTxt1.hidden = !attackTxt1.hidden
		attackTxt2.hidden = !attackTxt2.hidden
	}
	
	func runGame() {
		player = Character(startingHealth: 125, attackPwr: 15, name: "Soldier")
		enemy = Character(startingHealth: 75, attackPwr: 25, name: "Orc")
		updateHealthBars()
	}

	func updateHealthBars(){
		playerHpLbl.text = "\(player.health) HP"
		enemyHpLbl.text = "\(enemy.health) HP"
	}
	
	@IBAction func enemyBtnPressed(sender: UIButton) {
		onAttack(enemy, target: player)
	}

	@IBAction func playerBtnPressed(sender: UIButton) {
		onAttack(player, target: enemy)
	}
	
	func onAttack(attacker: Character, target: Character) {
		attacker.attack(target)
		
		updateLbl.text = "\(attacker.name) attacked \(target.name) for \(attacker.attackPwr)"
		updateHealthBars()
		
		if !target.isAlive {
			updateLbl.text = "\(attacker.name) killed \(target.name)"
			startGame()
		}
		
	}
}

