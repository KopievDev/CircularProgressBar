# CircularProgressBar
```swift
    @IBOutlet weak var progressBar: ProgressBar!
    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) {[weak self] timer in
            guard let `self` = self else {return}
            self.count += 1
            DispatchQueue.main.async {
                self.progressBar.progress = min(0.02 * self.count, 1)
                if self.progressBar.progress == 1 {
                    timer.invalidate()
                }
            }

```
![Fotoram io](https://user-images.githubusercontent.com/78022759/122054303-392c9400-cdf0-11eb-9c9c-1bc510274763.png)
