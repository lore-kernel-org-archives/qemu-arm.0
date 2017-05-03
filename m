Received: by 10.25.0.198 with SMTP id 189csp92916lfa;
        Wed, 3 May 2017 06:12:11 -0700 (PDT)
X-Received: by 10.200.35.27 with SMTP id a27mr31173788qta.2.1493817131208;
        Wed, 03 May 2017 06:12:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si19273162qta.175.2017.05.03.06.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5u4g-0003RD-GY
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trQ-0000Qi-QR
	for qemu-devel@nongnu.org; Wed, 03 May 2017 08:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trP-0001FJ-SF
	for qemu-devel@nongnu.org; Wed, 03 May 2017 08:58:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5trN-0001DP-51; Wed, 03 May 2017 08:58:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00BA8201FB;
	Wed,  3 May 2017 12:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 00BA8201FB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 00BA8201FB
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A760F182D6;
	Wed,  3 May 2017 12:58:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:15 +0200
Message-Id: <1493816238-33120-22-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 May 2017 12:58:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 21/24] numa: use possible_cpus for not
 mapped CPUs check
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
X-TUID: Z8rAUEm036DE

and remove corresponding part in numa.c that uses
node_cpu bitmaps.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
It's one more less user of node_cpu bitmpas, following
commit will remove the last user along with
node_cpu itself.
---
 hw/core/machine.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 numa.c            | 10 ----------
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 217b4f4..4229054 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -19,6 +19,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
+#include "sysemu/numa.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
 {
@@ -648,9 +649,66 @@ bool machine_mem_merge(MachineState *machine)
     return machine->mem_merge;
 }
 
+static char *cpu_slot_to_string(const CPUArchId *cpu)
+{
+    GString *s = g_string_new(NULL);
+    if (cpu->props.has_socket_id) {
+        g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
+    }
+    if (cpu->props.has_core_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "core-id: %"PRId64, cpu->props.core_id);
+    }
+    if (cpu->props.has_thread_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "thread-id: %"PRId64, cpu->props.thread_id);
+    }
+    return g_string_free(s, false);
+}
+
+static void machine_numa_validate(MachineState *machine)
+{
+    int i;
+    GString *s = g_string_new(NULL);
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
+
+    assert(nb_numa_nodes);
+    for (i = 0; i < possible_cpus->len; i++) {
+        const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
+
+        /* at this point numa mappings are initilized by CLI options
+         * or with default mappings so it's sufficient to list
+         * all not yet mapped CPUs here */
+        /* TODO: make it hard error in future */
+        if (!cpu_slot->props.has_node_id) {
+            char *cpu_str = cpu_slot_to_string(cpu_slot);
+            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
+                                   cpu_str);
+            g_free(cpu_str);
+        }
+    }
+    if (s->len) {
+        error_report("warning: CPU(s) not present in any NUMA nodes: %s",
+                     s->str);
+        error_report("warning: All CPU(s) up to maxcpus should be described "
+                     "in NUMA config, ability to start up with partial NUMA "
+                     "mappings is obsoleted and will be removed in future");
+    }
+    g_string_free(s, true);
+}
+
 void machine_run_board_init(MachineState *machine)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
+
+    if (nb_numa_nodes) {
+        machine_numa_validate(machine);
+    }
     machine_class->init(machine);
 }
 
diff --git a/numa.c b/numa.c
index f8c849d..d7aa662 100644
--- a/numa.c
+++ b/numa.c
@@ -293,16 +293,6 @@ static void validate_numa_cpus(void)
         bitmap_or(seen_cpus, seen_cpus,
                   numa_info[i].node_cpu, max_cpus);
     }
-
-    if (!bitmap_full(seen_cpus, max_cpus)) {
-        char *msg;
-        bitmap_complement(seen_cpus, seen_cpus, max_cpus);
-        msg = enumerate_cpus(seen_cpus, max_cpus);
-        error_report("warning: CPU(s) not present in any NUMA nodes: %s", msg);
-        error_report("warning: All CPU(s) up to maxcpus should be described "
-                     "in NUMA config");
-        g_free(msg);
-    }
     g_free(seen_cpus);
 }
 
-- 
2.7.4

