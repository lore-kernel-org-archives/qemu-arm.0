Received: by 10.25.0.198 with SMTP id 189csp92732lfa;
        Wed, 3 May 2017 06:11:50 -0700 (PDT)
X-Received: by 10.200.35.73 with SMTP id b9mr31261785qtb.268.1493817110393;
        Wed, 03 May 2017 06:11:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si1822497qkd.37.2017.05.03.06.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5u4L-0003B8-Ow
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trM-0000Lw-Ch
	for qemu-devel@nongnu.org; Wed, 03 May 2017 08:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trL-0001Ca-Ih
	for qemu-devel@nongnu.org; Wed, 03 May 2017 08:58:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5trH-0001A8-5D; Wed, 03 May 2017 08:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBDEF80C0A;
	Wed,  3 May 2017 12:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EBDEF80C0A
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EBDEF80C0A
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BEE217C5A;
	Wed,  3 May 2017 12:58:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:13 +0200
Message-Id: <1493816238-33120-20-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 03 May 2017 12:58:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 19/24] numa: remove no longer need
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
X-TUID: iumNE2zcfPCr

CPUState::numa_node is still in use but now it's set by
board when it creates CPU objects. So there isn't any
need to set it again after all CPU's are created,
since it's been already set.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/sysemu/numa.h |  1 -
 numa.c                | 15 ---------------
 vl.c                  |  2 --
 3 files changed, 18 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 9077bb2..0b0a044 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -25,7 +25,6 @@ typedef struct node_info {
 
 extern NodeInfo numa_info[MAX_NODES];
 void parse_numa_opts(MachineState *ms);
-void numa_post_machine_init(void);
 void query_numa_node_mem(uint64_t node_mem[]);
 extern QemuOptsList qemu_numa_opts;
 void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
diff --git a/numa.c b/numa.c
index 06c42e9..f8c849d 100644
--- a/numa.c
+++ b/numa.c
@@ -418,21 +418,6 @@ void parse_numa_opts(MachineState *ms)
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

