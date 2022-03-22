package View;

/*********************************** README ************************************
*
* Title placeholder
* @author Alexander Lundqvist
* Created: 24-11-2021
*
* About this class:
*
*
* Based on:
* <a href="">Link</a>
*
*******************************************************************************/

import javax.swing.*;
import java.awt.*;

public class View {
    private JTextArea output; // Text area for function output
    
    /*
    public View(Controller controller){
        this.controller = controller;
        this.output = new JTextArea("");
        this.output.setEnabled(false);
    } 
    */
    
    public void runInterface(){
       // Creating the frame
       JFrame frame = new JFrame("Soundgood music school - Instrument rental");
       frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
       frame.setSize(800,500);
       
       // Adding filler at the top
       JPanel filler = new JPanel();
       frame.getContentPane().add(BorderLayout.NORTH, filler);

       // Static text area with option menu
       JTextArea textArea = new JTextArea(
            "Available actions \n\n"+
            "1. Get device id. \n"+
            "2. Set certain device id. \n"+
            "3. Generate a random device id. \n"
        );
       textArea.setEditable(false);
       frame.getContentPane().add(BorderLayout.LINE_START, textArea);
       
       // Scrollable area for function output  
       JScrollPane outputWindow = new JScrollPane(output);
       outputWindow.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);  
       outputWindow.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS); 
       frame.add(outputWindow, BorderLayout.CENTER);  
       
       // Button menu at the bottom
       JPanel controlField = new JPanel();

       JButton button1 = new JButton("List instruments");
       button1.setActionCommand("1");
       button1.addActionListener((ActionEvent e) -> {
           resetOutput();
           output.append("Option 1 exectuted!\n");
       });
       
       JButton button2 = new JButton("Rent instrument");
       button2.setActionCommand("2");
       button2.addActionListener((ActionEvent e) -> {
           resetOutput();
           output.append("Option 2 exectuted!\n");
       });
       
       JButton button3 = new JButton("Terminate rental");
       button3.setActionCommand("3");
       button3.addActionListener((ActionEvent e) -> {
           resetOutput();
           output.append("Option 3 exectuted!\n");
       });
       
       controlField.add(button1);
       controlField.add(button2);
       controlField.add(button3);
       
       frame.getContentPane().add(BorderLayout.SOUTH, controlField);
       frame.setVisible(true);
    }
    
    private void resetOutput(){
        this.output.setText(null);
    }
    
    // Static testing of the view component
    public static void main(String[] args) {
        View view = new View();
    }
}
