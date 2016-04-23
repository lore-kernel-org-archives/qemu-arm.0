Received: by 10.25.208.194 with SMTP id h185csp1207890lfg;
        Sat, 23 Apr 2016 03:06:13 -0700 (PDT)
X-Received: by 10.141.47.66 with SMTP id y63mr16090277qhe.74.1461405973433;
        Sat, 23 Apr 2016 03:06:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si5542886qhv.31.2016.04.23.03.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 03:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atuS4-0008BI-RS
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 06:06:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQw-00064e-6b
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 06:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atuQr-0005uE-D0
	for qemu-devel@nongnu.org; Sat, 23 Apr 2016 06:05:02 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atuQq-0005to-98; Sat, 23 Apr 2016 06:04:57 -0400
Received: from 172.24.1.47 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DJI66787; Sat, 23 Apr 2016 18:04:38 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml422-hub.china.huawei.com (10.82.67.152) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 18:04:27 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 18:04:15 +0800
Message-ID: <1461405855-15576-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.571B48B7.0185, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 262495335b912ea68b8863ff740aa697
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: [Qemu-devel] [PATCH v2 3/3] hw/arm/virt-acpi-build: Add PMU IRQ
 number in ACPI table
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
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qLrYgccXVq2t

From: Shannon Zhao <shannon.zhao@linaro.org>

Add PMU IRQ number in ACPI table, then we can use PMU in guest through
ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f51fe39..5031232 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -491,6 +491,9 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
         gicc->arm_mpidr = armcpu->mp_affinity;
         gicc->uid = i;
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
+
+        if (armcpu->has_pmu)
+            gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
     }
 
     if (guest_info->gic_version == 3) {
-- 
2.0.4


