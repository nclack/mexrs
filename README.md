# MEXRS

A simple demonstration of making a Matlab mex function using Rust.

A mex function is nothing more than a specially named DLL that exports a special name: `mexFunction`.  Rust's FFI makes this relatively straightforward.

Most mex functions will need to interact with Matlab's MX and MEX APIs to do anything useful.  There's a `build.rs` for providing the link path to Matlab's libraries.

## Wishlist

* automatically locate Matlab in `build.rs`
* automatically determine the mex extension.  Perhaps use a call to Matlab's `mexext` command.

## Details

### Environment

The goal here was not to write something very general. These are the tools I used when putting this example together. It should be simple to adapt to other configurations.

* Rust 1.15 (stable)
* Matlab 2016b 
* Windows 10 x64
* Visual Studio 2015

### Building

From the `hello` directory:

```
cargo build
cp .\target\debug\helloworld.dll .\target\debug\helloworld.mexw64
```

Alternatively, see the `build.ps1` script in the `scripts` folder.

### Running

From the `hello` directory (after building):

```
matlab.exe -nodesktop -noFigureWindows -nosplash -logfile "log.txt" -r "cd target/debug;  helloworld; quit;"
```

You should get something like:

```
MATLAB is running in headless mode.  Figure windows will not be displayed.
 
To get started, type one of these: helpwin, helpdesk, or demo.
For product information, visit www.mathworks.com.
 
Hello World.
```
