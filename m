Received: by 10.25.159.19 with SMTP id i19csp332416lfe;
        Sat, 23 Jan 2016 03:37:43 -0800 (PST)
X-Received: by 10.140.168.85 with SMTP id o82mr10480312qho.8.1453549063503;
        Sat, 23 Jan 2016 03:37:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z93si12666786qgd.106.2016.01.23.03.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwVi-0002n3-Mh
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:37:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVg-0002ms-Jg
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVd-0004ue-D3
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:40 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwVc-0004su-Gm; Sat, 23 Jan 2016 06:37:37 -0500
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDP88408; Sat, 23 Jan 2016 19:37:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:36:59 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:42 +0800
Message-ID: <1453549006-16044-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.56A365E8.00B5, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e4580f9b837dfde59bc4c696bb2fbef1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
Subject: [Qemu-arm] [PATCH v4 1/5] ARM: Virt: Add /distance-map node for NUMA
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1jc+EalJxUX+

From: Shannon Zhao <shannon.zhao@linaro.org>

This /distance-map node is used to describe the accessing distance
between NUMA nodes.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15658f4..c725e29 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -39,6 +39,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
@@ -183,6 +184,9 @@ static VirtBoardInfo *find_machine_info(const char *cpu)
 
 static void create_fdt(VirtBoardInfo *vbi)
 {
+    unsigned int i, j, number, count;
+    uint64_t *matrix;
+
     void *fdt = create_device_tree(&vbi->fdt_size);
 
     if (!fdt) {
@@ -219,6 +223,32 @@ static void create_fdt(VirtBoardInfo *vbi)
                                 "clk24mhz");
     qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vbi->clock_phandle);
 
+    if (nb_numa_nodes <= 0) {
+        return;
+    }
+
+    /* Add /distance-map node for NUMA */
+    qemu_fdt_add_subnode(fdt, "/distance-map");
+    qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
+                            "numa,distance-map-v1");
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


