with Ada.Unchecked_Deallocation;
package body Coladinamica is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo, Tipopun);
   
   function Vacia(Cola:in Tipocola) return Boolean is
   begin
      return cola.frente=null;
   end Vacia;
   
   procedure Inscola(Cola:in out Tipocola; Elemento:in Tipoelemento) is
      Nuevonodo:Tipopun:=new Tiponodo'(Elemento, null);      
   begin
      if Vacia(Cola) then
         Cola.Frente:=Nuevonodo;
      else 
         Cola.Final.Sig:=Nuevonodo;
      end if;
      Cola.Final:=Nuevonodo;
   end Inscola;
   
   procedure Supcola(Cola:in out Tipocola; Elemento:out Tipoelemento) is
      Temp:Tipopun:=Cola.Frente;
   begin
      if Vacia(Cola) then raise Colavacia;
      else
         Elemento:=Cola.Frente.Info;
         Cola.Frente:=Cola.Frente.Sig;
      end if;
      if Cola.Frente=null then
         Cola.Final:=null;
      end if;
      Free(Temp);
   end Supcola;
   
   procedure Limpiar(Cola:in out Tipocola) is
      Temp:Tipopun:=Cola.Frente;
   begin
      while not Vacia(Cola) loop
         Cola.Frente:=Cola.Frente.Sig;
         Free(Temp);
         Temp:=Cola.Frente;
      end loop;      
   end Limpiar;
   
end Coladinamica;