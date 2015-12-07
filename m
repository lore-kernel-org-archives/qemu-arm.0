Received: by 10.182.158.201 with SMTP id ww9csp2142115obb;
        Sun, 6 Dec 2015 23:41:22 -0800 (PST)
X-Received: by 10.140.152.150 with SMTP id 144mr37695967qhy.8.1449474082108;
        Sun, 06 Dec 2015 23:41:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si18672064qge.59.2015.12.06.23.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:41:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qQD-0002tJ-PO
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:41:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPX-0001rk-S7
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 02:40:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPW-0004OX-Tg
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 02:40:39 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:9817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qPR-0004NL-Lk; Mon, 07 Dec 2015 02:40:34 -0500
Received: from 172.24.1.51 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CXN21086; Mon, 07 Dec 2015 15:40:23 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:13 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:52 +0800
Message-ID: <1449473992-11560-9-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.566537E7.00E1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7e5b2ee34063a37cc93a0a74bf01d38b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-devel] [PATCH v4 8/8] ARM: Virt: Add gpio-keys node for
	Poweroff using DT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jVsQaind2HTN

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a gpio-keys node. This is used for Poweroff for the systems which
use DT not ACPI.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cb1d45b..bd6781bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -52,6 +52,7 @@
 #include "kvm_arm.h"
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
+#include <linux/input.h>
 
 /* Number of external interrupt lines to configure the GIC with */
 #define NUM_IRQS 256
@@ -561,6 +562,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
 
     pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
 
+    uint32_t phandle = qemu_fdt_alloc_phandle(vbi->fdt);
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
     qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
@@ -573,6 +575,20 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
     qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(vbi->fdt, nodename, "phandle", phandle);
+
+    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys");
+    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys", "compatible", "gpio-keys");
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#size-cells", 0);
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#address-cells", 1);
+
+    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys/poweroff");
+    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys/poweroff",
+                            "label", "GPIO Key Poweroff");
+    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys/poweroff", "linux,code",
+                          KEY_POWER);
+    qemu_fdt_setprop_cells(vbi->fdt, "/gpio-keys/poweroff",
+                           "gpios", phandle, 3, 0);
 
     /* connect powerdown request */
     qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-- 
2.0.4


