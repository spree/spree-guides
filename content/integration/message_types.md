---
title: Message Types
---

## Order Messages

### order:new

When a new order is created, this is the message that will be send out. The ```original``` is the Spree::Order, while the ```order``` is the generic Integrator order format.

---order_new.json---
```json
{
  "message": "order:new",
  "payload": {
    "order": {
      "number": "R104702249",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2013-07-30T19:19:05Z",
      "updated_at": "2013-07-30T20:08:39Z",
      "status": "complete",
      "totals": {
        "item": 99.95,
        "adjustment": 15,
        "tax": 5,
        "shipping": 0,
        "payment": 114.95,
        "order": 114.95
      },
      "line_items": [
        {
          "name": "Spree Baseball Jersey",
          "sku": "SPR-00001",
          "external_ref": "",
          "quantity": 2,
          "price": 19.99,
          "variant_id": 8,
          "options": {
            
          }
        },
        {
          "name": "Ruby on Rails Baseball Jersey",
          "sku": "ROR-00004",
          "external_ref": "",
          "quantity": 3,
          "price": 19.99,
          "variant_id": 20,
          "options": {
            "tshirt-color": "Red",
            "tshirt-size": "Medium"
          }
        }
      ],
      "adjustments": [
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "North America 5.0%",
          "value": 5
        }
      ],
      "shipping_address": {
        "firstname": "Brian",
        "lastname": "Quinn",
        "address1": "7735 Old Georgetown Rd",
        "address2": "",
        "zipcode": "20814",
        "city": "Bethesda",
        "state": "Maryland",
        "country": "US",
        "phone": "555-123-456"
      },
      "billing_address": {
        "firstname": "Brian",
        "lastname": "Quinn",
        "address1": "7735 Old Georgetown Rd",
        "address2": "",
        "zipcode": "20814",
        "city": "Bethesda",
        "state": "Maryland",
        "country": "US",
        "phone": "555-123-456"
      },
      "payments": [
        {
          "number": 6,
          "status": "completed",
          "amount": 5,
          "payment_method": "Check"
        },
        {
          "number": 5,
          "status": "completed",
          "amount": 109.95,
          "payment_method": "Credit Card"
        }
      ],
      "shipments": [
        {
          "number": "H286178199",
          "cost": 5,
          "status": "shipped",
          "stock_location": null,
          "shipping_method": "UPS Ground (USD)",
          "tracking": null,
          "updated_at": null,
          "shipped_at": "2013-07-30T20:08:38Z",
          "items": [
            {
              "name": "Spree Baseball Jersey",
              "sku": "SPR-00001",
              "external_ref": "",
              "quantity": 1,
              "price": 19.99,
              "variant_id": 8,
              "options": {
                
              }
            },
            {
              "name": "Ruby on Rails Baseball Jersey",
              "sku": "ROR-00004",
              "external_ref": "",
              "quantity": 1,
              "price": 19.99,
              "variant_id": 20,
              "options": {
                "tshirt-color": "Red",
                "tshirt-size": "Medium"
              }
            }
          ]
        },
        {
          "number": "H803900939",
          "cost": 5,
          "status": "ready",
          "stock_location": null,
          "shipping_method": "UPS Ground (USD)",
          "tracking": "4532535354353452",
          "updated_at": null,
          "shipped_at": null,
          "items": [
            {
              "name": "Ruby on Rails Baseball Jersey",
              "sku": "ROR-00004",
              "external_ref": "",
              "quantity": 2,
              "price": 19.99,
              "variant_id": 20,
              "options": {
                "tshirt-color": "Red",
                "tshirt-size": "Medium"
              }
            },
            {
              "name": "Spree Baseball Jersey",
              "sku": "SPR-00001",
              "external_ref": "",
              "quantity": 1,
              "price": 19.99,
              "variant_id": 8,
              "options": {
                
              }
            }
          ]
        }
      ]
    },
    "original": {
      "id": 5,
      "number": "R104702249",
      "item_total": "99.95",
      "total": "114.95",
      "state": "complete",
      "adjustment_total": "15.0",
      "user_id": 1,
      "created_at": "2013-07-29T17:42:02Z",
      "updated_at": "2013-07-30T20:08:39Z",
      "completed_at": "2013-07-30T19:19:05Z",
      "payment_total": "114.95",
      "shipment_state": "partial",
      "payment_state": "paid",
      "email": "spree@example.com",
      "special_instructions": null,
    }
  }
}
```

### order:updated

When an order is updated, the following message will be send out. The ```order``` and ```previous``` are all in the generic Integrator format, while the ```original``` is the ```Spree::Order```. The ```diff`` key contains all the changes that happend for this order.

---order_updated.json---
```json
{
  "message": "order:updated",
  "payload": {
    "order": { ... },
    "original": { ... },
    "previous": { ... },
    "diff": {
      "updated_at": [
        "2013-09-25T09:36:39Z",
        "2013-09-25T13:06:18Z"
      ],
      "payments": [
        [
          {
            "id": 2,
            "amount": "24.14",
            "state": "pending",
            "payment_method_id": 1,
            "payment_method": {
              "id": 1,
              "name": "Credit Card",
              "environment": "development"
            }
          }
        ],
        [
          {
            "id": 2,
            "amount": "24.14",
            "state": "void",
            "payment_method_id": 1,
            "payment_method": {
              "id": 1,
              "name": "Credit Card",
              "environment": "development"
            }
          }
        ]
      ]
    }
  }
}
```

### order:canceled

The only difference with this messages that is send out is the status, this will be ```canceled```

---order_canceled.json---
```json
{
  "message": "order:canceled",
  "payload": {
  "order": {
    ...
    "status": "canceled",
  },
  "original": { ... }
}
```

## Shipment Messages

### shipment:ready

When a shipment has a state of `ready`, generally indicating that they are ready to be fulfilled a `shipment:ready` message will be pushed to incoming queue.

---shipment_ready.json---
```json
{
  "message_id": "51af1dc5fe53543f1200f519",
  "message": "shipment:ready",
  "payload": {
    "shipment": {
      "number": "H11357178202",
      "order_number": "R543221177",
      "email": "spree@example.com",
      "cost": 1.95,
      "status": "ready",
      "stock_location": null,
      "shipping_method": "Standard Shipping",
      "tracking": null,
      "updated_at": null,
      "shipped_at": null,
      "shipping_address": {
        "firstname": "John",
        "lastname": "Do",
        "address1": "Street 134",
        "address2": "",
        "zipcode": "1234AB",
        "city": "Somewhere",
        "state": "Friesland",
        "country": "NL",
        "phone": "06123456753"
      },
      "items": [
        {
          "name": "Ruby on Rails Tote",
          "sku": "ROR-00011",
          "external_ref": "",
          "quantity": 1,
          "price": 15.99,
          "variant_id": 1,
          "options": {
            
          }
        }
      ]
    },
    "order": { ... },
    "original": { ... }
  }
}
```

### shipment:confirm

This type of Message is sent whenever an order shipment is confirmed and sent. It includes the tracking information so the customer can use it to track his/her order.

---shipment_confirm.json---
```json
{
  "message_id": "51af1dc5fe53543f1200f519",
  "message": "shipment:confirm",
  "payload": {
    "shipment": {
      "number": "H11357178202",
      "order_number": "R543221177",
      "email": "spree@example.com",
      "cost": 1.95,
      "status": "shipped",
      "stock_location": null,
      "shipping_method": "Standard Shipping",
      "tracking": "tracking-1234-ABC",
      "updated_at": null,
      "shipped_at": "2013-09-26T10:21:52Z",
      "shipping_address": {
        "firstname": "John",
        "lastname": "Do",
        "address1": "Street 134",
        "address2": "",
        "zipcode": "1234AB",
        "city": "Somewhere",
        "state": "Friesland",
        "country": "NL",
        "phone": "06123456753"
      },
      "items": [
        {
          "name": "Ruby on Rails Tote",
          "sku": "ROR-00011",
          "external_ref": "",
          "quantity": 1,
          "price": 15.99,
          "variant_id": 1,
          "options": {            
          }
        }
      ]
    }
  }
}
```

## Stock Messages
Changing the stock amount for a specific Variant by his SKU.

By default stock backordering will be respected. To turn this off add a boolean parameter ```spree.force_quantity``` with ```true``` to set the stock amount exactly the same as the quantity provided.

### stock:change

This message will change the ```count_on_hand``` for a ```Spree::Variant``` based on the provided sku and the quantity. The quantity can be negative!. 

!!!
It's impossible to create any backorders for a Spree 1.3 store since the logic is tied to Orders and InventoryUnits. An ```InvalidQuantityException``` will be raised when that's happening.
!!!

---stock_change.json---
```json
{
  "message_id": "51af1dc5fe53543f1200f519",
  "message": "stock:change",
  "payload": {
    "sku": "ROR-001234",
    "quantity": 20
  }
}
```

### stock:actual

This message will set the ```count_on_hand``` for a ```Spree::Variant``` based on the provided sku and the quantity. The quantity can be negative!. This message will always force the quantity.

!!!
It's impossible to create any backorders for a Spree 1.3 store since the logic is tied to Orders and InventoryUnits. An ```InvalidQuantityException``` will be raised when that's happening.
!!!

---stock_actual.json---
```json
{
  "message_id": "51af1dc5fe53543f1200f519",
  "message": "stock:actual",
  "payload": {
    "sku": "ROR-001234",
    "quantity": 20
  }
}
```

## Notification Messages

Notifications are special message that are generated by the hub after processing [endpoint service responses](/integration/terminology.html#service-responses). 

Endpoints do not return notification messages in the same way as normal messages, as notifications can be processed even if received via HTTP `500` statuses, unlike normal messages which must be return via HTTP `200` only.

Notifications are used by endpoints to convey information to the store operators, they should be considered as logging messages.

When a notification is received from an endpoint, the hub stores a copy of the notification associated with the message that generated it. It will then push the notification message onto the incoming queue, which can then be mapped to endpoints just like any other message.

***
If a duplicate notification is received for example from a message that is repeatedly failing & retrying, the hub will increment the `:occurrences` attribute on the locally store notification, but no new message will be pushed onto the incoming queue. This prevents failing messages from flooding endpoints with duplicate notification messages.
***

### notification:info

Info level notifications are generally used for communicating successful processing of messages, and are normally returned with a HTTP `200` status.

An endpoint would include the "notifications" hash as follows in its response:

---endpoint response---
```json
{
  "message_id": "518726r84910000000",
  "notifications": [
    { "level": "info",
      "subject": "Tracking number assigned",
      "description": "Shipment has been given a tracking #123443-5242." }
  ]
}
```

And the hub in turn will push the following message onto the incoming queue, the first time such a response is received:

---notification:info---
```json
{
  "message": "notification:info",
  "message_id": "518726r84910000001",
  "source": "shipping.tracking",
  "payload": {
    "subject": "Tracking number assigned",
    "description": "Shipment has been given a tracking #123443-5242."
  }
}
```

### notification:warn

Warn level messages are used to indicate that a service executed successfully but that there may be a potential problem that's worth investigating.

---notification:warn---
```json
{
  "message": "notification:warn",
  "message_id": "518726r84910000002",
  "source": "mandrill.order_confirmation",
  "payload": {
    "subject": "Unable to verify address",
    "description": "Shipment #H123456 contains an address that was unable to be verified. We have shipped the package anyways but it may not get there!"
  }
}
```

### notification:error

Error level notifications indicate that a service was unable to perform the requested action. Typically this is a validation problem with the service or some other type of permanent failure. For example, a shipment is being requested to a country that is not eligible for shipping by the carrier. 

Error notifications are typically returned with a HTTP `500` status, thus forcing the message into either a `retrying` or `parked` state. Errors are normally used to alert staff that the message cannot be processed with some manual intervention. 

---notification:error---
```json
{
  "message": "notification:error",
  "message_id": "518726r84910000003",
  "source": "shipwire.order"
  "payload": {
    "subject": "Shipment rejected",
    "description": "We are unable to ship overnight packages to Afghanistan."
  }
}
```

!!!
It's a good idea to map `notification:error` messages to a help desk or alerting system so you can be aware of failures as they occur. The Spree Commerce hub support team also actively monitor error notifications.
!!!