# Default values that are provided to settings when the user has not made any changes.

{
  logo = {

    type = "builtin";
    width = 30;
    height = 15;
    source = "auto";
    padding = {
      top = 0;
      left = 0; 
      right = 2;
    };
  };

  display = {

    separator = ": ";
    color = { 
      keys = "blue"; 
      title = "red"; 
    };

    key = {

      width = 12;
      type = "both";
    };

    bar = {

      width = 10;
      char = {
        elapsed = "■";
        total = "-";
      };
    };

    percent = {

      type = 9;
      color = {
        green = "green";
        yellow = "light_yellow";
        red = "light_red";
      };
    };
  };

  modules = [ 
    "title"
    "os"
    "kernel"
    "memory"
    "cpu"
    "uptime"
  ];
}
