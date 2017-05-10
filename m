Received: by 10.25.0.6 with SMTP id 6csp243140lfa;
        Wed, 10 May 2017 04:42:16 -0700 (PDT)
X-Received: by 10.200.43.59 with SMTP id 56mr5067565qtu.202.1494416536499;
        Wed, 10 May 2017 04:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416536; cv=none;
        d=google.com; s=arc-20160816;
        b=ETXYySGCuK+lSUcqGgBN/FVP0RqyBq0V7a8BOwDTEuYiC+2hWvzbW9bQluz6QoZ/C1
         UQ+H8kt2ahNeWtrJ9t9RJw64B0EvZWIRUNS8i1xXbQtpKTx76SN6K08rHmgNDxluMFKO
         2yAmsPP8noeduV8cj1zpPjTp6q959WU3ovNCi38oYTa6BEQbPk+lnPofNRl+sVcQsKY8
         vAJfZMAYQo98gOS8I29wJRizVy3aTjIFItFUh8z4B8fRrkUUh3CoEa4eVFvbvFeLe7li
         8gFR40htdJLN/6PSPPWqplt6l8KthQX7RZRwQoFqr9JWgCr2VXxs1AyePXkSF8gCQVxs
         Iwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=0p/QtNqG48EujXmZEezPOMa7YPYqnFv8BEhRPxA4TBc=;
        b=ctu5iclLizKm9mzKd+P1BQk+I6zLlluYKxOAP5f3tochrVeTHQYwCrMKUcLbJ1NijM
         jWtOzBmrFZhw8VqPBp4YdkHP0bdtLue6PFFfh1mhAa1VThX9RLTr5yUjNHcN/ZsC6xOx
         6ZRR5xS5as2fOZ/22TFv9qPDSGQxvIx6fYW4f3uwOpi1tdE305zG9L2/ywALcObwMQpm
         qFnAOn4z9yslliI/hzLwSLmeYUZyU/LCRT3zOiM/UsMb80zKVH2B867hkfsyvk/tFCZA
         7QqFYAQ1eHVHQ9rP4x7frU+2X+knfDJ82fE/OYbXCDXQUMmO9lqs+ioP3qrMpTeikpVg
         4ouA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si2870383qtg.223.2017.05.10.04.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Q0V-0000YX-UU
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:42:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpV-00082r-GK
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpU-0001t2-Aq
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpP-0001px-Ju; Wed, 10 May 2017 07:30:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 846CA80F8D;
	Wed, 10 May 2017 11:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 846CA80F8D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 846CA80F8D
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 919507DFF5;
	Wed, 10 May 2017 11:30:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:59 +0200
Message-Id: <1494415802-227633-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 10 May 2017 11:30:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 15/18] numa: use possible_cpus for not
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
X-TUID: qyBQUnRyxuT3

and remove corresponding part in numa.c that uses
node_cpu bitmaps.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
It's one more less user of node_cpu bitmpas, following
commit will remove the last user along with
node_cpu itself.
---
 hw/core/machine.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 numa.c            | 10 ----------
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 64e2a4f..fd6a436 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -20,6 +20,7 @@
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
+#include "sysemu/numa.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
 {
@@ -678,9 +679,66 @@ bool machine_mem_merge(MachineState *machine)
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
index dc739ea..63bff5a 100644
--- a/numa.c
+++ b/numa.c
@@ -337,16 +337,6 @@ static void validate_numa_cpus(void)
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

