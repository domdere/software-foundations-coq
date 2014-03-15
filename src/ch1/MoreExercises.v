Require Import ch1.EnumeratedTypes.
Require Import ch1.Simplification.
Require Import ch1.Rewriting.
Require Import ch1.CaseAnalysis.

(* Use the tactics you have learned so far to prove the following theorem about boolean functions. *)

Theorem identity_fn_applied_twice :
    forall (f : bool -> bool),
    (forall (x : bool), f x = x) ->
    forall (b : bool), f (f b) = b.
Proof.
    intros f H b.
    rewrite -> H.
    rewrite -> H.
    reflexivity. Qed.

(* Now state and prove a theorem negation_fn_applied_twice similar to the previous one but where the second hypothesis says that the function f has the property that f x = negb x. *)

Theorem negation_fn_applied_twice :
    forall (f : bool -> bool),
    (forall (x : bool), f x = negb x) ->
    forall (b : bool), f (f b) = b.
Proof.
    intros f H b.
    rewrite -> H.
    rewrite -> H.
    rewrite -> negb_involutive.
    reflexivity. Qed.

(*

Consider a different, more efficient representation of natural numbers using a binary rather than unary system. That is, instead of saying that each natural number is either zero or the successor of a natural number, we can say that each binary number is either
zero,
twice a binary number, or
one more than twice a binary number.
(a) First, write an inductive definition of the type bin corresponding to this description of binary numbers.

*)

Inductive bin : Type :=
    | O : bin
    | Even : bin -> bin
    | Odd : bin -> bin.
