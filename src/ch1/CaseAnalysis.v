Require Import ch1.EnumeratedTypes.

Theorem plus_1_neq_0_firsttry : forall n : nat,
    beq_nat (n + 1) 0 = false.

Proof.
    intros n. destruct n as [| n'].
        reflexivity.
        reflexivity. Qed.

Theorem negb_involutive : forall b : bool,
    negb (negb b) = b.
Proof.
    intros b. destruct b.
    reflexivity.
    reflexivity. Qed.

(* Exercise *)

Theorem zero_nbeq_plus_1 : forall n : nat,
    beq_nat 0 (n + 1) = false.
Proof.
    intros n. destruct n as [| n'].
    reflexivity.
    reflexivity. Qed.
