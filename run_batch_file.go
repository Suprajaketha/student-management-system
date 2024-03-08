package main

import (
    "fmt"
    "os/exec"
)

func main() {
    // Command to execute the batch file
    cmd := exec.Command("cmd", "/c", "40_copy_files.bat")

    // Run the command
    err := cmd.Run()
    if err != nil {
        fmt.Println("Error executing batch file:", err)
        return
    }

    fmt.Println("Batch file executed successfully.")
}

