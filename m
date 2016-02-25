Received: by 10.25.208.211 with SMTP id h202csp2730615lfg;
        Thu, 25 Feb 2016 02:35:29 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr54174984qka.58.1456396529489;
        Thu, 25 Feb 2016 02:35:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o124si7460514qho.101.2016.02.25.02.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:35:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtGa-0002RG-V5
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:35:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtF2-0008Ra-UO
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEy-0001wH-SJ
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:52 -0500
Received: from m12-14.163.com ([220.181.12.14]:57259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtEy-0001vl-DO; Thu, 25 Feb 2016 05:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=N63LTJsMMqKQ7BTN0S
	a6EkM+ARVSdj/QepzsfUsRjcw=; b=i4ftoN6ncXk9UcqrE+rURUj6u5kJDwdE3p
	oLcBub9LA58lVFO9jqNAFlc+/k2iw3aNU2qSSkPvAP6P2ldAmUf2f/biBnXwjC6X
	fhgsZTtiGpIPxHCgHZ9UWpyOk9oV6gWjGTk7ZKt7ZP1m19yc0amWRPwN3EnG5qH9
	aUtwtXkqQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S4;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:30 +0800
Message-Id: <1456396236-2759-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4kKw1kJw17Zw13Gr1UAwb_yoW8uF1Dpa
	yxCF17Gr48JrsrXr4fJFn7GF98Jr1kAr1kGryxJwsavFyIkr1rtF4vy3yayFW2kFWv9FW3
	ArWrXFyrZw45G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4uWLUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhgaxlWBPSnBvwAAss
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v5 2/8] hw/timer: QOM'ify lm32_timer
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
X-TUID: iamIPhi72onP

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


