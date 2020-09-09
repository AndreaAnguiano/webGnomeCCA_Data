import subprocess
import glob
import os
from datetime import datetime
from datetime import timedelta
import time 


if __name__ == "__main__":
    now = datetime(2020,9,8)

    add = timedelta(days=1)
    # Download the one from the previous day
    newd = now - add
    newd_yest = newd

    fileExp = "hycom_gomu_901m000_%s%s%s*.nc"%(now.year,str(now.month).zfill(2),str(now.day).zfill(2))
    fileExpYesterday = "hycom_gomu_901m000_%s%s%s*.nc"%(newd_yest.year,str(newd_yest.month).zfill(2),str(newd_yest.day).zfill(2))
    outputFolder = "data/hycom/"
    
    tocall = "wget --user=anonymous ftp://ftp.hycom.org/datasets/GOMu0.04/expt_90.1m000/data/forecasts/%s -P %s"%(fileExp,outputFolder)

    print("Removing yesterday files")
    for f in glob.glob(outputFolder+fileExpYesterday):
        print("Removing: ",f)
        os.remove(f)

    print("Wget to process",tocall)
    subprocess.Popen([tocall],shell=True)
