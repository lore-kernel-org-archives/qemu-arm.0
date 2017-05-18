Received: by 10.25.0.6 with SMTP id 6csp603745lfa;
        Thu, 18 May 2017 01:09:47 -0700 (PDT)
X-Received: by 10.55.177.69 with SMTP id a66mr2424607qkf.305.1495094987770;
        Thu, 18 May 2017 01:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495094987; cv=none;
        d=google.com; s=arc-20160816;
        b=u53osUtmO2/zRkGOE+Ev3vGIg+PNf2L5WxinaqZiPH8gYBe/P9z6st0LJJKf1HPt79
         qJQhthhxZ93xohDoCIhZVngP8oDSBzkinreZY1zLCohBTFb9uBPLb7mzIFiuqNwu68xK
         2LNpVvu42M9fH9M48w86g3By5Vd82wcbNjNaC4Pxs4nlFQuFP/47dXcv0sg5PZoM0LEF
         6l6qxsAuf06AoVXnlc8iNqkiyTjKH4+tKXcQz4IMRAhKsyetCDZu9MiQDNK79PXmpvGa
         8Ao2nOI9Qn5lugbTTGEB8L7EK04zevltWGFNsYqPLZyGHltst+2OqK7/JANwEtgQtUZR
         iQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=1UU1lUO3HMGAM9bquIiWYug2qV26Uz5TNELGZuS7+Z8=;
        b=hrHm+v/oy2W/syd7fskY9A6LuC26QecZLJ+H2saS8p1BiGqNJUMAxJc+5U1AlZkS90
         XZfRoEx9vfRpSuhovDMHFW5k3nTnwK3CzJzBcDMyVA7sDHJ8Oq2X+SjuygS/cOe8YiDn
         /JDdnR6MHWuLa75QHc/v3oTTRxHm+n7ZhgRcijaebOf5BYj6CYNSRtINcGo6d2YQf+n0
         6gzyCGnp4cKSznFJqikATurd8bKSTi6R4E2KYB6jq+ubIT7Xx0Bel1gSzC8WRBxX4I4q
         f9vVU87LryXQK2Pw8xrMyu4Ltdycw+wJ8UtXQWnIyix1np3HRQlMXPDe0VP6qAsu+4YK
         y/Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n188si1893238qkc.75.2017.05.18.01.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 01:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBGVH-0003RI-3w
	for alex.bennee@linaro.org; Thu, 18 May 2017 04:09:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGVA-0003PM-47
	for qemu-arm@nongnu.org; Thu, 18 May 2017 04:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGV9-00026i-0x
	for qemu-arm@nongnu.org; Thu, 18 May 2017 04:09:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dBGV8-000269-Pu; Thu, 18 May 2017 04:09:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8C9361B91;
	Thu, 18 May 2017 08:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E8C9361B91
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E8C9361B91
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C96A17593;
	Thu, 18 May 2017 08:09:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 May 2017 10:09:30 +0200
Message-Id: <1495094971-177754-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 May 2017 08:09:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] numa: move default mapping init to machine
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
X-TUID: J8DK5/wZMtFz

there is no need use cpu_index_to_instance_props() for setting
default cpu -> node mapping. Generic machine code can do it
without cpu_index by just enabling already preset defaults
in possible_cpus.

PS:
as bonus it makes one less user of cpu_index_to_instance_props()

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/machine.c | 32 +++++++++++++++++++++-----------
 numa.c            | 26 --------------------------
 2 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fd6a436..2e91aa9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -700,26 +700,36 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     return g_string_free(s, false);
 }
 
-static void machine_numa_validate(MachineState *machine)
+static void machine_numa_finish_init(MachineState *machine)
 {
-    int i;
+    int i, default_mapping;
     GString *s = g_string_new(NULL);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     assert(nb_numa_nodes);
+    for (i = possible_cpus->len;
+         i && !possible_cpus->cpus[i - 1].props.has_node_id;
+         i--)
+        ;;
+    default_mapping = !i; /* i == 0 : no explicit mapping provided by user */
+
     for (i = 0; i < possible_cpus->len; i++) {
         const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
 
-        /* at this point numa mappings are initilized by CLI options
-         * or with default mappings so it's sufficient to list
-         * all not yet mapped CPUs here */
-        /* TODO: make it hard error in future */
         if (!cpu_slot->props.has_node_id) {
-            char *cpu_str = cpu_slot_to_string(cpu_slot);
-            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
-                                   cpu_str);
-            g_free(cpu_str);
+            if (default_mapping) {
+                /* fetch default mapping from board and enable it */
+                CpuInstanceProperties props = cpu_slot->props;
+                props.has_node_id = true;
+                machine_set_cpu_numa_node(machine, &props, &error_fatal);
+            } else {
+                /* record slots with not set mapping */
+                char *cpu_str = cpu_slot_to_string(cpu_slot);
+                g_string_append_printf(s, "%sCPU %d [%s]",
+                                       s->len ? ", " : "", i, cpu_str);
+                g_free(cpu_str);
+            }
         }
     }
     if (s->len) {
@@ -737,7 +747,7 @@ void machine_run_board_init(MachineState *machine)
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
 
     if (nb_numa_nodes) {
-        machine_numa_validate(machine);
+        machine_numa_finish_init(machine);
     }
     machine_class->init(machine);
 }
diff --git a/numa.c b/numa.c
index 0115bfd..796cd7d 100644
--- a/numa.c
+++ b/numa.c
@@ -427,7 +427,6 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 void parse_numa_opts(MachineState *ms)
 {
     int i;
-    const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
@@ -485,31 +484,6 @@ void parse_numa_opts(MachineState *ms)
 
         numa_set_mem_ranges();
 
-        /* assign CPUs to nodes using board provided default mapping */
-        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
-            error_report("default CPUs to NUMA node mapping isn't supported");
-            exit(1);
-        }
-
-        possible_cpus = mc->possible_cpu_arch_ids(ms);
-        for (i = 0; i < possible_cpus->len; i++) {
-            if (possible_cpus->cpus[i].props.has_node_id) {
-                break;
-            }
-        }
-
-        /* no CPUs are assigned to NUMA nodes */
-        if (i == possible_cpus->len) {
-            for (i = 0; i < max_cpus; i++) {
-                CpuInstanceProperties props;
-                /* fetch default mapping from board and enable it */
-                props = mc->cpu_index_to_instance_props(ms, i);
-                props.has_node_id = true;
-
-                machine_set_cpu_numa_node(ms, &props, &error_fatal);
-            }
-        }
-
         /* QEMU needs at least all unique node pair distances to build
          * the whole NUMA distance table. QEMU treats the distance table
          * as symmetric by default, i.e. distance A->B == distance B->A.
-- 
2.7.4

