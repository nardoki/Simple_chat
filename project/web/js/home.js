    const person=document.querySelector('.personal');
    const group=document.querySelector('.group');
    const feedback=document.querySelector('.feedback');
    const profile=document.querySelector('.profile');
    const changepassword=document.querySelector('.changePassword');
    const dropDown=document.querySelector('.dropDown');
    const dropDown1=document.querySelector('.dropDown1');
    const profil1=document.querySelector('.profile1');
    const profil2=document.querySelector('.profile2');
    
    dropDown1.style.display="none";
            dropDown.style.display="none";
    function personal(){
        if(person.style.display==="flex")
        {}
        else{
            person.style.display="flex";
            group.style.display="none";
            feedback.style.display="none";
            profile.style.display="none";
            changepassword.style.display="none";
            dropDown1.style.display="none";
            dropDown.style.display="none";
        }
    }
    function group1(){
        if(group.style.display==="flex")
        {}
        else{
            person.style.display="none";
            group.style.display="flex";
            feedback.style.display="none";
            profile.style.display="none";
            changepassword.style.display="none";
            dropDown1.style.display="none";
            dropDown.style.display="none";
        }
    }
    function feedback1(){
        if(feedback.style.display==="flex")
        {}
        else{
            person.style.display="none";
            group.style.display="none";
            feedback.style.display="flex";
            profile.style.display="none";
            changepassword.style.display="none";
            dropDown1.style.display="none";
            dropDown.style.display="none";

        }
    }
    function profile1(){
        if(profile.style.display==="flex")
        {}
        else{
            person.style.display="none";
            group.style.display="none";
            feedback.style.display="none";
            profile.style.display="flex";
            changepassword.style.display="none";
            dropDown1.style.display="none";
            dropDown.style.display="none";

        }
    }
    function changepassword1(){
        if(changepassword.style.display==="flex")
        {}
        else{
            person.style.display="none";
            group.style.display="none";
            feedback.style.display="none";
            profile.style.display="none";
            changepassword.style.display="flex";
            dropDown1.style.display="none";
            dropDown.style.display="none";

        }
    }

    function close1(){
        if(dropDown.style.display==="block")
        { 
            dropDown.style.display="none";
        }
        else 
        {
            dropDown.style.display="block";
        }    
    }
    function close2(){
        if(dropDown1.style.display==="block")
        { 
            dropDown1.style.display="none";
        }
        else 
        {
            dropDown1.style.display="block";
        }    
    }
    
    function closeDrop(){
        if(dropDown1.style.display==="block")
        { 
            dropDown1.style.display="none";
        }
        if(dropDown.style.display==="block")
        { 
            dropDown.style.display="none";
        }
            
    }
    
    function edit(){
        profil2.style.display="flex"
        profil1.style.display="none";  
    }
    
    window.onload = function() {
        var viewBox=document.querySelector('.viewbox');
        viewBox.scrollTop = viewBox.scrollHeight;
    };
    
    function edit2(){
        profil2.style.display="flex"
        profil1.style.display="none";  
    }
    
    window.onload = function() {
        var viewBox=document.querySelector('.group.message.viewbox');
        viewBox.scrollTop = viewBox.scrollHeight;
    };
    


