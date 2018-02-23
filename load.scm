(load "tfhe")

(define minimum-lambda 100)
(define params (new-default-gate-bootstrapping-parameters minimum-lambda))
(define lwe-params (c-> params "TFheGateBootstrappingParameterSet in_out_params"))
(define secret-keyset (new-random-gate-bootstrapping-secret-keyset params))


;; (define lwe-sample (new-gate-bootstrapping-ciphertext params))
(define lwe-sample (new-lwe-sample lwe-params))
(define message 1)
(bootsSymEncrypt lwe-sample message params)
