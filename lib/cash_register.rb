class CashRegister
    attr_accessor :total, :discount, :items, :latest

    def initialize(discount= 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity= 1)
        self.latest = price * quantity
        @total += self.latest
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            percentage = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * percentage).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= self.latest
    end
end
