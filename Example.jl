

#For pure resistors, there's no pin's distinction
wheatstone = @circuit begin

    R_left_up = resistor(1)
    R_right_up = resistor(1)
    R_left_down = resistor(1)
    R_right_down = resistor(1)
    R_middle = resistor(1)

    node_up = node()
    node_down = node()
    node_left = node()
    node_right = node()

    net_in = ionode()
    net_out = ionode()

    @connection [
        [net_in, node_left, R_left_up, node_up, R_right_up, node_right, net_out],
        [node_left, R_left_down, node_down, R_right_down, node_right],
        [node_up, R_middle, node_down]
    ]
end

#methods for open circuit
runcircuit(wheatstone, net_in, net_out)

#If not for simulaiton, just for schematic
wheatstone_nosim = @circuit begin

    resistors([
        R_left_up
        R_right_up
        R_left_down
        R_right_down
        R_middle
    ])

    nodes([
        node_up
        node_down
        node_left
        node_right
    ])

    net_in = ionode()
    net_out = ionode()

    @connection [
        [net_in, node_left, R_left_up, node_up, R_right_up, node_right, net_out],
        [node_left, R_left_down, node_down, R_right_down, node_right],
        [node_up, R_middle, node_down]
    ]
end
#can't be runned


#for pins which makes distinction
diode_circuit = @circuit begin

    d = diode()
    t = triode()

    net_in = ionode()
    net_out = ionode()

    @connection [
        #when connect from one pin to another pin in same object, two args should be nearby.
        [net_in, d.pos, d.neg, t.s1, t.s2, net_out],
        [d.neg, t.s3]
        #If you wanna using pin syntax with such as a resistor:
        #Access resistor's num1 pin like `r.pin1`.
        #Link it to another object's pin.
        #Declare a new node.
    ]

end