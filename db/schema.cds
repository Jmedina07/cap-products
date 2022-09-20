namespace com.logali;

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};
// type EmailAddresses_01 : array of {
//     Kind : String;
//     email : String;
// }
// entity Emails {
//     email_01 : EmailAddresses_01;
// }

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

entity Suppliers {
    key ID      : UUID;
        name    : String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
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
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}
