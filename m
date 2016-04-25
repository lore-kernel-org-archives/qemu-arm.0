Received: by 10.25.208.194 with SMTP id h185csp769398lfg;
        Mon, 25 Apr 2016 01:11:10 -0700 (PDT)
X-Received: by 10.55.117.5 with SMTP id q5mr16966581qkc.195.1461571870904;
        Mon, 25 Apr 2016 01:11:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h129si9854987qkf.258.2016.04.25.01.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 01:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubbp-0004Kb-3I
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 04:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubbl-0004ES-A9
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubbk-0005i0-7u
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:11:05 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:40221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubbd-0005h6-SV; Mon, 25 Apr 2016 04:10:58 -0400
Received: from 172.24.1.136 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAM77960; Mon, 25 Apr 2016 16:07:33 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 16:07:26 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 16:05:43 +0800
Message-ID: <1461571547-13132-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571DD046.001C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 89ba1d083c912329d1f52f39a33eb6b3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v7 1/5] ARM: Virt: Set numa-node-id for cpu and
 memory nodes
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
X-TUID: spaw75Dx5kIp

From: Shannon Zhao <shannon.zhao@linaro.org>

Generate memory nodes according to NUMA topology. Set numa-node-id
property for cpu and memory nodes.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/boot.c | 43 +++++++++++++++++++++++++++++++++++++------
 hw/arm/virt.c |  8 ++++++++
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5975fbf..cbc65a7 100644
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
@@ -456,12 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         goto fail;
     }
 
-    rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
-                                      acells, binfo->loader_start,
-                                      scells, binfo->ram_size);
-    if (rc < 0) {
-        fprintf(stderr, "couldn't set /memory/reg\n");
-        goto fail;
+    if (nb_numa_nodes > 0) {
+        /*
+         * Turn the /memory node created before into a NOP node, then create
+         * /memory@addr nodes for all numa nodes respectively.
+         */
+        qemu_fdt_nop_node(fdt, "/memory");
+        mem_base = binfo->loader_start;
+        for (i = 0; i < nb_numa_nodes; i++) {
+            mem_len = numa_info[i].node_mem;
+            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+            qemu_fdt_add_subnode(fdt, nodename);
+            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                              acells, mem_base,
+                                              scells, mem_len);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
+                        i);
+                goto fail;
+            }
+
+            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
+            mem_base += mem_len;
+            g_free(nodename);
+        }
+    } else {
+        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
+                                          acells, binfo->loader_start,
+                                          scells, binfo->ram_size);
+        if (rc < 0) {
+            fprintf(stderr, "couldn't set /memory/reg\n");
+            goto fail;
+        }
     }
 
     if (binfo->kernel_cmdline && *binfo->kernel_cmdline) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 56d35c7..fe6b11d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -38,6 +38,7 @@
 #include "net/net.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/boards.h"
@@ -329,6 +330,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
 {
     int cpu;
     int addr_cells = 1;
+    unsigned int i;
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -378,6 +380,12 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
                                   armcpu->mp_affinity);
         }
 
+        for (i = 0; i < nb_numa_nodes; i++) {
+            if (test_bit(cpu, numa_info[i].node_cpu)) {
+                qemu_fdt_setprop_cell(vbi->fdt, nodename, "numa-node-id", i);
+            }
+        }
+
         g_free(nodename);
     }
 }
-- 
2.0.4


