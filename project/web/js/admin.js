const main3=document.querySelector('.main3');
const main4=document.querySelector('.feedback');
const main5=document.querySelector('.changePassword');
function func1(){
    if(main3.style.display=="flex")
    {
        main3.style.display="flex" ;  
    }
    else 
    {
        main3.style.display="flex"
        main4.style.display="none";
        main5.style.display="none";;
    }
}

function func2(){
    if(main4.style.display=="flex")
    {
        main4.style.display="flex" ;  
    }
    else 
    {
        main4.style.display="flex"
        main3.style.display="none";
        main5.style.display="none";;
    }
}
function func3(){
    if(main5.style.display=="flex")
    {
        main5.style.display="flex" ;  
    }
    else 
    {
        main5.style.display="flex"
        main4.style.display="none";
        main3.style.display="none";
    }
}