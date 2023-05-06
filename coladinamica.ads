generic
   
   type Tipoelemento is private;
   
   package Coladinamica is 
      
      type Tiponodo is private;
      type tipocola is private;
      type Tipopun is access Tiponodo;
      
      function Vacia(Cola:in Tipocola) return boolean;
      procedure Inscola(Cola:in out tipocola; Elemento:in Tipoelemento);
      procedure Supcola(Cola:in out tipocola; Elemento:out Tipoelemento);
      procedure Limpiar(Cola:in out Tipocola);
      Colavacia:exception;
      
      private
         
      type Tiponodo is record
         Info:Tipoelemento;
         Sig:Tipopun;
      end record;
      
      type Tipocola is record
      frente, final:tipopun;
      end record;
         
   end Coladinamica;
