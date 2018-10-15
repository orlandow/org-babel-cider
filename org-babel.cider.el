(defun org-cider* (deps)
  (let* ((cider-clojure-cli-parameters (concat "-Sdeps '" deps "' " cider-clojure-cli-parameters))
         (cider-inject-dependencies-at-jack-in nil)
         (cider-allow-jack-in-without-project t))
    (cider-jack-in-clj nil)))

(defun org-cider-src-block-at-point ()
  (let ((content (org-element-property :value (org-element-at-point))))
    (org-cider* content)))

(defun org-cider ()
  (save-excursion
    (org-babel-goto-named-src-block "deps")
    (org-cider-src-block-at-point)))
