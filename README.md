# avimac
A general purpose highly customizable minimalistic virtual machine for C/Cpp/Arduino.

## MOTIVATION
> *"If you want more effective programmers, you will discover that they should not waste their time debugging, they should not introduce the bugs to starth with."*
- Edger Dijkstra, The Humble Programmer, 1972

> NOTE: this is a `work in progress`, complete and enhance existing features, add more options in almost everything, test cases, better documentation and more examples are planned towards a 1.0.0 release

## CHARACTERISTICS

* customizable and extensible instruction set
* general purpose default instructions (count: 8 opcodes)
* optional IoC -inverse of control- hook callbacks (initial setup and before and after instruction execution)
* dedicated bytes register (default count: 16 bytes)
* dedicated string register (default length: 128 bytes)
* externally accessible stack
* external user program code memory (default limit: 1024 bytes)
* incorporated OOB -out of bounds- checks for code and stack
* optional branching limit (useful as an infinite loop prevention fence)

## HiSTORY

0.7.0 * 03.apr.2023 * first public release
0.6.0 * 02.apr.2023 * 
0.5.0 * 28.mar.2023 * 
0.4.0 * 24.mar.2023 * 
0.3.0 * 23.mar.2023 * 
0.2.0 * 22.mar.2023 * 
0.1.0 * 19.mar.2023 * 
0.0.1 * 24.feb.2023 * started coding

