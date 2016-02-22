Received: by 10.25.208.211 with SMTP id h202csp970196lfg;
        Sun, 21 Feb 2016 19:18:22 -0800 (PST)
X-Received: by 10.55.77.148 with SMTP id a142mr31451227qkb.44.1456111102089;
        Sun, 21 Feb 2016 19:18:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13si27506738qhc.70.2016.02.21.19.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh0u-0002P2-WD
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:18:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzu-0000mQ-Qf
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzr-0007Vc-L5
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:18 -0500
Received: from m12-16.163.com ([220.181.12.16]:54222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXgzo-0007Rf-E2; Sun, 21 Feb 2016 22:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=gdYLpz3nDJRx7DI7XU
	gbPW0InXSRI3FWNn8rUDRc2dg=; b=N+uZ/tppahF60q6wjEdsYJD12NAVhM8Et6
	PtQOVp05+FEwZwO2HR7dc6OxvRacAMZPE1UZTbF2M02sVVP9iNHJJnvufqvQ0kRw
	NQ68auR4HYTHQqqo27S77Rv+hKEakbeNxnPuEqHlikmo9GkIIPLD4rt1FzyTcfrU
	xraWbu48c=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S8;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:30 +0800
Message-Id: <1456110933-5457-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuw4fuw48KF1Dtrb_yoW5Xr15pF
	WxZFnxtw4xGrsrXrWfJr1qqF1Ykws7t348Krn7tr4Syr17Jry5JF1kX3y8Jay7tFZ29FWf
	XaykXry5ta15taUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkOzsUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTB0XxlSINffcugAAs4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 6/9] hw/timer: QOM'ify milkymist_sysctl
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
X-TUID: hIX1PpR9sQsQ

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


