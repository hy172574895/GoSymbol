# GoSymbol
I have to say that, this project is a little break the philosophy of vim, it's kind of emaces.



whatever, "Tomorrow is another day".




INSTALLATION

    1. Clonging this project to your vimfile
        You may use Vundle or others, plugins manager.
        Please copy the following to your vimrc    
        Plugin 'hy172574895/GoSymbol' 
        
    2. Setting your map. I prefer to using <Alt>
       So I list my map:
        imap <M-k> <Esc>:call ToAnywhere("right","i")<cr>i
        imap <M-l> <Esc>:call ToAnywhere("right","a")<cr>a
        imap <M-j> <Esc>:call ToAnywhere("left","a")<cr>a
        imap <M-h> <Esc>:call ToAnywhere("left","i")<cr>i
       You can change the map <M-?> that you use to it.

HOW TO USE?

    1.First at all, you have to set your vimrc.
    
    2.here are a example:("|"is meaning where your cursor is)
    
    int foo(in|t a,char b,char *c,)
    
    {
        printf("hello world %d",a);
        return b;
    }
    ----------------------------------------
    I want control my cursor to there:

    int foo(int a,char b,char *c,|)
    {
        printf("hello world %d",a);
        return b;
    }
    ----------------------------------------
    (A)I would like to use a Plugin name "easymotion" before
        it's really good when I press  <leader> twice and press "w" that I can go anywhere. 
        but grually I am aware of this way could mess my mind up, beacause I have to choose a char to achieve my
        aim, I do not want to think about something that I don't concern when I am coding.the more important is I 
        should left insert model, even thought I can set a mapping, I got a better idea.
    (B)using "f" command is a good option, but I think its same as (A)
    (C)using "e" "w"  in normal model mabey can replace this project. oh yes, mabey its useless, but "why
       try everthing once".
    After all the shit, press <Alt-h> <Alt-j> <Alt-l> <Alt-k> in insert model.I just pressing pressing pressing
     I don't need to think about it. When the cursor arrived where I want to, I stopped.
    ----------------------------------------
CUSTOMIZATION


    We stop when we meet the following symbol which was set in the plugin by default
        '/+-=()<>:;~`?!@#[]{}$%^&"*
    if you don't want to use the default setting, you can change like this: 

    let g:keywords = "'\\\/\+\-\=\(\)\<\>\:\;\~\`\?\!\@\#\[\]\{\}\$\%\^\&\"\*"

    It should be necessarry  remind you that add a "\" before you want to set a new symbol to distinguish

:wq

    
