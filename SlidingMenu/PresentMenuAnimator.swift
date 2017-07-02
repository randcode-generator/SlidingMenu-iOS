import UIKit

class PresentMenuAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
      else {
        return
    }
    
    let containerView = transitionContext.containerView
    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
    
    toVC.view.center.x = -toVC.view.bounds.width/2
    UIView.animate(
      withDuration: transitionDuration(using: transitionContext),
      animations: {
        toVC.view.center.x = 0
      },
      completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      }
    )
  }
}
