Received: by 10.25.15.230 with SMTP id 99csp260744lfp;
        Wed, 22 Mar 2017 06:42:55 -0700 (PDT)
X-Received: by 10.233.223.198 with SMTP id t189mr10239983qkf.292.1490190175347;
        Wed, 22 Mar 2017 06:42:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si1107154qkf.257.2017.03.22.06.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgXO-0007CW-Q1
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:42:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPU-0008UF-0G
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPQ-0002Af-8m
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgPQ-0002AQ-2W; Wed, 22 Mar 2017 09:34:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDFF2915BE;
	Wed, 22 Mar 2017 13:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CDFF2915BE
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CDFF2915BE
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC170A5662;
	Wed, 22 Mar 2017 13:34:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:42 +0100
Message-Id: <1490189568-167621-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 Mar 2017 13:34:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 17/23] numa: remove no longer used
 numa_get_node_for_cpu()
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
X-TUID: CPIqhltOGif1

it's been replaced by fetching mapping info from possible_cpus

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/sysemu/numa.h |  4 ----
 numa.c                | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 46ea6c7..c67763a 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -31,8 +31,4 @@ extern QemuOptsList qemu_numa_opts;
 void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
 void numa_unset_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
 uint32_t numa_get_node(ram_addr_t addr, Error **errp);
-
-/* on success returns node index in numa_info,
- * on failure returns nb_numa_nodes */
-int numa_get_node_for_cpu(int idx);
 #endif
diff --git a/numa.c b/numa.c
index ab41776..187c93f 100644
--- a/numa.c
+++ b/numa.c
@@ -583,20 +583,6 @@ MemdevList *qmp_query_memdev(Error **errp)
     return list;
 }
 
-int numa_get_node_for_cpu(int idx)
-{
-    int i;
-
-    assert(idx < max_cpus);
-
-    for (i = 0; i < nb_numa_nodes; i++) {
-        if (test_bit(idx, numa_info[i].node_cpu)) {
-            break;
-        }
-    }
-    return i;
-}
-
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
-- 
2.7.4

