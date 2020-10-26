namespace Bell {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    @EntryPoint()
    operation TestBell() : Unit {
        let initials = [Zero, One];

        for (initial in initials) {
            let (numZeros, numOnes, agree) = TestBellState(1000, initial);

            Message($"Init:{initial} 0s={numZeros} 1s={numOnes} agree={agree}");
        }
    }
}

