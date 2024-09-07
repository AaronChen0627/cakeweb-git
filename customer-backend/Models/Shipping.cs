using System;
using System.Collections.Generic;

namespace customer_backend.Models;

public partial class Shipping
{
    public int ShippingId { get; set; }

    public int? OrderId { get; set; }

    public string ShippingMethod { get; set; } = null!;

    public string? TrackingNumber { get; set; }

    public decimal ShippingCost { get; set; }

    public DateTime? ShippedDate { get; set; }

    public DateTime? DeliveredDate { get; set; }

    public string ShippingStatus { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Order? Order { get; set; }
}
