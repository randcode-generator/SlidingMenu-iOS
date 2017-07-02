import UIKit

class MenuViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func menuButtonAction(_ sender: Any) {
    let controller = UIAlertController.init(title: "Menu", message: "Press ok", preferredStyle: .alert)
    let defaultAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
    controller.addAction(defaultAction)
    present(controller, animated: true, completion: nil)
  }
}
