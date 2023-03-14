#!/usr/bin/env python

import subprocess
import time
import pandas as pd
import csv

with open("result1.txt", "w") as f:
    f.write("")

with open("result2.txt", "w") as f:
    f.write("")

with open("result3.txt", "w") as f:
    f.write("")

with open("result4.txt", "w") as f:
    f.write("")

with open("result5.txt", "w") as f:
    f.write("")

with open("result6.txt", "w") as f:
    f.write("")

with open("result7.txt", "w") as f:
    f.write("")

with open("result8.txt", "w") as f:
    f.write("")

with open("result9.txt", "w") as f:
    f.write("")

with open("result10.txt", "w") as f:
    f.write("")


script_path = "/root/Tesi/downward/fast-downward.py"

arguments = [ ["test1_domain.pddl", "test1_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"],
              ["test2_domain.pddl", "test2_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"],
              ["test3_domain.pddl", "test3_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"],
              ["test4_domain.pddl", "test4_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"],
              ["test5_domain.pddl", "test5_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"],
              ["test6_domain.pddl", "test6_problem.pddl", "--evaluator", "h=ff()",  "--search", "lazy_greedy([h], preferred=[h])"]  
            ]

# workbook = openpyxl.Workbook()
# sheet = workbook.active

total_time1=[]
total_time2=[]
total_time3=[]
total_time4=[]
total_time5=[]
total_time6=[]
total_time7=[]
total_time8=[]
total_time9=[]
total_time10=[]


for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time1.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result1.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time1[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time2.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result2.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time2[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time3.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result3.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time3[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time4.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result4.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time4[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time5.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result5.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time5[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time6.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result6.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time6[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time7.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result7.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time7[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time8.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result8.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time8[i]) + "s to execute \n")



for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time9.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result9.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time9[i]) + "s to execute \n")




for i in range(0, len(arguments)):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time10.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("result10.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time10[i]) + "s to execute \n")


total_time = {'first try':total_time1, 'second try':total_time2, 'third try':total_time3, 'fourth try':total_time4, 'fifth try':total_time5, 'sixth try':total_time6, 'seventh try':total_time7, 'eighth try':total_time8, 'ninth try':total_time9, 'tenth try':total_time10}

#df = pd.DataFrame(total_time, columns=['Time to execute 1', 'Time to execute 2'])
df = pd.DataFrame(total_time)
df.to_excel (r'/root/Tesi/downward/times.xlsx', index= True, header=True)


