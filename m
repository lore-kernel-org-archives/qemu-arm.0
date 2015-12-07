Received: by 10.182.158.201 with SMTP id ww9csp2143369obb;
        Sun, 6 Dec 2015 23:44:58 -0800 (PST)
X-Received: by 10.140.36.232 with SMTP id p95mr34868617qgp.55.1449474298150;
        Sun, 06 Dec 2015 23:44:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si23561363qgf.2.2015.12.06.23.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qTh-0007yN-QZ
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTd-0007rS-L9
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTc-0005nd-OC
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:44:53 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:2611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qTb-0005lW-SW; Mon, 07 Dec 2015 02:44:52 -0500
Received: from 172.24.1.50 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSG33289; Mon, 07 Dec 2015 15:40:18 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:11 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:50 +0800
Message-ID: <1449473992-11560-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.566537E2.010D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 40ffed225c9061ff1fd46c0950b0c6bd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 6/8] ARM: ACPI: Add _E03 for Power Button
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
X-TUID: ot9BTUxYNDT1

From: Shannon Zhao <shannon.zhao@linaro.org>

Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1424672..d693135 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -338,6 +338,20 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
                                   AML_EXCLUSIVE, gpio_irq));
     aml_append(dev, aml_name_decl("_CRS", crs));
+
+    Aml *aei = aml_resource_template();
+    /* Pin 3 for power button */
+    const uint32_t pin_list[1] = {3};
+    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
+                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE, AML_PULL_UP, 0,
+                                 pin_list, 1, "GPO0", NULL, 0));
+    aml_append(dev, aml_name_decl("_AEI", aei));
+
+    /* _E03 is handle for power button */
+    Aml *method = aml_method("_E03", 0);
+    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
+                                  aml_int(0x80)));
+    aml_append(dev, method);
     aml_append(scope, dev);
 }
 
-- 
2.0.4


