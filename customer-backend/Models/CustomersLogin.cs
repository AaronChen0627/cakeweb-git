using System;
using System.Collections.Generic;

namespace customer_backend.Models;

public partial class CustomersLogin
{
    public int CustomerId { get; set; }

    public string Account { get; set; } = null!;

    public string Password { get; set; } = null!;
}
