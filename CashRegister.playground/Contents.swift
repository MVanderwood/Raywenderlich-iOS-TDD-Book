import XCTest

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0

    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }

    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }

    func acceptCashPayment(_ amount: Decimal) {
        if amount > transactionTotal {
            availableFunds -= transactionTotal - amount
            transactionTotal = 0
        } else {
            transactionTotal -= amount
        }
    }
}

class CashRegisterTests: XCTestCase {
    var availableFunds: Decimal!
    var sut           : CashRegister!
    var itemCost      : Decimal!

    override func setUp() {
        super.setUp()

        availableFunds = 100
        sut            = CashRegister(availableFunds: availableFunds)
        itemCost       = 42
    }

    override func tearDown() {
        availableFunds = nil
        sut            = nil
        itemCost       = nil

        super.tearDown()
    }

    func testInitAvailableFunds_setsAvailableFunds() {
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }

    func testAddItem_onetItem_addsCostToTransactionTotal() {
        // when
        sut.addItem(itemCost)

        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }

    func testAddItem_twoItems_addsCostToTransactionTotal() {
        // given
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2

        // when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)

        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }

    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {
        // given
        sut.addItem(itemCost)
        let cashPayment = Decimal(15)

        // when
        sut.acceptCashPayment(cashPayment)

        // then
        XCTAssertEqual(sut.transactionTotal, itemCost - cashPayment)
    }

    func testAcceptCashPayment_addsPaymentToAvailableFunds() {
        // given
        sut.addItem(itemCost)
        let cashPayment = Decimal(50)
        let endingBalance = sut.availableFunds - (sut.transactionTotal - cashPayment)

        // when
        sut.acceptCashPayment(cashPayment)

        // then
        XCTAssertEqual(sut.transactionTotal, Decimal(0))
        XCTAssertEqual(sut.availableFunds, endingBalance)
    }
}

CashRegisterTests.defaultTestSuite.run()

