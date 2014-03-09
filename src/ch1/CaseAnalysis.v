Require Import ch1.EnumeratedTypes.

Theorem plus_1_neq_0_firsttry : forall n : nat,
    beq_nat (n + 1) 0 = false.

Proof.
    intros n. destruct n as [| n'].
        reflexivity.
        reflexivity. Qed.
