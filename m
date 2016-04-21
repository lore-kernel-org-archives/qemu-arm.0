Received: by 10.25.208.194 with SMTP id h185csp2717919lfg;
        Wed, 20 Apr 2016 23:31:12 -0700 (PDT)
X-Received: by 10.140.92.39 with SMTP id a36mr15350510qge.39.1461220272081;
        Wed, 20 Apr 2016 23:31:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si672348qhh.3.2016.04.20.23.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 23:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1at88t-000664-HS
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 02:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at88P-0005AV-1p
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at88K-0003Gs-TI
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:30:40 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:55801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1at88D-0003G4-2T; Thu, 21 Apr 2016 02:30:29 -0400
Received: from 172.24.1.50 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAI18020; Thu, 21 Apr 2016 14:26:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 21 Apr 2016 14:24:17 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:23:52 +0800
Message-ID: <1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.57187284.0128, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4b9b3d0af375da1c9cf0320f8b919172
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v5 3/5] ARM: Add numa-node-id for /memory node
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pecgWdzmEc41

From: Shannon Zhao <shannon.zhao@linaro.org>

When specifying NUMA for ARM machine, generate /memory node according to
NUMA topology.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/boot.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5975fbf..3770235 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -14,6 +14,7 @@
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
@@ -405,6 +406,9 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     void *fdt = NULL;
     int size, rc;
     uint32_t acells, scells;
+    char *nodename;
+    unsigned int i;
+    hwaddr mem_base, mem_len;
 
     if (binfo->dtb_filename) {
         char *filename;
@@ -456,14 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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
+        /* Set the numa-node-id for the first /memory node. */
+        qemu_fdt_setprop_cell(fdt, "/memory", "numa-node-id", 0);
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


