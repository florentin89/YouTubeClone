//
//  VideoLauncher.swift
//  YouTubeClone
//
//  Created by Florentin on 04/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    var player: AVPlayer?
    
    let activityIndicatorView: UIActivityIndicatorView = {
        
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
    }()
    
    let pauseAndPlayButton: UIButton = {
        
        let button = UIButton(type: .system)
        let image = UIImage(named: "pause")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()
    
    // Check if the video is playing
    func isPlaying() -> Bool {
        return player?.rate != 0 && player?.error == nil
    }
    
    // Function to Pause / Play the video changing the image of the buttons
    @objc func handlePause(){
        
        if isPlaying() {
            player?.pause()
            pauseAndPlayButton.setImage(UIImage(named: "play"), for: .normal)
        } else{
            player?.play()
            pauseAndPlayButton.setImage(UIImage(named: "pause"), for: .normal)
        }
    }
    
    let controlsContainerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
    let videoLengthLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .right
        
        return label
    }()
    
    let currentTimeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let videoSlider: UISlider = {
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.setThumbImage(UIImage(named: "red_dot"), for: .normal)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    // Allow the user to change the track of the video (to move forward or backward )
    @objc func handleSliderChange(){
        
        if let duration = player?.currentItem?.duration{
            
            let totalSeconds = CMTimeGetSeconds(duration)
            let value = Float64(videoSlider.value) * totalSeconds
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayerView()
        
        setupGradientLayer()
        
        // Add a layer which will contain all the controls (buttons)
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        
        // Add on the layer an activity indicator spin which will load until the video will start
        controlsContainerView.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // add on layer a button for Pause and Play for the video
        controlsContainerView.addSubview(pauseAndPlayButton)
        pauseAndPlayButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pauseAndPlayButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pauseAndPlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseAndPlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // add on layer a label which will show the duration of that video
        controlsContainerView.addSubview(videoLengthLabel)
        videoLengthLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        videoLengthLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        videoLengthLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        videoLengthLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        controlsContainerView.addSubview(currentTimeLabel)
        currentTimeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        currentTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        currentTimeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        currentTimeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        // add on layer a slider which will track the duration of the video
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: videoLengthLabel.leftAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: currentTimeLabel.rightAnchor).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        backgroundColor = .black
    }
    
    private func setupPlayerView(){
        
        let urlString = Constants.urlVideoAPI // Video loaded from personal GoogleCloudPlatform https://console.cloud.google.com
        
        if let url = URL(string: urlString){
            player = AVPlayer(url: url)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player?.play()
            
            // Track Player Duration of the video
            player?.addObserver(self, forKeyPath: Constants.loadedTimeRanges, options: .new, context: nil)
            
            // Track Player Progress of the video
            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
                
                let seconds = CMTimeGetSeconds(progressTime)
                let secondsToDisplay = String(format: "%02d", Int(seconds.truncatingRemainder(dividingBy: 60)))
                let minutesToDisplay = String(format: "%02d", Int(seconds / 60))
                self.currentTimeLabel.text = "\(minutesToDisplay):\(secondsToDisplay)"
                
                // Functionality to implement the progress of the slider thumb
                if let duration = self.player?.currentItem?.duration {
                    let durationSeconds = CMTimeGetSeconds(duration)
                    self.videoSlider.value = Float(seconds / durationSeconds)
                }
            })
        }
    }
    
    // When the video start playing the Activity indicator will disappear
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // Player is ready and rendering frames
        if keyPath == Constants.loadedTimeRanges {
            activityIndicatorView.stopAnimating()
            controlsContainerView.backgroundColor = .clear
            pauseAndPlayButton.isHidden = false
            
            if let duration = player?.currentItem?.duration {
                let seconds = CMTimeGetSeconds(duration)
                let secondsToDisplay = Int(seconds) % 60
                let minutesToDisplay = String(format: "%02d", Int(seconds) / 60)
                videoLengthLabel.text = "\(minutesToDisplay):\(secondsToDisplay)"
            }
        }
    }
    
    // Set a layer under the Progress duration which will reflect a gradient of shadow
    private func setupGradientLayer(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        
        controlsContainerView.layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.fatalErrorInit)
    }
}

class VideoLauncher: NSObject{
    
    // Show the video player when you click a videoclip
    func showVideoPlayer(){
        
        if let keyWindow = UIApplication.shared.keyWindow{
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            // 16 x 9 is the aspect ratio of all HD Videos
            let height = keyWindow.frame.width * 9 / 16
            
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = keyWindow.frame
                
            }, completion: {(completedAnimation) in
                
                UIApplication.shared.isStatusBarHidden = true
            })
        }
    }
}
