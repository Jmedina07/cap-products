namespace com.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';


type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

// type EmailAddresses_01 : many {
//     kind  : String;
//     email : String;
// }

// type EmailAddresses_02 {
//     kind  : String;
//     email : String;
// }

// entity Emails {
//     email_01  :      EmailAddresses_01;
//     email_02  : many EmailAddresses_02;
//     email_03  : many {
//         kind  :      String;
//         email :      String;
//     }
// }

// type Gender : String enum {
//     male;
//     female;
// }

// entity Order {
//     ClientGender : Gender;
//     status       : Integer enum {
//         submited  = 1;
//         fulfiller = 2;
//         shipped   = 3;
//         cancel    = 4;
//     };
//     priority     : String @assert.range enum {
//             high;
//             medium;
//             low;
//         }
// }
// entity Car {
//     key ID : UUID;
//     name : String;
//     virtual dicount_1 : Decimal;
//     @Core.Computed : false
//     virtual dicount_2 : Decimal;
// }

type Dec : Decimal(16, 2);

context materials {

    entity Products : cuid, managed {
        // key ID               : UUID;
        Name             : localized String not null;
        Descripction     : localized String;
        ImageURL         : String;
        ReleaseData      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        // Supplier_Id      : UUID;
        Supplier         : Association to sales.Suppliers;
        // UnitofMeasure_Id : String(2);
        UnitofMeasure    : Association to UnitofMeasures;
        Currency         : Association to Currencies;
        DimensionUnit    : Association to DimensionUnits;
        Category         : Association to Categories;
        SalesData        : Association to many sales.SalesData
                               on SalesData.Product = $self;
        Reviews          : Association to many ProductReview
                               on Reviews.Product = $self;
    };

    entity Categories {
        key ID   : String(1);
            name : localized String;
    };

    entity Currencies {
        key ID          : String(3);
            Description : localized String;
    };
    entity StockAvailability {
        key ID          : Integer;
            Description : localized String;
            Product     : Association to materials.Products;
    };

    entity UnitofMeasures {
        key ID          : String(2);
            Description : localized String;
    };

    entity DimensionUnits {
        key ID          : String(2);
            Description : localized String;
    };

    entity ProductReview {
        key ID      : UUID;
            Name    : String;
            Rating  : Integer;
            Comment : String;
            Product : Association to materials.Products;
    };
};


context sales {
    entity Orders : cuid {
        // key ID       : UUID;
        Date     : Date;
        Customer : String;
        Item     : Composition of many OrderItems
                       on Item.Order = $self;
    };

    entity OrderItems : cuid {
        // key ID       : UUID;
        Order    : Association to Orders;
        Product  : Association to materials.Products;
        Quantity : Integer;
    };

    entity Suppliers : cuid, managed {
        // key ID      : UUID;
        name    : type of materials.Products : Name;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
        Product : Association to many materials.Products
                      on Product.Supplier = $self;
    };

    entity Months {
        key ID               : String(2);
            Description      : localized String;
            ShortDescription : String(3);
    };

    entity SalesData {
        key ID            : UUID;
            DeliveryDate  : DateTime;
            Revenue       : Decimal(16, 2);
            Product       : Association to materials.Products;
            Currency      : Association to materials.Currencies;
            DeliveryMonth : Association to Months;
    };

    entity SelProducts   as select from materials.Products;

    entity SelProducts1  as
        select from SelProducts {
            *
        };

    entity SelProducts2  as
        select from SelProducts {
            Name,
            Price,
            Quantity

        };

    entity SelProducts3  as
        select from materials.Products
        left join materials.ProductReview
            on Products.Name = ProductReview.Name
        {
            Rating,
            Products.Name,
            sum(Price) as TotalPrice,
        }
        group by
            Rating,
            Products.Name
        order by
            Rating;

    entity ProjProducts  as projection on materials.Products;

    entity ProjProducts2 as projection on materials.Products {
        *
    };

    entity ProjProducts3 as projection on materials.Products {
        ReleaseData,
        Name
    };
    // entity  ParamProducts( pName : String ) as
    //     select
    //         Name, Price, Quantity
    //     from Products
    //     where Name = :pName;

    extend materials.Products with {
        PriceCondition     : String(2);
        PriceDetermination : String(3);
    };

    entity Course {
        key ID : UUID
    };
}
