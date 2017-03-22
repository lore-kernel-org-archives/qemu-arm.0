Received: by 10.25.15.230 with SMTP id 99csp258986lfp;
        Wed, 22 Mar 2017 06:38:42 -0700 (PDT)
X-Received: by 10.200.34.38 with SMTP id o35mr37055141qto.226.1490189922667;
        Wed, 22 Mar 2017 06:38:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si659514qki.313.2017.03.22.06.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgTK-0003Ay-31
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgOH-0007L2-Dp
	for qemu-devel@nongnu.org; Wed, 22 Mar 2017 09:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgOG-0001pU-Aj
	for qemu-devel@nongnu.org; Wed, 22 Mar 2017 09:33:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgOB-0001oh-It; Wed, 22 Mar 2017 09:33:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83408C05490E;
	Wed, 22 Mar 2017 13:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 83408C05490E
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 83408C05490E
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA287A5660;
	Wed, 22 Mar 2017 13:33:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:31 +0100
Message-Id: <1490189568-167621-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 Mar 2017 13:33:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-2.10 06/23] spapr: add node-id property to
 sPAPR core
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hyxB9iPw2bXL

it will allow switching from cpu_index to core based numa
mapping in follow up patches.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/ppc/spapr_cpu_core.h |  1 +
 include/qom/cpu.h               |  2 ++
 hw/ppc/spapr.c                  | 17 +++++++++++++++++
 hw/ppc/spapr_cpu_core.c         | 11 ++++++++---
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index 3c35665..93051e9 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -27,6 +27,7 @@ typedef struct sPAPRCPUCore {
 
     /*< public >*/
     void *threads;
+    int node_id;
 } sPAPRCPUCore;
 
 typedef struct sPAPRCPUCoreClass {
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index c3292ef..7f27d56 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -258,6 +258,8 @@ typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
 
 struct qemu_work_item;
 
+#define CPU_UNSET_NUMA_NODE_ID -1
+
 /**
  * CPUState:
  * @cpu_index: CPU index (informative).
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9dcbbcc..9c61721 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2770,9 +2770,11 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
     Error *local_err = NULL;
     CPUCore *cc = CPU_CORE(dev);
+    sPAPRCPUCore *sc = SPAPR_CPU_CORE(dev);
     char *base_core_type = spapr_get_cpu_core_type(machine->cpu_model);
     const char *type = object_get_typename(OBJECT(dev));
     CPUArchId *core_slot;
+    int node_id;
     int index;
 
     if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
@@ -2801,6 +2803,21 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         goto out;
     }
 
+    node_id = numa_get_node_for_cpu(cc->core_id);
+    if (node_id == nb_numa_nodes) {
+        /* by default CPUState::numa_node was 0 if it's not set via CLI
+         * keep it this way for now but in future we probably should
+         * refuse to start up with incomplete numa mapping */
+        node_id = 0;
+    }
+    if (sc->node_id == CPU_UNSET_NUMA_NODE_ID) {
+        sc->node_id = node_id;
+    } else if (sc->node_id != node_id) {
+        error_setg(&local_err, "node-id %d must match numa node specified"
+            "with -numa option for cpu-index %d", sc->node_id, cc->core_id);
+        goto out;
+    }
+
 out:
     g_free(base_core_type);
     error_propagate(errp, local_err);
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 6883f09..25988f8 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -163,7 +163,6 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
     const char *typename = object_class_get_name(scc->cpu_class);
     size_t size = object_type_get_instance_size(typename);
     Error *local_err = NULL;
-    int core_node_id = numa_get_node_for_cpu(cc->core_id);;
     void *obj;
     int i, j;
 
@@ -181,10 +180,10 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
 
         /* Set NUMA node for the added CPUs  */
         node_id = numa_get_node_for_cpu(cs->cpu_index);
-        if (node_id != core_node_id) {
+        if (node_id != sc->node_id) {
             error_setg(&local_err, "Invalid node-id=%d of thread[cpu-index: %d]"
                 " on CPU[core-id: %d, node-id: %d], node-id must be the same",
-                 node_id, cs->cpu_index, cc->core_id, core_node_id);
+                 node_id, cs->cpu_index, cc->core_id, sc->node_id);
             goto err;
         }
         if (node_id < nb_numa_nodes) {
@@ -250,6 +249,11 @@ static const char *spapr_core_models[] = {
     "POWER9_v1.0",
 };
 
+static Property spapr_cpu_core_properties[] = {
+    DEFINE_PROP_INT32("node-id", sPAPRCPUCore, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -257,6 +261,7 @@ void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
 
     dc->realize = spapr_cpu_core_realize;
     dc->unrealize = spapr_cpu_core_unrealizefn;
+    dc->props = spapr_cpu_core_properties;
     scc->cpu_class = cpu_class_by_name(TYPE_POWERPC_CPU, data);
     g_assert(scc->cpu_class);
 }
-- 
2.7.4

