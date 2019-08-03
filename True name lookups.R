Operatorandurllookup <- mergedf6.6 %>% group_by(`Offset.Project.Operator`, Project.Name, `Project Type`) %>% summarise(tot = sum(`Offsets issued`))

write.csv(Operatorandurllookup, "Operatorandurllookup.csv")


Operatorandurllookup<- read.csv("C:/Users/Jordan/Desktop/Operatorandurllookup.csv")
