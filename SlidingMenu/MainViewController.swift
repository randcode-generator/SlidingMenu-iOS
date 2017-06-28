import UIKit

class MainViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func mainButtonAction(_ sender: Any) {
    let controller = UIAlertController.init(title: "Main", message: "Press ok", preferredStyle: .alert)
    let defaultAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
    controller.addAction(defaultAction)
    present(controller, animated: true, completion: nil)
  }
}
