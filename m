Received: by 10.25.0.6 with SMTP id 6csp240670lfa;
        Wed, 10 May 2017 04:36:40 -0700 (PDT)
X-Received: by 10.200.33.240 with SMTP id 45mr5329020qtz.111.1494416200874;
        Wed, 10 May 2017 04:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416200; cv=none;
        d=google.com; s=arc-20160816;
        b=uCA26I1TNevYvKbJrAa7RjpxmvF+qjIuL12bLAEFLmRxH2+pxZf5CQdj1E9DSrheMc
         RQFNQFl+J0ztkp6jU1zionyQPWFiX7oQWgPmf4OPZHOC1+IiHYNRAtzpQ3+MfVus02Nh
         PErdN3uFSdvXvv6iWjiULOgYbaroHKtmkGCxIco5lTrm6gWJ41XkQk7A0DHpHStcr5HT
         uUe1GimU3aSCnnr7+AqaPAE7+U0sok6dp7AbHaEBQpFEp1QD/kqEp8sHfejybsQByILT
         sk09H+C59ceon4WFjIiI8R4cWS959vYV6Gxl65l3pJ+wR04SbEpEu+mJ+TEg8lC/zrod
         pbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=nSNZJLkNqmwFFawrqcjrqOTsUmGMWZcS92dQGnwVUVI=;
        b=grEqWyqAkh1p0ubT9MA//aaLFhGOwlXQCqGdVhQOrEGh6IoxbCaYznVc0cMTWVczvq
         kzF1cfGUHNJa6zN0x9mNaaqnsoZp1BO51u+ZDvmhFe5SxoZM3pCqzR2OJTwVZy892cih
         NdyeLyYVn1SPgUsb3CJn7vYtPYom7omnLOmhsxQcJBUTy9XwoNXQE8v2Ws8ug/olCABV
         muq5OzdUtCUlQrzESKeHb0eZivLWMfDV5yXks5l6lmORNMXRuv5r/0ZxLwUnwHZgVZdQ
         XP5g4jbvenIXx8P5HzC087QwuY9Qy1l8BF4nWqzLYHF1ziMkq7phnQORLcfHG+OL10PH
         aJoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si2910543qkf.138.2017.05.10.04.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pv6-0004BX-7z
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpO-0007tB-8B
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpN-0001pO-CC
	for qemu-devel@nongnu.org; Wed, 10 May 2017 07:30:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpL-0001oE-5d; Wed, 10 May 2017 07:30:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12C6765D04;
	Wed, 10 May 2017 11:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 12C6765D04
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 12C6765D04
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0F17DFF5;
	Wed, 10 May 2017 11:30:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:57 +0200
Message-Id: <1494415802-227633-14-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 10 May 2017 11:30:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 13/18] numa: remove no longer need
 numa_post_machine_init()
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
X-TUID: 7+Rj2fp2U6tK

CPUState::numa_node is still in use but now it's set by
board when it creates CPU objects. So there isn't any
need to set it again after all CPU's are created,
since it's been already set.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 include/sysemu/numa.h |  6 ------
 numa.c                | 15 ---------------
 vl.c                  |  2 --
 3 files changed, 23 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 027830c..8cb3ebc 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -27,7 +27,6 @@ struct node_info {
 
 extern NodeInfo numa_info[MAX_NODES];
 void parse_numa_opts(MachineState *ms);
-void numa_post_machine_init(void);
 void query_numa_node_mem(uint64_t node_mem[]);
 extern QemuOptsList qemu_numa_opts;
 void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
@@ -37,9 +36,4 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size);
 void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                   int nb_nodes, ram_addr_t size);
-
-
-/* on success returns node index in numa_info,
- * on failure returns nb_numa_nodes */
-int numa_get_node_for_cpu(int idx);
 #endif
diff --git a/numa.c b/numa.c
index f16a6a8..dc739ea 100644
--- a/numa.c
+++ b/numa.c
@@ -572,21 +572,6 @@ void parse_numa_opts(MachineState *ms)
     }
 }
 
-void numa_post_machine_init(void)
-{
-    CPUState *cpu;
-    int i;
-
-    CPU_FOREACH(cpu) {
-        for (i = 0; i < nb_numa_nodes; i++) {
-            assert(cpu->cpu_index < max_cpus);
-            if (test_bit(cpu->cpu_index, numa_info[i].node_cpu)) {
-                cpu->numa_node = i;
-            }
-        }
-    }
-}
-
 static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
                                            const char *name,
                                            uint64_t ram_size)
diff --git a/vl.c b/vl.c
index c63f4d5..fe4741d 100644
--- a/vl.c
+++ b/vl.c
@@ -4595,8 +4595,6 @@ int main(int argc, char **argv, char **envp)
 
     cpu_synchronize_all_post_init();
 
-    numa_post_machine_init();
-
     rom_reset_order_override();
 
     /*
-- 
2.7.4

