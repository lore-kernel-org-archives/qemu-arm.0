Received: by 10.25.208.211 with SMTP id h202csp970180lfg;
        Sun, 21 Feb 2016 19:18:17 -0800 (PST)
X-Received: by 10.140.135.84 with SMTP id 81mr28301886qhh.26.1456111097650;
        Sun, 21 Feb 2016 19:18:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j201si27476149qhc.131.2016.02.21.19.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:18:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh0q-0002Gd-Sv
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:18:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzu-0000mY-Rv
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzs-0007Vi-3R
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:18 -0500
Received: from m12-16.163.com ([220.181.12.16]:54230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXgzp-0007Rm-2b; Sun, 21 Feb 2016 22:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=N63LTJsMMqKQ7BTN0S
	a6EkM+ARVSdj/QepzsfUsRjcw=; b=Y7Sduq8Q09W3nsAcJMcJbsKT/Sis6Pr9OI
	qYCXOkmoO/U8F3ImFbPkXbcXe6o96InAHFoIHaNFGPlWIpJdB5fwg0OQNcMWS53i
	t+ZUTG4qUqtRw61xZbmep38rtOcqQ8sGDSeb4cj37AJfm5Juoj3WZ/9G+3+36Fcv
	W9lsqtXlE=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S5;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:27 +0800
Message-Id: <1456110933-5457-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4kKw1kJw17Zw13Gr1UAwb_yoW8uF1Dpa
	yxCF17Gr48JrsrXr4fJFn7GF98Jr1kAr1kGryxJwsavFyIkr1rtF4vy3yayFW2kFWv9FW3
	ArWrXFyrZw45G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jLhL8UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEB0XxlUL61WOsAACsA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 3/9] hw/timer: QOM'ify lm32_timer
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
X-TUID: HVuzCciA4vvM

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/lm32_timer.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 3198355..e45a65b 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -176,21 +176,26 @@ static void timer_reset(DeviceState *d)
     ptimer_stop(s->ptimer);
 }
 
-static int lm32_timer_init(SysBusDevice *dev)
+static void lm32_timer_init(Object *obj)
 {
-    LM32TimerState *s = LM32_TIMER(dev);
+    LM32TimerState *s = LM32_TIMER(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->irq);
 
     s->bh = qemu_bh_new(timer_hit, s);
     s->ptimer = ptimer_init(s->bh);
-    ptimer_set_freq(s->ptimer, s->freq_hz);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &timer_ops, s,
+    memory_region_init_io(&s->iomem, obj, &timer_ops, s,
                           "timer", R_MAX * 4);
     sysbus_init_mmio(dev, &s->iomem);
+}
 
-    return 0;
+static void lm32_timer_realize(DeviceState *dev, Error **errp)
+{
+    LM32TimerState *s = LM32_TIMER(dev);
+
+    ptimer_set_freq(s->ptimer, s->freq_hz);
 }
 
 static const VMStateDescription vmstate_lm32_timer = {
@@ -213,9 +218,8 @@ static Property lm32_timer_properties[] = {
 static void lm32_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = lm32_timer_init;
+    dc->realize = lm32_timer_realize;
     dc->reset = timer_reset;
     dc->vmsd = &vmstate_lm32_timer;
     dc->props = lm32_timer_properties;
@@ -225,6 +229,7 @@ static const TypeInfo lm32_timer_info = {
     .name          = TYPE_LM32_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(LM32TimerState),
+    .instance_init = lm32_timer_init,
     .class_init    = lm32_timer_class_init,
 };
 
-- 
2.1.4


