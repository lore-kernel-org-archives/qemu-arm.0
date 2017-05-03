Received: by 10.25.0.198 with SMTP id 189csp91963lfa;
        Wed, 3 May 2017 06:10:19 -0700 (PDT)
X-Received: by 10.237.40.2 with SMTP id r2mr35224552qtd.173.1493817019059;
        Wed, 03 May 2017 06:10:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m3si1683876qkb.149.2017.05.03.06.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5u2s-0002IL-9d
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trV-0000Uz-61
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trT-0001HI-R2
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5trT-0001Gw-I1; Wed, 03 May 2017 08:58:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EB7280F7C;
	Wed,  3 May 2017 12:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5EB7280F7C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5EB7280F7C
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24D8017C5A;
	Wed,  3 May 2017 12:58:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:17 +0200
Message-Id: <1493816238-33120-24-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 03 May 2017 12:58:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: as7xTGnQkz1e

legacy cpu to node mapping is using cpu index values to map
VCPU to node with help of '-numa node,nodeid=node,cpus=x[-y]'
option. However cpu index is internal concept and QEMU users
have to guess /reimplement qemu's logic/ to map it to
a concrete cpu socket/core/thread to make sane CPUs
placement across numa nodes.

This patch allows to map cpu objects to numa nodes using
the same properties as used for cpus with -device/device_add
(socket-id/core-id/thread-id/node-id).

At present valid properties/values to address CPUs could be
fetched using hotpluggable-cpus monitor/qmp command, it will
require user to start qemu twice when creating domain to fetch
possible CPUs for a machine type/-smp layout first and
then the second time with numa explicit mapping for actual
usage. The first step results could be saved and reused to
set/change mapping later as far as machine type/-smp stays
the same.

Proposed impl. supports exact and wildcard matching to
simplify CLI and allow to set mapping for a specific cpu
or group of cpu objects specified by matched properties.

For example:

   # exact mapping x86
   -numa cpu,node-id=x,socket-id=y,core-id=z,thread-id=n

   # exact mapping SPAPR
   -numa cpu,node-id=x,core-id=y

   # wildcard mapping, all cpu objects that match socket-id=y
   # are mapped to node-id=x
   -numa cpu,node-id=x,socket-id=y

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - use new NumaCpuOptions instead of CpuInstanceProperties in
    NumaOptions, so that in future we could decouple both
    if needed. (Eduardo Habkost <ehabkost@redhat.com>)
  - clarify effect of NumaCpuOptions.node-id in qapi-schema.json
---
 numa.c           | 25 +++++++++++++++++++++++++
 qapi-schema.json | 21 +++++++++++++++++++--
 qemu-options.hx  | 23 ++++++++++++++++++++++-
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/numa.c b/numa.c
index 40e9f44..61521f5 100644
--- a/numa.c
+++ b/numa.c
@@ -227,6 +227,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
     NumaOptions *object = NULL;
     MachineState *ms = opaque;
     Error *err = NULL;
+    CpuInstanceProperties cpu;
 
     {
         Visitor *v = opts_visitor_new(opts);
@@ -246,6 +247,30 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
         }
         nb_numa_nodes++;
         break;
+    case NUMA_OPTIONS_TYPE_CPU:
+        if (!object->u.cpu.has_node_id) {
+            error_setg(&err, "Missing mandatory node-id property");
+            goto end;
+        }
+        if (!numa_info[object->u.cpu.node_id].present) {
+            error_setg(&err, "Invalid node-id=%" PRId64 ", NUMA node must be "
+                "defined with -numa node,nodeid=ID before it's used with "
+                "-numa cpu,node-id=ID", object->u.cpu.node_id);
+            goto end;
+        }
+
+        memset(&cpu, 0, sizeof(cpu));
+        cpu.has_node_id = object->u.cpu.has_node_id;
+        cpu.node_id = object->u.cpu.node_id;
+        cpu.has_socket_id = object->u.cpu.has_socket_id;
+        cpu.socket_id = object->u.cpu.socket_id;
+        cpu.has_core_id = object->u.cpu.has_core_id;
+        cpu.core_id = object->u.cpu.core_id;
+        cpu.has_thread_id = object->u.cpu.has_thread_id;
+        cpu.thread_id = object->u.cpu.thread_id;
+
+        machine_set_cpu_numa_node(ms, &cpu, &err);
+        break;
     default:
         abort();
     }
diff --git a/qapi-schema.json b/qapi-schema.json
index 76d137d..5baf3a4 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -5680,10 +5680,12 @@
 ##
 # @NumaOptionsType:
 #
+# @cpu: property based CPU(s) to node mapping (Since: 2.10)
+#
 # Since: 2.1
 ##
 { 'enum': 'NumaOptionsType',
-  'data': [ 'node' ] }
+  'data': [ 'node', 'cpu' ] }
 
 ##
 # @NumaOptions:
@@ -5696,7 +5698,8 @@
   'base': { 'type': 'NumaOptionsType' },
   'discriminator': 'type',
   'data': {
-    'node': 'NumaNodeOptions' }}
+    'node': 'NumaNodeOptions',
+    'cpu': 'NumaCpuOptions' }}
 
 ##
 # @NumaNodeOptions:
@@ -5725,6 +5728,20 @@
    '*memdev': 'str' }}
 
 ##
+# @NumaCpuOptions:
+#
+# Option "-numa cpu" overrides default cpu to node mapping.
+# It accepts the same set of cpu properties as returned by
+# query-hotpluggable-cpus[].props, where node-id could be used to
+# override default node mapping.
+#
+# Since: 2.10
+##
+{ 'struct': 'NumaCpuOptions',
+   'base': 'CpuInstanceProperties',
+   'data' : {} }
+
+##
 # @HostMemPolicy:
 #
 # Host memory policy types
diff --git a/qemu-options.hx b/qemu-options.hx
index 787b9c3..e88f534 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -139,13 +139,16 @@ ETEXI
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
-    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n", QEMU_ARCH_ALL)
+    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
+    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n", QEMU_ARCH_ALL)
 STEXI
 @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
 @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
+@itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
 @findex -numa
 Define a NUMA node and assign RAM and VCPUs to it.
 
+Legacy VCPU assignment uses @samp{cpus} option where
 @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
 @samp{cpus} option represent a contiguous range of CPU indexes
 (or a single VCPU if @var{lastcpu} is omitted). A non-contiguous
@@ -159,6 +162,24 @@ a NUMA node:
 -numa node,cpus=0-2,cpus=5
 @end example
 
+@samp{cpu} option is a new alternative to @samp{cpus} option
+which uses @samp{socket-id|core-id|thread-id} properties to assign
+CPU objects to a @var{node} using topology layout properties of CPU.
+The set of properties is machine specific, and depends on used
+machine type/@samp{smp} options. It could be queried with
+@samp{hotpluggable-cpus} monitor command.
+@samp{node-id} property specifies @var{node} to which CPU object
+will be assigned, it's required for @var{node} to be declared
+with @samp{node} option before it's used with @samp{cpu} option.
+
+For example:
+@example
+-M pc \
+-smp 1,sockets=2,maxcpus=2 \
+-numa node,nodeid=0 -numa node,nodeid=1 \
+-numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
+@end example
+
 @samp{mem} assigns a given RAM amount to a node. @samp{memdev}
 assigns RAM from a given memory backend device to a node. If
 @samp{mem} and @samp{memdev} are omitted in all nodes, RAM is
-- 
2.7.4

