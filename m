Received: by 10.25.208.194 with SMTP id h185csp2718217lfg;
        Wed, 20 Apr 2016 23:31:55 -0700 (PDT)
X-Received: by 10.55.78.70 with SMTP id c67mr17197176qkb.37.1461220315579;
        Wed, 20 Apr 2016 23:31:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si674423qhg.9.2016.04.20.23.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 23:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1at89b-0007bC-1z
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 02:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at89N-00078k-Tx
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at89K-0003N1-KG
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:31:41 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:56726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1at89A-0003MU-WE; Thu, 21 Apr 2016 02:31:29 -0400
Received: from 172.24.1.49 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAI17807; Thu, 21 Apr 2016 14:24:43 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 21 Apr 2016 14:24:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:23:50 +0800
Message-ID: <1461219834-10416-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5718722C.006F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 78d7aa2fd3ba5acf461105472963fc74
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v5 1/5] ARM: Virt: Add /distance-map node for NUMA
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
X-TUID: TVt0bGFMkC8K

From: Shannon Zhao <shannon.zhao@linaro.org>

This /distance-map node is used to describe the accessing distance
between NUMA nodes.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 56d35c7..814a1eb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -40,6 +40,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
@@ -203,6 +204,9 @@ static VirtBoardInfo *find_machine_info(const char *cpu)
 
 static void create_fdt(VirtBoardInfo *vbi)
 {
+    unsigned int i, j, number, count;
+    uint64_t *matrix;
+
     void *fdt = create_device_tree(&vbi->fdt_size);
 
     if (!fdt) {
@@ -239,6 +243,32 @@ static void create_fdt(VirtBoardInfo *vbi)
                                 "clk24mhz");
     qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vbi->clock_phandle);
 
+    if (nb_numa_nodes <= 0) {
+        return;
+    }
+
+    /* Add /distance-map node for NUMA */
+    qemu_fdt_add_subnode(fdt, "/distance-map");
+    qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
+                            "numa-distance-map-v1");
+
+    number = nb_numa_nodes * nb_numa_nodes * 6;
+    matrix = g_malloc0(number * sizeof(uint64_t));
+    for (i = 0; i < nb_numa_nodes; i++) {
+        for (j = 0; j < nb_numa_nodes; j++) {
+            count = (i * nb_numa_nodes + j) * 6;
+            matrix[count++] = 1;
+            matrix[count++] = i;
+            matrix[count++] = 1;
+            matrix[count++] = j;
+            matrix[count++] = 1;
+            matrix[count++] = (i == j) ? 10 : 20;
+        }
+    }
+    qemu_fdt_setprop_sized_cells_from_array(fdt, "/distance-map",
+                                            "distance-matrix", number / 2,
+                                            matrix);
+    g_free(matrix);
 }
 
 static void fdt_add_psci_node(const VirtBoardInfo *vbi)
-- 
2.0.4


