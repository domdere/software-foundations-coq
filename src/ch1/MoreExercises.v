Require Import ch1.EnumeratedTypes.
Require Import ch1.Simplification.
Require Import ch1.Rewriting.
Require Import ch1.CaseAnalysis.
Require Import ch1.Induction.

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
    | Even : nat -> bin
    | Odd : nat -> bin.

(*

(b) Next, write an increment function for binary numbers, and a function to convert binary numbers to unary numbers.

*)

Fixpoint inc_bin (n : bin) : bin :=
    match n with
        | Even n'   => Odd n'
        | Odd n'    => Even (plus n' 1)
    end.

Definition bin2nat (n : bin) : nat :=
    match n with
        | Even n'   => mult n' 2
        | Odd n'    => plus (mult n' 2) 1
    end.

Definition evenbin (n : bin) : bool :=
    match n with
        | Even _    => true
        | Odd _     => false
    end.

Definition oddbin (n : bin) : bool := negb (evenbin n).

(*

(c) Write some unit tests for your increment and binary-to-unary
functions.

Notice that incrementing a binary number and then converting it to
unary should yield the same result as first converting it to unary
and then incrementing.

*)

Example test_inc_bin1: (inc_bin (Even 0)) = (Odd 0).
Proof. reflexivity. Qed.

Theorem dist: forall (n : nat),
    n * 2 + 1 + 1 = (n + 1) * 2.

Proof.
    intros n.
    induction n as [| n'].
    Case "n = 0". reflexivity.
    Case "n = S n'".
    simpl.
    rewrite -> IHn'.
    reflexivity . Qed.

Theorem inc_bin2nat_commute: forall (n : bin),
    bin2nat (inc_bin n) = plus (bin2nat n) 1.

Proof.
    intros n. destruct n as [evenn | oddn].
    reflexivity.
    simpl.
    rewrite -> dist.
    reflexivity. Qed.
