Received: by 10.25.0.6 with SMTP id 6csp1897241lfa;
        Tue, 30 May 2017 09:30:43 -0700 (PDT)
X-Received: by 10.200.45.247 with SMTP id q52mr26174242qta.177.1496161843585;
        Tue, 30 May 2017 09:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161843; cv=none;
        d=google.com; s=arc-20160816;
        b=aFyJ5YBzAucnzFpS3dB/XXsz91vTiKuVp51xaONhV6WBFoMkXb/q0zUrCLr+HdCfKV
         OJeR+sfMZVuC//XTLChXTnGrPwV2VODW/XoKu1N2Plo6GhS/rd/valWlgTjzuNZ4iDlJ
         EjHgpYt3JCe/sLAEdq7gomu5qQkIvKRk4LJT2QFMA4APk4J3+82zIC5cHTvLipkfAc5W
         SknRxJNiwmZzPT81CpbKCWIdp5qDQB3aFWQiFCQZ6CJThuguBTMv1+YyuhQH7x8sbmjE
         a+DZarNsdlO/8UirMH5Msrc1H/1Bi7zboQxUvC5n25Xtm/jtc4K9YqmEnKR4yQM+nPOw
         8xTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=auJK+ExpHV3LCQSJZZUV2YDD7j6BHXwTX5zmY3kEDyA=;
        b=cZjlXYAi2hg/uUN8HOFLqY+k2tvy7QqZz/IyTQSJUn/pYq41YWOBv3GPIMK1e8gqMV
         3Z895gFy6atQ09+Vsp+wzfV2AKIm49c50ln5l4ZDYpC0vZE+cmoHkJA16qWkVQFx4YiV
         244Ivi/nYty9A9Cu2Q4VU6UMwJ04CwwNCoujrwwmvkJ5aLUdt+tL0IAWVed9kZ10wNuv
         e/W4n2v11GV3V99jkzifLWiLsPuR4Qae12Bfp6u9NftZgC2VdoSMO+eUplqi84NlIqlP
         fRAYuwQTcIix51X86+fWoaWTEy0g1d5+YBLop/n5yWVrRtfNFDJ1iVB6ncvWplAKtgNR
         iEmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si13328203qtc.99.2017.05.30.09.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFk2c-0002ze-VN
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwP-0005uJ-RY
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwP-00056Z-04
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFjwO-000566-Q9; Tue, 30 May 2017 12:24:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B784C37E65;
	Tue, 30 May 2017 16:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B784C37E65
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B784C37E65
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 315A0171A0;
	Tue, 30 May 2017 16:24:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 May 2017 18:23:59 +0200
Message-Id: <1496161442-96665-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 30 May 2017 16:24:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 4/7] numa: make hmp 'info numa' fetch numa
 nodes from qmp_query_cpus() result
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
X-TUID: ebCCOlMcXbdd

HMP command 'info numa' is the last external user that access
CPUState::numa_node field directly. In order to move it to CPU
classes that actually use it, eliminate direct access and use
an alternative approach by using result of qmp_query_cpus(),
which provides topology properties CPU threads are associated
with (including node-id).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 monitor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/monitor.c b/monitor.c
index baa73c9..9d91631 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1696,23 +1696,26 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 static void hmp_info_numa(Monitor *mon, const QDict *qdict)
 {
     int i;
-    CPUState *cpu;
     uint64_t *node_mem;
+    CpuInfoList *cpu_list, *cpu;
 
+    cpu_list = qmp_query_cpus(&error_abort);
     node_mem = g_new0(uint64_t, nb_numa_nodes);
     query_numa_node_mem(node_mem);
     monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
     for (i = 0; i < nb_numa_nodes; i++) {
         monitor_printf(mon, "node %d cpus:", i);
-        CPU_FOREACH(cpu) {
-            if (cpu->numa_node == i) {
-                monitor_printf(mon, " %d", cpu->cpu_index);
+        for (cpu = cpu_list; cpu; cpu = cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+                cpu->value->props->node_id == i) {
+                monitor_printf(mon, " %" PRIi64, cpu->value->CPU);
             }
         }
         monitor_printf(mon, "\n");
         monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
                        node_mem[i] >> 20);
     }
+    qapi_free_CpuInfoList(cpu_list);
     g_free(node_mem);
 }
 
-- 
2.7.4

