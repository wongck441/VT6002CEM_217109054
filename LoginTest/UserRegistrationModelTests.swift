import XCTest
@testable import VT6002CEM_217109054
class UserRegistrationModelTestCase: XCTestCase {
    
    var sut: UserRegistrationModel!
    let firstName = "Yuu"
    let lastName = "Wong"
    let email = "yuu@test.com"
    let password = "Aa111111!"
    
    override func setUp() {
    }
    override func tearDown() {
        sut = nil
    }
    
    func testUserModelStruc_canCreateNewInstance() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertNotNil(sut)
     }
 
    func testUserFirstName_shouldPassIfValidFirstName() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertTrue(sut.isValidFirstName())
     }
    
    func testUserFirstName_shouldPassIfFirstNameLessThanMinLength() {
        sut = UserRegistrationModel(firstName: "S",
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertFalse(sut.isValidFirstName())
    }
    
    func testUserLastName_shouldPassIfValidLastName() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertTrue(sut.isValidLastName())
    }
    
    func testUserLastName_shouldPassIfLastNameLessThanMinLength() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: "K",
        email: email,
        password: password)
        
        XCTAssertFalse(sut.isValidLastName())
    }
    
    func testUserRegistrationModel_shouldPassIfValidEmail() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertTrue(sut.isValidEmail())
    }
    
    func testUserRegistrationModel_shouldPassIfInValidEmail() {
        
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: "test.com",
        password: password)
        
        XCTAssertFalse(sut.isValidEmail())
    }
    
    func testUserRegistrationModel_shouldPassIfValidPasswordLength() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertTrue(sut.isValidPasswordLength())
    }
    
    func testUserPassword_shouldPassIfPasswordIsValid() {
        sut = UserRegistrationModel(firstName: firstName,
        lastName: lastName,
        email: email,
        password: password)
        
        XCTAssertTrue(sut.isValidPassword())
    }
}
