Received: by 10.103.124.15 with SMTP id x15csp1865160vsc;
        Tue, 23 May 2017 07:39:24 -0700 (PDT)
X-Received: by 10.55.26.153 with SMTP id l25mr28131692qkh.9.1495550364092;
        Tue, 23 May 2017 07:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550364; cv=none;
        d=google.com; s=arc-20160816;
        b=oxgv/7sutffnvEOFMRSJpnjkr8nhUmwtch1SKx2XR4gV5lUP4WOa3wYG1swQu5LSCr
         FmfZ+ql8a/2nM8bM4hfA0A7Jc9MIKTNZaTcMaKqR5kYnXUFoHeRsqOXtHo5QAAY38MhT
         ux09Ja+1wBumLhCCvWcG20DcM40hZ/Gi1Fp10zv2ob2NGJrlwgUWPfj8lfGv18Q62zAl
         4OJYuyv84ODrrFWK2eL/BLbd5eNRhvfpD2ljc0D1VtrtDmv4GHA4iUlEZEjNj+/Snb0B
         xk8ir5BlW4fa/Si4UZG/j+jERmX5wsGkCdoEQZxd/V6gdNA6wTiMZdtkravW58FOmFI7
         +X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=ImbYpNLkfYLoryZQjXSOfpVDhHNUEWTRUu2eIAraFMo=;
        b=EdBzRqAM2xEDLLpCp0fFQ3d3mhPbezCk/SxATqeahYNYrGVGeYVs4wbDDxozWIVf4G
         yiiaBo9vcqDifSYHO1xfUO8YWzxPF+HDM1uq4MzXovefS9CHwK/nFpl7jBaXIx0OtswD
         aHWe6MoR4dYuRHuz+k9BpuK1P6+HR7HfzPYx0mkreNBNLbFGjlx21Mxkm07hLEhhP1cB
         fXa8JUb1PYwu7G/XuWKVYaHMoEmjv1MFxXmEdVyfmeV/jzLiZnJ3Jbzwsig6ARO03whg
         2bscFZfQY1bcjw/duxUeMkrN3lkonwJMGkdoEo9CCEzJKtu2jwU6+1n37mrY91quDJab
         0kcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m55si22090298qtf.187.2017.05.23.07.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDAy3-00006X-I2
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxe-0008HB-RG
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxd-0002Xr-OP
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxd-0002Wn-DS; Tue, 23 May 2017 10:38:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5391985540;
	Tue, 23 May 2017 14:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5391985540
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5391985540
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFBAA7814F;
	Tue, 23 May 2017 14:38:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:47 +0200
Message-Id: <1495550330-34087-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 23 May 2017 14:38:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/5] numa: move default mapping init to machine
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFrbNyfd72jD

there is no need use cpu_index_to_instance_props() for setting
default cpu -> node mapping. Generic machine code can do it
without cpu_index by just enabling already preset defaults
in possible_cpus.

PS:
as bonus it makes one less user of cpu_index_to_instance_props()

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - make default_mapping boolean, Eduardo Habkost <ehabkost@redhat.com>
  - redo default mapping detection loop as a combo of
    for/if, Eduardo Habkost <ehabkost@redhat.com>
  - return back lost TODO comment, Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 33 +++++++++++++++++++++++----------
 numa.c            | 26 --------------------------
 2 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fd6a436..aaf3cff 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -700,26 +700,39 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     return g_string_free(s, false);
 }
 
-static void machine_numa_validate(MachineState *machine)
+static void machine_numa_finish_init(MachineState *machine)
 {
     int i;
+    bool default_mapping;
     GString *s = g_string_new(NULL);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     assert(nb_numa_nodes);
     for (i = 0; i < possible_cpus->len; i++) {
+        if (possible_cpus->cpus[i].props.has_node_id) {
+            break;
+        }
+    }
+    default_mapping = (i == possible_cpus->len);
+
+    for (i = 0; i < possible_cpus->len; i++) {
         const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
 
-        /* at this point numa mappings are initilized by CLI options
-         * or with default mappings so it's sufficient to list
-         * all not yet mapped CPUs here */
-        /* TODO: make it hard error in future */
         if (!cpu_slot->props.has_node_id) {
-            char *cpu_str = cpu_slot_to_string(cpu_slot);
-            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
-                                   cpu_str);
-            g_free(cpu_str);
+            if (default_mapping) {
+                /* fetch default mapping from board and enable it */
+                CpuInstanceProperties props = cpu_slot->props;
+                props.has_node_id = true;
+                machine_set_cpu_numa_node(machine, &props, &error_fatal);
+            } else {
+                /* record slots with not set mapping,
+                 * TODO: make it hard error in future */
+                char *cpu_str = cpu_slot_to_string(cpu_slot);
+                g_string_append_printf(s, "%sCPU %d [%s]",
+                                       s->len ? ", " : "", i, cpu_str);
+                g_free(cpu_str);
+            }
         }
     }
     if (s->len) {
@@ -737,7 +750,7 @@ void machine_run_board_init(MachineState *machine)
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
 
     if (nb_numa_nodes) {
-        machine_numa_validate(machine);
+        machine_numa_finish_init(machine);
     }
     machine_class->init(machine);
 }
diff --git a/numa.c b/numa.c
index 723f5f8..e30702e 100644
--- a/numa.c
+++ b/numa.c
@@ -427,7 +427,6 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 void parse_numa_opts(MachineState *ms)
 {
     int i;
-    const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
@@ -485,31 +484,6 @@ void parse_numa_opts(MachineState *ms)
 
         numa_set_mem_ranges();
 
-        /* assign CPUs to nodes using board provided default mapping */
-        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
-            error_report("default CPUs to NUMA node mapping isn't supported");
-            exit(1);
-        }
-
-        possible_cpus = mc->possible_cpu_arch_ids(ms);
-        for (i = 0; i < possible_cpus->len; i++) {
-            if (possible_cpus->cpus[i].props.has_node_id) {
-                break;
-            }
-        }
-
-        /* no CPUs are assigned to NUMA nodes */
-        if (i == possible_cpus->len) {
-            for (i = 0; i < max_cpus; i++) {
-                CpuInstanceProperties props;
-                /* fetch default mapping from board and enable it */
-                props = mc->cpu_index_to_instance_props(ms, i);
-                props.has_node_id = true;
-
-                machine_set_cpu_numa_node(ms, &props, &error_fatal);
-            }
-        }
-
         /* QEMU needs at least all unique node pair distances to build
          * the whole NUMA distance table. QEMU treats the distance table
          * as symmetric by default, i.e. distance A->B == distance B->A.
-- 
2.7.4

