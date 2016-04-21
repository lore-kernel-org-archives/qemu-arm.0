Received: by 10.25.208.194 with SMTP id h185csp2717031lfg;
        Wed, 20 Apr 2016 23:28:48 -0700 (PDT)
X-Received: by 10.55.42.19 with SMTP id q19mr17036232qkh.79.1461220128824;
        Wed, 20 Apr 2016 23:28:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si640464qkc.192.2016.04.20.23.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 23:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1at86a-0000b4-CI
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 02:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at861-00080F-Mu
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 02:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at85y-0002lI-EL
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 02:28:13 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1at85x-0002jz-So; Thu, 21 Apr 2016 02:28:10 -0400
Received: from 172.24.1.49 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAI17805; Thu, 21 Apr 2016 14:24:42 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 21 Apr 2016 14:24:17 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:23:51 +0800
Message-ID: <1461219834-10416-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.5718722B.00D2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 56bda102a1cdaeb5fb73adbd2ff3bbe3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v5 2/5] ARM: Virt: Set numa-node-id for CPUs
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
X-TUID: 5MCab1/muxgb

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a numa-node-id property to specify NUMA information for CPUs.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 814a1eb..d21e9a0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -359,6 +359,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
 {
     int cpu;
     int addr_cells = 1;
+    unsigned int i;
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -408,6 +409,12 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
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


