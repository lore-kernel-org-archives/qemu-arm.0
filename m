Received: by 10.25.159.19 with SMTP id i19csp333140lfe;
        Sat, 23 Jan 2016 03:40:12 -0800 (PST)
X-Received: by 10.140.19.52 with SMTP id 49mr9585973qgg.65.1453549212320;
        Sat, 23 Jan 2016 03:40:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si12666574qgf.122.2016.01.23.03.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:40:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwY7-0007qJ-Qt
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:40:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwX9-0006CB-AJ
	for qemu-devel@nongnu.org; Sat, 23 Jan 2016 06:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwX8-0005N2-9Q
	for qemu-devel@nongnu.org; Sat, 23 Jan 2016 06:39:11 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwX3-0005L2-5i; Sat, 23 Jan 2016 06:39:05 -0500
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDP88410; Sat, 23 Jan 2016 19:37:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:37:00 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:44 +0800
Message-ID: <1453549006-16044-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.56A365E8.013A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 29715f2b481925c4b2ebb8dce0e62ab2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
Subject: [Qemu-devel] [PATCH v4 3/5] ARM: Add numa-node-id for /memory node
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fx3XPW9pp0AC

From: Shannon Zhao <shannon.zhao@linaro.org>

When specifying NUMA for ARM machine, generate /memory node according to
NUMA topology.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/boot.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 7742dd3..10f3615 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -13,6 +13,7 @@
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
@@ -353,6 +354,9 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     void *fdt = NULL;
     int size, rc;
     uint32_t acells, scells;
+    char *nodename;
+    unsigned int i;
+    hwaddr mem_base, mem_len;
 
     if (binfo->dtb_filename) {
         char *filename;
@@ -402,14 +406,37 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         goto fail;
     }
 
+    mem_len = (nb_numa_nodes > 0) ? numa_info[0].node_mem : binfo->ram_size;
     rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
                                       acells, binfo->loader_start,
-                                      scells, binfo->ram_size);
+                                      scells, mem_len);
     if (rc < 0) {
         fprintf(stderr, "couldn't set /memory/reg\n");
         goto fail;
     }
 
+    if (nb_numa_nodes > 0) {
+        /* create /memory node and set properties for other memory numa nodes */
+        mem_base = binfo->loader_start + mem_len;
+        for (i = 1; i < nb_numa_nodes; i++) {
+            mem_len = numa_info[i].node_mem;
+            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+            qemu_fdt_add_subnode(fdt, nodename);
+            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                              acells, mem_base,
+                                              scells, mem_len);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /memory/reg\n");
+                goto fail;
+            }
+
+            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
+            mem_base += mem_len;
+            g_free(nodename);
+        }
+    }
+
     if (binfo->kernel_cmdline && *binfo->kernel_cmdline) {
         rc = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                      binfo->kernel_cmdline);
-- 
2.0.4


