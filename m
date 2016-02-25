Received: by 10.25.208.211 with SMTP id h202csp2729627lfg;
        Thu, 25 Feb 2016 02:32:42 -0800 (PST)
X-Received: by 10.55.33.102 with SMTP id h99mr20591905qkh.18.1456396362369;
        Thu, 25 Feb 2016 02:32:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si7458131qgn.107.2016.02.25.02.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:32:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtDt-0006Dp-Qv
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:32:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtDr-0006BV-BA
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtDq-0001Re-JT
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:32:39 -0500
Received: from m12-14.163.com ([220.181.12.14]:53200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtDl-0001NE-IL; Thu, 25 Feb 2016 05:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=gdYLpz3nDJRx7DI7XU
	gbPW0InXSRI3FWNn8rUDRc2dg=; b=cjhj1ZWB5yU0143rkpXva2ciUx2P5/kxv4
	ZeO3voNgSSSAG7UJS8ucDmzXoKJuQQmT4mEoKH5QSldI0Vxlb+I/DkBYnOpiSMnr
	41Srh8nSAaiMKl+EjM/gOUWbFpVikCNlXtJzz0oL9qinv7MqlkFzA/soiRJzH8GU
	JzPm0f7HQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S7;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:33 +0800
Message-Id: <1456396236-2759-6-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuw4fuw48KF1Dtrb_yoW5Xr15pF
	WxZFnxtw4xGrsrXrWfJr1qqF1Ykws7t348Krn7tr4Syr17Jry5JF1kX3y8Jay7tFZ29FWf
	XaykXry5ta15taUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOTmhUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hgaxlUL9pVcogABsU
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v5 5/8] hw/timer: QOM'ify milkymist_sysctl
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
X-TUID: UWKdY1Zz3H/B

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/milkymist-sysctl.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 5f29480..30a4bc4 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -270,9 +270,10 @@ static void milkymist_sysctl_reset(DeviceState *d)
     s->regs[R_GPIO_IN] = s->strappings;
 }
 
-static int milkymist_sysctl_init(SysBusDevice *dev)
+static void milkymist_sysctl_init(Object *obj)
 {
-    MilkymistSysctlState *s = MILKYMIST_SYSCTL(dev);
+    MilkymistSysctlState *s = MILKYMIST_SYSCTL(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->gpio_irq);
     sysbus_init_irq(dev, &s->timer0_irq);
@@ -282,14 +283,18 @@ static int milkymist_sysctl_init(SysBusDevice *dev)
     s->bh1 = qemu_bh_new(timer1_hit, s);
     s->ptimer0 = ptimer_init(s->bh0);
     s->ptimer1 = ptimer_init(s->bh1);
-    ptimer_set_freq(s->ptimer0, s->freq_hz);
-    ptimer_set_freq(s->ptimer1, s->freq_hz);
 
-    memory_region_init_io(&s->regs_region, OBJECT(s), &sysctl_mmio_ops, s,
+    memory_region_init_io(&s->regs_region, obj, &sysctl_mmio_ops, s,
             "milkymist-sysctl", R_MAX * 4);
     sysbus_init_mmio(dev, &s->regs_region);
+}
 
-    return 0;
+static void milkymist_sysctl_realize(DeviceState *dev, Error **errp)
+{
+    MilkymistSysctlState *s = MILKYMIST_SYSCTL(dev);
+
+    ptimer_set_freq(s->ptimer0, s->freq_hz);
+    ptimer_set_freq(s->ptimer1, s->freq_hz);
 }
 
 static const VMStateDescription vmstate_milkymist_sysctl = {
@@ -319,9 +324,8 @@ static Property milkymist_sysctl_properties[] = {
 static void milkymist_sysctl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = milkymist_sysctl_init;
+    dc->realize = milkymist_sysctl_realize;
     dc->reset = milkymist_sysctl_reset;
     dc->vmsd = &vmstate_milkymist_sysctl;
     dc->props = milkymist_sysctl_properties;
@@ -331,6 +335,7 @@ static const TypeInfo milkymist_sysctl_info = {
     .name          = TYPE_MILKYMIST_SYSCTL,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MilkymistSysctlState),
+    .instance_init = milkymist_sysctl_init,
     .class_init    = milkymist_sysctl_class_init,
 };
 
-- 
2.1.4


