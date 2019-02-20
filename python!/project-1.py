# -*-coding:Utf-8 -*
"""
First project, first script
"""
print ("'Quel est nom?'")
reponsenom = input ()
#print ("Quel est votre age?")
#reponseage = input ()
reponseage =int(input("Quel est votre age?")) #converti la valeur de age en un entier
#reponseage = float(reponseage)
if reponseage > 60: 
    # print (reponsenom) 
    print ("vous êtes agé de :", reponseage)
elif reponseage < 25:
    print ("Vous avez encore de belles années devant vous")
else: 
    print("Tu es encore jeune")

print ("bye bye")
