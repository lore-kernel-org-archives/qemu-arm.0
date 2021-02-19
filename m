Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9089281lfc;
        Fri, 19 Feb 2021 07:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwScMgiSmhAHUVXV+qwSAlYVgCYD0f6Pcm9o71fzXrUvx/Rp9RU9Eji3MbebZJKDU4QtEFM
X-Received: by 2002:a05:620a:6d2:: with SMTP id 18mr9834289qky.33.1613747085246;
        Fri, 19 Feb 2021 07:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747085; cv=none;
        d=google.com; s=arc-20160816;
        b=kF74qUngp58TBbevGpWbkLgUdWr+zsEkyI0V2mf+wNwmFkeHixykygP0LMyOJGaKKf
         xLjko2yMJj+KGGtzypOLv6ixf8Af77xl0lT07m4/9sr3DtAAHdWkKqbCC3WJfYnbbO75
         AsWd9HIB4mBEWY4WAuNk049ILFxbeW7QaJ9gJyWuG1/D34J5oF4W0yedTxDnVNWwUAGv
         m9pjhWljDaMbVKtp1GUvf+mFE6Kj84ZWuAwxTW/M5EJ5AVHcbRO8A10fJMriRRlbeDa8
         OIcXWD9DuKHIMR1gSnZiZZ7D9FlTTo1njbQpe5jqXSPVwZGfs3W4qw9kI6SxrOAg5xxL
         uGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k6oYzYF2kgG/d9iwOF7hKSmrm8saHh/z9DOwOyvSPH0=;
        b=jLOAyNLt/bu4Qq1l2FX8vurevTJdx9sYF0yRb200iMIA26m4CwDp6Z5MQJ3x/NpjW6
         o4vnS1xdL9aTmb+Y5Fy6L6Z4jeKs5Hv5O1o9VNgL1PodkRSeOu4XiTSn5HvHiRZbO1cz
         h45XBkiL8BrIfD++WNenThV7XdlQZVnYqoNmvPvQWjLfNawnD/ooLN5d9f4QB8vZ1Q2K
         FkmYTxNTTqFPE5PSKY/sOASG8m8cDVaPCGpnmPj9zg0LckM9zBRb6aM7QvJbZ0xSZ3eG
         Bi2o+PJPHcweVyEJRtbwkyBKCUK9mvBkyg9Lg21GzsIcMt1kiGUWibQEVAzHFGJoIRPd
         NEKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMftuM2m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c203si5586107ybf.216.2021.02.19.07.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMftuM2m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Km-0006BL-DH
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73b-0002So-CX
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73F-0003XZ-Sy
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so8823247wrx.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k6oYzYF2kgG/d9iwOF7hKSmrm8saHh/z9DOwOyvSPH0=;
 b=DMftuM2myTDxw1qjfmpGuaKguePaIEav2ouS648acRzXsfXbIaYEA0414DRyzJiqT0
 pasweguRMliH/dPaYNgny7NOQ2HXhj+QjXTz1CS3fJ8AbCfkVyNss2TLSnku8GKSU50v
 zovw/klcJ5u+PReu2eZSZ/oUGk4ltS/dkO68V2MPbGs/kd2pXVd5LsCUV+mK7o/ieOKU
 NKQydUOEtHGXGX2+QWs50M1HY+ENL7dzH004zVaShnQBBl6IEYWGCLNX26J8nloj4tJ1
 /coT3Iu6T9mqKuihu6iSvuWr6wPG2cA22mfBHH1lhheVhPo7UokPzjTWeH15q+UkEehW
 eCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6oYzYF2kgG/d9iwOF7hKSmrm8saHh/z9DOwOyvSPH0=;
 b=EpezlEaKjY9J7td6j5s/sXltl2ceNplXAzZ1QCjAKfDnat1HmtCVYWfabSrM4fdC5W
 mySbl+l2+FPLW9pgdCKHUMEoejAyJ2ArEs0cT9TstIaaHRiCPaVMiZuOfKvcOlw0oLG7
 lZdwQCzw1E3R4GpCVj04bGPh5/2aJhTSSrnx1+cDodFgQLhhY/QxMcagkHAaN7UYvQGx
 u4AqtYDnJoAZZtvj6DTndSv5pQTCVsURMlumaNTDLEyOydaacMt5/xY/GniKOxaUBcZc
 5PsZLaN0f7GC2gQ3F+bxcnskDOtAFfG9hs+Z34AzOmPGGgG/o+KIfSffcDQiloSZHjC3
 T71g==
X-Gm-Message-State: AOAM533SlZBy5hCrhs7zTD3RPFQqeSD63YJtvaLGAMh+vrbjhN9I3az8
 V1507iKVZKIUn+BprYh1/auaj/eqb1hG3w==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr9333153wrs.64.1613745996238; 
 Fri, 19 Feb 2021 06:46:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/44] hw/arm/armsse: Use an array for apb_ppc fields in the
 state structure
Date: Fri, 19 Feb 2021 14:45:54 +0000
Message-Id: <20210219144617.4782-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLMAJe5m+EQq

Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
to use an array instead of two separate fields.  We already had one
place in the code that wanted to be able to refer to the PPC by
index, and we're about to add more code like that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  6 +++---
 hw/arm/armsse.c         | 32 ++++++++++++++++++--------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 09284ca75cf..771150b0a94 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -124,8 +124,9 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
  */
+#define NUM_INTERNAL_PPCS 2
 #define NUM_EXTERNAL_PPCS (IOTS_NUM_AHB_EXP_PPC + IOTS_NUM_APB_EXP_PPC)
-#define NUM_PPCS (NUM_EXTERNAL_PPCS + 2)
+#define NUM_PPCS (NUM_EXTERNAL_PPCS + NUM_INTERNAL_PPCS)
 
 #define MAX_SRAM_BANKS 4
 #if MAX_SRAM_BANKS > IOTS_NUM_MPC
@@ -152,8 +153,7 @@ struct ARMSSE {
     ARMv7MState armv7m[SSE_MAX_CPUS];
     CPUClusterState cluster[SSE_MAX_CPUS];
     IoTKitSecCtl secctl;
-    TZPPC apb_ppc0;
-    TZPPC apb_ppc1;
+    TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
     CMSDKAPBTimer timer0;
     CMSDKAPBTimer timer1;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 326e161c8d4..2b25fca1ca2 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -291,8 +291,12 @@ static void armsse_init(Object *obj)
     }
 
     object_initialize_child(obj, "secctl", &s->secctl, TYPE_IOTKIT_SECCTL);
-    object_initialize_child(obj, "apb-ppc0", &s->apb_ppc0, TYPE_TZ_PPC);
-    object_initialize_child(obj, "apb-ppc1", &s->apb_ppc1, TYPE_TZ_PPC);
+
+    for (i = 0; i < ARRAY_SIZE(s->apb_ppc); i++) {
+        g_autofree char *name = g_strdup_printf("apb-ppc%d", i);
+        object_initialize_child(obj, name, &s->apb_ppc[i], TYPE_TZ_PPC);
+    }
+
     for (i = 0; i < info->sram_banks; i++) {
         char *name = g_strdup_printf("mpc%d", i);
         object_initialize_child(obj, name, &s->mpc[i], TYPE_TZ_MPC);
@@ -739,7 +743,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer0), 0,
                        armsse_get_common_irq_in(s, 3));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer0), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[0]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[0]", OBJECT(mr),
                              &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
@@ -749,7 +753,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
                        armsse_get_common_irq_in(s, 4));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[1]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[1]", OBJECT(mr),
                              &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
@@ -759,7 +763,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
                        armsse_get_common_irq_in(s, 5));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), "port[2]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[2]", OBJECT(mr),
                              &error_abort);
 
     if (info->has_mhus) {
@@ -782,7 +786,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             }
             port = g_strdup_printf("port[%d]", i + 3);
             mr = sysbus_mmio_get_region(mhu_sbd, 0);
-            object_property_set_link(OBJECT(&s->apb_ppc0), port, OBJECT(mr),
+            object_property_set_link(OBJECT(&s->apb_ppc[0]), port, OBJECT(mr),
                                      &error_abort);
             g_free(port);
 
@@ -802,12 +806,12 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc0), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[0]), errp)) {
         return;
     }
 
-    sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc0);
-    dev_apb_ppc0 = DEVICE(&s->apb_ppc0);
+    sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
+    dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
     mr = sysbus_mmio_get_region(sbd_apb_ppc0, 0);
     memory_region_add_subregion(&s->container, 0x40000000, mr);
@@ -917,16 +921,16 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
                        armsse_get_common_irq_in(s, 2));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc1), "port[0]", OBJECT(mr),
+    object_property_set_link(OBJECT(&s->apb_ppc[1]), "port[0]", OBJECT(mr),
                              &error_abort);
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc1), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
     }
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc1), 0);
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc[1]), 0);
     memory_region_add_subregion(&s->container, 0x4002f000, mr);
 
-    dev_apb_ppc1 = DEVICE(&s->apb_ppc1);
+    dev_apb_ppc1 = DEVICE(&s->apb_ppc[1]);
     qdev_connect_gpio_out_named(dev_secctl, "apb_ppc1_nonsec", 0,
                                 qdev_get_gpio_in_named(dev_apb_ppc1,
                                                        "cfg_nonsec", 0));
@@ -1063,7 +1067,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         DeviceState *devs = DEVICE(&s->ppc_irq_splitter[i]);
         char *gpioname = g_strdup_printf("apb_ppc%d_irq_status",
                                          i - NUM_EXTERNAL_PPCS);
-        TZPPC *ppc = (i == NUM_EXTERNAL_PPCS) ? &s->apb_ppc0 : &s->apb_ppc1;
+        TZPPC *ppc = &s->apb_ppc[i - NUM_EXTERNAL_PPCS];
 
         qdev_connect_gpio_out(devs, 0,
                               qdev_get_gpio_in_named(dev_secctl, gpioname, 0));
-- 
2.20.1

