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
