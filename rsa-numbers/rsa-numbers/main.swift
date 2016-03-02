// J2 - RSA Numbers
// Contributors: Russell Gordon, Matt Anderson, Liam Byrne, Oliver Gane

// Get an integer that is greater than 0 and less
// than 1000
var lower = 0  // lower limit: start with a value not in
                // desired range
repeat {
    
    // Prompt the user
    print("Enter the lower limit of range")
    
    // Get a value from the user – readLine always returns an
    // optional String, so we use optional binding to unwrap it
    if let input = readLine(stripNewline: true) {
        
        // We have a value, so try to convert it to an Int
        if let inputAsInteger = Int(input) {
            // We have successfully converted to Int
            // but... check if it is in the range we want
            if inputAsInteger > 0 && inputAsInteger < 1000 {
                // The input is now stored as an integer,
                // and is in our desired range
                lower = inputAsInteger
            } else {
                // The input is an integer, but is not in the
                // desired range, so prompt the user to correct
                // their input
                print("Please enter an integer greater than 0 and less than 1000.")
            }
            
        } else {
            // The value didn't get converted to an integer
            // successfully. Print an error message
            print("Please enter an integer value.")
        }
        
        
    }
    
    
} while lower < 1 || lower >= 1000 // keep going until we get a
                                   // value in the range that we
                                   // need


// Get an integer that is greater than or equal to the lower range value and less
// than 1000
var upper = lower - 1  // lower limit: start with a value not in
                       // desired range
repeat {
    
    // Prompt the user
    print("Enter the upper limit of range")
    
    // Get a value from the user – readLine always returns an
    // optional String, so we use optional binding to unwrap it
    if let input = readLine(stripNewline: true) {
        
        // We have a value, so try to convert it to an Int
        if let inputAsInteger = Int(input) {
            // We have successfully converted to Int
            // but... check if it is in the range we want
            if inputAsInteger >= lower && inputAsInteger < 1000 {
                // The input is now stored as an integer,
                // and is in our desired range
                upper = inputAsInteger
            } else {
                // The input is an integer, but is not in the
                // desired range, so prompt the user to correct
                // their input
                print("Please enter an integer greater than or equal to \(lower) and less than 1000.")
            }
            
        } else {
            // The value didn't get converted to an integer
            // successfully. Print an error message
            print("Please enter an integer value.")
        }
        
    }
    
} while upper < lower || upper >= 1000 // keep going until we get a
                                       // value in the range that we
                                       // need

// Find all the RSA numbers in the range given
var RSANumberCount = 0
for aNumber in lower...upper {
    
    // Notes: basically I need to iterate up to the number and check each value to see
    //        to see if it is a divisor of the original number
    //        (and keep track of how many divisors I have)
    //        when the divisor is 4 exactly, it's an RSA number
    
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

// Print the desired output
print("The number of RSA numbers between \(lower) and \(upper) is \(RSANumberCount)")




