Received: by 10.25.0.6 with SMTP id 6csp730800lfa;
        Thu, 1 Jun 2017 03:53:46 -0700 (PDT)
X-Received: by 10.200.9.76 with SMTP id z12mr960918qth.102.1496314426716;
        Thu, 01 Jun 2017 03:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496314426; cv=none;
        d=google.com; s=arc-20160816;
        b=nodgxVTgqAHnd8tYNWNHmqBo8hbxX9XtKlBFjotT7k8oyeTNv2DKlw4vuBSIR3ZSB1
         d27KCPlka0sRvxvgUnLsh0SmXgrGQDhzFDQ/3bB8E3un14F+/5dUsLP0+XxDTXXDzbJp
         CfJ8zFzYt6zUiI6qT/ETxrgjDKjMAzYDavh4XHIEGflj/lULNsZSpe73qGabx57C/61B
         ITbUxLR58NOmrK+EJrRJ+2WwbzIlmelwn4sWL8I/i3hu+DCMG/E4AznUkIDbnU8hB8r6
         VCiQRKYznBq7Yp+VYMUbsjxDraGDRDxxJSZJX6PsBUnDk6/mzWi0+LQwXPCqrddrsVc+
         yYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=P8mMGeGP0WqakhG44EkfQhjC4BIYboAqZSxz4gA/Fio=;
        b=vTRhgoMjULdT54SZNs1ZskdEB7vDmnjljJzE/9QNs5wSwwzLKQSK/KZqEwUr03V8SF
         kP6MjfRKoSw+MG0YWlHv50g0F/46OQ/npC2KRS2nZiQ0W1VHENRSQ/hSyOBysY0cwrlY
         N+XSNvPfVf3dYk3zPLfCRruG3IEFb23G6SMOKyNFDiHSRijw9rubkEoHJ6v2TH6gIsMi
         hRu6C+BwiA9AaelVct3rq0mr0HFyLzZoFaMTmhdPFGaYsUj40UJ8BMVbxVe/YRkgJxtz
         LcHolyUD0fHHGef8OzD/Bok+EgBan0u8UjF/JhjTN9lioKgF+Bux4I46TLlbrEevFk2M
         fxeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si19586663qtc.85.2017.06.01.03.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 03:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGNjc-0003JW-04
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 06:53:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dGNjW-0003HF-9Q
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 06:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dGNjT-0005mH-0u
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 06:53:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dGNjS-0005m4-MU; Thu, 01 Jun 2017 06:53:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E63EC804EB;
	Thu,  1 Jun 2017 10:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E63EC804EB
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E63EC804EB
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3FA118835;
	Thu,  1 Jun 2017 10:53:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Jun 2017 12:53:28 +0200
Message-Id: <1496314408-163972-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <20170531133201.GS32274@thinpad.lan.raisama.net>
References: <20170531133201.GS32274@thinpad.lan.raisama.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 01 Jun 2017 10:53:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 7/7] numa: cpu: calculate/set default node-ids
 after all -numa CLI options are parsed
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
X-TUID: fDXY8QFSXb+v

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
v4:
  (Eduardo)
    - drop most of asserts
    - document agrguments of get_default_cpu_node_id() callback

CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Andrew Jones <drjones@redhat.com>

---
 include/hw/boards.h |  4 ++++
 hw/arm/virt.c       | 14 ++++++--------
 hw/core/machine.c   |  1 +
 hw/i386/pc.c        | 20 +++++++++++---------
 hw/ppc/spapr.c      | 15 ++++++---------
 5 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 76ce021..ea17f84 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -94,6 +94,9 @@ typedef struct {
  *    Returns an array of @CPUArchId architecture-dependent CPU IDs
  *    which includes CPU IDs for present and possible to hotplug CPUs.
  *    Caller is responsible for freeing returned list.
+ * @get_default_cpu_node_id:
+ *    returns default board specific node_id value for CPU slot specified by
+ *    index @idx in @ms->possible_cpus[]
  * @has_hotpluggable_cpus:
  *    If true, board supports CPUs creation with -device/device_add.
  * @minimum_page_bits:
@@ -151,6 +154,7 @@ struct MachineClass {
     CpuInstanceProperties (*cpu_index_to_instance_props)(MachineState *machine,
                                                          unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
+    int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
 };
 
 /**
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce676df..63a644b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1553,6 +1553,11 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
     return possible_cpus->cpus[cpu_index].props;
 }
 
+static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    return idx % nb_numa_nodes;
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
@@ -1571,14 +1576,6 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
@@ -1601,6 +1598,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
index 84f0a6f..39f8e14 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2253,6 +2253,16 @@ pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
     return possible_cpus->cpus[cpu_index].props;
 }
 
+static int64_t pc_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+   X86CPUTopoInfo topo;
+
+   assert(idx < ms->possible_cpus->len);
+   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
+                            smp_cores, smp_threads, &topo);
+   return topo.pkg_id % nb_numa_nodes;
+}
+
 static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
@@ -2282,15 +2292,6 @@ static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
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
@@ -2335,6 +2336,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->linuxboot_dma_enabled = true;
     mc->get_hotplug_handler = pc_get_hotpug_handler;
     mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
+    mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 96a2a74..1393b8d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3002,6 +3002,11 @@ spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
     return core_slot->props;
 }
 
+static int64_t spapr_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    return idx / smp_cores % nb_numa_nodes;
+}
+
 static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
 {
     int i;
@@ -3026,15 +3031,6 @@ static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
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
@@ -3160,6 +3156,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     hc->plug = spapr_machine_device_plug;
     hc->unplug = spapr_machine_device_unplug;
     mc->cpu_index_to_instance_props = spapr_cpu_index_to_props;
+    mc->get_default_cpu_node_id = spapr_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = spapr_possible_cpu_arch_ids;
     hc->unplug_request = spapr_machine_device_unplug_request;
 
-- 
2.7.4

