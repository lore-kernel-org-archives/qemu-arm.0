Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229956ejb;
        Wed, 31 May 2023 13:37:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DXusgd3RfTClBuY8ie00mL/MAUEI2oOlqZewG1r+WSQsRSg+S/rGe1KIDvZEVRlF0x2jA
X-Received: by 2002:a05:6214:21e7:b0:622:199c:c4dc with SMTP id p7-20020a05621421e700b00622199cc4dcmr6924623qvj.51.1685565469340;
        Wed, 31 May 2023 13:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565469; cv=none;
        d=google.com; s=arc-20160816;
        b=kiTtTBup++2lyK2VhznVqaiXOsHELwk5K+oFZ3yBq/SnH+FoBTj2rj7hWHWOqcEMIV
         hDNcGmjGIA3GCWQJNScmS99zxA3PKIXQAvgvwQWqQQqwjKpWDekRGvB1j5200JNFwLW7
         ID+LD1GqGJFXr4QSj0mc/CUcAL2m1xr44Bg0GF2pEv7NI7uytOD8BOolcHDaByYfCVNo
         TqDlLPKbuXHs26L1YKcETeRAyQWcj2+8ZckBEHRVpxmy/f0J/SbF4cKkMgslAIZszosz
         lVhBHpUj1Z0hRFqsXOWy1zzCqDieOfQcOnkMATQh/umqcjOLx7w9UHzEdVSf8hrV6dgM
         Jrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sjhOm08stxYpC2nNilZ+r3P5phZDhdo7hj/kLX7dCFk=;
        b=iIYlyXUKPl+/A67oc7UhH8uYXb2CB6tgSlEqIpOY+8ksWPMsVH+4PxGlGlfo12MY+/
         lMXfpAJK8JDbq60xkzCUUqpAADsSoJ1OfKic6Ot5YpATcEouHHqHpWdxIkJqyF0rNZTo
         IYYpFMX4sSrRghLw02VyYEUSW5pgfRIx4wKFdk1QdeJ8sLKsNZ2V1fsXuqohYbRKdKnd
         Wv7hHEC5Z7J/VG3OHuYiZOg0aCWtuX17IB1Nw3ZSFDMXbdIPQgV+rMR2fe4Hbqc5E+is
         zArpFsBJ/TCfWBHPSD7asDSY55/REoyf9lrU/ZvtP5vAaW0iCgtRk3d9hIWuH6cgUOWa
         6YOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baHRiqQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05622a149400b003f521711227si8888606qtx.586.2023.05.31.13.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baHRiqQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SZj-0001fi-IK; Wed, 31 May 2023 16:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZX-00017u-2k
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZV-0003SI-3Z
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3094910b150so76310f8f.0
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565447; x=1688157447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjhOm08stxYpC2nNilZ+r3P5phZDhdo7hj/kLX7dCFk=;
 b=baHRiqQebNF8k8O8SyWORZYC3mudlxAkHKFMU53zBVrnBq5ZRHFLkquBLJ4UAxY7Mb
 KovMzALEUVYyKFjDGheabWZ7gYzI17QHF23RLcCuRSoDDHvInhYq/pH3sqwjmAFcss5V
 w51rPU7bbkIK+nvs5KjbwvJLexYRXX1qjxb9JDcFjAw21MNC4KP1G8ZwN8SdQGi64R2W
 l2hra9gtxluhu2r2in40iwd6YW5nbrk2qVJU3LofRc8A9YFVkMDIhalpe+pTbSAg5GQv
 f0Uf3B8VfgvthWvybT3r5aKTQJar3b+6EjOqrZOGRTYVRRq+eRNbYl/j1EZ6mYtRPKxs
 AyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565447; x=1688157447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjhOm08stxYpC2nNilZ+r3P5phZDhdo7hj/kLX7dCFk=;
 b=kYJucMTPt2JRuQza8GNpCUgibVwhRw/h2GbZBHCmSVEs/jowGGsCgb3YRobCR1Y3mP
 fvAqmDtxFy/2DeFY5SfscQeRoClBKGDEvDPTgZGc3OmRN9Y3tZOxwqBgObWqg5+P9V6B
 5z5qe5eCo2E28ysRnpCmmkQY+MiljAUj2OdJSiGJ4x/YCoArDui3+nqjqf9l0f+qy6Bb
 1n/rDRO2isJwhUn3Weo2WsLIJPnz3EJ1hEq/R+u6dRszpBiMxhAn5/flsdbhQc/5vJuc
 d5t5HrfTveEK9c11KYNbwmZ/+tCG9aLo4rf/7oDe0vLYx9yVymsGAJytgZt5JUuiGQ72
 tgGw==
X-Gm-Message-State: AC+VfDwCKhOLbo7RPfnpVO7mz7RzJenjcFe7UMRKNzGZR7k36FnoxDUI
 PbRR0FWkX+LPWlf/QxwOb8uZ7Q==
X-Received: by 2002:a5d:5304:0:b0:30a:eda0:71c5 with SMTP id
 e4-20020a5d5304000000b0030aeda071c5mr222844wrv.16.1685565447037; 
 Wed, 31 May 2023 13:37:27 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4741000000b002f9e04459desm7783956wrs.109.2023.05.31.13.37.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:37:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/15] hw/timer/arm_timer: QOM'ify ARM_TIMER
Date: Wed, 31 May 2023 22:35:59 +0200
Message-Id: <20230531203559.29140-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jD19sEvYYK5A

Introduce the ARM_TIMER sysbus device.

arm_timer_new() is converted as QOM instance init()/finalize()
handlers. Note in arm_timer_finalize() we release a ptimer handle
which was previously leaked.

ArmTimerState is directly embedded into SP804State/IcpPitState,
and is initialized as a QOM child.

Since the timer frequency belongs to ARM_TIMER, have it hold the
QOM property. SP804State/IcpPitState directly access it.

Similarly the SP804State/IcpPitState input IRQ becomes the
ARM_TIMER sysbus output IRQ.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 109 +++++++++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 39 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 82123b40c0..a929fbba62 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -17,6 +17,7 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 /* Common timer implementation.  */
 
@@ -29,14 +30,18 @@
 #define TIMER_CTRL_PERIODIC     (1 << 6)
 #define TIMER_CTRL_ENABLE       (1 << 7)
 
-typedef struct {
+#define TYPE_ARM_TIMER "arm-timer"
+OBJECT_DECLARE_SIMPLE_TYPE(ArmTimerState, ARM_TIMER)
+
+struct ArmTimerState {
+    SysBusDevice parent_obj;
     ptimer_state *timer;
     uint32_t control;
     uint32_t limit;
     uint32_t freq;
     int int_level;
     qemu_irq irq;
-} ArmTimerState;
+};
 
 /* Check all active timers, and schedule the next timer interrupt.  */
 
@@ -172,23 +177,42 @@ static const VMStateDescription vmstate_arm_timer = {
     }
 };
 
-static void arm_timer_reset(ArmTimerState *s)
+static void arm_timer_reset(DeviceState *dev)
 {
+    ArmTimerState *s = ARM_TIMER(dev);
+
     s->control = TIMER_CTRL_IE;
 }
 
-static ArmTimerState *arm_timer_new(uint32_t freq, qemu_irq irq_out)
+static void arm_timer_init(Object *obj)
 {
-    ArmTimerState *s;
+    ArmTimerState *s = ARM_TIMER(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s = g_new0(ArmTimerState, 1);
-    s->freq = freq;
-    arm_timer_reset(s);
-
-    s->irq = irq_out;
     s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
-    return s;
+
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void arm_timer_finalize(Object *obj)
+{
+    ArmTimerState *s = ARM_TIMER(obj);
+
+    ptimer_free(s->timer);
+}
+
+static Property arm_timer_properties[] = {
+    DEFINE_PROP_UINT32("freq", ArmTimerState, freq, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void arm_timer_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->reset = arm_timer_reset;
+    dc->vmsd = &vmstate_arm_timer;
+    device_class_set_props(dc, arm_timer_properties);
 }
 
 /*
@@ -204,11 +228,9 @@ struct SP804State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    ArmTimerState *timer[2];
-    uint32_t freq[2];
+    ArmTimerState timer[2];
     int level[2];
     qemu_irq irq;
-    qemu_irq irq_in[2];
 };
 
 static const uint8_t sp804_ids[] = {
@@ -233,10 +255,10 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
     SP804State *s = opaque;
 
     if (offset < 0x20) {
-        return arm_timer_read(s->timer[0], offset);
+        return arm_timer_read(&s->timer[0], offset);
     }
     if (offset < 0x40) {
-        return arm_timer_read(s->timer[1], offset - 0x20);
+        return arm_timer_read(&s->timer[1], offset - 0x20);
     }
 
     /* TimerPeriphID */
@@ -265,12 +287,12 @@ static void sp804_write(void *opaque, hwaddr offset,
     SP804State *s = opaque;
 
     if (offset < 0x20) {
-        arm_timer_write(s->timer[0], offset, value);
+        arm_timer_write(&s->timer[0], offset, value);
         return;
     }
 
     if (offset < 0x40) {
-        arm_timer_write(s->timer[1], offset - 0x20, value);
+        arm_timer_write(&s->timer[1], offset - 0x20, value);
         return;
     }
 
@@ -304,6 +326,12 @@ static void sp804_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &sp804_ops, s,
                           "sp804", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
+
+    qdev_init_gpio_in_named(DEVICE(obj), sp804_set_irq,
+                            "timer-in", ARRAY_SIZE(s->timer));
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        object_initialize_child(obj, "timer[*]", &s->timer[i], TYPE_ARM_TIMER);
+    }
 }
 
 static void sp804_realize(DeviceState *dev, Error **errp)
@@ -311,23 +339,17 @@ static void sp804_realize(DeviceState *dev, Error **errp)
     SP804State *s = SP804(dev);
 
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        s->irq_in[i] = qemu_allocate_irq(sp804_set_irq, s, i);
-        s->timer[i] = arm_timer_new(s->freq[i], s->irq_in[i]);
-    }
-}
-
-static void sp804_unrealize(DeviceState *dev)
-{
-    SP804State *s = SP804(dev);
-
-    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        qemu_free_irq(s->irq_in[i]);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer[i]), errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
+                           qdev_get_gpio_in_named(dev, "timer-in", i));
     }
 }
 
 static Property sp804_properties[] = {
-    DEFINE_PROP_UINT32("freq0", SP804State, freq[0], 1000000),
-    DEFINE_PROP_UINT32("freq1", SP804State, freq[1], 1000000),
+    DEFINE_PROP_UINT32("freq0", SP804State, timer[0].freq, 1000000),
+    DEFINE_PROP_UINT32("freq1", SP804State, timer[1].freq, 1000000),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -336,7 +358,6 @@ static void sp804_class_init(ObjectClass *klass, void *data)
     DeviceClass *k = DEVICE_CLASS(klass);
 
     k->realize = sp804_realize;
-    k->unrealize = sp804_unrealize;
     device_class_set_props(k, sp804_properties);
     k->vmsd = &vmstate_sp804;
 }
@@ -350,8 +371,7 @@ struct IntegratorPitState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    ArmTimerState *timer[3];
-    qemu_irq irq_in[3];
+    ArmTimerState timer[3];
     qemu_irq irq[3];
 };
 
@@ -368,7 +388,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
         return 0;
     }
 
-    return arm_timer_read(s->timer[n], offset & 0xff);
+    return arm_timer_read(&s->timer[n], offset & 0xff);
 }
 
 static void icp_pit_write(void *opaque, hwaddr offset,
@@ -383,7 +403,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
         return;
     }
 
-    arm_timer_write(s->timer[n], offset & 0xff, value);
+    arm_timer_write(&s->timer[n], offset & 0xff, value);
 }
 
 static const MemoryRegionOps icp_pit_ops = {
@@ -414,7 +434,8 @@ static void icp_pit_init(Object *obj)
                             "timer-in", ARRAY_SIZE(s->timer));
 
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
+        object_initialize_child(obj, "timer[*]", &s->timer[i], TYPE_ARM_TIMER);
+        qdev_prop_set_uint32(DEVICE(&s->timer[i]), "freq", tmr_freq[i]);
         sysbus_init_irq(dev, &s->irq[i]);
     }
 
@@ -430,7 +451,10 @@ static void icp_pit_realize(DeviceState *dev, Error **errp)
     IntegratorPitState *s = INTEGRATOR_PIT(dev);
 
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer[i]), errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
                            qdev_get_gpio_in_named(dev, "timer-in", i));
     }
 }
@@ -444,6 +468,13 @@ static void icp_pit_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo arm_timer_types[] = {
     {
+        .name           = TYPE_ARM_TIMER,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(ArmTimerState),
+        .instance_init  = arm_timer_init,
+        .instance_finalize = arm_timer_finalize,
+        .class_init     = arm_timer_class_init,
+    }, {
         .name           = TYPE_INTEGRATOR_PIT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(IntegratorPitState),
-- 
2.38.1

