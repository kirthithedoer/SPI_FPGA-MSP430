# SPI_FPGA-MSP430
I have designed a Real Time Clock (RTC) on the FPGA Board and then SPI communication is carried out between Master - FPGA and the slave - MSP430F5529 microcontroller. 
The time is sent as hours, minutes and seconds serially to the slave from the master. 
MSP430 goes into Low Power Mode and is woken up again using interrupts.
