Received: by 10.25.208.211 with SMTP id h202csp93550lfg;
        Fri, 25 Mar 2016 03:13:50 -0700 (PDT)
X-Received: by 10.141.5.130 with SMTP id h124mr17176834qhd.89.1458900830161;
        Fri, 25 Mar 2016 03:13:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si10134396qge.116.2016.03.25.03.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Mar 2016 03:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ajOkQ-0007mR-Dm
	for alex.bennee@linaro.org; Fri, 25 Mar 2016 06:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ajOkN-0007jb-23
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 06:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ajOkM-0003W0-5G
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 06:13:38 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:62357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ajOkG-0003V5-Du; Fri, 25 Mar 2016 06:13:33 -0400
Received: from 172.24.1.51 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BYR60584; Fri, 25 Mar 2016 17:46:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 25 Mar 2016 17:46:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2016 17:46:21 +0800
Message-ID: <1458899181-17896-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.56F50912.00BF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 09bccc8acef0df7f4b115ade2e6e1045
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/virt-acpi-build: Add PMU IRQ number
	in ACPI table
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
X-TUID: Wma28GMsN65d

From: Shannon Zhao <shannon.zhao@linaro.org>

Add PMU IRQ number in ACPI table, then we can use PMU in guest through
ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6a86b2c..7a377e5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -490,6 +490,9 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
         gicc->arm_mpidr = armcpu->mp_affinity;
         gicc->uid = i;
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
+
+        if (armcpu->has_pmu)
+            gicc->performance_interrupt = VIRTUAL_PMU_IRQ + 16;
     }
 
     if (guest_info->gic_version == 3) {
-- 
2.0.4


