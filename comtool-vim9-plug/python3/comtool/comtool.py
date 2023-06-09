import vim

import os
import serial

class COMPort:
    def __init__(self):
        pass

    def connect(self, port_name, speed):
        try:
            self.ser = serial.Serial(port_name, speed, timeout=0.1)
        except serial.SerialException:
            vim.command("echo 'This port does not exist!!'")
            vim.command("g:com_error = 1")
        except ValueError:
            vim.command("echo 'Invalid input!!'")
            vim.command("g:com_error = 1")

    def read(self, byte_size):
        vim.vars["read_buf"] = self.ser.read(byte_size).decode('utf-8')

    def write(self, msg):
        self.ser.write(msg.encode('utf-8'))

    def disconnect(self):
        self.ser.close()
