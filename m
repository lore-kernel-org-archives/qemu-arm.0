Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp809180wrv;
        Fri, 12 Jul 2019 04:50:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwENfZw+pTRIv80hOoOlu8oOPpTQcoJCP02anHycbhZBTw7rjpQ2K5Ex3zEjqH6oilneBuB
X-Received: by 2002:a50:ec03:: with SMTP id g3mr8769657edr.233.1562932241778;
        Fri, 12 Jul 2019 04:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562932241; cv=none;
        d=google.com; s=arc-20160816;
        b=sMr2LaG89V4CKCzXNiQVh257FaVfIz0XL+9YucVYA14mtdnI/74Qszb3NTtkZGwn0B
         uW8RnQwuFrLgEnZQmoDM09gNhO83+RT2kkRmN9U0L+W3FO7HUbMAcz/tvKBRMW9Fkl2M
         aszlE0NhntSO4C7MSW0/beq9RoI6l2BT7WtYuzD8/Gejyw0pNtnbPP8DVayQJBPquXNE
         m0NWLL7FxCtM1EnxnqRRB9kLcyzoL2ZhwcwKMsTmWXpAp1uCaaXC9mcn03N6zeCkKjI3
         JhXwLniSvJ9fUaJUlrs0SEGc1Z+jJS0RxekJxv0UzXkdme/k6BQRs3KNHNNilzbfyhCo
         rQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=VlbJbQSW8/zo5SQT5J/jriNPih0ZwCvEM2vgRhOqVIc=;
        b=U+YWMSshS01xnpqIq0d6ZTY9oNwBrwjsmNaV3rUaQv2+ciX6JkXHkJYlsbKOGWeaDN
         4i8BlrIs6QGZn9D6yaMPWJNLRDUPtmyI8jmjbBMlzStqTd1nwfUjhtYGqMY8eYJN0SJ3
         lGlVF/Tq4vj5KAjHxSDlE9KyoVRKbrjzULfJyZgrKeGpjjFwR44R/L5bZvNrJYEKppzJ
         584vPynfS3aT9GWuT1C49Er106qVwyjugDq9Tm/BUaMOI5ZGkwm2mhftBnJFbScArhrI
         b7E49gRoKxQrhsAhI2f0sukKu0oamxIlbg7sCbKatXXez4VroP1CcfnBP9YVVE2vv2kC
         j45w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=djpgZzB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 50si5374671edu.334.2019.07.12.04.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 04:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=djpgZzB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlu4W-0006t1-Cf
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 07:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlu4R-0006sk-KP
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 07:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlu4Q-000074-3v
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 07:50:35 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44921)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlu4P-00006S-Sb
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 07:50:34 -0400
Received: by mail-wr1-x443.google.com with SMTP id p17so9649454wrf.11
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VlbJbQSW8/zo5SQT5J/jriNPih0ZwCvEM2vgRhOqVIc=;
 b=djpgZzB48OJweC1e5h4SQ6eqRHXQUrfUSDTrqDDRbeEGIUW5tN8xJExlNPH9yvWNJB
 2RbYHxj+kvmAF+GeTTl/3fI1am5xZYz/uraeBWCIWwXXPHlSTXF986IE9H6WiZ4WQkFw
 M04IjTdDS2mTH5T0/1odPuYChQWO8aemW2C61syZiDqH48+y7BGM85s6nsdkPzzLveNu
 RGll55kRFHyNcD/5l8e9OuYWGfA+Flba9VkYU8WbeyGm7QZwecpH34gag3+Q/m7WXrSo
 5byGfmmSPZ9Q9jBivY1uJQquwT2BhtFIoqsU+MJWOgzBo4+muf3cu6cKEb88bHlvSzmm
 PHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VlbJbQSW8/zo5SQT5J/jriNPih0ZwCvEM2vgRhOqVIc=;
 b=e4mcgMiteHrhZmgsmVQkwXee4q5gimZUs4U56qWZ9ZDxbBTSQo1JiijeVmbDALVpoD
 juE01yMegO29CZq9MAMCc+OjK82mju4qcrbFuj7qVax8Q8wHafQUhzjchU8MqnXwE4E8
 k8Gl1MgS5Pc+a1zkPzniFSUzeVV12rYeXLaQIpRDrD6FRYKYb8jJ/8SaXu+oolEs9haA
 v76Y5LcpVqkrElAhcP3mg5bndNQXg4YWtKGH+D0IJhcpKHY2K6yhVMxj6sYW7aQuMRWW
 eP+K0czBkvdmSn3gk975m2rrQodQjA1kY5nhpLGVSCahnLXU5Lcf9zJnFTVTjYEDdcPz
 M/JA==
X-Gm-Message-State: APjAAAXeEj56OjTkeyeANfIbKqBfXD1ysvkSXqT0qCUIxfVVQjACkODV
 R2xivHIxJVmiF7NJ9WKtx4fKGbO7L6V/JQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr8260wrm.25.1562932232386;
 Fri, 12 Jul 2019 04:50:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v204sm7757279wma.20.2019.07.12.04.50.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 04:50:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 12:50:30 +0100
Message-Id: <20190712115030.26895-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH for-4.1?] hw/arm/fsl-imx6ul.c: Remove dead
 SMP-related code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcmsZ/SI1MvO

The i.MX6UL always has a single Cortex-A7 CPU (we set FSL_IMX6UL_NUM_CPUS
to 1 in line with this). This means that all the code in fsl-imx6ul.c to
handle multiple CPUs is dead code, and Coverity is now complaining that
it is unreachable (CID 1403008, 1403011).

Remove the unreachable code and the only-executes-once loops,
and replace the single-entry cpu[] array in the FSLIMX6ULState
with a simple cpu member.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The only real reason to put this into 4.1 is because it fixes
some Coverity issues, and it would be nice to be able to get
down to no Coverity issues for the release. I think that pre-rc1
that's a reasonable reason to put this in.

Disclaimer: tested with "make check" as I have no test image for
this board.

 include/hw/arm/fsl-imx6ul.h |  2 +-
 hw/arm/fsl-imx6ul.c         | 62 +++++++++++--------------------------
 hw/arm/mcimx6ul-evk.c       |  2 +-
 3 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 9e94e98f8ee..eda389aec7d 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -61,7 +61,7 @@ typedef struct FslIMX6ULState {
     DeviceState    parent_obj;
 
     /*< public >*/
-    ARMCPU             cpu[FSL_IMX6UL_NUM_CPUS];
+    ARMCPU             cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
     IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index f8601654388..b074177a71d 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -29,16 +29,12 @@
 
 static void fsl_imx6ul_init(Object *obj)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6ULState *s = FSL_IMX6UL(obj);
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6UL_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
-                                "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
-    }
+    object_initialize_child(obj, "cpu0", &s->cpu, sizeof(s->cpu),
+                            "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
 
     /*
      * A7MPCORE
@@ -161,42 +157,25 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6ULState *s = FSL_IMX6UL(dev);
     int i;
-    qemu_irq irq;
     char name[NAME_SIZE];
-    unsigned int smp_cpus = ms->smp.cpus;
+    SysBusDevice *sbd;
+    DeviceState *d;
 
-    if (smp_cpus > FSL_IMX6UL_NUM_CPUS) {
-        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
-                   TYPE_FSL_IMX6UL, FSL_IMX6UL_NUM_CPUS, smp_cpus);
+    if (ms->smp.cpus > 1) {
+        error_setg(errp, "%s: Only a single CPU is supported (%d requested)",
+                   TYPE_FSL_IMX6UL, ms->smp.cpus);
         return;
     }
 
-    for (i = 0; i < smp_cpus; i++) {
-        Object *o = OBJECT(&s->cpu[i]);
-
-        object_property_set_int(o, QEMU_PSCI_CONDUIT_SMC,
-                                "psci-conduit", &error_abort);
-
-        /* On uniprocessor, the CBAR is set to 0 */
-        if (smp_cpus > 1) {
-            object_property_set_int(o, FSL_IMX6UL_A7MPCORE_ADDR,
-                                    "reset-cbar", &error_abort);
-        }
-
-        if (i) {
-            /* Secondary CPUs start in PSCI powered-down state */
-            object_property_set_bool(o, true,
-                                     "start-powered-off", &error_abort);
-        }
-
-        object_property_set_bool(o, true, "realized", &error_abort);
-    }
+    object_property_set_int(OBJECT(&s->cpu), QEMU_PSCI_CONDUIT_SMC,
+                            "psci-conduit", &error_abort);
+    object_property_set_bool(OBJECT(&s->cpu), true,
+                             "realized", &error_abort);
 
     /*
      * A7MPCORE
      */
-    object_property_set_int(OBJECT(&s->a7mpcore), smp_cpus, "num-cpu",
-                            &error_abort);
+    object_property_set_int(OBJECT(&s->a7mpcore), 1, "num-cpu", &error_abort);
     object_property_set_int(OBJECT(&s->a7mpcore),
                             FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL,
                             "num-irq", &error_abort);
@@ -204,18 +183,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                              &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
 
-    for (i = 0; i < smp_cpus; i++) {
-        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
+    sbd = SYS_BUS_DEVICE(&s->a7mpcore);
+    d = DEVICE(&s->cpu);
 
-        irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
-        sysbus_connect_irq(sbd, i, irq);
-        sysbus_connect_irq(sbd, i + smp_cpus, qdev_get_gpio_in(d, ARM_CPU_FIQ));
-        sysbus_connect_irq(sbd, i + 2 * smp_cpus,
-                           qdev_get_gpio_in(d, ARM_CPU_VIRQ));
-        sysbus_connect_irq(sbd, i + 3 * smp_cpus,
-                           qdev_get_gpio_in(d, ARM_CPU_VFIQ));
-    }
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
+    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
+    sysbus_connect_irq(sbd, 2, qdev_get_gpio_in(d, ARM_CPU_VIRQ));
+    sysbus_connect_irq(sbd, 3, qdev_get_gpio_in(d, ARM_CPU_VFIQ));
 
     /*
      * A7MPCORE DAP
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index bbffb11c2a8..1f6f4aed97c 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -71,7 +71,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu[0], &boot_info);
+        arm_load_kernel(&s->soc.cpu, &boot_info);
     }
 }
 
-- 
2.20.1

