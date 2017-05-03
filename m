Received: by 10.25.0.198 with SMTP id 189csp93822lfa;
        Wed, 3 May 2017 06:14:18 -0700 (PDT)
X-Received: by 10.55.134.2 with SMTP id i2mr2813910qkd.43.1493817258185;
        Wed, 03 May 2017 06:14:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si19957391qtc.92.2017.05.03.06.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:14:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5u6j-0005yZ-FK
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:14:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tr3-0008Qj-OB
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tr0-0000y3-DE
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tr0-0000uJ-79; Wed, 03 May 2017 08:58:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BB5A8124A;
	Wed,  3 May 2017 12:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7BB5A8124A
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7BB5A8124A
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98135182C9;
	Wed,  3 May 2017 12:57:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:05 +0200
Message-Id: <1493816238-33120-12-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 03 May 2017 12:57:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 11/24] numa: do default mapping based on
 possible_cpus instead of node_cpu bitmaps
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
X-TUID: VRHtqi8eJCBP

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 numa.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/numa.c b/numa.c
index 5ff1212..c7e3e0a 100644
--- a/numa.c
+++ b/numa.c
@@ -309,6 +309,7 @@ static void validate_numa_cpus(void)
 void parse_numa_opts(MachineState *ms)
 {
     int i;
+    const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     for (i = 0; i < MAX_NODES; i++) {
@@ -379,11 +380,6 @@ void parse_numa_opts(MachineState *ms)
 
         numa_set_mem_ranges();
 
-        for (i = 0; i < nb_numa_nodes; i++) {
-            if (!bitmap_empty(numa_info[i].node_cpu, max_cpus)) {
-                break;
-            }
-        }
         /* Historically VCPUs were assigned in round-robin order to NUMA
          * nodes. However it causes issues with guest not handling it nice
          * in case where cores/threads from a multicore CPU appear on
@@ -391,11 +387,20 @@ void parse_numa_opts(MachineState *ms)
          * rule grouping VCPUs by socket so that VCPUs from the same socket
          * would be on the same node.
          */
-        if (!mc->cpu_index_to_instance_props) {
+        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
             error_report("default CPUs to NUMA node mapping isn't supported");
             exit(1);
         }
-        if (i == nb_numa_nodes) {
+
+        possible_cpus = mc->possible_cpu_arch_ids(ms);
+        for (i = 0; i < possible_cpus->len; i++) {
+            if (possible_cpus->cpus[i].props.has_node_id) {
+                break;
+            }
+        }
+
+        /* no CPUs are assigned to NUMA nodes */
+        if (i == possible_cpus->len) {
             for (i = 0; i < max_cpus; i++) {
                 CpuInstanceProperties props;
                 /* fetch default mapping from board and enable it */
-- 
2.7.4

