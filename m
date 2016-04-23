Received: by 10.25.208.194 with SMTP id h185csp1190250lfg;
        Sat, 23 Apr 2016 02:12:54 -0700 (PDT)
X-Received: by 10.55.73.199 with SMTP id w190mr28974251qka.77.1461402774369;
        Sat, 23 Apr 2016 02:12:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si5240517qkb.84.2016.04.23.02.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 02:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1attcT-0004Wc-RM
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 05:12:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attbs-0003cg-F7
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 05:12:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attbp-00023g-76
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 05:12:16 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:18606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1attbn-000237-4U; Sat, 23 Apr 2016 05:12:13 -0400
Received: from 172.24.1.49 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAK99777; Sat, 23 Apr 2016 17:07:02 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 17:06:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 17:06:32 +0800
Message-ID: <1461402396-11776-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.571B3B37.0008, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 707e229323ce074ccfc710bf5d9e70aa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v6 1/5] ARM: Virt: Set numa-node-id for CPUs
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTQvtv8M1fqg

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a numa-node-id property to specify NUMA information for CPUs.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

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


