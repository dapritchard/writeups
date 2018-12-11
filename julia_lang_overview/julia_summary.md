---
title: Summary of Julia language characteristics
author: David Pritchard
geometry: margin=1in
header-includes:
  - \hypersetup{colorlinks=true,
            allbordercolors={0 0 0},
            pdfborderstyle={/S/U/W 1},
			urlcolor=blue}
---

Based on a reading of _Julia: A Fresh Approach to Numerical Computing_ and _Julia:
Dynamism and Performance Reconciled by Design_

* background
    * project launched in 2009, first release in 2012.  Version 1.0 in August 2018.
    * co-created by Jeff Bezanson, Alan Edelman, Stefan Karpinski, and Viral
      B. Shah.  Edelman is a professor at MIT and Bezanson received his
      Ph.D. under his direction for his work on Julia. Not sure how Karpinski
      and Shah became involved.
    * "combines features of productivity languages, such as Python or MATLAB,
      with characteristics of performance-oriented languages, such as C++ or
      Fortran."
    * the name Julia apparently doesn't have any particular meaning:
      <http://stackoverflow.com/q/29290780/>
    * interesting post from Karpinsky about the motivation for creating the
      language:
      <https://discourse.julialang.org/t/julia-motivation-why-werent-numpy-scipy-numba-good-enough/2236/10>
* interpreted language
* very fast.  See <https://julialang.org/benchmarks/>
* lexically scoped
* automatic memory management (through garbage collection)
* targets the LLVM JIT internal representation
* support for generic functions with multiple dispatch (a la Lisp CLOS or R S4)  are deep-seated
    * usage is omnipresent (comparable in usage to R S3 generic functions,
      perhaps)
    * far less boilerplate code than R S4
* dynamic typing system
    * supports both mutable and immutable objects
    * can be inferred from the interpreter in most cases (i.e. doesn't have to
      be manually specified)
    * cornerstone of Julia's efficiency, by allowing for algorithm
      specialization, and leveraged with generic functions
    * for loops are fast or faster than vector operations because types are
      known (compare this to R)
    * user-defined types are given first class status
    * generic types a la Java or C++ templates (e.g. `my_array{T}`)
* macro system (I think similar to Lisp, at first glance?)
* full metaprogramming capabilities (a la Lisp or R)
* direct access to the full BLAS and LAPACK libraries
    * as opposed to being limited to calls through e.g. R's `%*%` operator
    * can specialize computations when applicable
* native support for parallel and distributed computing is built into the language
    * still experimental / under developement
    * interpreter not limited to 1 thread as in R or Python
    * primitives for blocking, atomic access, message passing etc.
    * distributed computing facilities provided in the standard library with
      similar goals as MPI but with very different semantics
* package manager by default operates with environments a la packrat or virtualenv
* disadvantages:
    * very young
	* still in a state of flux (changing APIs)
	* very weak still in data manipulation (compare to dplyr or pandas, etc.)
	* limited (but rapidly growing!)  ecosystem of packages
	* features like parallel / distributed computing are still experimental
* interesting comparison of R, Python, MATLAB, and Julia:
  <https://voxeu.org/content/which-numerical-computing-language-best-julia-matlab-python-or-r>
