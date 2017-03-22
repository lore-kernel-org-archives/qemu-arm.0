Received: by 10.25.15.230 with SMTP id 99csp256701lfp;
        Wed, 22 Mar 2017 06:33:06 -0700 (PDT)
X-Received: by 10.200.37.13 with SMTP id 13mr35787928qtm.209.1490189586733;
        Wed, 22 Mar 2017 06:33:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si1095194qkf.178.2017.03.22.06.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgNu-0006wx-87
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:33:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNo-0006uR-K5
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNn-0001iH-JB
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:33:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgNn-0001i4-AI; Wed, 22 Mar 2017 09:32:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4930B43A42;
	Wed, 22 Mar 2017 13:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4930B43A42
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4930B43A42
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 489C96046C;
	Wed, 22 Mar 2017 13:32:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:28 +0100
Message-Id: <1490189568-167621-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 22 Mar 2017 13:32:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 03/23] hw/arm/virt: use
 machine->possible_cpus for storing possible topology info
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
X-TUID: Y3XXZtrZqma6

for now precalculate and store mp_afinity in possible_cpus
as ARM cpus don't have socket/core/thread-id properties yet.
In follow patches possible_cpus will be used for storing
and setting NUMA node mapping and replace legacy bitmap
based numa_info[node_id].node_cpu/numa_get_node_for_cpu()

For the lack of better idea, this patch cannibalizes
possible_cpus.cpus[x].props.thread_id so that
*_cpu_index_to_props() callback could return addressable
by props CPU which will used by machine_set_cpu_numa_node()
in follow up patches to assign a CPU to node. But
cannibalizing is fine for now as that thread_id isn't exposed
to users (no hotpluggable_cpus callback support for ARM yet)
and it will be used only internally until 'device_add cpu'
is supported where we can decide on which properties to use.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 484754e..4de46b1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1237,6 +1237,7 @@ static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
@@ -1360,10 +1361,16 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj = object_new(typename);
+    mc->possible_cpu_arch_ids(machine);
+    for (n = 0; n < machine->possible_cpus->len; n++) {
+        Object *cpuobj;
 
-        object_property_set_int(cpuobj, virt_idx2mp_affinity(vms, n),
+        if (n >= smp_cpus) {
+            break;
+        }
+
+        cpuobj = object_new(typename);
+        object_property_set_int(cpuobj, machine->possible_cpus->cpus[n].arch_id,
                                 "mp-affinity", NULL);
 
         if (!vms->secure) {
@@ -1543,6 +1550,31 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
+{
+    int n;
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+
+    if (ms->possible_cpus) {
+        assert(ms->possible_cpus->len == max_cpus);
+        return ms->possible_cpus;
+    }
+
+    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
+                                  sizeof(CPUArchId) * max_cpus);
+    ms->possible_cpus->len = max_cpus;
+    for (n = 0; n < ms->possible_cpus->len; n++) {
+        ms->possible_cpus->cpus[n].arch_id =
+            virt_idx2mp_affinity(vms, n);
+        ms->possible_cpus->cpus[n].props.has_thread_id = true;
+        ms->possible_cpus->cpus[n].props.thread_id = n;
+
+        /* TODO: add 'has_node/node' here to describe
+           to which node core belongs */
+    }
+    return ms->possible_cpus;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1559,6 +1591,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->pci_allow_0_address = true;
     /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
     mc->minimum_page_bits = 12;
+    mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.7.4

