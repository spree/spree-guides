---
title: Notification Messages
---

## Overview

Notification messages are generally used by endpoints to convey information to the owner of the storefront (or one of their employees.) These messages are typically generated in the context of an endpoint service request and should always be sent with a HTTP status code of `200`.

***
Notification messages can be mapped to endpoints just like any other message. By default they are also automatically converted into log entries.
***

## Message Types

### Info

This message type is for communicating interesting information from endpoint services. It is common for this type of message to be sent in response after an endpoint processes an inbound message.

---notification:info---
```json
{
  "message": "notification:info",
  "message_id": "518726r84910000001",
  "source": "incoming",
  "payload": {
    "subject": "Tracking number assigned",
    "description": "Shipment has been given a tracking #123443-5242."
  }
}
```

### Warn

Use this message type to indicate that a service executed successfully but that there may be a potential problem that's worth investigating.

---notification:warn---
```json
{
  "message": "notification:warn",
  "message_id": "518726r84910000002",
  "source": "mandrill.order_confirmation",
  "payload": {
    "subject": "Unable to verify address",
    "description": "Shipment #H123456 contains an address that was unabled to be verified. We have shipped the package anyways but it may not get there!"
  }
}
```

### Error

Use this message type to indicate that a service was unable to perform the requested action. Typically this is a validation problem with the service or some other type of permanent failure. For example, a shipment is being requested to a country that is not eligible for shipping by the carrier. Use `notification:error` messages when no amount of retrying will change the outcome and its time to notify someone in charge of troubleshooting problems with the store.

!!!
Do not use this message for exceptional situations such as the inability to connect to a third party server. Those types of exceptions are considered [Failures]() and should be handled by returning a `5XX` error code instead.
!!!

$$$
Fix the link above
$$$

---notification:error---
```json
{
  "message": "notification:error",
  "message_id": "518726r84910000003",
  "source": "spree.order_poller"
  "payload": {
    "subject": "Shipment rejected",
    "description": "We are unable to ship overnight packages to Afghanistan."
  }
}
```