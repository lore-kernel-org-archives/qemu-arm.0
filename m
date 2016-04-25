Received: by 10.25.208.194 with SMTP id h185csp746760lfg;
        Mon, 25 Apr 2016 00:13:03 -0700 (PDT)
X-Received: by 10.140.128.80 with SMTP id 77mr35013847qha.0.1461568383454;
        Mon, 25 Apr 2016 00:13:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r142si9978552qhb.48.2016.04.25.00.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 00:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auahZ-00081p-Gk
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 03:13:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auahW-0007yt-Q4
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:12:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auahV-0008TW-Vs
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:12:58 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:54843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1auahQ-0008S3-5Q; Mon, 25 Apr 2016 03:12:53 -0400
Received: from 172.24.1.47 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY19821; Mon, 25 Apr 2016 15:12:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 15:12:22 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 15:11:46 +0800
Message-ID: <1461568306-14624-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.571DC360.00F0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: eb269745e330873feee5ab7ba02c6d4a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH v3 3/3] hw/arm/virt-acpi-build: Add PMU IRQ
 number in ACPI table
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
Cc: drjones@redhat.com, shannon.zhao@linaro.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mjatXEnjmA+q

From: Shannon Zhao <shannon.zhao@linaro.org>

Add PMU IRQ number in ACPI table, then we can use PMU in guest through
ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
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


