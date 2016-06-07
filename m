Received: by 10.25.27.66 with SMTP id b63csp1783373lfb;
        Mon, 6 Jun 2016 19:49:17 -0700 (PDT)
X-Received: by 10.140.181.70 with SMTP id c67mr19496906qha.20.1465267757501;
        Mon, 06 Jun 2016 19:49:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p21si12793155qka.202.2016.06.06.19.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 19:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bA74u-0005aO-RR
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 22:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA72y-0004Jp-MR
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bA72l-0003W1-1Y
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 22:47:15 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:14314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bA72k-0003VY-Ci; Mon, 06 Jun 2016 22:47:02 -0400
Received: from 172.24.1.137 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CCU77794; Tue, 07 Jun 2016 10:46:41 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 7 Jun 2016 10:46:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 10:46:17 +0800
Message-ID: <1465267577-1808-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
References: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.57563595.003F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d0cb3afe19f1fb8841bf0d761378b8d1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-devel] [PATCH v5 3/3] hw/arm/virt-acpi-build: Add PMU IRQ
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wt8ZXcw6DtIp

From: Shannon Zhao <shannon.zhao@linaro.org>

Add PMU IRQ number in ACPI table, then we can use PMU in guest through
ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 83a5420..2586769 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -539,6 +539,10 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
         gicc->arm_mpidr = armcpu->mp_affinity;
         gicc->uid = i;
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
+
+        if (armcpu->has_pmu) {
+            gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
+        }
     }
 
     if (guest_info->gic_version == 3) {
-- 
2.0.4


