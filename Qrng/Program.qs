namespace Qrng {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation RandomNumber(max : Int) : Int {
        Message($"Sampling a random number between 0 and {max}: ");
        return RandomNumberInRange(max);
    }

    operation RandomNumberInRange(max : Int) : Int {
        mutable bits = new Result[0];

        for (idxBit in 1..BitSizeI(max)) {
            set bits += [RandomNumberGenerator()];
        }

        let sample = ResultArrayAsInt(bits);
        return sample > max ? RandomNumberInRange(max) | sample;
    }

    operation RandomNumberGenerator() : Result {
        using (q = Qubit()) {
            H(q);
            return MResetZ(q);
        }
    }
}

