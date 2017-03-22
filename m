Received: by 10.25.15.230 with SMTP id 99csp259933lfp;
        Wed, 22 Mar 2017 06:40:57 -0700 (PDT)
X-Received: by 10.200.49.232 with SMTP id i37mr35710033qte.241.1490190057217;
        Wed, 22 Mar 2017 06:40:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n89si1098281qte.325.2017.03.22.06.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgVU-0005RM-Hb
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:40:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgP6-00088c-9R
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgP2-00023W-TL
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgP2-000232-K8; Wed, 22 Mar 2017 09:34:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AF29804F4;
	Wed, 22 Mar 2017 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9AF29804F4
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9AF29804F4
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4E9719805;
	Wed, 22 Mar 2017 13:34:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:38 +0100
Message-Id: <1490189568-167621-14-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 22 Mar 2017 13:34:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 13/23] spapr: get numa node mapping from
 possible_cpus instead of numa_get_node_for_cpu()
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
X-TUID: GirCU3nSg3tU

it's safe to remove thread node_id != core node_id error
branch as machine_set_cpu_numa_node() also does mismatch
check and is called even before any CPU is created.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/ppc/spapr.c          |  4 ++--
 hw/ppc/spapr_cpu_core.c | 14 ++------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9c61721..42cef3d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2803,8 +2803,8 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         goto out;
     }
 
-    node_id = numa_get_node_for_cpu(cc->core_id);
-    if (node_id == nb_numa_nodes) {
+    node_id = core_slot->props.node_id;
+    if (!core_slot->props.has_node_id) {
         /* by default CPUState::numa_node was 0 if it's not set via CLI
          * keep it this way for now but in future we probably should
          * refuse to start up with incomplete numa mapping */
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 25988f8..8d48468 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -168,7 +168,6 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
 
     sc->threads = g_malloc0(size * cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
-        int node_id;
         char id[32];
         CPUState *cs;
 
@@ -178,17 +177,8 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
         cs = CPU(obj);
         cs->cpu_index = cc->core_id + i;
 
-        /* Set NUMA node for the added CPUs  */
-        node_id = numa_get_node_for_cpu(cs->cpu_index);
-        if (node_id != sc->node_id) {
-            error_setg(&local_err, "Invalid node-id=%d of thread[cpu-index: %d]"
-                " on CPU[core-id: %d, node-id: %d], node-id must be the same",
-                 node_id, cs->cpu_index, cc->core_id, sc->node_id);
-            goto err;
-        }
-        if (node_id < nb_numa_nodes) {
-            cs->numa_node = node_id;
-        }
+        /* Set NUMA node for the threads belonged to core  */
+        cs->numa_node = sc->node_id;
 
         snprintf(id, sizeof(id), "thread[%d]", i);
         object_property_add_child(OBJECT(sc), id, obj, &local_err);
-- 
2.7.4

