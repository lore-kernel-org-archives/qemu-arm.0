Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp3597479ejb;
        Sun, 10 Dec 2023 11:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKNCODiblyIld1bHuVaOP/Ubs7mHutIAyDgok+IPZQT7J/KSyJ2o/uIsKnb982BExB9ojY
X-Received: by 2002:ad4:52c2:0:b0:67a:cf30:dc22 with SMTP id p2-20020ad452c2000000b0067acf30dc22mr3861721qvs.4.1702235156772;
        Sun, 10 Dec 2023 11:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702235156; cv=none;
        d=google.com; s=arc-20160816;
        b=mJJX0Io6tNbViVAv5zhNiV7dDsbYZ3529B+WhfsL61YWU1twmqnhSz9adV9QioU29D
         Zp9WSIOg1NXSTynZzYCaqRP2/LcEfiXgaEQkdt02S+5in1/1jMd/fD65YPcxr7ycWbHC
         ZYLbXwZEYr6ctB1twFmIv2fXGdUmBG9f9bPXORnt4d391jdemY0RSLUAXnkWGdc+PKLb
         W7/+3AyH498MEGvLFinotA+unvmr39mmIozhFIgPD/30sIZufUsu/EZKYQR+hM9Ubxiz
         V1BkE04iBtps+/PiQvFeDmjob6lETJgLvSRUQimhcXrDQQ00Sie24az3cBg9qM50flZI
         reCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:in-reply-to:message-id:mime-version
         :subject:date:from;
        bh=GC00WdC1IDebOq/siXncQ0ln4/vbq2bZzAk1qcnygRo=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=aycveHAu3HdOMDJOtM8ppU+Sq/RmMlcDR7yD2IR3Nn+s884ejUIirNtSCX/MLmvRap
         DgCnFOgU6OlV0thlcDkoOtSskRAwcVV/BqnT0pp2/Yr3s5YL3+xrfUWtlwU+pUvcOUMY
         xDgNjrlFfrtXS7DmKiT9kTet+HLTvaIWpjc/krcD/xIWSalsuVrITSVowUGojQa4lsEE
         xcQyN09VbsMGAgBSR2Jd0XhtRjokqpnu3vZSx8V5mwmS3Ak0uRHK6ojDlLtWWG+1Ph5H
         9dnEaVKbwdcZBJINiLaA81LwXTiEUA77o+t9Hk9UqVjSE87xC7d4zCXXHGaDmqNPshHY
         Fttw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj28-20020a056214529c00b0067a956d98d7si7257879qvb.358.2023.12.10.11.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Dec 2023 11:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCP73-0007Cw-FZ; Sun, 10 Dec 2023 14:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rCP71-0007C8-Ii; Sun, 10 Dec 2023 14:05:11 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rCP6z-0000jt-Cs; Sun, 10 Dec 2023 14:05:11 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 159E311F029;
 Sun, 10 Dec 2023 19:05:07 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Sun, 10 Dec 2023 19:06:50 +0100
Subject: [PATCH qemu 3/3] hw/arm: Connect STM32L4xx SYSCFG to STM32L4x5 SoC
MIME-Version: 1.0
Message-ID: <170223510627.13579.3191933474458037037-3@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170223510627.13579.3191933474458037037-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8I+3zjX8MnsM

From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32l4x5_soc.c         | 24 ++++++++++++++++--------
 include/hw/arm/stm32l4x5_soc.h |  2 ++
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9c9d5bb541..ea77977d4b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -458,6 +458,7 @@ config STM32L4X5_SOC
     bool
     select ARM_V7M
     select OR_IRQ
+    select STM32L4XX_SYSCFG
     select STM32L4X5_EXTI
=20
 config XLNX_ZYNQMP_ARM
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index cf786eac1d..9b45a9e606 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -46,6 +46,7 @@
 #define SRAM2_SIZE (32 * KiB)
=20
 #define EXTI_ADDR 0x40010400
+#define SYSCFG_ADDR 0x40010000
=20
 #define NUM_EXTI_IRQ 40
 /* Match exti line connections with their CPU IRQ number */
@@ -90,6 +91,8 @@ static void stm32l4x5_soc_initfn(Object *obj)
=20
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
=20
+    object_initialize_child(obj, "syscfg", &s->syscfg, TYPE_STM32L4XX_SYSCFG=
);
+
     s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
     s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
@@ -167,6 +170,15 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, =
Error **errp)
         return;
     }
=20
+    /* System configuration controller */
+    dev =3D DEVICE(&s->syscfg);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->syscfg), errp)) {
+        return;
+    }
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, SYSCFG_ADDR);
+
+    /* EXTI device */
     dev =3D DEVICE(&s->exti);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {
         return;
@@ -178,13 +190,10 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc,=
 Error **errp)
         sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[i]));
     }
=20
-    /*
-     * Uncomment when Syscfg is implemented
-     * for (i =3D 0; i < 16; i++) {
-     *     qdev_connect_gpio_out(DEVICE(&s->syscfg), i,
-     *                           qdev_get_gpio_in(dev, i));
-     * }
-     */
+    for (i =3D 0; i < 16; i++) {
+        qdev_connect_gpio_out(DEVICE(&s->syscfg), i,
+                              qdev_get_gpio_in(dev, i));
+    }
=20
     /* APB1 BUS */
     create_unimplemented_device("TIM2",      0x40000000, 0x400);
@@ -223,7 +232,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     /* RESERVED:    0x40009800, 0x6800 */
=20
     /* APB2 BUS */
-    create_unimplemented_device("SYSCFG",    0x40010000, 0x30);
     create_unimplemented_device("VREFBUF",   0x40010030, 0x1D0);
     create_unimplemented_device("COMP",      0x40010200, 0x200);
     /* RESERVED:    0x40010800, 0x1400 */
diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_soc.h
index ac47158596..5ff757f15b 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -37,6 +37,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
 #include "hw/arm/armv7m.h"
+#include "hw/misc/stm32l4xx_syscfg.h"
 #include "hw/misc/stm32l4x5_exti.h"
 #include "qom/object.h"
=20
@@ -52,6 +53,7 @@ struct Stm32l4x5SocState {
     ARMv7MState armv7m;
=20
     Stm32l4x5ExtiState exti;
+    STM32L4xxSyscfgState syscfg;
=20
     MemoryRegion sram1;
     MemoryRegion sram2;
--=20
2.38.5
