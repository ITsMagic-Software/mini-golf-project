package JAVARuntime;

// Useful imports
import java.util.*;
import java.text.*;
import java.net.*;
import java.math.*;
import java.io.*;
import java.nio.*;
import java.io.IOException;

/**
 * @Author 
*/
public class LuaScriptCreatorUtil extends FilesPanelDirectoryMenu { 

private InputDialog createScriptDialog;

    public LuaScriptCreatorUtil() {
        super("Lua Scripting/New Lua Script");
    }
    
    @Override
    public void onClick(File selectedFolder) {
        final File fldr = selectedFolder;
        createScriptDialog = new InputDialog("Create new Lua script", "MyLuaScript", "OK", "Cancel", new InputDialogListener() {
                    File selectedFolder = fldr;
                    public void onFinish(String name) {
                        File folder = new File(selectedFolder.getAbsolutePath()+"/");
                        folder.mkdirs();
                        File newFile = new File(selectedFolder.getAbsolutePath()+"/"+ name + ".lua");
                        //PFile newScriptFile = null;
                        try {
                            newFile.createNewFile();
                            //newScriptFile = new PFile(Directories.getProjectFolder() + "Files/LuaScripts/" + name + ".lua");
                        } catch (IOException e) {
                            Console.log(e.toString());
                        }
                    }
                    
                    public void onCancel() {
                    
                    }
                });
    }
}
