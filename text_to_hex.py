# code adapted from: https://forum.micropython.org/viewtopic.php?t=3863
def text_to_hex(string):	
	ba = bytearray(str.encode(string))
	return "".join("\\x%02x" % i for i in ba)
