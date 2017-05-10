Received: by 10.25.0.6 with SMTP id 6csp239337lfa;
        Wed, 10 May 2017 04:33:52 -0700 (PDT)
X-Received: by 10.55.89.196 with SMTP id n187mr4591972qkb.322.1494416032770;
        Wed, 10 May 2017 04:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416032; cv=none;
        d=google.com; s=arc-20160816;
        b=vZOA8UEkvG7hd8AU9n0dYsEb6gzlo+oyeT74f2GO53zFMynf+PzUNf30AlkMeuelT9
         9QwbO0JRv29PL1HZteHIj2hOh+Ja9jhcVSgdi9dIQTPp/cGoJwvc6i4zPDc2yNkTUpy+
         TnHOQGWNSEbogt1wDV2ZE0iqTVvZa6iygpjSjWeq9YjNb/1jl+8Ed5WCoeiLtXAxMIi9
         LIeihHELqzf8NSa8orZe9AESXymnLduVO919521ULBvhGiGlUlQ6LBjU5RSPEg7bVeNQ
         v4Fi5ZRUt6iBnOo0YdTcOvSQ854QW3F7PZo5ewy0n+TjGZ1PHVt9w05kYnaoBMsnelnA
         CbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=7SQ/38ckQ++4CYjAH7GTxKT5kaPv/EUH+nVR0RQDB3Y=;
        b=muN9N3YrQFDTBw4CJQITioIY5EWTVmsTXNesKxmPchedOhWIqupZV1LTuJIRAtI1zM
         Df8IJdFXUtgwK/wpdanXbEOGDprIgKwi1msd4uoB2h40Pj2TZ1gmKYaqrvkvZz8LCM07
         wuwlcPR72OwWf5p5as+edIPuUt5HeDniWNV49Spz9cCKPV//oS0aezcsIgxz3qsc4Vco
         ugBNQ7vrK0GWKwdqS7dN8bQP15G8LIfTsssDdLJGpz5dA0IiECkDFOu3jyMwk5dwaofj
         sKsgWwjHa+rGLng6sfcnIJQvGyDSKs7YItlCl4nKis485wldYDfnhHD/BwDNugEiggH/
         UDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k64si2892810qkb.268.2017.05.10.04.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8PsO-0002Gu-7g
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:33:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpC-0007fS-JY
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpB-0001lN-He
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpB-0001lD-8s; Wed, 10 May 2017 07:30:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A60F37EEF;
	Wed, 10 May 2017 11:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2A60F37EEF
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2A60F37EEF
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3736A7DFF5;
	Wed, 10 May 2017 11:30:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:53 +0200
Message-Id: <1494415802-227633-10-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 10 May 2017 11:30:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 09/18] spapr: get numa node mapping from
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
X-TUID: XPPchLplfehu

it's safe to remove thread node_id != core node_id error
branch as machine_set_cpu_numa_node() also does mismatch
check and is called even before any CPU is created.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c          |  4 ++--
 hw/ppc/spapr_cpu_core.c | 14 ++------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a952a39..504161f 100644
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

