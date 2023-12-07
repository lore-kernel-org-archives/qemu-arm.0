Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp662377eji;
        Mon, 18 Dec 2023 01:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgkBREA0T5kLHIokbjZecw95qhWRwQSxJW2a5Ugz/A5SLvrOuDXmk3Dp2Nvp969ndcjDWD
X-Received: by 2002:a05:620a:450e:b0:77e:fba3:9d0c with SMTP id t14-20020a05620a450e00b0077efba39d0cmr21932751qkp.112.1702891148592;
        Mon, 18 Dec 2023 01:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702891148; cv=none;
        d=google.com; s=arc-20160816;
        b=RXwuLd6eunC0nyPkvEGlmbArC/ch7FQWvpPJQxvWAEK+wNC7zHqygkPTkk8UGS3hTV
         mA4BhhBV++CWWfxjuVU0RbpdaKj/DqCOz37E8rX/1E5Sq7o4WSLerb4kv+mnXv3FsOmO
         5SdFkwYtjHmMmliiD1J4l/Vy5EDqvaw6SEShaKAT6tQ95OxD77JvohCMFgnglsTJZKqP
         Akp/Gjlj8vp2J50CAT8nk0d2Am2bidbTO5Ycr4yJWAVdfwq4lWI83QA0RKW7bGt6NfTg
         Pubshf+j3iWMS5MV48/ZMI5+Ig3KPfvGGmK/+mRlZeI4S+4YJNmy8KrCB6P0VkOpxNA1
         dl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:in-reply-to:message-id:mime-version
         :subject:date:from;
        bh=nTZFSZANpiTBx/s/BMdsT34QGUtPNJCDKnuGNzmeC28=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=eSCY8XpO7/268bwxc14ntlgX6Nc50RGY+efGOVoCa78lbdi99Sf091oVh8gQJH7wFw
         JRTrQf72aSwDYAMmnbTliME6Au88UrrSvwGQ5mu34FLuAdwkPx6tmJ+iewR2quWZCTF+
         DFKDtEqieX2vpeJT/Kl4i3p38tX+U5O+0SE8J1f2zqO8mcy5w0/ytkvxbex24xJ/5u4u
         ZVYfiWMq9PIdiEZa5C7Z2mwHrEUbXeWT3RBchhMl6cAxDofgw19JyVzlTAF4DXpVLeKJ
         Jpc7Xc4BqCHEtbcFg3+AYEy7q6jnv1/mWsAS5SXn6W/x1Sz3BAq/rUXbyQ/gHdh4mqbK
         6kEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05620a102700b0077f272c3aacsi22421057qkk.582.2023.12.18.01.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 01:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rF9lb-0003Fo-SC; Mon, 18 Dec 2023 04:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rF9lP-0003AU-O7; Mon, 18 Dec 2023 04:18:16 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rF9lN-00005Z-Lm; Mon, 18 Dec 2023 04:18:15 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 035AB11EFD1;
 Mon, 18 Dec 2023 09:18:11 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Thu, 07 Dec 2023 21:33:16 +0100
Subject: [PATCH qemu v3 3/3] hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
MIME-Version: 1.0
Message-ID: <170289109015.23396.9428181315206234398-3@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170289109015.23396.9428181315206234398-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: rHi3AXVHVLUK

From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32l4x5_soc.c         | 56 ++++++++++++++++++++++++++++++++--
 include/hw/arm/stm32l4x5_soc.h |  3 ++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7520dc5cc0..9c9d5bb541 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -458,6 +458,7 @@ config STM32L4X5_SOC
     bool
     select ARM_V7M
     select OR_IRQ
+    select STM32L4X5_EXTI
=20
 config XLNX_ZYNQMP_ARM
     bool
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index f476878b2c..b07593730f 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -45,10 +45,51 @@
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
     s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
     s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
@@ -59,7 +100,9 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
     Stm32l4x5SocState *s =3D STM32L4X5_SOC(dev_soc);
     const Stm32l4x5SocClass *sc =3D STM32L4X5_SOC_GET_CLASS(dev_soc);
     MemoryRegion *system_memory =3D get_system_memory();
-    DeviceState *armv7m;
+    DeviceState *dev, *armv7m;
+    SysBusDevice *busdev;
+    int i;
=20
     /*
      * We use s->refclk internally and only define it with qdev_init_clock_i=
n()
@@ -124,6 +167,16 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, =
Error **errp)
         return;
     }
=20
+    dev =3D DEVICE(&s->exti);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {
+        return;
+    }
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, EXTI_ADDR);
+    for (i =3D 0; i < NUM_EXTI_IRQ; i++) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[i]));
+    }
+
     /* APB1 BUS */
     create_unimplemented_device("TIM2",      0x40000000, 0x400);
     create_unimplemented_device("TIM3",      0x40000400, 0x400);
@@ -164,7 +217,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     create_unimplemented_device("SYSCFG",    0x40010000, 0x30);
     create_unimplemented_device("VREFBUF",   0x40010030, 0x1D0);
     create_unimplemented_device("COMP",      0x40010200, 0x200);
-    create_unimplemented_device("EXTI",      0x40010400, 0x400);
     /* RESERVED:    0x40010800, 0x1400 */
     create_unimplemented_device("FIREWALL",  0x40011C00, 0x400);
     /* RESERVED:    0x40012000, 0x800 */
diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_soc.h
index 564201fee5..ac47158596 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -37,6 +37,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
 #include "hw/arm/armv7m.h"
+#include "hw/misc/stm32l4x5_exti.h"
 #include "qom/object.h"
=20
 #define TYPE_STM32L4X5_SOC "stm32l4x5-soc"
@@ -50,6 +51,8 @@ struct Stm32l4x5SocState {
=20
     ARMv7MState armv7m;
=20
+    Stm32l4x5ExtiState exti;
+
     MemoryRegion sram1;
     MemoryRegion sram2;
     MemoryRegion flash;
--=20
2.38.5
