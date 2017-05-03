Received: by 10.25.0.198 with SMTP id 189csp86305lfa;
        Wed, 3 May 2017 06:01:00 -0700 (PDT)
X-Received: by 10.55.111.67 with SMTP id k64mr2745661qkc.56.1493816460847;
        Wed, 03 May 2017 06:01:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m65si1675367qkb.227.2017.05.03.06.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tts-0002Wt-8f
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:01:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqd-000837-F5
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqb-0000d2-Tb
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tqb-0000c9-Kw; Wed, 03 May 2017 08:57:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 714F68046A;
	Wed,  3 May 2017 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 714F68046A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 714F68046A
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EF0117C5A;
	Wed,  3 May 2017 12:57:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:56:59 +0200
Message-Id: <1493816238-33120-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 03 May 2017 12:57:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 05/24] numa: move source of default CPUs to
 NUMA node mapping into boards
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
X-TUID: zXyXFq7y989V

Originally CPU threads were by default assigned in
round-robin fashion. However it was causing issues in
guest since CPU threads from the same socket/core could
be placed on different NUMA nodes.
Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
fixed it by grouping threads within a socket on the same node
introducing cpu_index_to_socket_id() callback and commit
20bb648d (spapr: Fix default NUMA node allocation for threads)
reused callback to fix similar issues for SPAPR machine
even though socket doesn't make much sense there.

As result QEMU ended up having 3 default distribution rules
used by 3 targets /virt-arm, spapr, pc/.

In effort of moving NUMA mapping for CPUs into possible_cpus,
generalize default mapping in numa.c by making boards decide
on default mapping and let them explicitly tell generic
numa code to which node a CPU thread belongs to by replacing
cpu_index_to_socket_id() with @cpu_index_to_instance_props()
which provides default node_id assigned by board to specified
cpu_index.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
Patch only moves source of default mapping to possible_cpus[]
and leaves the rest of NUMA handling to numa_info[node_id].node_cpu
bitmaps. It's up to follow up patches to replace bitmaps
with possible_cpus[] internally.

v3:
  - drop duplicate ';' (Drew)
v2:
  - use cpu_index instead of core_id directly in spapr_cpu_index_to_props()
       (David Gibson)
  - ammend comment message s/board/numa init code/
       (David Gibson)
---
 include/hw/boards.h   |  8 ++++++--
 include/sysemu/numa.h |  2 +-
 hw/arm/virt.c         | 20 ++++++++++++++++++--
 hw/i386/pc.c          | 23 +++++++++++++++++------
 hw/ppc/spapr.c        | 27 ++++++++++++++++++++-------
 numa.c                | 15 +++++++++------
 vl.c                  |  2 +-
 7 files changed, 72 insertions(+), 25 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 31d9c72..5d6af21 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -74,7 +74,10 @@ typedef struct {
  *    of HotplugHandler object, which handles hotplug operation
  *    for a given @dev. It may return NULL if @dev doesn't require
  *    any actions to be performed by hotplug handler.
- * @cpu_index_to_socket_id:
+ * @cpu_index_to_instance_props:
+ *    used to provide @cpu_index to socket/core/thread number mapping, allowing
+ *    legacy code to perform maping from cpu_index to topology properties
+ *    Returns: tuple of socket/core/thread ids given cpu_index belongs to.
  *    used to provide @cpu_index to socket number mapping, allowing
  *    a machine to group CPU threads belonging to the same socket/package
  *    Returns: socket number given cpu_index belongs to.
@@ -139,7 +142,8 @@ struct MachineClass {
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
-    unsigned (*cpu_index_to_socket_id)(unsigned cpu_index);
+    CpuInstanceProperties (*cpu_index_to_instance_props)(MachineState *machine,
+                                                         unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
 };
 
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 8f09dcf..46ea6c7 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -24,7 +24,7 @@ typedef struct node_info {
 } NodeInfo;
 
 extern NodeInfo numa_info[MAX_NODES];
-void parse_numa_opts(MachineClass *mc);
+void parse_numa_opts(MachineState *ms);
 void numa_post_machine_init(void);
 void query_numa_node_mem(uint64_t node_mem[]);
 extern QemuOptsList qemu_numa_opts;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acc748e..3e19b5f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1539,6 +1539,16 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static CpuInstanceProperties
+virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+
+    assert(cpu_index < possible_cpus->len);
+    return possible_cpus->cpus[cpu_index].props;;
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
@@ -1558,8 +1568,13 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id = n;
 
-        /* TODO: add 'has_node/node' here to describe
-           to which node core belongs */
+        /* default distribution of CPUs over NUMA nodes */
+        if (nb_numa_nodes) {
+            /* preset values but do not enable them i.e. 'has_node_id = false',
+             * numa init code will enable them later if manual mapping wasn't
+             * present on CLI */
+            ms->possible_cpus->cpus[n].props.node_id = n % nb_numa_nodes;
+        }
     }
     return ms->possible_cpus;
 }
@@ -1581,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
+    mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f3b372a..9cec0c1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2243,12 +2243,14 @@ static void pc_machine_reset(void)
     }
 }
 
-static unsigned pc_cpu_index_to_socket_id(unsigned cpu_index)
+static CpuInstanceProperties
+pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
-    X86CPUTopoInfo topo;
-    x86_topo_ids_from_idx(smp_cores, smp_threads, cpu_index,
-                          &topo);
-    return topo.pkg_id;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+
+    assert(cpu_index < possible_cpus->len);
+    return possible_cpus->cpus[cpu_index].props;;
 }
 
 static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
@@ -2280,6 +2282,15 @@ static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[i].props.core_id = topo.core_id;
         ms->possible_cpus->cpus[i].props.has_thread_id = true;
         ms->possible_cpus->cpus[i].props.thread_id = topo.smt_id;
+
+        /* default distribution of CPUs over NUMA nodes */
+        if (nb_numa_nodes) {
+            /* preset values but do not enable them i.e. 'has_node_id = false',
+             * numa init code will enable them later if manual mapping wasn't
+             * present on CLI */
+            ms->possible_cpus->cpus[i].props.node_id =
+                topo.pkg_id % nb_numa_nodes;
+        }
     }
     return ms->possible_cpus;
 }
@@ -2322,7 +2333,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->save_tsc_khz = true;
     mc->get_hotplug_handler = pc_get_hotpug_handler;
-    mc->cpu_index_to_socket_id = pc_cpu_index_to_socket_id;
+    mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
     mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 80d12d0..33405a0 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2981,11 +2981,17 @@ static HotplugHandler *spapr_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
-static unsigned spapr_cpu_index_to_socket_id(unsigned cpu_index)
+static CpuInstanceProperties
+spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
 {
-    /* Allocate to NUMA nodes on a "socket" basis (not that concept of
-     * socket means much for the paravirtualized PAPR platform) */
-    return cpu_index / smp_threads / smp_cores;
+    CPUArchId *core_slot;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    /* make sure possible_cpu are intialized */
+    mc->possible_cpu_arch_ids(machine);
+    core_slot = spapr_find_cpu_slot(machine, cpu_index, NULL);
+    assert(core_slot);
+    return core_slot->props;
 }
 
 static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
@@ -3012,8 +3018,15 @@ static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
         machine->possible_cpus->cpus[i].arch_id = core_id;
         machine->possible_cpus->cpus[i].props.has_core_id = true;
         machine->possible_cpus->cpus[i].props.core_id = core_id;
-        /* TODO: add 'has_node/node' here to describe
-           to which node core belongs */
+
+        /* default distribution of CPUs over NUMA nodes */
+        if (nb_numa_nodes) {
+            /* preset values but do not enable them i.e. 'has_node_id = false',
+             * numa init code will enable them later if manual mapping wasn't
+             * present on CLI */
+            machine->possible_cpus->cpus[i].props.node_id =
+                core_id / smp_threads / smp_cores % nb_numa_nodes;
+        }
     }
     return machine->possible_cpus;
 }
@@ -3138,7 +3151,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     hc->pre_plug = spapr_machine_device_pre_plug;
     hc->plug = spapr_machine_device_plug;
     hc->unplug = spapr_machine_device_unplug;
-    mc->cpu_index_to_socket_id = spapr_cpu_index_to_socket_id;
+    mc->cpu_index_to_instance_props = spapr_cpu_index_to_props;
     mc->possible_cpu_arch_ids = spapr_possible_cpu_arch_ids;
     hc->unplug_request = spapr_machine_device_unplug_request;
 
diff --git a/numa.c b/numa.c
index 6fc2393..ab1661d 100644
--- a/numa.c
+++ b/numa.c
@@ -294,9 +294,10 @@ static void validate_numa_cpus(void)
     g_free(seen_cpus);
 }
 
-void parse_numa_opts(MachineClass *mc)
+void parse_numa_opts(MachineState *ms)
 {
     int i;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     for (i = 0; i < MAX_NODES; i++) {
         numa_info[i].node_cpu = bitmap_new(max_cpus);
@@ -378,14 +379,16 @@ void parse_numa_opts(MachineClass *mc)
          * rule grouping VCPUs by socket so that VCPUs from the same socket
          * would be on the same node.
          */
+        if (!mc->cpu_index_to_instance_props) {
+            error_report("default CPUs to NUMA node mapping isn't supported");
+            exit(1);
+        }
         if (i == nb_numa_nodes) {
             for (i = 0; i < max_cpus; i++) {
-                unsigned node_id = i % nb_numa_nodes;
-                if (mc->cpu_index_to_socket_id) {
-                    node_id = mc->cpu_index_to_socket_id(i) % nb_numa_nodes;
-                }
+                CpuInstanceProperties props;
+                props = mc->cpu_index_to_instance_props(ms, i);
 
-                set_bit(i, numa_info[node_id].node_cpu);
+                set_bit(i, numa_info[props.node_id].node_cpu);
             }
         }
 
diff --git a/vl.c b/vl.c
index f46e070..c63f4d5 100644
--- a/vl.c
+++ b/vl.c
@@ -4506,7 +4506,7 @@ int main(int argc, char **argv, char **envp)
     default_drive(default_floppy, snapshot, IF_FLOPPY, 0, FD_OPTS);
     default_drive(default_sdcard, snapshot, IF_SD, 0, SD_OPTS);
 
-    parse_numa_opts(machine_class);
+    parse_numa_opts(current_machine);
 
     if (qemu_opts_foreach(qemu_find_opts("mon"),
                           mon_init_func, NULL, NULL)) {
-- 
2.7.4

