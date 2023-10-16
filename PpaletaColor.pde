/* 
  --Objeto PpaletaColor--
  Carga un archivo .cvs donde cada linea
  contiene una paleta de color de cuatro  
  o cinco colores. Cada color esta almacenado 
  en hexadecimal, sin la capa de transparencia
  
  la talba contiene cabecera
*/

class PpaletaColor{
  
  
  /************** VARIABLES *************
  -------------------------------------*/
  Table colorSheet; //declara Tabla
   
  
  /************* CONSTRUCTOR *************   
  ---------------------------------------*/ 
  PpaletaColor(String nombreTabla){
    //carga tabla de colores 
    colorSheet=loadTable(nombreTabla,"header");
    
    
  }  
  /************** FUNCIONES **************
  ---------------------------------------*/
  
  //--- COVERTIR COLOR ---//
  /* ingresa string con cod hexadecimal
  y lo transforma en una variable color*/
  color convertirColor(String colHexa){
    
    color C; 
    
    //obtiene la cadena de cada valor , 2 digitos
    String rHex=colHexa.substring(0,2);
    String gHex=colHexa.substring(2,4);
    String bHex=colHexa.substring(4,6);
    
    //convierte valor de hexadecimal a entero decimal  
    int r=Integer.valueOf(rHex,16);
    int g=Integer.valueOf(gHex,16);
    int b=Integer.valueOf(bHex,16);
    
  C= color(r,g,b);  //construye el color
  return C; //retorna el color
  }//-------------------//
  
  //funcion paleta de color crea la pàleta de color
  color[] paletaColor(Table tablaColor,int numPaleta){
   
    int anchoTabla=tablaColor.getColumnCount();//obtiene ancho de tabla
   
    color[] col=new color[anchoTabla]; //crea array de colores
   
    TableRow fila=tablaColor.getRow( numPaleta ); //carga fila de la tabla
   
    //carga colores en array de colores
    for(int i=1;i<anchoTabla;i++){  //index 0 nombre de Paleta
       String colStr=fila.getString(i); //lee la celda
       col[i]= convertirColor(colStr); //convierte dato en color invocando la func
    }
  
    return col;
  }
}//-------- END OBJECT ---------//
