// https://github.com/Quick/Quick

import Quick
import Nimble
import Frankfurter

class FrankfurterSpecs: QuickSpec {
    
    override func spec() {
        
        let frankFurterService = FrankFurter()
        
        describe("latest currency Converter") {
            describe("get") {
                context("wihout parameter") {
                    
                    it("should get a EUR currency Converter") {
                        frankFurterService
                            .latest(from: nil,
                                    to: nil,
                                    completion: { (cConverter, error) in
                                        expect(cConverter?.base).to(equal("EUR"))
                            })
                    }
                }
                
                context("from USD") {
                    it("should get a USD currency Converter") {
                        frankFurterService
                            .latest(from: "USD",
                                    to: nil,
                                    completion: { (cConverter, error) in
                                        expect(cConverter?.base).to(equal("USD"))
                            })
                    }
                }
                
                context("to MYR, NOK AND PHP") {
                    
                    it("should get a EUR currency Converter to MYR, NOK AND PHP") {
                        frankFurterService
                            .latest(from: nil,
                                    to: ["MYR", "NOK","AND", "PHP"],
                                    completion: { (cConverter, error) in
                                        expect(cConverter?.rates.keys)
                                            .to(contain(["MYR", "NOK","AND", "PHP"]))
                            })
                    }
                }
                
                context("FROM USD to MYR, NOK AND PHP") {
                    
                    it("should get a USD currency Converter to MYR, NOK AND PHP") {
                        frankFurterService
                            .latest(from: "USD",
                                    to: ["MYR", "NOK","AND", "PHP"],
                                    completion: { (cConverter, error) in
                                        expect(cConverter?.rates.keys)
                                            .to(contain(["MYR", "NOK","AND", "PHP"]))
                            })
                    }
                }
            }
            
        }
        
        describe("Converter") {
            it("should convert EUR to USD") {
                frankFurterService.convert(amount: 1, base: "EUR", currency: "USD", completion: { (convertedAnount: Float?) in
                    expect(convertedAnount).notTo(equal(1))
                })
            }
        }
    }
}
