import common

import edify_generator

 

def RemoveDeviceAssert(info):

  edify = info.script

  for i in xrange(len(edify.script)):

    if "ro.product" in edify.script[i]:

      edify.script[i] = ''

      return



def WritePolicyConfig(info):
  try:
    file_contexts = info.input_zip.read("META/file_contexts")
    common.ZipWriteStr(info.output_zip, "file_contexts", file_contexts)
  except KeyError:
    print "warning: file_context missing from target;"



def FullOTA_InstallEnd(info):

    RemoveDeviceAssert(info)
    WritePolicyConfig(info)
 

def IncrementalOTA_InstallEnd(info):

    RemoveDeviceAssert(info)


