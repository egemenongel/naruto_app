import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String?, placeholder: UIImage?, fallback: UIImage?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = fallback
            return
        }

        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [.transition(.fade(0.2))],
            completionHandler: { result in
                switch result {
                case .failure:
                    self.image = fallback
                case .success:
                    break
                }
            }
        )
    }
}
