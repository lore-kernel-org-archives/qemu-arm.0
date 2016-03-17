Received: by 10.25.208.211 with SMTP id h202csp441475lfg;
        Thu, 17 Mar 2016 06:27:16 -0700 (PDT)
X-Received: by 10.140.34.170 with SMTP id l39mr14085086qgl.52.1458221236425;
        Thu, 17 Mar 2016 06:27:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si7864161qhp.6.2016.03.17.06.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agXxL-0005UV-RV
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwg-0004d1-Pa
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1agXwg-0000Go-03
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:26:34 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:8645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1agXwY-00009r-Cg; Thu, 17 Mar 2016 09:26:27 -0400
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDR74277; Thu, 17 Mar 2016 21:26:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 17 Mar 2016 21:25:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <wei@redhat.com>
Date: Thu, 17 Mar 2016 21:25:40 +0800
Message-ID: <1458221140-15232-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56EAB06E.0128, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: dcd3e050f9ff916799d0054f5dea42ed
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Subject: [Qemu-devel] [PATCH 2/2] ARM: Virt: Use gpio_key for power button
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
X-TUID: /BF36FfKcnOv

From: Shannon Zhao <shannon.zhao@linaro.org>

There is a problem for power button that it will not work if an early
system_powerdown request happens before guest gpio driver loads.

Fix this problem by using gpio_key.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 95331a5..10e385d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -581,11 +581,11 @@ static void create_rtc(const VirtBoardInfo *vbi, qemu_irq *pic)
     g_free(nodename);
 }
 
-static DeviceState *pl061_dev;
+static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
     /* use gpio Pin 3 for power button event */
-    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
+    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
 }
 
 static Notifier virt_system_powerdown_notifier = {
@@ -595,6 +595,7 @@ static Notifier virt_system_powerdown_notifier = {
 static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
 {
     char *nodename;
+    DeviceState *pl061_dev;
     hwaddr base = vbi->memmap[VIRT_GPIO].base;
     hwaddr size = vbi->memmap[VIRT_GPIO].size;
     int irq = vbi->irqmap[VIRT_GPIO];
@@ -617,6 +618,8 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
     qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "phandle", phandle);
 
+    gpio_key_dev = sysbus_create_simple("gpio_key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
     qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys");
     qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys", "compatible", "gpio-keys");
     qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#size-cells", 0);
-- 
2.0.4


