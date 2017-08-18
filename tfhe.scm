(load-option 'ffi)
(c-include "tfhe")


;;; Parameters
;; Returns a keyset
(define (new-default-gate-bootstrapping-parameters minimum-lambda)
	(c-call "new_default_gate_bootstrapping_parameters" null-alien minimum-lambda))

;; Deletes a keyset
(define (delete-gate-bootstrapping-parameters keyset)
	(c-call "delete_gate_bootstrapping_parameters" keyset))

;;; Secret keyset
;; Returns a keyset
(define (new-random-gate-bootstrapping-secret-keyset params)
	(c-call "new_random_gate_bootstrapping_secret_keyset" null-alien params))

;; Deletes a keyset
(define (delete-gate-bootstrapping-secret-keyset keyset)
	(c-call "delete_gate_bootstrapping_secret_keyset" keyset))

;;; Cloud keyset
;; Deletes a keyset
(define (delete-gate-bootstrapping-cloud-keyset keyset)
	(c-call "delete_gate_bootstrapping_cloud_keyset" keyset))

;;; Ciphertexts
(define (new-gate-bootstrapping-ciphertext params)
	(c-call "new_gate_bootstrapping_ciphertext" null-alien params))

(define (new-gate-bootstrapping-ciphertext-array nbelems params)
	(c-call "new_gate_bootstrapping_ciphertext_array" null-alien nbelems params))

;;; Encrypt decrypt

;; encrypts a boolean
(define (bootsSymEncrypt result message params)
	(c-call "bootsSymEncrypt" result message params))

;; decrypts a boolean
(define (bootsSymDecrypt sample params)
	(c-call "bootsSymDecrypt" sample params))

;;; Homomorphic operations

;; bootstrapped Constant (true or false) trivial Gate
(define (bootsCONSTANT result value bk)
	(c-call "bootsCONSTANT" result value bk))
