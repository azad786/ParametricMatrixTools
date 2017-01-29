# ======================================================================= #
# ======================================================================= #
#                                                                         #
# ParametricMatrixTools.mpl                                               #
#                                                                         #
# AUTHOR .... Steven E. Thornton                                          #
#                Under the supervision of                                 #
#                Robert M. Corless & Marc Moreno Maza                     #
# EMAIL ..... sthornt7@uwo.ca                                             #
# UPDATED ... Jan. 9/2017                                                 #
#                                                                         #
# A module for computations on parametric matrices.                       #
#                                                                         #
# LICENSE                                                                 #
#   This program is free software: you can redistribute it and/or modify  #
#   it under the terms of the GNU General Public License as published by  #
#   the Free Software Foundation, either version 3 of the License, or     #
#   any later version.                                                    #
#                                                                         #
#   This program is distributed in the hope that it will be useful,       #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of        #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
#   GNU General Public License for more details.                          #
#                                                                         #
#   You should have received a copy of the GNU General Public License     #
#   along with this program.  If not, see http://www.gnu.org/licenses/.   #
# ======================================================================= #
# ======================================================================= #
ParametricMatrixTools := module()

    option package;
    
    export ComprehensiveFrobeniusForm,
           ComprehensiveGcd,
           ComprehensiveJordanForm,
           ComprehensiveSmithForm,
           ComprehensiveSquareFreeFactorization,
           SquareFreeFactorization_monic,
           JordanForm,
           ListComprehensiveGcd;
    
    local ModuleLoad,
          loadTypes,
          allComb,
          isConstant,
          isConstantMatrix,
          isGreatestVariable,
          isNonZeroOverCS,
          isNonZeroOverRS,
          isUnder,
          isZeroMatrixOverCS,
          isZeroMatrixOverRS,
          isZeroOverCS,
          isZeroOverRS,
          ListIntersection,
          ListUnion,
          TRDdifference_intersect_cs_p,
          TRDequal_cs,
          TRDis_disjoint_lcs,
          TRDis_partition_cs;
    
    # This function is run when the package is loaded.
    ModuleLoad := proc()
        kernelopts('opaquemodules' = false);
        loadTypes();
    end proc;

# Macros
$define RC RegularChains 
$define RC_CST RegularChains:-ConstructibleSetTools
$define RC_PST RegularChains:-ParametricSystemTools
$define RC_CT RegularChains:-ChainTools
$define RC_SAST RegularChains:-SemiAlgebraicSetTools
$define RC_MT RegularChains:-MatrixTools
$define LA LinearAlgebra
$define PT PolynomialTools
$define LT ListTools

# External Files
$include "src/types.mpl"

$include "src/Extra/allComb.mpl"
$include "src/Extra/isConstant.mpl"
$include "src/Extra/isConstantMatrix.mpl"
$include "src/Extra/isGreatestVariable.mpl"
$include "src/Extra/isUnder.mpl"
$include "src/Extra/isNonZeroOverCS.mpl"
$include "src/Extra/isNonZeroOverRS.mpl"
$include "src/Extra/isZeroMatrixOverCS.mpl"
$include "src/Extra/isZeroMatrixOverRS.mpl"
$include "src/Extra/isZeroOverCS.mpl"
$include "src/Extra/isZeroOverRS.mpl"
$include "src/Extra/ListIntersection.mpl"
$include "src/Extra/ListUnion.mpl"
$include "src/Extra/TRDdifference_intersect_cs_p.mpl"
$include "src/Extra/TRDequal_cs.mpl"
$include "src/Extra/TRDis_disjoint_lcs.mpl"
$include "src/Extra/TRDis_partition_cs.mpl"

$include "src/ComprehensiveFrobeniusForm/ComprehensiveFrobeniusForm.mpl"

$include "src/ComprehensiveGcd/ComprehensiveGcd.mpl"
$include "src/ComprehensiveGcd/ListComprehensiveGcd.mpl"

$include "src/ComprehensiveSmithForm/ComprehensiveSmithForm.mpl"

$include "src/ComprehensiveSquareFreeFactorization/ComprehensiveSquareFreeFactorization.mpl"
$include "src/ComprehensiveSquareFreeFactorization/SquareFreeFactorization_monic.mpl"

$include "src/ComprehensiveJordanForm/JordanForm.mpl"
$include "src/ComprehensiveJordanForm/ComprehensiveJordanForm.mpl"

end module: