Received: by 10.25.159.19 with SMTP id i19csp332502lfe;
        Sat, 23 Jan 2016 03:38:01 -0800 (PST)
X-Received: by 10.55.75.212 with SMTP id y203mr10020206qka.3.1453549081409;
        Sat, 23 Jan 2016 03:38:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si12671699qgf.113.2016.01.23.03.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwW0-0003To-VI
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:38:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVy-0003RB-RM
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVv-00050G-LZ
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:58 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwVu-0004zJ-Rx; Sat, 23 Jan 2016 06:37:55 -0500
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDP88411; Sat, 23 Jan 2016 19:37:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:37:00 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:43 +0800
Message-ID: <1453549006-16044-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56A365E8.0109, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c3614750229bc6319925f75e050cc26a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, ganapatrao.kulkarni@caviumnetworks.com,
	hanjun.guo@linaro.org
Subject: [Qemu-arm] [PATCH v4 2/5] ARM: Virt: Set numa-node-id for CPUs
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
X-TUID: YHwJcrOAXs9n

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a numa-node-id property to specify NUMA information for CPUs.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c725e29..14265b1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -335,6 +335,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
 {
     int cpu;
     int addr_cells = 1;
+    unsigned int i;
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -384,6 +385,12 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
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


