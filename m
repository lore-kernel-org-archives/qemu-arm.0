Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp454721ejs;
        Tue, 9 Jan 2024 07:25:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8zQ/7tlsrZ5g1BqsKjX+KriEk9SJREnzKYaWxtk+ZVicTceUjZB/PZEIBjKRWzuvshxd6
X-Received: by 2002:a05:6214:2a4b:b0:680:d4c2:a5d1 with SMTP id jf11-20020a0562142a4b00b00680d4c2a5d1mr6639707qvb.66.1704813910800;
        Tue, 09 Jan 2024 07:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704813910; cv=none;
        d=google.com; s=arc-20160816;
        b=nk9EnVm1AMqF6fswfFvwtRv9Dde3Zb6uUPd+KdMH2W3/LUpo+DewfQ4n6ftKubUNE6
         nMFVwsOKG0CHmRjswdHQA2fNzop39clGAsMTqCLsr+yEyy3UV/Bt/iapUEV7vwv+z1l2
         L7xS/cwbXU1TPjdiL7wWuv54fXMRj5iEFPyaRQZjJ7kyc97zz0IF+i7YFZc1u0zCKxdP
         /q0tK5wonA5mgdkmD6Ae+xYUsKDhuIFJgjyoJnyUDwfSvUVd1aK+X6WZiqMnt0kM8bWz
         qcByNVd+4sDcbK6z/H4R+sBvgq93ocxlYs5xlEKd1ooM5qAZwcKCGLTk+vYmc0YjtE3c
         GOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=Ca6hmgpPbhemvhYSfPCbopjCGJJMtOpR4HF5RyCauW4=;
        fh=QxpwAJQZOSHhOsFAN2wbnN0R1FGPGXQqaPLjxPWe2NE=;
        b=DYI9KZRnV6YDG6Ch9S5uaopySgMhM1uPb+CrNd5XfZEU5nRcNG1Jrv0RSeb2Huzn8Y
         Bozqh4I3fZOKeEIIo8znCCKY/12Epk9usc48WfEfktQ2ULO22WezpeG5k6kFgC4bZWBN
         XVs3eJYOx4ZWURqW2yGn1pTayqMUMHTBp55XiWcaMN3AONotoTlrdmrRQk7uTdxWjwsi
         HQVm3bdW/5JxAQid28PuJWcDAB7rA7UvBCt+KlrfCSCrkKvsL37oXpn1IM5MZHx4EQHN
         H1lfrV8JTu9XbSTGEmMmb4Y/F1SuZzbeROLVnSaWhbOAplUsTcCwRoKOLfTFZhCLdILI
         mnPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=y44z1hVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a0ccb06000000b0067f62b9e9fesi2421294qvk.602.2024.01.09.07.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 07:25:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=y44z1hVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNDxe-0006BI-Iw; Tue, 09 Jan 2024 10:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rNDxc-0006AC-Un; Tue, 09 Jan 2024 10:24:13 -0500
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rNDxY-0001EN-7s; Tue, 09 Jan 2024 10:24:11 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 6E953A0835;
 Tue,  9 Jan 2024 16:23:56 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id cuVeLu8odzWM; Tue,  9 Jan 2024 16:23:55 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 81ED9A07E1;
 Tue,  9 Jan 2024 16:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 81ED9A07E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1704813835;
 bh=Ca6hmgpPbhemvhYSfPCbopjCGJJMtOpR4HF5RyCauW4=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=y44z1hVArISOC6ETCfiplbILRMaWFyuy/UBNOd2/WPc0r7v4OGTVVuJPH+vMWS2mx
 7khzh/7FXU+zj7zVbtmzRpUVQiOBCeBGI3lqSwY7CntNAv25b1ZGqwbdmDkmQ9q9Dg
 fCc9dVOtSO9numx9GHyjwB9/4fBpuee0oOMvGVVA=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 78333bdLMEKL; Tue,  9 Jan 2024 16:23:55 +0100 (CET)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:240:3f5e:381b:bff9:b9ae])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 47DD8A0820;
 Tue,  9 Jan 2024 16:23:55 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 2/3] hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
Date: Tue,  9 Jan 2024 16:21:38 +0100
Message-ID: <20240109152350.303202-3-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109152350.303202-1-ines.varhol@telecom-paris.fr>
References: <20240109152350.303202-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EEX9trpqcnLf

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32l4x5_soc.c         | 52 +++++++++++++++++++++++++++++++++-
 include/hw/arm/stm32l4x5_soc.h |  3 ++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ae2073a1d..8c8488a70a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -459,6 +459,7 @@ config STM32L4X5_SOC
     bool
     select ARM_V7M
     select OR_IRQ
+    select STM32L4X5_EXTI
=20
 config XLNX_ZYNQMP_ARM
     bool
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 70609a6dac..fe46b7c6c0 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -36,10 +36,51 @@
 #define SRAM2_BASE_ADDRESS 0x10000000
 #define SRAM2_SIZE (32 * KiB)
=20
+#define EXTI_ADDR 0x40010400
+
+#define NUM_EXTI_IRQ 40
+/* Match exti line connections with their CPU IRQ number */
+/* See Vector Table (Reference Manual p.396) */
+static const int exti_irq[NUM_EXTI_IRQ] =3D {
+    6,                      /* GPIO[0]                 */
+    7,                      /* GPIO[1]                 */
+    8,                      /* GPIO[2]                 */
+    9,                      /* GPIO[3]                 */
+    10,                     /* GPIO[4]                 */
+    23, 23, 23, 23, 23,     /* GPIO[5..9]              */
+    40, 40, 40, 40, 40, 40, /* GPIO[10..15]            */
+    1,                      /* PVD                     */
+    67,                     /* OTG_FS_WKUP, Direct     */
+    41,                     /* RTC_ALARM               */
+    2,                      /* RTC_TAMP_STAMP2/CSS_LSE */
+    3,                      /* RTC wakeup timer        */
+    63,                     /* COMP1                   */
+    63,                     /* COMP2                   */
+    31,                     /* I2C1 wakeup, Direct     */
+    33,                     /* I2C2 wakeup, Direct     */
+    72,                     /* I2C3 wakeup, Direct     */
+    37,                     /* USART1 wakeup, Direct   */
+    38,                     /* USART2 wakeup, Direct   */
+    39,                     /* USART3 wakeup, Direct   */
+    52,                     /* UART4 wakeup, Direct    */
+    53,                     /* UART4 wakeup, Direct    */
+    70,                     /* LPUART1 wakeup, Direct  */
+    65,                     /* LPTIM1, Direct          */
+    66,                     /* LPTIM2, Direct          */
+    76,                     /* SWPMI1 wakeup, Direct   */
+    1,                      /* PVM1 wakeup             */
+    1,                      /* PVM2 wakeup             */
+    1,                      /* PVM3 wakeup             */
+    1,                      /* PVM4 wakeup             */
+    78                      /* LCD wakeup, Direct      */
+};
+
 static void stm32l4x5_soc_initfn(Object *obj)
 {
     Stm32l4x5SocState *s =3D STM32L4X5_SOC(obj);
=20
+    object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
+
     s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0)=
;
     s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0)=
;
 }
@@ -51,6 +92,7 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     const Stm32l4x5SocClass *sc =3D STM32L4X5_SOC_GET_CLASS(dev_soc);
     MemoryRegion *system_memory =3D get_system_memory();
     DeviceState *armv7m;
+    SysBusDevice *busdev;
=20
     /*
      * We use s->refclk internally and only define it with qdev_init_clo=
ck_in()
@@ -112,6 +154,15 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
         return;
     }
=20
+    busdev =3D SYS_BUS_DEVICE(&s->exti);
+    if (!sysbus_realize(busdev, errp)) {
+        return;
+    }
+    sysbus_mmio_map(busdev, 0, EXTI_ADDR);
+    for (unsigned i =3D 0; i < NUM_EXTI_IRQ; i++) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[=
i]));
+    }
+
     /* APB1 BUS */
     create_unimplemented_device("TIM2",      0x40000000, 0x400);
     create_unimplemented_device("TIM3",      0x40000400, 0x400);
@@ -152,7 +203,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
     create_unimplemented_device("SYSCFG",    0x40010000, 0x30);
     create_unimplemented_device("VREFBUF",   0x40010030, 0x1D0);
     create_unimplemented_device("COMP",      0x40010200, 0x200);
-    create_unimplemented_device("EXTI",      0x40010400, 0x400);
     /* RESERVED:    0x40010800, 0x1400 */
     create_unimplemented_device("FIREWALL",  0x40011C00, 0x400);
     /* RESERVED:    0x40012000, 0x800 */
diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
index 2fd44a36a9..f7305568dc 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -26,6 +26,7 @@
=20
 #include "exec/memory.h"
 #include "hw/arm/armv7m.h"
+#include "hw/misc/stm32l4x5_exti.h"
 #include "qom/object.h"
=20
 #define TYPE_STM32L4X5_SOC "stm32l4x5-soc"
@@ -39,6 +40,8 @@ struct Stm32l4x5SocState {
=20
     ARMv7MState armv7m;
=20
+    Stm32l4x5ExtiState exti;
+
     MemoryRegion sram1;
     MemoryRegion sram2;
     MemoryRegion flash;
--=20
2.43.0

