Received: by 10.25.0.6 with SMTP id 6csp1895958lfa;
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
X-Received: by 10.55.20.27 with SMTP id e27mr2592389qkh.202.1496161648652;
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161648; cv=none;
        d=google.com; s=arc-20160816;
        b=CZyzoMDtWBtfbyQfv+Ax2u+WQ0RX3wAlhNYjTRwJVpi5GyhMglp+2tOBrNiKxewAKZ
         UvyZp4EmI9k/Pm1wZS1Ymz3ktLAvxTSzds6adaQ7TjAiKDHKhybxNlMn7QglWoDCuY0O
         ACxExHxh0bD06RhpH4AZlUvolgX6YCC69Hc67x8ARtYcezujpwb8mc99CrxK2gp/6zaJ
         g4e2Jg/m00a7s5xmWCeJii1Z/sgPPdIAinMVnN9AiWEHvDVPceupUzkRVLjUkbWNzJ9w
         LHxY+BuG8ocpI+sFBpgcYe/rTyH1Bz8WTdt1m7Qon9jI2Z6x9fi9Rxr6Djh9q6PvLlzy
         XGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=I9c+g1P5fqJhkrNOvesBkHGm2GSaXd45l8oaPpvIVY8=;
        b=k7RXsLrjOj/QTSIYNyBFVOAyRcdN6vQne90drH8oU2aRhCMGK9c0HV2hssdGErVYqu
         ayEtjhEWWR+j+GMqS4ROrdXEerQq8r7Zg2Vuw5Aylbn/XNCDK0NXgZPq8RjrTWW7Uu1t
         dZOAM3bUp4oLpLv50/pcBg3SWFsKODkRxcD9smk3uyRdaE3DoPrifiedgGaV7qX5XA5A
         Z7p0bTGvCGQpZ+lFYzyOidO0A5c0r+IgjUOudOuaS+ZWVfqni8krN0ipXRiQC+EuKgTE
         ET8OYG+ys33U6BKFrTDBpCsUHL8pWVhQ9VyOBYJj8eLD4xibQ4GFM6mvaSlOXrR7Yw2U
         VgDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s18si13359828qta.121.2017.05.30.09.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjzT-0008OO-VS
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:27:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwV-000619-Pl
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwU-00059Q-Kb
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:24:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFjwQ-00057J-Ip; Tue, 30 May 2017 12:24:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81A4D80B22;
	Tue, 30 May 2017 16:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 81A4D80B22
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 81A4D80B22
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0787D171A0;
	Tue, 30 May 2017 16:24:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 May 2017 18:24:00 +0200
Message-Id: <1496161442-96665-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 May 2017 16:24:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 5/7] numa: move numa_node from CPUState into
 target specific classes
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
X-TUID: yvmRTWBzmAXL

Move vcpu's assocciated numa_node field out of generic CPUState
into inherited classes that actually care about cpu<->numa mapping,
i.e: ARMCPU, PowerPCCPU, X86CPU.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/qom/cpu.h       | 2 --
 target/arm/cpu.h        | 2 ++
 target/i386/cpu.h       | 1 +
 target/ppc/cpu.h        | 1 +
 hw/ppc/spapr.c          | 2 +-
 hw/ppc/spapr_cpu_core.c | 4 +++-
 target/arm/cpu.c        | 2 +-
 target/i386/cpu.c       | 2 +-
 8 files changed, 10 insertions(+), 6 deletions(-)

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
index c4602ca..dec4067 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1275,6 +1275,7 @@ struct X86CPU {
 
     struct kvm_msrs *kvm_msr_buf;
 
+    int32_t node_id; /* NUMA node this CPU is belonging to */
     int32_t socket_id;
     int32_t core_id;
     int32_t thread_id;
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
index c7fee8b..34bb03d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -187,7 +187,7 @@ static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, CPUState *cs)
                                 cpu_to_be32(0x0),
                                 cpu_to_be32(0x0),
                                 cpu_to_be32(0x0),
-                                cpu_to_be32(cs->numa_node),
+                                cpu_to_be32(cpu->node_id),
                                 cpu_to_be32(index)};
 
     /* Advertise NUMA via ibm,associativity */
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

