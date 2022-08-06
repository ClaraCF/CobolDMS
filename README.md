# CobolDMS
![GitHub last commit](https://img.shields.io/github/last-commit/ClaraCF/CobolDMS?color=ff7fff) 
![GitHub License](https://img.shields.io/github/license/ClaraCF/CobolDMS)
![Have a nice day ♥](https://img.shields.io/static/v1?label=Hey~&message=Have%20A%20Nice%20Day%20♥&color=blueviolet)

An interactive command line utility to convert Decimal Degrees to Degrees, Minutes and Seconds (and viceversa).  
This is a rewrite of [this](https://github.com/qAxelFT/Degree2DegreeMinuteSecond-Conversor) project by [@qAxelFT](https://github.com/qAxelFT) written in COBOL.

## Why?
Because I'm a masochist.  
I got curious and decided it was a good idea to give COBOL a try.

## Requirements
To compile this project GnuCOBOL was used.  
On Linux distributions you can install it by running:
```bash
# Arch Linux
sudo pacman -S gnucobol

# Ubuntu and other Debian-based distros
sudo apt install gnucobol

# Gentoo
sudo emerge open-cobol
```

For other distros, as well as Windows and Mac users, you can download GnuCOBOL [here](https://gnucobol.sourceforge.io/).
Other COBOL compilers may work too (perhaps).

## Compiling
To compile this project you may run the following command:
```bash
cobc -O2 -x main.cbl -o CobolDMS
```
Feel free to change the -O flag level to your liking, but I'd recommend not disabling it as it produces a warning otherwise.

## Usage
Upon running the generated executable, you'll be met with a menu with options. Use number to navigate through the different menus and submenus.  
There are currently three options:
1. **Convertion from Decimal Degrees to Degrees, Minutes and Seconds**: Input a numeric value corresponding to decimal degrees to convert it to DMS.
2. **Convertion from Degrees, Minutes and Seconds to Decimal Degrees**: Input a numeric value corresponding to DMS to convert it to decimal degrees.
3. **Exit**: Exit 👍  

Values that count as valid input are **positive** numbers with floating point with a limit of 3 digits before and after the point.  
For example: 10, 300, 123.50, 45.678, 0.  
Negative numbers and numbers with more than 3 digits before and/or after the floating point are not supported.  
Try not to break the program. It definitely will.  

## Contributing
Do you think you know COBOL better than I do? Well, you're absolutely right. If you think you have something to add, please feel free to contribute to this atrocious creation <3.
Corrections and contributions to other things such as this README are also welcome and greatly appreciated. (Seriously c: <3).

## License
[No](https://unlicense.org/).
