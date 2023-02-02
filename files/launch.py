#!/usr/bin/env python3

import subprocess
import time

with open("results.txt", "w") as f:
    f.write("")

script_path = "/root/Tesi/downward/fast-downward.py"

arguments = [ ["thesis_domain1.pddl", "thesis_problem1.pddl", "--evaluator", "hff=ff()", "--evaluator", "hcea=cea()", "--search", "lazy_greedy([hff, hcea], preferred=[hff, hcea])"],
              ["thesis_domain2.pddl", "thesis_problem2.pddl", "--evaluator", "hff=ff()", "--evaluator", "hcea=cea()", "--search", "lazy_greedy([hff, hcea], preferred=[hff, hcea])"],
              ["thesis_domain3.pddl", "thesis_problem3.pddl", "--evaluator", "hff=ff()", "--evaluator", "hcea=cea()", "--search", "lazy_greedy([hff, hcea], preferred=[hff, hcea])"],
              ["thesis_domain4.pddl", "thesis_problem4.pddl", "--evaluator", "hff=ff()", "--evaluator", "hcea=cea()", "--search", "lazy_greedy([hff, hcea], preferred=[hff, hcea])"],
              ["thesis_domain5.pddl", "thesis_problem5.pddl", "--evaluator", "hff=ff()", "--evaluator", "hcea=cea()", "--search", "lazy_greedy([hff, hcea], preferred=[hff, hcea])"]  
            ]

total_time=[]

for i in range(0,5,1):

    start=time.time()
    plan = subprocess.run(["python3", script_path] + arguments[i], stdout=subprocess.PIPE)
    temp=time.time() - start

    total_time.append(temp)

    with open("sas_plan", "r") as in_plan:
        in_plan_txt = in_plan.read()

    with open("results.txt", "a") as out_plan_txt:
        out_plan_txt.write("Try to find the solution for the plan! \n\n")
        out_plan_txt.write(in_plan_txt)
        out_plan_txt.write("\n\n\n")

    print('PLAN {} EXECUTED'.format(i))
    print("The planner has taken " + str(total_time[i]) + "s to execute \n")

print(total_time)

