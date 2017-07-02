import UIKit

class DismissMenuAnimator: NSObject, UIViewControllerAnimatedTransitioning {
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
    
    UIView.animate(
      withDuration: transitionDuration(using: transitionContext),
      animations: {
        fromVC.view.center.x = -toVC.view.bounds.width/2
      },
      completion: { _ in
        let didTransitionComplete = !transitionContext.transitionWasCancelled

        if didTransitionComplete {
          fromVC.removeFromParentViewController()
        }
        transitionContext.completeTransition(didTransitionComplete)
      }
    )
  }
}
