namespace com.logali;

entity Products {
    key ID               : UUID;
        name             : String;
        Descripction     : String;
        ImageURL         : String;
        ReleaseData      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
}

entity Supplier {
    key ID         : UUID;
        name       : String;
        Street     : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(3);
        Email      : String;
        Phone      : String;
        Fax        : String;
}

entity Categories {
    key ID   : String(1);
        name : String;
}

entity StockAvailability {
    key ID          : Integer;
        Description : String;
}

entity Currencies {
    key ID          : String(3);
        Description : String;
}

entity UnitofMeasures {
    key ID          : String(2);
        Description : String;
}

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
}

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String;
}

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
}

entity SalesData {
    key DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}
