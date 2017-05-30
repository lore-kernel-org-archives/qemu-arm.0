Received: by 10.25.0.6 with SMTP id 6csp1895952lfa;
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
X-Received: by 10.200.45.49 with SMTP id n46mr24100272qta.15.1496161648130;
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161648; cv=none;
        d=google.com; s=arc-20160816;
        b=PKwJTp6krw2iGBSiY/+O3Ozo/xGySBKaXhA5c+FWH7ddGuGNLtM9vUwYFrqsnZsyW4
         fecU+nTv4Bm8dwYCBBY5Cu7TozhfgC1eV+NvMpZXAdUoNfIWJMtkQXw/naqjPBtyMX8q
         rYZPpzh2JkSw9ILlQwB5gWXlGuVSLN9L3//1DoJC5oaZa4yCzs8sAKFfyTlAdWEMkA3N
         Odb3bNaDUDvcQX+krb6UOqQmXvlyQmCLh2HBQ1+NG65jvk0khdZSC38QZ4vdY7DngCwy
         RpA9HN89nvxB3W7dvSibET+FJxKZecZ1Tk9YLxBvIlPWOnUjUt3rbXV5UoaEY7lpWyMi
         zbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=JuTWJump/jPmfymlgkj3DRN6vPLCxkr2Fh+7ZUMeKyQ=;
        b=h38jdeJmd36VLbOA6V7uu1pbCTujv+7alLpbp1XUdjy1wkX4RY0hIi2TlOCpZjULfo
         mMrCjetKV30jwrLcxula4o51UqXWsyGDWvqWab0kGyaG8BBOwNTZHxSjdnzvXcNgBLoP
         bgk8+a9W91TinF2qV0iYmMWRyuU3bf8LTtDa1fZWO+xR4lTW8TWcPixLhnjaoSkpMWni
         wevA56AC3fSMHOuBPsbBt3aa8WrUBXxhQSWfp8gt4TQcGreSBLGF3HE290ArKbwNEDXZ
         RJflaQsrO0uSF7WbFWSQFV5VTzm0os8QZyXxUk3OzsU3/gJ42GjzELIQmrIocyVAFLfu
         l3CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si13130529qtc.277.2017.05.30.09.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjzT-0008O1-GS
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:27:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwf-0006Ez-Al
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwd-0005Cu-Qp
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:24:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFjwY-0005Ah-HM; Tue, 30 May 2017 12:24:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75D2280F75;
	Tue, 30 May 2017 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 75D2280F75
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 75D2280F75
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFF48171A0;
	Tue, 30 May 2017 16:24:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 May 2017 18:24:02 +0200
Message-Id: <1496161442-96665-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 30 May 2017 16:24:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 7/7] numa: cpu: calculate/set default
 node-ids after all -numa CLI options are parsed
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IpGnokDW2jwN

Calculating default node-ids for CPUs in possible_cpu_arch_ids()
is rather fragile since defaults calculation uses nb_numa_nodes but
callback might be potentially called early before all -numa CLI
options are parsed, which would lead to cpus assigned only upto
nb_numa_nodes at the time possible_cpu_arch_ids() is called.

Issue was introduced by
(7c88e65 numa: mirror cpu to node mapping in MachineState::possible_cpus)
and for example CLI:
  -smp 4 -numa node,cpus=0 -numa node
would set props.node-id in possible_cpus array for every non
explicitly mapped CPU to the first node.

Issue is not visible to guest nor to mgmt interface due to
  1) implictly mapped cpus are forced to the first node in
     case of partial mapping
  2) in case of default mapping possible_cpu_arch_ids() is
     called after all -numa options are parsed (resulting
     in correct mapping).

However it's fragile to rely on late execution of
possible_cpu_arch_ids(), therefore add machine specific
callback that returns node-id for CPU and use it to calculate/
set defaults at machine_numa_finish_init() time when all -numa
options are parsed.

Reported-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/boards.h   |  3 +++
 include/sysemu/numa.h |  9 +++++++++
 hw/arm/virt.c         | 16 ++++++++--------
 hw/core/machine.c     |  1 +
 hw/i386/pc.c          | 21 ++++++++++++---------
 hw/ppc/spapr.c        | 16 +++++++---------
 6 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 76ce021..063f329 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -94,6 +94,8 @@ typedef struct {
  *    Returns an array of @CPUArchId architecture-dependent CPU IDs
  *    which includes CPU IDs for present and possible to hotplug CPUs.
  *    Caller is responsible for freeing returned list.
+ * @get_default_cpu_node_id:
+ *    returns default board specific node_id value for CPU
  * @has_hotpluggable_cpus:
  *    If true, board supports CPUs creation with -device/device_add.
  * @minimum_page_bits:
@@ -151,6 +153,7 @@ struct MachineClass {
     CpuInstanceProperties (*cpu_index_to_instance_props)(MachineState *machine,
                                                          unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
+    int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
 };
 
 /**
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 610eece..ea123ef 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -36,4 +36,13 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                   int nb_nodes, ram_addr_t size);
 void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);
+
+static inline void assert_nb_numa_nodes_change(void)
+{
+    static int saved_nb_numa_nodes;
+    assert(nb_numa_nodes);
+    assert(saved_nb_numa_nodes == 0 || saved_nb_numa_nodes == nb_numa_nodes);
+    saved_nb_numa_nodes = nb_numa_nodes;
+}
+
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce676df..74f1453 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1553,6 +1553,13 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
     return possible_cpus->cpus[cpu_index].props;
 }
 
+static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    assert(nb_numa_nodes);
+    assert_nb_numa_nodes_change();
+    return idx % nb_numa_nodes;
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
@@ -1571,14 +1578,6 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
             virt_cpu_mp_affinity(vms, n);
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id = n;
-
-        /* default distribution of CPUs over NUMA nodes */
-        if (nb_numa_nodes) {
-            /* preset values but do not enable them i.e. 'has_node_id = false',
-             * numa init code will enable them later if manual mapping wasn't
-             * present on CLI */
-            ms->possible_cpus->cpus[n].props.node_id = n % nb_numa_nodes;
-        }
     }
     return ms->possible_cpus;
 }
@@ -1601,6 +1600,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+    mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 964b75d..01028c8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -723,6 +723,7 @@ static void machine_numa_finish_init(MachineState *machine)
             /* fetch default mapping from board and enable it */
             CpuInstanceProperties props = cpu_slot->props;
 
+            props.node_id = mc->get_default_cpu_node_id(machine, i);
             if (!default_mapping) {
                 /* record slots with not set mapping,
                  * TODO: make it hard error in future */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 84f0a6f..51d5a1b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2253,6 +2253,17 @@ pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
     return possible_cpus->cpus[cpu_index].props;
 }
 
+static int64_t pc_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+   X86CPUTopoInfo topo;
+
+   assert_nb_numa_nodes_change();
+   assert(ms->possible_cpus && (idx < ms->possible_cpus->len));
+   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
+                            smp_cores, smp_threads, &topo);
+   return topo.pkg_id % nb_numa_nodes;
+}
+
 static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
@@ -2282,15 +2293,6 @@ static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[i].props.core_id = topo.core_id;
         ms->possible_cpus->cpus[i].props.has_thread_id = true;
         ms->possible_cpus->cpus[i].props.thread_id = topo.smt_id;
-
-        /* default distribution of CPUs over NUMA nodes */
-        if (nb_numa_nodes) {
-            /* preset values but do not enable them i.e. 'has_node_id = false',
-             * numa init code will enable them later if manual mapping wasn't
-             * present on CLI */
-            ms->possible_cpus->cpus[i].props.node_id =
-                topo.pkg_id % nb_numa_nodes;
-        }
     }
     return ms->possible_cpus;
 }
@@ -2335,6 +2337,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->linuxboot_dma_enabled = true;
     mc->get_hotplug_handler = pc_get_hotpug_handler;
     mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
+    mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 96a2a74..06d0fb3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3002,6 +3002,12 @@ spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
     return core_slot->props;
 }
 
+static int64_t spapr_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    assert_nb_numa_nodes_change();
+    return idx / smp_cores % nb_numa_nodes;
+}
+
 static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
 {
     int i;
@@ -3026,15 +3032,6 @@ static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
         machine->possible_cpus->cpus[i].arch_id = core_id;
         machine->possible_cpus->cpus[i].props.has_core_id = true;
         machine->possible_cpus->cpus[i].props.core_id = core_id;
-
-        /* default distribution of CPUs over NUMA nodes */
-        if (nb_numa_nodes) {
-            /* preset values but do not enable them i.e. 'has_node_id = false',
-             * numa init code will enable them later if manual mapping wasn't
-             * present on CLI */
-            machine->possible_cpus->cpus[i].props.node_id =
-                core_id / smp_threads / smp_cores % nb_numa_nodes;
-        }
     }
     return machine->possible_cpus;
 }
@@ -3160,6 +3157,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = spapr_machine_device_plug;
     hc->unplug = spapr_machine_device_unplug;
     mc->cpu_index_to_instance_props = spapr_cpu_index_to_props;
+    mc->get_default_cpu_node_id = spapr_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = spapr_possible_cpu_arch_ids;
     hc->unplug_request = spapr_machine_device_unplug_request;
 
-- 
2.7.4

