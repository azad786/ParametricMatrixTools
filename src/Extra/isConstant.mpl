# ======================================================================= #
# ======================================================================= #
#                                                                         #
# isConstant.mpl                                                          #
#                                                                         #
# AUTHOR .... Steven E. Thornton                                          #
#                Under the supervision of                                 #
#                Robert M. Corless & Marc Moreno Maza                     #
# EMAIL ..... sthornt7@uwo.ca                                             #
# UPDATED ... Jan. 9/2017                                                 #
#                                                                         #
# Determine if a polynomial is constant.                                  #
#                                                                         #
# CALLING SEQUENCE                                                        #
#   isConstant(p, R)                                                      #
#   isConstant(p, v, R)                                                   #
#                                                                         #
# INPUT                                                                   #
#   p ... Polynomial                                                      #
#   v ... Variable                                                        #
#   R ... Polynomial ring                                                 #
#                                                                         #
# OUTPUT                                                                  #
#   3 Arguments:                                                          #
#       True if the input polynomial either has no indeterminants or its  #
#       only indeterminant is v, false otherwise.                         #
#   2 Arguments:                                                          #
#       True if the input polynomial has no indeterminants, false         #
#       otherwise.                                                        #
#                                                                         #
# EXAMPLE                                                                 #
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
isConstant := module()

    export ModuleApply;

    local
        isConstant2,
        isConstant3;

    ModuleApply := proc()
        if nargs = 3 then
            return isConstant3(args)
        elif nargs = 2 then
            return isConstant2(args)
        else
            error "Function takes 2 or 3 arguments";
        end if;
    end proc;

    # 3 argument method
    isConstant3 := proc(p::depends(polyInRing(R)), v::name, R::TRDring, $) :: truefalse;

        # ERROR CHECKING -----------------------------

        # v must be the greatest variable of R
        if not isGreatestVariable(v, R) then
            error "v must be the greatest variable of R";
        end if;

        # CODE ---------------------------------------

        if nops(indets(p)) > 1 then
            return false;
        elif nops(indets(p)) = 1 then
            if not v in indets(p) then
                return false;
            end if;
        end if;
        return true;
    end proc;

    # 2 argument method
    isConstant2 := proc(p::depends(polyInRing(R)), R::TRDring, $) :: truefalse;
        return RC:-TRDis_constant(p, R);
    end proc;
    
end module;