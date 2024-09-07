using System;
using System.Collections.Generic;

namespace test.Models;

public partial class CustomersLogin
{
    public int CustomerId { get; set; }

    public string Account { get; set; } = null!;

    public string Password { get; set; } = null!;
}
