package JAVARuntime;

// Useful imports
import java.util.*;
import java.text.*;
import java.net.*;
import java.math.*;
import java.io.*;
import java.nio.*;

/**
 * @Author 
*/
public class ObjectsStorage extends Component { 

    public ObjectFile[] tiles = new ObjectFile[0];
    public ObjectFile[] objects = new ObjectFile[0];
    
    public ObjectFile flag = null;
    
    public WorldFile world;
    
    public ObjectFile player;

    /// Run only once
    @Override
    public void start() {
        
    }

    /// Repeat every frame
    @Override
    public void repeat() {
    
    }

    /// Repeat every frame when component or object is disabled
    @Override
    public void disabledRepeat() {
        
    }
    
    public ObjectFile getTile(int index) {
        return tiles[index];
    }
    
    public ObjectFile[] getObjects() {
        return objects;
    }
    
    public ObjectFile getFlag() {
        return flag;
    }
    
    public WorldFile getWorld() {
        return world;
    }
    
    public ObjectFile getPlayer() {
        return player;
    }
}
