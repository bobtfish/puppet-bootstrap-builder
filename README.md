# Puppet booststrap builder

This is an initial sketch for a puppet boostrap builder.

The idea is that the user writes manifests/bootstrap.pp which
pulls in just the puppet manifests that they need to bootstrap (a subset)
and then we have a tool to do the following:

  * Parse manifests/bootstrap.pp, extract all classes used from it
  * Bundle puppet and dependencies into a directory
  * Create a tar file of manifests/bootstrap.pp, relevant modules, puppet + deps
  * Generate a shell script containing this tar file base64'd + a shim which
    unwraps it, then executes the bundled version of puppet against the manifests/bootstrap.pp

