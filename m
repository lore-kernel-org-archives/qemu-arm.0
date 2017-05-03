Received: by 10.25.0.198 with SMTP id 189csp88304lfa;
        Wed, 3 May 2017 06:03:50 -0700 (PDT)
X-Received: by 10.55.107.130 with SMTP id g124mr2666695qkc.219.1493816630846;
        Wed, 03 May 2017 06:03:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si1766400qkb.31.2017.05.03.06.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5twc-00057Z-9C
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tr4-0008SA-JO
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tr3-0000zv-Si
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tr3-0000yQ-Ic; Wed, 03 May 2017 08:58:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C96620264;
	Wed,  3 May 2017 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8C96620264
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8C96620264
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5E917C5A;
	Wed,  3 May 2017 12:58:00 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:08 +0200
Message-Id: <1493816238-33120-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 May 2017 12:58:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 14/24] spapr: get numa node mapping from
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
X-TUID: OUmHFZ4wQE1d

it's safe to remove thread node_id != core node_id error
branch as machine_set_cpu_numa_node() also does mismatch
check and is called even before any CPU is created.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/ppc/spapr.c          |  4 ++--
 hw/ppc/spapr_cpu_core.c | 14 ++------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 7f58ee4..bcb91e7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2863,8 +2863,8 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
index 9de7a56..a17ea07 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -181,7 +181,6 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
 
     sc->threads = g_malloc0(size * cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
-        int node_id;
         char id[32];
         CPUState *cs;
 
@@ -191,17 +190,8 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
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

