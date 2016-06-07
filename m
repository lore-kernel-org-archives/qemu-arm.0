Received: by 10.25.27.66 with SMTP id b63csp1933215lfb;
        Tue, 7 Jun 2016 03:40:34 -0700 (PDT)
X-Received: by 10.55.15.158 with SMTP id 30mr20812875qkp.31.1465296034646;
        Tue, 07 Jun 2016 03:40:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si13666560qgh.119.2016.06.07.03.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAER0-0000IZ-1u
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:40:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENa-0005aa-TT
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENZ-0002b6-RN
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:37:02 -0400
Received: from m12-18.163.com ([220.181.12.18]:52936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENU-0002ZM-KF; Tue, 07 Jun 2016 06:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=fpJmz+t+K71EHQVbhr
	aQSIKyJQk2PBeDXWwbDHbt9fk=; b=XD107MppJmF/FUOHUQJD2Ue9kE69+uW2wK
	ZVgpjnuAJ94i0dIhhp029GUgwpIWvYy6eMjUZaBvEBMFHiTP9POMJo6q8s1O4HeD
	TSEr/oRNmxUWZ0884ygZl4mA1im7m++WtGCfu914YcsblzWq0GMptaglDtat3lmz
	aYcKOScoM=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S5;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:43 +0800
Message-Id: <1465295747-11651-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1kAF1ftrW8CrW5tw4fXwb_yoWrCrW3pF
	yxGFn7WrZ3tFsFqr4xta1DCF18Awn2kw1xZrsrArsakwn2kr98Ar1kKa4SyFW0qrW09F1f
	Jay8GFyxWw4DJwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHuWLUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhuBxlWBRPuW+gABsM
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 13/17] hw/misc: QOM'ify slavio_misc.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLx03RwUpDbe

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/misc/slavio_misc.c | 43 +++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/hw/misc/slavio_misc.c b/hw/misc/slavio_misc.c
index edd5de0..e1a706e 100644
--- a/hw/misc/slavio_misc.c
+++ b/hw/misc/slavio_misc.c
@@ -414,76 +414,73 @@ static const VMStateDescription vmstate_misc = {
     }
 };
 
-static int apc_init1(SysBusDevice *dev)
+static void apc_init(Object *obj)
 {
-    APCState *s = APC(dev);
+    APCState *s = APC(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(dev, &s->cpu_halt);
 
     /* Power management (APC) XXX: not a Slavio device */
-    memory_region_init_io(&s->iomem, OBJECT(s), &apc_mem_ops, s,
+    memory_region_init_io(&s->iomem, obj, &apc_mem_ops, s,
                           "apc", MISC_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
-static int slavio_misc_init1(SysBusDevice *sbd)
+static void slavio_misc_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    MiscState *s = SLAVIO_MISC(dev);
+    DeviceState *dev = DEVICE(obj);
+    MiscState *s = SLAVIO_MISC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
     sysbus_init_irq(sbd, &s->fdc_tc);
 
     /* 8 bit registers */
     /* Slavio control */
-    memory_region_init_io(&s->cfg_iomem, OBJECT(s), &slavio_cfg_mem_ops, s,
+    memory_region_init_io(&s->cfg_iomem, obj, &slavio_cfg_mem_ops, s,
                           "configuration", MISC_SIZE);
     sysbus_init_mmio(sbd, &s->cfg_iomem);
 
     /* Diagnostics */
-    memory_region_init_io(&s->diag_iomem, OBJECT(s), &slavio_diag_mem_ops, s,
+    memory_region_init_io(&s->diag_iomem, obj, &slavio_diag_mem_ops, s,
                           "diagnostic", MISC_SIZE);
     sysbus_init_mmio(sbd, &s->diag_iomem);
 
     /* Modem control */
-    memory_region_init_io(&s->mdm_iomem, OBJECT(s), &slavio_mdm_mem_ops, s,
+    memory_region_init_io(&s->mdm_iomem, obj, &slavio_mdm_mem_ops, s,
                           "modem", MISC_SIZE);
     sysbus_init_mmio(sbd, &s->mdm_iomem);
 
     /* 16 bit registers */
     /* ss600mp diag LEDs */
-    memory_region_init_io(&s->led_iomem, OBJECT(s), &slavio_led_mem_ops, s,
+    memory_region_init_io(&s->led_iomem, obj, &slavio_led_mem_ops, s,
                           "leds", LED_SIZE);
     sysbus_init_mmio(sbd, &s->led_iomem);
 
     /* 32 bit registers */
     /* System control */
-    memory_region_init_io(&s->sysctrl_iomem, OBJECT(s), &slavio_sysctrl_mem_ops, s,
+    memory_region_init_io(&s->sysctrl_iomem, obj, &slavio_sysctrl_mem_ops, s,
                           "system-control", SYSCTRL_SIZE);
     sysbus_init_mmio(sbd, &s->sysctrl_iomem);
 
     /* AUX 1 (Misc System Functions) */
-    memory_region_init_io(&s->aux1_iomem, OBJECT(s), &slavio_aux1_mem_ops, s,
+    memory_region_init_io(&s->aux1_iomem, obj, &slavio_aux1_mem_ops, s,
                           "misc-system-functions", MISC_SIZE);
     sysbus_init_mmio(sbd, &s->aux1_iomem);
 
     /* AUX 2 (Software Powerdown Control) */
-    memory_region_init_io(&s->aux2_iomem, OBJECT(s), &slavio_aux2_mem_ops, s,
+    memory_region_init_io(&s->aux2_iomem, obj, &slavio_aux2_mem_ops, s,
                           "software-powerdown-control", MISC_SIZE);
     sysbus_init_mmio(sbd, &s->aux2_iomem);
 
     qdev_init_gpio_in(dev, slavio_set_power_fail, 1);
-
-    return 0;
 }
 
 static void slavio_misc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = slavio_misc_init1;
     dc->reset = slavio_misc_reset;
     dc->vmsd = &vmstate_misc;
 }
@@ -492,21 +489,15 @@ static const TypeInfo slavio_misc_info = {
     .name          = TYPE_SLAVIO_MISC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MiscState),
+    .instance_init = slavio_misc_init,
     .class_init    = slavio_misc_class_init,
 };
 
-static void apc_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
-
-    k->init = apc_init1;
-}
-
 static const TypeInfo apc_info = {
     .name          = TYPE_APC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MiscState),
-    .class_init    = apc_class_init,
+    .instance_init = apc_init,
 };
 
 static void slavio_misc_register_types(void)
-- 
2.1.4


