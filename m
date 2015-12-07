Received: by 10.182.158.201 with SMTP id ww9csp2142699obb;
        Sun, 6 Dec 2015 23:42:58 -0800 (PST)
X-Received: by 10.140.230.134 with SMTP id a128mr36687906qhc.33.1449474178453;
        Sun, 06 Dec 2015 23:42:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f144si19870435qhc.96.2015.12.06.23.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qRm-000641-5E
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:42:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPV-0001ob-O6
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPS-0004OE-EQ
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:37 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:9813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qPR-0004N3-Lt; Mon, 07 Dec 2015 02:40:34 -0500
Received: from 172.24.1.51 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CXN21085; Mon, 07 Dec 2015 15:40:23 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:12 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:51 +0800
Message-ID: <1449473992-11560-8-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.566537E7.0094, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b2b64ab900478849d37bdb0df6e61010
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 7/8] ARM: Virt: Add QEMU powerdown notifier
	and hook it to GPIO Pin 3
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
X-TUID: r2nzRrEMB84Z

From: Shannon Zhao <shannon.zhao@linaro.org>

Currently mach-virt model doesn't support powerdown request. Guest VM
doesn't react to system_powerdown from monitor console (or QMP) because
there is no communication mechanism for such requests. This patch registers
GPIO Pin 3 with powerdown notification. So guest VM can receive notification
when such powerdown request is triggered.

Signed-off-by: Wei Huang <wei@redhat.com>
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Wei Huang <wei@redhat.com>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7977e3c..cb1d45b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -540,6 +540,17 @@ static void create_rtc(const VirtBoardInfo *vbi, qemu_irq *pic)
     g_free(nodename);
 }
 
+static DeviceState *pl061_dev;
+static void virt_powerdown_req(Notifier *n, void *opaque)
+{
+    /* use gpio Pin 3 for power button event */
+    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
+}
+
+static Notifier virt_system_powerdown_notifier = {
+    .notify = virt_powerdown_req
+};
+
 static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
 {
     char *nodename;
@@ -548,7 +559,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
     int irq = vbi->irqmap[VIRT_GPIO];
     const char compat[] = "arm,pl061\0arm,primecell";
 
-    sysbus_create_simple("pl061", base, pic[irq]);
+    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
 
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
@@ -563,6 +574,9 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
     qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
 
+    /* connect powerdown request */
+    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
+
     g_free(nodename);
 }
 
-- 
2.0.4


