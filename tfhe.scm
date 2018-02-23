(load-option 'ffi)
(c-include "tfhe")


;;; Parameters

(define (make-params)
	(malloc
		(c-sizeof "TFheGateBootstrappingParameterSet")
		'TFheGateBootstrappingParameterSet))

;; Returns a keyset
(define (new-default-gate-bootstrapping-parameters minimum-lambda)
	(c-call
		"new_default_gate_bootstrapping_parameters"
		; (make-params)
		null-alien
		minimum-lambda))

;; Deletes a keyset
(define (delete-gate-bootstrapping-parameters keyset)
	(c-call "delete_gate_bootstrapping_parameters" keyset))


;;; Secret keyset

(define (make-secret-keyset)
	(malloc 
		(c-sizeof "TFheGateBootstrappingSecretKeySet") 
		'TFheGateBootstrappingSecretKeySet))

;; Returns a keyset
(define (new-random-gate-bootstrapping-secret-keyset params)
	(c-call 
		"new_random_gate_bootstrapping_secret_keyset"
		; (make-secret-keyset)
		null-alien
		params))

;; Deletes a keyset
(define (delete-gate-bootstrapping-secret-keyset keyset)
	(c-call "delete_gate_bootstrapping_secret_keyset" keyset))


;;; Cloud keyset

;; Deletes a keyset
(define (delete-gate-bootstrapping-cloud-keyset keyset)
	(c-call "delete_gate_bootstrapping_cloud_keyset" keyset))

;;; Ciphertexts

(define (make-lwe-sample)
	(malloc (c-sizeof "LweSample") 'LweSample))

(define (make-lwe-sample-array nbelems)
	(malloc (* nbelems (c-sizeof "LweSample")) 'LweSample))

;; generate a new unititialized ciphertext (or an array of ciphertexts) 
(define (new-gate-bootstrapping-ciphertext params)
	(c-call "new_gate_bootstrapping_ciphertext"
		; (make-lwe-sample)
		null-alien
		params))

(define (new-gate-bootstrapping-ciphertext-array nbelems params)
	(c-call "new_gate_bootstrapping_ciphertext_array"
		; (make-lwe-sample-array nbelems)
		null-alien
		nbelems
		params))

(define (alloc-lwe-sample)
	(c-call "alloc_LweSample" null-alien))

(define (alloc-lwe-sample-array nbelts)
	(c-call "alloc_LweSample_array" null-alien nbelts))

(define (free-lwe-sample lwe-sample)
	(c-call "free_LweSample" lwe-sample))

(define (free-lwe-sample-array nbelts lwe-sample)
	(c-call "free_LweSample_array" nbelts lwe-sample))

(define (init-lwe-sample lwe-sample lwe-params)
	(c-call "init_LweSample" lwe-sample lwe-params))

(define (init-lwe-sample-array nbelts lwe-sample lwe-params)
	(c-call "init_LweSample_array" nbelts lwe-sample lwe-params))

(define (destroy-lwe-sample lwe-sample)
	(c-call "destroy_LweSample" lwe-sample))

(define (destroy-lwe-sample-array nbelts lwe-sample)
	(c-call "destroy_LweSample_array" nbelts lwe-sample))

(define (new-lwe-sample lwe-params)
	(c-call "new_LweSample" null-alien lwe-params))

(define (new-lwe-sample-array nbelts lwe-params)
	(c-call "new_LweSample_array" null-alien nbelts lwe-params))

(define (delete-lwe-sample lwe-sample)
	(c-call "delete_LweSample" lwe-sample))

(define (delete-lwe-sample-array nbelts lwe-sample)
	(c-call "delete_LweSample_array" nbelts lwe-sample))

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
