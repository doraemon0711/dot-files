;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)

  (require 'evil)
  (evil-mode 1)

;; Custom commands
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-k") 'move-line-up)
(global-set-key (kbd "M-j") 'move-line-down)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-hl-line-mode 1)
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (relaxed-dark)))
 '(custom-safe-themes
   (quote
    ("38a8684ffac84eec4bdb11fa43d5575423a0516d149ca361387c5b27a57c98f3" "16bae2d0ba0409410a9a44540db9020c3f562a06a04834452294139b3c5353a1" "42ae62fcde144ad8d2bd2287c931f3c90be8106948d58f80ac77e82d8c462e7e" "bcb098001a84e2b777a2c12bc00df959d02cb2778e45c834b26fe9c069cfa957" "b497597d71ee69532fcc7bcb16fbb6939eb380447395e2968912b523f90303dc" "8fa390edddf747774b9b5555476141aad153b94dfd33ee7706649fa7bcf9370d" "17f8c3c35c2e59ff7a23cf9b68b6fbdd57aa1c1c92340929cabdfe11e5abd78c" "fdd189f51c3ecac04a452cb8795cb7d7a67f051fedb7ace06a33d5c1c27ec4a6" "d0a9a169f6214f767cd5caec622ab5e2da45cfccaee7bcce549173e8f558cf5d" "808b978824feaf841f223f49f43d701e03945394a4f3c1ba303fea5d532a2d39" "df175fea155e9d6596c2f557bc46078fd695740ff7318051cc755d5f74c4d156" "14e189d9ee7472d6bcb8e9b2c78c89668a109979f29fad3d3a99613c4f16f3e9" "52a43acd90ec36c9e6bb63509977005fc301069f154bf271a594239772cd41f0" "83101c23ed275a7e614fad8270895866d3c6e4ad6789de65fbff2e19a6cd494b" "16a42e4a9c1dba72db60b4f3de932144ffccab192067e6c334a964a8a6873fdb" "5a5f1c54f16903f61a9dac70870357dcaf7aae2c31cf44f927d4898ddd912150" "4487bcd1c40767f48b6f5cf2827e7bed75189d22d44bc4d28bb544b9ddec2d36" "91982d28792077e8490dc337e4cfe8dd3215b3dabaf1957b34dd53c31c1ab369" "cb8ae7a5e40abe7678b42bccc2236a240b9811d1be4177ee57f24c7615fd996b" "597c1a1bbe629a8097900ae3e02b589e7f8c45f84fc8850a7832ca3a8612d60a" "193ed9d0eb5dcb4802de35b3d84751b9ed9e94f2f875dc9afa2ae806d8abe9bf" "c01d4f15f811267f1bce636597f09d5c4f3cbfd0866c4fa314f8aaaea1b84019" "db04575dd815530ee47db2a3aef9f378ee41d8d06f0801b463aae78b5bde65b9" "cd791969e4a9afb982f8d7bd30c5bf2af8c09df9f4fe883f2a712139aa45ffb0" "38686f9942e82da1474b4b904196c904c8c9715dc12608257092197d7e81e25a" "17b2b8e3f1b85cb41999007c1b35e7b52482c34d5a50d494f3b416b8921f9d13" "3d46716bb07868eee04f650f8cc3033696fd3c3c95e074184fc63e1e519acb74" "66ce7b669675ab06ab09f8731e4d9c789bce991d17a05ad9d89e4269e812c891" "1231847f13c910edfaecae217ed5c7d53c23f037be7a035589c36c0e45bb0b02" "c8553e45914bd9a413d63c8c70e8c43236a0ad57b8ca83bb29b77cb7b31023ea" "5e7040681399d0c23008514bbbb5da22c0e654621434324664b52467e9e97ad2" "c849cfeaed70dc24ec1e596a232a33d9301cf43708b1cfb76d42551ac2af0e77" "8d86df78504d353c55cecabb80873d0923e2f7540c18ba889b9e43ebc631bc64" "f36ed119c3769e1dfdbc440d2a334ac1c9a757d8dd3294db6720cf3219241517" "440c78d0640d16cc1ae835b8d18e0b2530b275655c941fbc6d2038b1fc5d2f34" "5c67a4d71db6f1443ece2ea2cce08c5ce1234acebc430a684e40e5f05c39a20a" "ba00b1979a241923678d98c07b834e72b8218f7cb0a0bd05d0379ac90ea3705c" "c5a7650f31b17807c312e91848a9c1a324491592176b3e5db2f2f80c99e05e8d" "b5fa20282f38dd162b48d5cd12d22c334838dfb187105ed5ff108996122405a2" "28496811c5a8a57ed27f4c1f5ad72d40d91e97bf34730df6e83140d570677cae" "0c62debdd03c06448199c6eaad6c37de0fcbd9ce739ee8ed4d4ecde660e208a8" "5dbecaee5c2ee8e21bb7eabcf6b66d6c2c340ae6ca7d2347b1601e09b2e96b41" default)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (evil)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


