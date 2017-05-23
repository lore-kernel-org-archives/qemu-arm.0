Received: by 10.103.124.15 with SMTP id x15csp1866211vsc;
        Tue, 23 May 2017 07:42:00 -0700 (PDT)
X-Received: by 10.200.44.36 with SMTP id d33mr29446343qta.19.1495550520463;
        Tue, 23 May 2017 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550520; cv=none;
        d=google.com; s=arc-20160816;
        b=iCddceYhI1Hu55dlaAkUmQNk9UV7Aeu4ejwFFwzk9+hW0ME7LX/jMKhmBxerWCbJhO
         wC0kZwdJsJireX/XrTJRKHl+8RcZpSdgo5lNKxBoD4Ko6Eq7arytTg3fvnvMeOCgEUcF
         2JOUfo1bOC6q0Tx4+MtYqpCFJDsSUg3u989djDCQdkUf1FvlPAhozK01PXTDtjXh8jyT
         DOM4xSWyDGb5u3gvZPTcaQen3CcmlOUNLoW3AvoTQiGU/6t7UKIQD0RGmswF2uk48ne5
         4qCEKaVPXG5ixQZfHO1N5lv9KAZoEQ3DU1m1Pxs1A6CbvT1qK2sXgx8yc0StfWwtlb1/
         dUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=0vVFqbmvBZjRhCm+RxRusMIb4kvROQukWeY2Q6lOKMM=;
        b=YD1kwXHdhL7sXCzEPsLHPvRAzQIVKsizfIyTSlh5pG5bCUBpguNsuYQD3vKct0y1aB
         UpKo0+NGyIKMC4XBONTEDzXRQrCfLkWVLjAZvnUIqpKfOVLK5MjPugRBYTprJiy4x09x
         hHeujpxou48aGshOXkuqaTMnAjarSiX+DZN4xuaWA2V2mT5TZPCntzpE9sZCawvDInXv
         h9PsJoe2Xjyf95Z3GGs72mqghM7QY1Piy/+a71giWDnXXezwL6LUf1opMkJVBWtmL5Wm
         /fH0B5EtFWavGP9dqF8w59Kcs6Jb+4svB9AiUrlFD19ukXo1NZ5UG8opv6FgJdxMZK5C
         pc7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h76si21610679qke.194.2017.05.23.07.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDB0Z-0002RL-Re
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:41:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxk-0008Mm-0x
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxi-0002fw-LE
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxi-0002f9-CF; Tue, 23 May 2017 10:39:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DACFC057EC9;
	Tue, 23 May 2017 14:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DACFC057EC9
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4DACFC057EC9
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01EEF7814F;
	Tue, 23 May 2017 14:38:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:50 +0200
Message-Id: <1495550330-34087-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 May 2017 14:39:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/5] numa: move numa_node from CPUState into
 target specific classes
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
X-TUID: +smJR++oTyqK

Move vcpu's assocciated numa_node field out of generic CPUState
into inherited classes that actually care about cpu<->numa mapping,
i.e: ARMCPU, PowerPCCPU, X86CPU.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/qom/cpu.h       |  2 --
 target/arm/cpu.h        |  2 ++
 target/i386/cpu.h       |  1 +
 target/ppc/cpu.h        |  1 +
 hw/ppc/spapr.c          | 24 +++++++++++-------------
 hw/ppc/spapr_cpu_core.c |  4 +++-
 monitor.c               | 11 +++++++----
 target/arm/cpu.c        |  2 +-
 target/i386/cpu.c       |  2 +-
 9 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 55214ce..89ddb68 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -265,7 +265,6 @@ struct qemu_work_item;
  * @cpu_index: CPU index (informative).
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
- * @numa_node: NUMA node this CPU is belonging to.
  * @host_tid: Host thread ID.
  * @running: #true if CPU is currently running (lockless).
  * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
@@ -314,7 +313,6 @@ struct CPUState {
 
     int nr_cores;
     int nr_threads;
-    int numa_node;
 
     struct QemuThread *thread;
 #ifdef _WIN32
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 048faed..5ffc9d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -703,6 +703,8 @@ struct ARMCPU {
 
     ARMELChangeHook *el_change_hook;
     void *el_change_hook_opaque;
+
+    int32_t node_id; /* NUMA node this CPU is belonging to */
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c4602ca..00f35a0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1278,6 +1278,7 @@ struct X86CPU {
     int32_t socket_id;
     int32_t core_id;
     int32_t thread_id;
+    int32_t node_id; /* NUMA node this CPU is belonging to */
 };
 
 static inline X86CPU *x86_env_get_cpu(CPUX86State *env)
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 401e10e..31c052d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1205,6 +1205,7 @@ struct PowerPCCPU {
     uint32_t compat_pvr;
     PPCVirtualHypervisor *vhyp;
     Object *intc;
+    int32_t node_id; /* NUMA node this CPU is belonging to */
 
     /* Fields related to migration compatibility hacks */
     bool pre_2_8_migration;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c7fee8b..96a2a74 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -178,25 +178,19 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
     return ret;
 }
 
-static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, CPUState *cs)
+static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, PowerPCCPU *cpu)
 {
-    int ret = 0;
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
     int index = ppc_get_vcpu_dt_id(cpu);
     uint32_t associativity[] = {cpu_to_be32(0x5),
                                 cpu_to_be32(0x0),
                                 cpu_to_be32(0x0),
                                 cpu_to_be32(0x0),
-                                cpu_to_be32(cs->numa_node),
+                                cpu_to_be32(cpu->node_id),
                                 cpu_to_be32(index)};
 
     /* Advertise NUMA via ibm,associativity */
-    if (nb_numa_nodes > 1) {
-        ret = fdt_setprop(fdt, offset, "ibm,associativity", associativity,
+    return fdt_setprop(fdt, offset, "ibm,associativity", associativity,
                           sizeof(associativity));
-    }
-
-    return ret;
 }
 
 /* Populate the "ibm,pa-features" property */
@@ -321,9 +315,11 @@ static int spapr_fixup_cpu_dt(void *fdt, sPAPRMachineState *spapr)
             return ret;
         }
 
-        ret = spapr_fixup_cpu_numa_dt(fdt, offset, cs);
-        if (ret < 0) {
-            return ret;
+        if (nb_numa_nodes > 1) {
+            ret = spapr_fixup_cpu_numa_dt(fdt, offset, cpu);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         ret = spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt);
@@ -538,7 +534,9 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
     _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
                       pft_size_prop, sizeof(pft_size_prop))));
 
-    _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cs));
+    if (nb_numa_nodes > 1) {
+        _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cpu));
+    }
 
     _FDT(spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt));
 
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index a17ea07..60baf02 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -183,15 +183,17 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < cc->nr_threads; i++) {
         char id[32];
         CPUState *cs;
+        PowerPCCPU *cpu;
 
         obj = sc->threads + i * size;
 
         object_initialize(obj, size, typename);
         cs = CPU(obj);
+        cpu = POWERPC_CPU(cs);
         cs->cpu_index = cc->core_id + i;
 
         /* Set NUMA node for the threads belonged to core  */
-        cs->numa_node = sc->node_id;
+        cpu->node_id = sc->node_id;
 
         snprintf(id, sizeof(id), "thread[%d]", i);
         object_property_add_child(OBJECT(sc), id, obj, &local_err);
diff --git a/monitor.c b/monitor.c
index afbacfe..b053c40 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1697,23 +1697,26 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 static void hmp_info_numa(Monitor *mon, const QDict *qdict)
 {
     int i;
-    CPUState *cpu;
     uint64_t *node_mem;
+    CpuInfoList *cpu_list, *cpu;
 
+    cpu_list = qmp_query_cpus(&error_abort);
     node_mem = g_new0(uint64_t, nb_numa_nodes);
     query_numa_node_mem(node_mem);
     monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
     for (i = 0; i < nb_numa_nodes; i++) {
         monitor_printf(mon, "node %d cpus:", i);
-        CPU_FOREACH(cpu) {
-            if (cpu->numa_node == i) {
-                monitor_printf(mon, " %d", cpu->cpu_index);
+        for (cpu = cpu_list; cpu; cpu = cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+                cpu->value->props->node_id == i) {
+                monitor_printf(mon, " %" PRIi64, cpu->value->CPU);
             }
         }
         monitor_printf(mon, "\n");
         monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
                        node_mem[i] >> 20);
     }
+    qapi_free_CpuInfoList(cpu_list);
     g_free(node_mem);
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c185eb1..09ef3a6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1573,7 +1573,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
-    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a41d595..ffb5267 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3986,7 +3986,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_INT32("core-id", X86CPU, core_id, -1),
     DEFINE_PROP_INT32("socket-id", X86CPU, socket_id, -1),
 #endif
-    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
     { .name  = "hv-spinlocks", .info  = &qdev_prop_spinlocks },
     DEFINE_PROP_BOOL("hv-relaxed", X86CPU, hyperv_relaxed_timing, false),
-- 
2.7.4

