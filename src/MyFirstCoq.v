Inductive day : Type :=
    | monday : day
    | tuesday : day
    | wednesday : day
    | thursday : day
    | friday : day
    | saturday : day
    | sunday : day.

Definition next_weekday (d:day) : day :=
    match d with
    | monday => tuesday
    | tuesday => wednesday
    | wednesday => thursday
    | thursday => friday
    | friday => monday
    | saturday => monday
    | sunday => monday
    end.

Eval compute in (next_weekday friday).

Eval compute in (next_weekday (next_weekday saturday)).

Example test_next_weekday:
    (next_weekday (next_weekday saturday)) = tuesday.

Proof. simpl. reflexivity. Qed.

Inductive bool : Type :=
    | true : bool
    | false : bool.

Definition andb (b1:bool) (b2:bool) : bool :=
    match b1 with
    | true  => b2
    | false => false
    end.

Definition negb (b:bool) : bool :=
    match b with
    | true => false
    | false => true
    end.

Definition orb (b1:bool) (b2:bool) : bool :=
    match b1 with
    | true => true
    | false => b2
    end.

Example test_orb1: (orb true true) = true.
Proof. reflexivity. Qed.

Example test_orb2: (orb true false) = true.
Proof. reflexivity. Qed.

Example test_orb3: (orb false true) = true.
Proof. reflexivity. Qed.

Example test_orb4: (orb false false) = false.
Proof. reflexivity. Qed.

Definition nandb (b1:bool) (b2:bool) : bool :=
    negb (andb b1 b2).

Example test_nandb1: (nandb true false) = true.
Proof. reflexivity. Qed.

Example test_nandb2: (nandb false true) = true.
Proof. reflexivity. Qed.

Example test_nandb3: (nandb false false) = true.
Proof. reflexivity. Qed.

Example test_nandb4: (nandb true true) = false.
Proof. reflexivity. Qed.

Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
    match b1 with
    | false => false
    | true => match b2 with
        | false => false
        | true => b3
        end
    end.


Example test_andb31: (andb3 true true true) = true.
Proof. reflexivity. Qed.

Example test_andb32: (andb3 false true true) = false.
Proof. reflexivity. Qed.

Example test_andb33: (andb3 true false true) = false.
Proof. reflexivity. Qed.

Example test_andb34: (andb3 true true false) = false.
Proof. reflexivity. Qed.

Check true.

Check negb.

Check (negb true).

Check (andb3 true).

Module Playground1.

Inductive nat : Type :=
    | O : nat
    | S : nat -> nat.

Definition pred (n : nat) : nat :=
    match n with
        | O => O
        | S n' => n'
    end.

End Playground1.

Definition minustwo (n : nat) : nat :=
    match n with
        | O => O
        | S O => O
        | S (S n') => n'
    end.

Check (S (S (S (S O)))).
Eval simpl in (minustwo 4).

Check S.
Check pred.
Check minustwo.

(*FixPoint evenb (n : nat) : bool :=
    match n with
        | O => true
        | S O => false
        | S (S n') => evenb n'
    end.*)
