Received: by 10.25.0.6 with SMTP id 6csp241895lfa;
        Wed, 10 May 2017 04:39:28 -0700 (PDT)
X-Received: by 10.200.2.159 with SMTP id p31mr5360470qtg.55.1494416368493;
        Wed, 10 May 2017 04:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416368; cv=none;
        d=google.com; s=arc-20160816;
        b=YRCIDyl/J74Fii2lH82yV8JE+su6u0z9kH3wnoH90azQ1JvvXcWMthgK92z9ZPVSC+
         cl2FFh+YHEiSRqS2crv4EiRqZe5boYx7KSH3jU/XNBvSQOnnHVfs202zCzb4H+MK54Gq
         Dy4NKOTuAgldIWRwUqFEX3kAZRWNLJ4xzYjexFGU3sjH2Zfj2jVN8J/ZB7QQSOtGdbF9
         WOUUDNoV5w+hlXCyIIIcrSpOvax4JgmhVzwlfKgHTv7BRkVpJejoyo9EI+/VIRaC9XNd
         HdwxQZqSatB2rFGU5BPCdp78jpdVuvnCtRJU/nB1Xm+VOsTl8imiyiVJ0dkl4U83cuRl
         CpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=YsC847cp0A+jck0xWia/yLlGzoaabXHWmLxdlRYiL6Q=;
        b=hm8oZxXygESeSX+oEycov2dfzw6A7LWCJ7wan4cMQlsLPJelNVB5u626aDI6t8FTHJ
         faMUrA5253km8ClJp6+EUMx4kMX38Kx0IOoE+Pdg7N3kUrLl0H1584WkKFy+gaU255bG
         P41XBcnDRcGNS7Gw0AoYc4torsLi0aM7tbuX9h6Xs9cd0CNMghaeZXO/LZLL55dXA3Uu
         74sKD4xCUEcURn9ofICNyMb7snUoU6fAISkgKboeHjFix8hE+7Mh6vMSltqk4crVcRXK
         K8k7iv01RDGuMWa/G5S1GgSLLQCOr5ixk7jEbXEJ//MwFLaHv8LchYHXwCTiLtnDWsZj
         ElPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si2803606qka.209.2017.05.10.04.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pxn-0006Ws-TO
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpW-000846-GV
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpV-0001tV-HD
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpS-0001sE-0m; Wed, 10 May 2017 07:30:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF5E081222;
	Wed, 10 May 2017 11:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DF5E081222
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DF5E081222
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA8497DFF5;
	Wed, 10 May 2017 11:30:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:30:00 +0200
Message-Id: <1494415802-227633-17-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 10 May 2017 11:30:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 16/18] numa: remove node_cpu bitmaps as they
 are no longer used
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
X-TUID: ZV/3m5OQnxk+

Postfactum "CPU(s) present in multiple NUMA nodes" check
was the last user of node_cpu bitmaps, but it's not need
as machine_set_cpu_numa_node() does the similar check at
the time mapping is set for cpus (i.e. when -numa cpus=
is parsed) and ensures that cpu can be mapped only to
one node.

Remove duplicate check based on node_cpu bitmaps and
since the last user is gone remove node_cpu as well,
which completes internal transition from legacy bitmap
based mapping storage to possible_cpus storage.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 include/sysemu/numa.h |  1 -
 numa.c                | 43 -------------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 8cb3ebc..7ffde5b 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -18,7 +18,6 @@ struct numa_addr_range {
 
 struct node_info {
     uint64_t node_mem;
-    unsigned long *node_cpu;
     struct HostMemoryBackend *node_memdev;
     bool present;
     QLIST_HEAD(, numa_addr_range) addr; /* List to store address ranges */
diff --git a/numa.c b/numa.c
index 63bff5a..ca122cc 100644
--- a/numa.c
+++ b/numa.c
@@ -178,7 +178,6 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
                        cpus->value, max_cpus);
             return;
         }
-        bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
         props = mc->cpu_index_to_instance_props(ms, cpus->value);
         props.node_id = nodenr;
         props.has_node_id = true;
@@ -305,41 +304,6 @@ end:
     return 0;
 }
 
-static char *enumerate_cpus(unsigned long *cpus, int max_cpus)
-{
-    int cpu;
-    bool first = true;
-    GString *s = g_string_new(NULL);
-
-    for (cpu = find_first_bit(cpus, max_cpus);
-        cpu < max_cpus;
-        cpu = find_next_bit(cpus, max_cpus, cpu + 1)) {
-        g_string_append_printf(s, "%s%d", first ? "" : " ", cpu);
-        first = false;
-    }
-    return g_string_free(s, FALSE);
-}
-
-static void validate_numa_cpus(void)
-{
-    int i;
-    unsigned long *seen_cpus = bitmap_new(max_cpus);
-
-    for (i = 0; i < nb_numa_nodes; i++) {
-        if (bitmap_intersects(seen_cpus, numa_info[i].node_cpu, max_cpus)) {
-            bitmap_and(seen_cpus, seen_cpus,
-                       numa_info[i].node_cpu, max_cpus);
-            error_report("CPU(s) present in multiple NUMA nodes: %s",
-                         enumerate_cpus(seen_cpus, max_cpus));
-            g_free(seen_cpus);
-            exit(EXIT_FAILURE);
-        }
-        bitmap_or(seen_cpus, seen_cpus,
-                  numa_info[i].node_cpu, max_cpus);
-    }
-    g_free(seen_cpus);
-}
-
 /* If all node pair distances are symmetric, then only distances
  * in one direction are enough. If there is even one asymmetric
  * pair, though, then all distances must be provided. The
@@ -451,10 +415,6 @@ void parse_numa_opts(MachineState *ms)
     const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    for (i = 0; i < MAX_NODES; i++) {
-        numa_info[i].node_cpu = bitmap_new(max_cpus);
-    }
-
     if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
         exit(1);
     }
@@ -531,13 +491,10 @@ void parse_numa_opts(MachineState *ms)
                 props = mc->cpu_index_to_instance_props(ms, i);
                 props.has_node_id = true;
 
-                set_bit(i, numa_info[props.node_id].node_cpu);
                 machine_set_cpu_numa_node(ms, &props, &error_fatal);
             }
         }
 
-        validate_numa_cpus();
-
         /* QEMU needs at least all unique node pair distances to build
          * the whole NUMA distance table. QEMU treats the distance table
          * as symmetric by default, i.e. distance A->B == distance B->A.
-- 
2.7.4

