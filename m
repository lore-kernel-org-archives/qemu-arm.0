Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp714321eji;
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpPsLyHk1JXomHYnOv+Q1LlfZFE1OqzpqJFJo44y+k/yuOFG8WvBWu3mUhj3NK3981cAJo
X-Received: by 2002:ac8:4e83:0:b0:423:9b25:3943 with SMTP id 3-20020ac84e83000000b004239b253943mr23869379qtp.65.1702898205168;
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702898205; cv=none;
        d=google.com; s=arc-20160816;
        b=q6JZhWer57NTnj5tIj8f6PJCAaOEQgQk9jxJ+fAhcYKEcu0G53bao7O/jGYo5bccbL
         RoyIOGIyHY0BCqHEPnyRw5j8pxhFWwfjH/SymsR6l7JryQIz3Us/DvY++I9b1v3Q3uTR
         /cQ2DsFslKBAg6HP4jps/XNLqk0OYcq3SA38eEhrxsyyDd4ZmVKlR1qxdyryYK/7s/Ec
         7UeUbr7NTcd7GJnNm2R4xJ4KLqru+hzCGFdMa7ajqkPl82RSpsmllSpik4m4hkbik/51
         EZMq6dQU1JqFfolX59UCRL7TGgItPYdEILI6CUO9PiQsReulNlcXDCr4NFovC8Qj3Phu
         YCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:in-reply-to:message-id:mime-version
         :subject:date:from;
        bh=9OJbrh5B5a1fGNoUfgmeLR72Cc7JHtzZ2cLd4YQYwoY=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=uq5kHS+i//D+h8lWfBTG/HYp2DHKDMkC9qA1XMipDwYUm3wpNel4Am36krPXAF9iQL
         1jx+xd3MyuvDGj4Qb3eua7CodsYup0xEOBVAh1KFYXzEkyc4MR0frTWOVv8aQjnF9Usw
         ofC53ohtlyiBZ/F5W00iJPpeLHI9ZtwKFFjrEB+tkVU73wo8W1Zi772iQnATXUaDexec
         ND7RPiMV7eBCA4rwfVs1sPb+iox5WCuYd0OmkmvlgAM6m6N1o8g5GjgEJSB4D9dkI3ik
         HnTKuSxplVEYoMo4f9UiXqYN+ZMyjTVeb1Lr0xhKpS4NeOq3LLgjyzuo41IsZMK4YtPw
         LPJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020ac87144000000b00423dcdd55fcsi21862566qtp.17.2023.12.18.03.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBbD-00072y-3v; Mon, 18 Dec 2023 06:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rFBb5-00071m-Eu; Mon, 18 Dec 2023 06:15:43 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rFBb2-0008IN-Od; Mon, 18 Dec 2023 06:15:43 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 12F7A11EFD1;
 Mon, 18 Dec 2023 11:15:39 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Sun, 10 Dec 2023 18:51:08 +0100
Subject: [PATCH qemu v2 1/3] hw/misc: Implement STM32L4x5 SYSCFG
MIME-Version: 1.0
Message-ID: <170289813862.19159.2545029501234884208-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170289813862.19159.2545029501234884208-0@git.sr.ht>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 70Ou1cV8Geim

From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/misc/Kconfig                    |   3 +
 hw/misc/meson.build                |   1 +
 hw/misc/stm32l4x5_syscfg.c         | 265 +++++++++++++++++++++++++++++
 hw/misc/trace-events               |   6 +
 include/hw/misc/stm32l4x5_syscfg.h |  54 ++++++
 5 files changed, 329 insertions(+)
 create mode 100644 hw/misc/stm32l4x5_syscfg.c
 create mode 100644 include/hw/misc/stm32l4x5_syscfg.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 3efe3dc2cc..4fc6b29b43 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -90,6 +90,9 @@ config STM32F4XX_EXTI
 config STM32L4X5_EXTI
     bool
=20
+config STM32L4X5_SYSCFG
+    bool
+
 config MIPS_ITU
     bool
=20
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 16db6e228d..2ca2ce4b62 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -111,6 +111,7 @@ system_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: f=
iles('stm32f2xx_syscfg.
 system_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_sys=
cfg.c'))
 system_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.=
c'))
 system_ss.add(when: 'CONFIG_STM32L4X5_EXTI', if_true: files('stm32l4x5_exti.=
c'))
+system_ss.add(when: 'CONFIG_STM32L4X5_SYSCFG', if_true: files('stm32l4x5_sys=
cfg.c'))
 system_ss.add(when: 'CONFIG_MPS2_FPGAIO', if_true: files('mps2-fpgaio.c'))
 system_ss.add(when: 'CONFIG_MPS2_SCC', if_true: files('mps2-scc.c'))
=20
diff --git a/hw/misc/stm32l4x5_syscfg.c b/hw/misc/stm32l4x5_syscfg.c
new file mode 100644
index 0000000000..3af6bd7942
--- /dev/null
+++ b/hw/misc/stm32l4x5_syscfg.c
@@ -0,0 +1,265 @@
+/*
+ * STM32L4x5 SYSCFG (System Configuration Controller)
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * This work is based on the stm32f4xx_syscfg by Alistair Francis.
+ * Original code is licensed under the MIT License:
+ *
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ */
+
+/*
+ * The reference used is the STMicroElectronics RM0351 Reference manual
+ * for STM32L4x5 and STM32L4x6 advanced Arm =C2=AE -based 32-bit MCUs.
+ * https://www.st.com/en/microcontrollers-microprocessors/stm32l4x5/document=
ation.html
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "hw/misc/stm32l4x5_syscfg.h"
+
+#define SYSCFG_MEMRMP 0x00
+#define SYSCFG_CFGR1 0x04
+#define SYSCFG_EXTICR1 0x08
+#define SYSCFG_EXTICR2 0x0C
+#define SYSCFG_EXTICR3 0x10
+#define SYSCFG_EXTICR4 0x14
+#define SYSCFG_SCSR 0x18
+#define SYSCFG_CFGR2 0x1C
+#define SYSCFG_SWPR 0x20
+#define SYSCFG_SKR 0x24
+#define SYSCFG_SWPR2 0x28
+
+/* 00000000_00000000_00000001_00000111 */
+#define ACTIVABLE_BITS_MEMRP 0x00000107
+
+/* 11111100_11111111_00000001_00000000 */
+#define ACTIVABLE_BITS_CFGR1 0xFCFF0100
+/* 00000000_00000000_00000000_00000001 */
+#define FIREWALL_DISABLE_CFGR1 0x00000001
+
+/* 00000000_00000000_11111111_11111111 */
+#define ACTIVABLE_BITS_EXTICR 0x0000FFFF
+
+/* 00000000_00000000_00000000_00000011 */
+/* #define ACTIVABLE_BITS_SCSR 0x00000003 */
+
+/* 00000000_00000000_00000000_00001111 */
+#define ECC_LOCK_CFGR2 0x0000000F
+/* 00000000_00000000_00000001_00000000 */
+#define SRAM2_PARITY_ERROR_FLAG_CFGR2 0x00000100
+
+/* 00000000_00000000_00000000_11111111 */
+#define ACTIVABLE_BITS_SKR 0x000000FF
+
+static void stm32l4x5_syscfg_hold_reset(Object *obj)
+{
+    Stm32l4x5SyscfgState *s =3D STM32L4X5_SYSCFG(obj);
+
+    s->memrmp =3D 0x00000000;
+    s->cfgr1 =3D 0x7C000001;
+    s->exticr[0] =3D 0x00000000;
+    s->exticr[1] =3D 0x00000000;
+    s->exticr[2] =3D 0x00000000;
+    s->exticr[3] =3D 0x00000000;
+    s->scsr =3D 0x00000000;
+    s->cfgr2 =3D 0x00000000;
+    s->swpr =3D 0x00000000;
+    s->skr =3D 0x00000000;
+    s->swpr2 =3D 0x00000000;
+}
+
+static void stm32l4x5_syscfg_set_irq(void *opaque, int irq, int level)
+{
+    Stm32l4x5SyscfgState *s =3D opaque;
+    uint8_t gpio =3D irq / GPIO_NUM_PINS;
+    g_assert(gpio < NUM_GPIOS);
+
+    int line =3D irq % GPIO_NUM_PINS;
+    int exticr_reg =3D line / 4;
+    int startbit =3D (irq % 4) * 4;
+
+    trace_stm32l4x5_syscfg_set_irq(gpio, line, level);
+
+    if (extract32(s->exticr[exticr_reg], startbit, 4) =3D=3D gpio) {
+        trace_stm32l4x5_syscfg_pulse_exti(line);
+        qemu_set_irq(s->gpio_out[line], level);
+   }
+}
+
+static uint64_t stm32l4x5_syscfg_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    Stm32l4x5SyscfgState *s =3D opaque;
+
+    trace_stm32l4x5_syscfg_read(addr);
+
+    switch (addr) {
+    case SYSCFG_MEMRMP:
+        return s->memrmp;
+    case SYSCFG_CFGR1:
+        return s->cfgr1;
+    case SYSCFG_EXTICR1...SYSCFG_EXTICR4:
+        return s->exticr[(addr - SYSCFG_EXTICR1) / 4];
+    case SYSCFG_SCSR:
+        return s->scsr;
+    case SYSCFG_CFGR2:
+        return s->cfgr2;
+    case SYSCFG_SWPR:
+        return s->swpr;
+    case SYSCFG_SKR:
+        return s->skr;
+    case SYSCFG_SWPR2:
+        return s->swpr2;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+        return 0;
+    }
+}
+
+static void stm32l4x5_syscfg_write(void *opaque, hwaddr addr,
+                       uint64_t val64, unsigned int size)
+{
+    Stm32l4x5SyscfgState *s =3D opaque;
+    uint32_t value =3D val64;
+
+    trace_stm32l4x5_syscfg_write(addr, value);
+
+    switch (addr) {
+    case SYSCFG_MEMRMP:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Changing the memory mapping isn't supported\n",
+                      __func__);
+        s->memrmp =3D value & ACTIVABLE_BITS_MEMRP;
+        return;
+    case SYSCFG_CFGR1:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Functions in CFGRx aren't supported\n",
+                      __func__);
+        /* bit 0 (firewall dis.) is cleared by software, set only by reset. =
*/
+        s->cfgr1 =3D (s->cfgr1 & value & FIREWALL_DISABLE_CFGR1) |
+                          (value & ACTIVABLE_BITS_CFGR1);
+        return;
+    case SYSCFG_EXTICR1...SYSCFG_EXTICR4:
+        s->exticr[(addr - SYSCFG_EXTICR1) / 4] =3D
+                (value & ACTIVABLE_BITS_EXTICR);
+        return;
+    case SYSCFG_SCSR:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Erasing SRAM2 isn't supported\n",
+                      __func__);
+        /*
+         * only non reserved bits are :
+         * bit 0 (write-protected by a passkey), bit 1 (meant to be read)
+         * so it serves no purpose yet to add :
+         * s->scsr =3D value & 0x3;
+         */
+        return;
+    case SYSCFG_CFGR2:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Functions in CFGRx aren't supported\n",
+                      __func__);
+        /* bit 8 (SRAM2 PEF) is cleared by software by writing a '1'.*/
+        /* bits[3:0] (ECC Lock) are set by software, cleared only by reset.*/
+        s->cfgr2 =3D (s->cfgr2 | (value & ECC_LOCK_CFGR2)) &
+                          ~(value & SRAM2_PARITY_ERROR_FLAG_CFGR2);
+        return;
+    case SYSCFG_SWPR:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Write protecting SRAM2 isn't supported\n",
+                      __func__);
+        /* These bits are set by software and cleared only by reset.*/
+        s->swpr |=3D value;
+        return;
+    case SYSCFG_SKR:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Erasing SRAM2 isn't supported\n",
+                      __func__);
+        s->skr =3D value & ACTIVABLE_BITS_SKR;
+        return;
+    case SYSCFG_SWPR2:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Write protecting SRAM2 isn't supported\n",
+                      __func__);
+        /* These bits are set by software and cleared only by reset.*/
+        s->swpr2 |=3D value;
+        return;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+}
+
+static const MemoryRegionOps stm32l4x5_syscfg_ops =3D {
+    .read =3D stm32l4x5_syscfg_read,
+    .write =3D stm32l4x5_syscfg_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size =3D 4,
+    .impl.max_access_size =3D 4,
+    .impl.unaligned =3D false,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+    .valid.unaligned =3D false,
+};
+
+static void stm32l4x5_syscfg_init(Object *obj)
+{
+    Stm32l4x5SyscfgState *s =3D STM32L4X5_SYSCFG(obj);
+
+    memory_region_init_io(&s->mmio, obj, &stm32l4x5_syscfg_ops, s,
+                          TYPE_STM32L4X5_SYSCFG, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    qdev_init_gpio_in(DEVICE(obj), stm32l4x5_syscfg_set_irq, 16 * NUM_GPIOS);
+    qdev_init_gpio_out(DEVICE(obj), s->gpio_out, 16);
+}
+
+static const VMStateDescription vmstate_stm32l4x5_syscfg =3D {
+    .name =3D TYPE_STM32L4X5_SYSCFG,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(memrmp, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32(cfgr1, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32_ARRAY(exticr, Stm32l4x5SyscfgState,
+                             SYSCFG_NUM_EXTICR),
+        VMSTATE_UINT32(scsr, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32(cfgr2, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32(swpr, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32(skr, Stm32l4x5SyscfgState),
+        VMSTATE_UINT32(swpr2, Stm32l4x5SyscfgState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void stm32l4x5_syscfg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+
+    dc->vmsd =3D &vmstate_stm32l4x5_syscfg;
+    rc->phases.hold =3D stm32l4x5_syscfg_hold_reset;
+}
+
+static const TypeInfo stm32l4x5_syscfg_info[] =3D {
+    {
+        .name          =3D TYPE_STM32L4X5_SYSCFG,
+        .parent        =3D TYPE_SYS_BUS_DEVICE,
+        .instance_size =3D sizeof(Stm32l4x5SyscfgState),
+        .instance_init =3D stm32l4x5_syscfg_init,
+        .class_init    =3D stm32l4x5_syscfg_class_init,
+    }
+};
+
+DEFINE_TYPES(stm32l4x5_syscfg_info)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 2f01c62c0e..a24d7e1eac 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -163,6 +163,12 @@ stm32f4xx_exti_set_irq(int irq, int level) "Set EXTI: %d=
 to %d"
 stm32f4xx_exti_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
 stm32f4xx_exti_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" PR=
Ix64 " val: 0x%" PRIx64 ""
=20
+# stm32l4x5_syscfg.c
+stm32l4x5_syscfg_set_irq(int gpio, int line, int level) "irq from GPIO: %d, =
line: %d, level: %d"
+stm32l4x5_syscfg_pulse_exti(int irq) "irq %d forwarded to EXTI"
+stm32l4x5_syscfg_read(uint64_t addr) "reg read: addr: 0x%" PRIx64 " "
+stm32l4x5_syscfg_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" =
PRIx64 " val: 0x%" PRIx64 ""
+
 # stm32l4x5_exti.c
 stm32l4x5_exti_set_irq(int irq, int level) "Set EXTI: %d to %d"
 stm32l4x5_exti_read(uint64_t addr, uint64_t data) "reg read: addr: 0x%" PRIx=
64 " val: 0x%" PRIx64 ""
diff --git a/include/hw/misc/stm32l4x5_syscfg.h b/include/hw/misc/stm32l4x5_s=
yscfg.h
new file mode 100644
index 0000000000..76bdcf5189
--- /dev/null
+++ b/include/hw/misc/stm32l4x5_syscfg.h
@@ -0,0 +1,54 @@
+/*
+ * STM32L4x5 SYSCFG (System Configuration Controller)
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * This work is based on the stm32f4xx_syscfg by Alistair Francis.
+ * Original code is licensed under the MIT License:
+ *
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
+ */
+
+/*
+ * The reference used is the STMicroElectronics RM0351 Reference manual
+ * for STM32L4x5 and STM32L4x6 advanced Arm =C2=AE -based 32-bit MCUs.
+ * https://www.st.com/en/microcontrollers-microprocessors/stm32l4x5/document=
ation.html
+ */
+
+#ifndef HW_STM32L4X5_SYSCFG_H
+#define HW_STM32L4X5_SYSCFG_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_STM32L4X5_SYSCFG "stm32l4x5-syscfg"
+OBJECT_DECLARE_SIMPLE_TYPE(Stm32l4x5SyscfgState, STM32L4X5_SYSCFG)
+
+#define NUM_GPIOS 8
+#define GPIO_NUM_PINS 16
+#define SYSCFG_NUM_EXTICR 4
+
+struct Stm32l4x5SyscfgState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    uint32_t memrmp;
+    uint32_t cfgr1;
+    uint32_t exticr[SYSCFG_NUM_EXTICR];
+    uint32_t scsr;
+    uint32_t cfgr2;
+    uint32_t swpr;
+    uint32_t skr;
+    uint32_t swpr2;
+
+    qemu_irq gpio_out[16];
+};
+
+#endif
--=20
2.38.5

