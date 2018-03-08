# Nostradamus

Can you prophecise the next block's values? Yes? Prove it by calling `prophecise` on `Nostradamus` with the proper `bytes32 exact`.

## Goals

* The exercise serves to show that you have to be careful when you use a block's values as a pseudo-random seed.
* It also serves to think about who is `msg.sender`.
* Serves to reduce belief in what appears to be right.

## Notes

* The `theWord()` function is a decoy whose hash calculation differs from the important one in `prophecise`. Do not "fix" it.
* Do not "fix" the missing space on the line `bytes32 blockHash =block.blockhash(block.number);`; it serves as an attention trap for those who look at the detail of the 2 functions.