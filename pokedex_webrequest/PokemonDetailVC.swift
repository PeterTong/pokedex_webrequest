//
//  PokemonDetailVC.swift
//  pokedex_webrequest
//
//  Created by KwokWing Tong on 29/5/2016.
//  Copyright © 2016 Tong Kwok Wing. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
  
  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var mainImg: UIImageView!
  @IBOutlet weak var descriptionLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var defenseLbl: UILabel!
  @IBOutlet weak var heightLbl: UILabel!
  @IBOutlet weak var pokedexLbl: UILabel!
  @IBOutlet weak var weightLbl: UILabel!
  @IBOutlet weak var baseAttackLbl: UILabel!
  @IBOutlet weak var currentEvoImg: UIImageView!
  @IBOutlet weak var nextEvoImg: UIImageView!
  @IBOutlet weak var evoLbl: UILabel!
  
  
  var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
      
      pokemon.downloadPokemonDetails { () -> () in
        // this will be called after the download is done
        print("DID WE GET HERE") // Why not print it? because we do not fulfill the clousure, so we need to add the completed() into Pokemon.swift
        self.updateUI()
      }
      
    }
  func updateUI() {
    descriptionLbl.text = pokemon.description
    typeLbl.text = pokemon.type
    defenseLbl.text = pokemon.defense
    pokedexLbl.text = "\(pokemon.pokedexId)"
    heightLbl.text = pokemon.height
    weightLbl.text = pokemon.weight
    baseAttackLbl.text = pokemon.attack
    
    if pokemon.nextEvolutionId == "" {
      nextEvoImg.hidden = true
      evoLbl.text = "No Evolutions"
    } else {
      nextEvoImg.hidden = false
      nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
      var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
      
      if pokemon.nextEvolutionLvl != "" {
        str += " - LVL \(pokemon.nextEvolutionLvl)"
      }
    }
    
    
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func backBtnPressed(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  

  

}
