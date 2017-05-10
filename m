Received: by 10.25.0.6 with SMTP id 6csp239167lfa;
        Wed, 10 May 2017 04:33:34 -0700 (PDT)
X-Received: by 10.55.3.10 with SMTP id 10mr5207844qkd.65.1494416014182;
        Wed, 10 May 2017 04:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416014; cv=none;
        d=google.com; s=arc-20160816;
        b=pRo21sQtvN9f6Xvq9MWRZZRqGskT04MUfl+dCZTIJjmThbweCsTuNse1IxR6OGRK6r
         snsY7J+t6EUR3oTRAvuXGO+PLj90AbPa5dbwG875fqzXry9mEmIN59K9ncJHP00JDCUL
         6h0C1YW4zL/t21HlMczJXmJQn4akLyV5rtjYhLsxiitRakCjL8Z0x62vrRrkTDlDikrN
         I67Ep7mrSzik7wh3GM3L/LfPx/goQmGGYpvMY4iRlxIVOyJuvJiFMyqjPOw/bmL/8xGi
         g5L9ff6KsdaFYga0fQZOslQCDi15Dig8Yhve94YBlUD0XlqEwnPvZXDgAQxghGT2rcfp
         0Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=pd/dQ1uIzIO9ZbuzGEPf2SFqCCp7Sw9X5qMYaIb2pIM=;
        b=NCj7WsJbuCoYmorxEPkqrNn0p0IC0ztWWB6DUqGtSMiRr4OzlMkJSf3JBN9u8kfVXV
         yL6i+PqKoHoBfeN2o5ojhYol7z/C5vLVFJM04PSeE26ES3eAfvbzjfnEI/kE6bh9sh0Q
         3jCdlsSJPvdLNZ/kkQrmL4rRCWCeoGSqlKCEcvrRK7MoMr3W6KMOZ/0RqQas8yi4rxUd
         PdDhXtA2tsHlRimUXlocehSSRiVc8uYNKE5n8ChY2VM17sDTXwuXRAd2XyDuaP/wUf3Z
         oMX5trsY0Kuhy6V0qaLa0trrYBBWQ7NgiE881sASw41zpZejTw5svKIjyzymTjJ/c+3l
         ZHhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e125si2892786qkc.177.2017.05.10.04.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:33:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Ps5-0001fa-I4
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:33:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp8-0007bp-W3
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp7-0001k8-Eh
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pp4-0001ir-H5; Wed, 10 May 2017 07:30:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75B016408F;
	Wed, 10 May 2017 11:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 75B016408F
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 75B016408F
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80ECD7DFF5;
	Wed, 10 May 2017 11:30:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:50 +0200
Message-Id: <1494415802-227633-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 10 May 2017 11:30:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 06/18] numa: mirror cpu to node mapping in
 MachineState::possible_cpus
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
X-TUID: DxB+j66gFIeS

Introduce machine_set_cpu_numa_node() helper that stores
node mapping for CPU in MachineState::possible_cpus.
CPU and node it belongs to is specified by 'props' argument.

Patch doesn't remove old way of storing mapping in
numa_info[X].node_cpu as removing it at the same time
makes patch rather big. Instead it just mirrors mapping
in possible_cpus and follow up per target patches will
switch to possible_cpus and numa_info[X].node_cpu will
be removed once there isn't any users left.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
v3:
  - add comment documenting machine_set_cpu_numa_node() semantics
    (Eduardo)
  - assert if props->has_node_id == false (Eduardo)
---
 include/hw/boards.h |  3 ++
 hw/core/machine.c   | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 numa.c              |  8 +++++
 3 files changed, 107 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3ffa255..4e14ff0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -42,6 +42,9 @@ bool machine_dump_guest_core(MachineState *machine);
 bool machine_mem_merge(MachineState *machine);
 void machine_register_compat_props(MachineState *machine);
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
+void machine_set_cpu_numa_node(MachineState *machine,
+                               const CpuInstanceProperties *props,
+                               Error **errp);
 
 /**
  * CPUArchId:
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2482c63..420c8c4 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -389,6 +389,102 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
     return head;
 }
 
+/**
+ * machine_set_cpu_numa_node:
+ * @machine: machine object to modify
+ * @props: specifies which cpu objects to assign to
+ *         numa node specified by @props.node_id
+ * @errp: if an error occurs, a pointer to an area to store the error
+ *
+ * Associate NUMA node specified by @props.node_id with cpu slots that
+ * match socket/core/thread-ids specified by @props. It's recommended to use
+ * query-hotpluggable-cpus.props values to specify affected cpu slots,
+ * which would lead to exact 1:1 mapping of cpu slots to NUMA node.
+ *
+ * However for CLI convenience it's possible to pass in subset of properties,
+ * which would affect all cpu slots that match it.
+ * Ex for pc machine:
+ *    -smp 4,cores=2,sockets=2 -numa node,nodeid=0 -numa node,nodeid=1 \
+ *    -numa cpu,node-id=0,socket_id=0 \
+ *    -numa cpu,node-id=1,socket_id=1
+ * will assign all child cores of socket 0 to node 0 and
+ * of socket 1 to node 1.
+ *
+ * On attempt of reassigning (already assigned) cpu slot to another NUMA node,
+ * return error.
+ * Empty subset is disallowed and function will return with error in this case.
+ */
+void machine_set_cpu_numa_node(MachineState *machine,
+                               const CpuInstanceProperties *props, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    bool match = false;
+    int i;
+
+    if (!mc->possible_cpu_arch_ids) {
+        error_setg(errp, "mapping of CPUs to NUMA node is not supported");
+        return;
+    }
+
+    /* disabling node mapping is not supported, forbid it */
+    assert(props->has_node_id);
+
+    /* force board to initialize possible_cpus if it hasn't been done yet */
+    mc->possible_cpu_arch_ids(machine);
+
+    for (i = 0; i < machine->possible_cpus->len; i++) {
+        CPUArchId *slot = &machine->possible_cpus->cpus[i];
+
+        /* reject unsupported by board properties */
+        if (props->has_thread_id && !slot->props.has_thread_id) {
+            error_setg(errp, "thread-id is not supported");
+            return;
+        }
+
+        if (props->has_core_id && !slot->props.has_core_id) {
+            error_setg(errp, "core-id is not supported");
+            return;
+        }
+
+        if (props->has_socket_id && !slot->props.has_socket_id) {
+            error_setg(errp, "socket-id is not supported");
+            return;
+        }
+
+        /* skip slots with explicit mismatch */
+        if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
+                continue;
+        }
+
+        if (props->has_core_id && props->core_id != slot->props.core_id) {
+                continue;
+        }
+
+        if (props->has_socket_id && props->socket_id != slot->props.socket_id) {
+                continue;
+        }
+
+        /* reject assignment if slot is already assigned, for compatibility
+         * of legacy cpu_index mapping with SPAPR core based mapping do not
+         * error out if cpu thread and matched core have the same node-id */
+        if (slot->props.has_node_id &&
+            slot->props.node_id != props->node_id) {
+            error_setg(errp, "CPU is already assigned to node-id: %" PRId64,
+                       slot->props.node_id);
+            return;
+        }
+
+        /* assign slot to node as it's matched '-numa cpu' key */
+        match = true;
+        slot->props.node_id = props->node_id;
+        slot->props.has_node_id = props->has_node_id;
+    }
+
+    if (!match) {
+        error_setg(errp, "no match found");
+    }
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
diff --git a/numa.c b/numa.c
index 7182481..7db5dde 100644
--- a/numa.c
+++ b/numa.c
@@ -170,6 +170,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         exit(1);
     }
     for (cpus = node->cpus; cpus; cpus = cpus->next) {
+        CpuInstanceProperties props;
         if (cpus->value >= max_cpus) {
             error_setg(errp,
                        "CPU index (%" PRIu16 ")"
@@ -178,6 +179,10 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
             return;
         }
         bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
+        props = mc->cpu_index_to_instance_props(ms, cpus->value);
+        props.node_id = nodenr;
+        props.has_node_id = true;
+        machine_set_cpu_numa_node(ms, &props, &error_fatal);
     }
 
     if (node->has_mem && node->has_memdev) {
@@ -528,9 +533,12 @@ void parse_numa_opts(MachineState *ms)
         if (i == nb_numa_nodes) {
             for (i = 0; i < max_cpus; i++) {
                 CpuInstanceProperties props;
+                /* fetch default mapping from board and enable it */
                 props = mc->cpu_index_to_instance_props(ms, i);
+                props.has_node_id = true;
 
                 set_bit(i, numa_info[props.node_id].node_cpu);
+                machine_set_cpu_numa_node(ms, &props, &error_fatal);
             }
         }
 
-- 
2.7.4

