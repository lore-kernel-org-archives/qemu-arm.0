Received: by 10.103.124.15 with SMTP id x15csp1866424vsc;
        Tue, 23 May 2017 07:42:34 -0700 (PDT)
X-Received: by 10.55.25.131 with SMTP id 3mr24678190qkz.224.1495550554591;
        Tue, 23 May 2017 07:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550554; cv=none;
        d=google.com; s=arc-20160816;
        b=KuX3OiDOyZA+Zpo0RZHgigxlXbChh2Tp5WJrczZhWQtRT5uU8OFlvvS0WEaI0U4gU0
         8Wrjpnr1hn4bn4c1mqirMPr8qhvnEBsx44aAKKaExZ9TOIB5oY85g4ANi+tmRHLRsQN5
         fHQkIT5gE3T7kTDom8RPRwzGskZxFcBiuX/bQpc8l3bAlBUQAY4xwxuxEAGaFghP2Xwd
         cVTiMGQ5CdtdPHzpYvreW5OBPUtmQjkMo1AdEEPxhmQw+C5krsKPbUMmazy3DISV4KCX
         8aIjxsAxACdZSE1e4GVZYMESpjiKiAR9hgedukD8LhIl6FPzlvokbXXTXYe1+HYUTGcp
         AtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=rNukcQX58L8UDQqfbPQXaEQQKGfna12oNSyS9+I07eM=;
        b=NHZXhf3pKZoVyERXSJtvTknMDWubiKjNJ+TIv9pZc7BIrQ0o2UQLqWnkQcisjI39oC
         W5ztUcHoxDiIE45vRZf/s5w9sGYYTkM4cwvehpsP5x2v8RiRqUobIXZZU5gofHIgBz0r
         WvQoGWqA3pbpqXmQCAMB6pslGp7aJPNXcTyewoWgVQtwl3NJCJtwaC8O9OTTj3WYobL0
         CpwYp+Zt0AOSX9lfFjClTEoYgqaxD4MtHlKxt9d5Cd8jeVWWEpwzlLr2PvCs4T/a02yg
         Rm9eCta06wTe5+1gzwuZFF0jdD1DyEz4KNoXN20XyphMQBoUFu9oJIBnMcc+5Xz18KUN
         t2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 71si23152582qkq.5.2017.05.23.07.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDB18-0002wu-3Q
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxd-0008G3-Ma
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxc-0002VU-1G
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxb-0002UY-Od; Tue, 23 May 2017 10:38:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C7E88553F;
	Tue, 23 May 2017 14:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9C7E88553F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9C7E88553F
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EFB07814F;
	Tue, 23 May 2017 14:38:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:46 +0200
Message-Id: <1495550330-34087-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 23 May 2017 14:38:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/5] numa: consolidate cpu_preplug
 fixups/checks for pc/arm/spapr
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
X-TUID: SYIJiYV0vWLR

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
v2:
  user error_abort in numa_cpu_pre_plug()
     Eduardo Habkost <ehabkost@redhat.com>
---
 include/sysemu/numa.h |  1 +
 hw/arm/virt.c         | 16 ++--------------
 hw/i386/pc.c          | 17 +----------------
 hw/ppc/spapr.c        | 17 +----------------
 numa.c                | 22 ++++++++++++++++++++++
 5 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 7ffde5b..610eece 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -35,4 +35,5 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size);
 void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                   int nb_nodes, ram_addr_t size);
+void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c7c8159..ce676df 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1351,7 +1351,6 @@ static void machvirt_init(MachineState *machine)
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
         CPUState *cs;
-        int node_id;
 
         if (n >= smp_cpus) {
             break;
@@ -1364,19 +1363,8 @@ static void machvirt_init(MachineState *machine)
         cs = CPU(cpuobj);
         cs->cpu_index = n;
 
-        node_id = possible_cpus->cpus[cs->cpu_index].props.node_id;
-        if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
-            /* by default CPUState::numa_node was 0 if it's not set via CLI
-             * keep it this way for now but in future we probably should
-             * refuse to start up with incomplete numa mapping */
-             node_id = 0;
-        }
-        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
-            cs->numa_node = node_id;
-        } else {
-            /* CPU isn't device_add compatible yet, this shouldn't happen */
-            error_setg(&error_abort, "user set node-id not implemented");
-        }
+        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
+                          &error_fatal);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 816bfa8..cf09949 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1893,7 +1893,6 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
                             DeviceState *dev, Error **errp)
 {
     int idx;
-    int node_id;
     CPUState *cs;
     CPUArchId *cpu_slot;
     X86CPUTopoInfo topo;
@@ -1984,21 +1983,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
     cs = CPU(cpu);
     cs->cpu_index = idx;
 
-    node_id = cpu_slot->props.node_id;
-    if (!cpu_slot->props.has_node_id) {
-        /* by default CPUState::numa_node was 0 if it's not set via CLI
-         * keep it this way for now but in future we probably should
-         * refuse to start up with incomplete numa mapping */
-        node_id = 0;
-    }
-    if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
-        cs->numa_node = node_id;
-    } else if (cs->numa_node != node_id) {
-            error_setg(errp, "node-id %d must match numa node specified"
-                "with -numa option for cpu-index %d",
-                cs->numa_node, cs->cpu_index);
-            return;
-    }
+    numa_cpu_pre_plug(cpu_slot, dev, errp);
 }
 
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0980d73..c7fee8b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2831,11 +2831,9 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
     Error *local_err = NULL;
     CPUCore *cc = CPU_CORE(dev);
-    sPAPRCPUCore *sc = SPAPR_CPU_CORE(dev);
     char *base_core_type = spapr_get_cpu_core_type(machine->cpu_model);
     const char *type = object_get_typename(OBJECT(dev));
     CPUArchId *core_slot;
-    int node_id;
     int index;
 
     if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
@@ -2870,20 +2868,7 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         goto out;
     }
 
-    node_id = core_slot->props.node_id;
-    if (!core_slot->props.has_node_id) {
-        /* by default CPUState::numa_node was 0 if it's not set via CLI
-         * keep it this way for now but in future we probably should
-         * refuse to start up with incomplete numa mapping */
-        node_id = 0;
-    }
-    if (sc->node_id == CPU_UNSET_NUMA_NODE_ID) {
-        sc->node_id = node_id;
-    } else if (sc->node_id != node_id) {
-        error_setg(&local_err, "node-id %d must match numa node specified"
-            "with -numa option for cpu-index %d", sc->node_id, cc->core_id);
-        goto out;
-    }
+    numa_cpu_pre_plug(core_slot, dev, &local_err);
 
 out:
     g_free(base_core_type);
diff --git a/numa.c b/numa.c
index ca73145..723f5f8 100644
--- a/numa.c
+++ b/numa.c
@@ -534,6 +534,28 @@ void parse_numa_opts(MachineState *ms)
     }
 }
 
+void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
+{
+    int node_id = object_property_get_int(OBJECT(dev), "node-id", &error_abort);
+
+    if (node_id == CPU_UNSET_NUMA_NODE_ID) {
+        /* by default CPUState::numa_node was 0 if it wasn't set explicitly
+         * TODO: make it error when incomplete numa mapping support is removed
+         */
+        node_id = 0;
+
+        /* due to bug in libvirt, it doesn't pass node-id from props on
+         * device_add as expected, so we have to fix it up here */
+        if (slot->props.has_node_id) {
+            node_id = slot->props.node_id;
+        }
+        object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
+    } else if (node_id != slot->props.node_id) {
+        error_setg(errp, "node-id=%d must match numa node specified "
+                   "with -numa option", node_id);
+    }
+}
+
 static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
                                            const char *name,
                                            uint64_t ram_size)
-- 
2.7.4

