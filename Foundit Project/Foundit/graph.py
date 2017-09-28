import matplotlib as mpl
mpl.use('Agg')
import numpy as np
import json
import mpld3 as mpld3
import matplotlib.pyplot as plt
from mpld3 import fig_to_html, plugins


def uautolabel(rects,ax):
    """
    Function attaches a text label above each bar displaying its height. This function provides the reader easy context on each value in the finished graph so that an understanding of the data can be made faster.
    """
    for rect in rects:
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width()/2., 1.05*height,
                '%d' % int(height),
                ha='center', va='bottom')
                
def urenderGraph(dataSet):
  """
  This function renders a graph for the use in the specialized word graphs. This portion of the code was not completed at the time of submission, and so this function is currently not being used. 
  """
  tdata=dataSet[0]
  sdata=dataSet[1]
  tsize=len(tdata)
  fig=plt.figure(1)
  fig.set_size_inches(11,(tsize*2.25))
  #fig.set_size_inches(18.5, 10.5, forward=True)
  counter=1
  for word, num in tdata:
    for tword, value in sdata.items():
      tempwords=[]
      tempcounts=[]
      tempucounts=[]
      if(word==tword):
        for sword, counts in value:
          tempwords.append(sword)
          tempcounts.append(counts[0])
          tempucounts.append(counts[1])
        ax=plt.subplot(tsize,1,counter, autoscale_on=True)
        ind = np.arange(len(tempcounts))  # the x locations for the groups
        width = 0.35       # the width of the bars
        rects1 = ax.bar(ind, tempcounts, width, color='r')
        rects2 = ax.bar(ind+.35, tempucounts, width, color='b')
        
        ax.set_ylabel("Occurances")
        ax.set_title(word)
        ax.set_xticks(ind + width / 2)
        ax.set_xticklabels(tempwords)
        
        uautolabel(rects1,ax)
        uautolabel(rects2,ax)
        
        counter+=1
#  data = dataSet[0]
#  title = dataSet[1]
#  ylabel = dataSet[2]
#  xlabels = dataSet[3]
#  data2 = dataSet[4]
  #bool1 = dataSet[5]
#  ind = np.arange(len(data))  # the x locations for the groups
 # width = 0.35       # the width of the bars

  #fig, ax = plt.subplots()
  #print 'Before figure'
  #chart = plt.figure(1)
  #print 'After first figure'

  # add some text for labels, title and axes ticks
#  ax.set_ylabel(ylabel)
#  ax.set_title(title)
#  ax.set_xticks(ind + width / 2)
#  ax.set_xticklabels(xlabels)

  #fig_to_html attempt
  #current error: 'Figure' object has no attribute 'fig_to_html'
  
  #needed to download jinja2 for mpld3 to work
  fig.tight_layout()
  graphOutput = plt.figure() #initialize variable as current graph to be later passed on to HTML code
  graphHTML = fig_to_html(fig) #convert current graph to HTML code
  #print (graphHTML)
  #if(bool1==1):
  #plt.show()
  plt.close(graphOutput) #close the current graph
  mpld3.display(fig)
  return graphHTML

def renderGraph(dataSet):
"""
The renderGraph function converts data into a bar graph object. It handles the measuring, drawing, and defining of the various aspects of the graph. From this point, it converts the graph code from Python to HTML and returns this value. This HTML code is then transferred to the website for the viewer.
"""
  data = dataSet[0]
  title = dataSet[1]
  ylabel = dataSet[2]
  xlabels = dataSet[3]
  dsize=len(data)
  ind = np.arange(dsize)  # the x locations for the groups
  width = 0.35       # the width of the bars

  #print 'Before figure'
  chart = plt.figure(1)
  chart.set_figwidth((11))
  #print 'After first figure'
  ax=plt.subplot(autoscale_on=True)
  rects1 = ax.bar(ind, data, width, color='r')

  # add some text for labels, title and axes ticks
  ax.set_ylabel(ylabel)
  ax.set_title(title)
  ax.set_xticks(ind + width / 2)
  ax.set_xticklabels(xlabels)

  def autolabel(rects):
      """
       Function attaches a text label above each bar displaying its height. This function provides the reader easy context on each value in the finished graph so that an understanding of the data can be made faster.
      """
      for rect in rects:
          height = rect.get_height()
          ax.text(rect.get_x() + rect.get_width()/2., 1.02*height,
                  '%d' % int(height),
                  ha='center', va='bottom')

  autolabel(rects1)
  #fig_to_html attempt
  #current error: 'Figure' object has no attribute 'fig_to_html'
  
  #needed to download jinja2 for mpld3 to work
  chart.tight_layout()
  graphOutput = plt.figure() #initialize variable as current graph to be later passed on to HTML code
  graphHTML = fig_to_html(chart) #convert current graph to HTML code
  #plt.show()
  plt.close(graphOutput) #close the current graph
  mpld3.display(chart)
  return graphHTML
  #json01 = json.dumps(mpld3.fig_to_dict(chart))
  #print json01

  #return json01

