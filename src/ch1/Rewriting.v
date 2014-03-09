Require Import ch1.Simplification.

Theorem plus_id_example : forall n m : nat,
    n = m -> n + n = m + m.

Proof.
    intros n m.     (* "for some n <- Nat, m <- Nat" *)
    intros H.       (* "such that n = m " *)
    rewrite -> H.   (* Rewrite the goal using the hypothesis *)
    reflexivity. Qed.

(* Exercise *)

Theorem plus_id_exercise : forall n m o : nat,
    n = m -> m = o -> n + m = m + o.

Proof.
    intros n m o.
    intros H1 H2.
    rewrite -> H1.
    rewrite -> H2.
    reflexivity. Qed.

Theorem mult_0_plus : forall n m : nat,
    (0 + n) * m = n * m.

Proof.
    intros n m.
    rewrite -> plus_O_n.
    reflexivity. Qed.
