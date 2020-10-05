//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// MARK: MODEL

class Pet {
    enum Rarity {
        case common
        case uncommon
        case rare
        case veryRare
    }
    
    let name: String
    let birthday: Date
    let rarity: Rarity
    let image: UIImage
    
    init(name: String, birthday: Date, rarity: Rarity, image: UIImage) {
        self.name = name
        self.birthday = birthday
        self.rarity = rarity
        self.image = image
    }
}

// MARK: ViewModel

class PetViewModel {
    private let pet: Pet
    private let calendar: Calendar
    
    init(pet: Pet) {
        self.pet = pet
        calendar = Calendar(identifier: .gregorian)
    }
    
    var name: String {
        return pet.name
    }
    
    var image: UIImage {
        return pet.image
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
