// Russell Gordon
// J2 - RSA Numbers

// Notes
//
// Two inputs
//
// lower – lower limit of range of integers to check as RSA numbers
// upper – upper limit of range of integers to check as RSA numbers

// Input variables
var lower = 1
var upper = 1000

// Handle input that is switched (lower range more than upper range
if (lower > upper) {
    let temp = upper    // save the lower number in a safe place
    upper = lower       // make 'upper' contain the real higher number
    lower = temp        // make 'lower' contain the real lower number
}

// Find all the RSA numbers in the range given
var RSANumberCount = 0
for aNumber in lower...upper {
    
    // Notes: basically I need to iterate up to the number and check each value to see
    //        to see if it is a divisor of the original number
    //        (and keep track of how many divisors I have)
    //        when the divisor is 4 exactly, it's an RSA
    
    // iterate up to the number I'm checking
    var divisorCount = 0
    for potentialDivisor in 1...aNumber {
        
        // check the current value to see if it is
        if aNumber % potentialDivisor == 0 {
            divisorCount += 1
        }
        
        // stop checking for divisors if we go over the limit for RSA numbers (4)
        // (efficiency)
        if divisorCount > 4 {
            break   // stops current loop (from line 26, the for loop)
        }
        
    }
    
    // Is this an RSA number?
    if divisorCount == 4 {
        RSANumberCount += 1
        // debug (remember to comment this out)
        // print("RSA number is: \(aNumber)")
    }
}

print("The number of RSA numbers between \(lower) and \(upper) is \(RSANumberCount)")


