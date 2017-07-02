import UIKit

class MainViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.transitioningDelegate = self
  }
  
  @IBAction func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
    
    if(sender.state == .began) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
      controller.transitioningDelegate = self
      controller.modalPresentationStyle = .overCurrentContext
      present(controller, animated: true, completion: nil)
    }
  }
  
  @IBAction func mainButtonAction(_ sender: Any) {
    let controller = UIAlertController.init(title: "Main", message: "Press ok", preferredStyle: .alert)
    let defaultAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
    controller.addAction(defaultAction)
    present(controller, animated: true, completion: nil)
  }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentMenuAnimator()
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return DismissMenuAnimator()
  }
}
