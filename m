Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1913767ejb;
        Thu, 7 Dec 2023 13:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkD0Vkg6mAj+yjStb3yCVwcdhRFgm7bBz6v4FpxhDnMLuifQk9+ziy9SZ/rvjGQfY2wJvZ
X-Received: by 2002:ac8:7f82:0:b0:423:7614:fbe8 with SMTP id z2-20020ac87f82000000b004237614fbe8mr4075550qtj.2.1701984679031;
        Thu, 07 Dec 2023 13:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984679; cv=none;
        d=google.com; s=arc-20160816;
        b=xQe/twMfRqNNFjSKyEQs8lLR1WRNI83HWzQVc8hPVDvcJae+BrzBVLmWwxC4KPb13I
         oOUgsia1zSpk43Da7tb2GnEc8nbAk6S7/it8FkLxRl7N0VgFVlUu5tAZnaVuHx+dUCIb
         b0s58rY6GYrD2F0ZjvuikcasE4meW9optkvNrV4WCF0EIWlgup6m3vM61FCqSBTQgPLB
         oJf07wHQozje1j/qv0/Vmtq/uVOGsTu5gqcfr2gBp9kE+elBS61n24jw2T4XU2AVPHgT
         D7R7iP+OIwCkQRHa36cfUKaJEuCqp/iTBeam+n8caLDlhPg40AVkxsDei5OasDIe8l4u
         4paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:in-reply-to:message-id:mime-version
         :subject:date:from;
        bh=r/Cllfqhw21Dlsc2U2emJZOyTy2bWVz7Qnr7PmfoJlw=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=FtQBBc9bZvURO0+4R9E/Mz+KiP7OrRVzKBvsRu9YMR0rwo4OcF6Jh2XYHtGad8xb6y
         wGnDFerAbyOX43+yFuMpt2ir0xi9Psopp5GYtVGQ/UDjX35X/u6PSqeWW1aQcBS3PcTH
         kQAPBLr2V+71UI7TKwEc+/M7LVYamOeE0pFKLZDERDJa4f5LqS0KwA29cyty+wg6SWb7
         cKjD3FLRVYWbLGDabcgrkaS34X/VUjPVlPW4ImIuQBz/Iy3BrvmFsi77MvcDXuX0dvlr
         GRAzO152te8kB6esOP8rWEyhYfyrktGhkUzNWJj3xG9baC4ZYCQd7xR+xN87llXCzLsv
         x0XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020a05622a114a00b0042580a1d7edsi700462qty.589.2023.12.07.13.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 13:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBLxX-0007XC-7n; Thu, 07 Dec 2023 16:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rBLx1-0007RI-Ag; Thu, 07 Dec 2023 16:30:31 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rBLwx-0005MO-LX; Thu, 07 Dec 2023 16:30:31 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D97B911F055;
 Thu,  7 Dec 2023 21:30:23 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Thu, 07 Dec 2023 21:12:42 +0100
Subject: [PATCH qemu 2/3] hw/arm: Add STM32L4x5 EXTI QTest testcase
MIME-Version: 1.0
Message-ID: <170198462199.32162.284497577253427308-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170198462199.32162.284497577253427308-0@git.sr.ht>
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
X-TUID: iYyPN6/sT5Pn

From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 485 ++++++++++++++++++++++++++++++
 2 files changed, 490 insertions(+)
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9945e69b1..bc62f201a8 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -194,6 +194,10 @@ qtests_aspeed =3D \
   ['aspeed_hace-test',
    'aspeed_smc-test',
    'aspeed_gpio-test']
+
+qtests_stm32l4x5 =3D \
+  ['stm32l4x5_exti-test']
+
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-du=
altimer-test'] : []) + \
@@ -207,6 +211,7 @@ qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] :=
 []) + \
   (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []=
) + \
   (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) +=
 \
+  (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') ? qtests_stm32l4x5 : [=
]) + \
   ['arm-cpu-features',
    'boot-serial-test']
=20
diff --git a/tests/qtest/stm32l4x5_exti-test.c b/tests/qtest/stm32l4x5_exti-t=
est.c
new file mode 100644
index 0000000000..e105b3dea3
--- /dev/null
+++ b/tests/qtest/stm32l4x5_exti-test.c
@@ -0,0 +1,485 @@
+/*
+ * QTest testcase for STM32L4x5_EXTI
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#define EXTI_BASE_ADDR 0x40010400
+#define EXTI_IMR1 0x00
+#define EXTI_EMR1 0x04
+#define EXTI_RTSR1 0x08
+#define EXTI_FTSR1 0x0C
+#define EXTI_SWIER1 0x10
+#define EXTI_PR1 0x14
+#define EXTI_IMR2 0x20
+#define EXTI_EMR2 0x24
+#define EXTI_RTSR2 0x28
+#define EXTI_FTSR2 0x2C
+#define EXTI_SWIER2 0x30
+#define EXTI_PR2 0x34
+
+#define NVIC_ISER 0xE000E100
+#define NVIC_ISPR 0xE000E200
+#define NVIC_ICPR 0xE000E280
+
+#define EXTI0_IRQ 6
+#define EXTI1_IRQ 7
+#define EXTI35_IRQ 1
+
+static void enable_nvic_irq(unsigned int n)
+{
+    writel(NVIC_ISER, 1 << n);
+}
+
+static void unpend_nvic_irq(unsigned int n)
+{
+    writel(NVIC_ICPR, 1 << n);
+}
+
+static bool check_nvic_pending(unsigned int n)
+{
+    return readl(NVIC_ISPR) & (1 << n);
+}
+
+static void exti_writel(unsigned int offset, uint32_t value)
+{
+    writel(EXTI_BASE_ADDR + offset, value);
+}
+
+static uint32_t exti_readl(unsigned int offset)
+{
+    return readl(EXTI_BASE_ADDR + offset);
+}
+
+static void test_reg_write_read(void)
+{
+    /* Test that non-reserved bits in xMR and xTSR can be set and cleared */
+
+    exti_writel(EXTI_IMR1, 0xFFFFFFFF);
+    uint32_t imr1 =3D exti_readl(EXTI_IMR1);
+    g_assert_cmpuint(imr1, =3D=3D, 0xFFFFFFFF);
+    exti_writel(EXTI_IMR1, 0x00000000);
+    imr1 =3D exti_readl(EXTI_IMR1);
+    g_assert_cmpuint(imr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_EMR1, 0xFFFFFFFF);
+    uint32_t emr1 =3D exti_readl(EXTI_EMR1);
+    g_assert_cmpuint(emr1, =3D=3D, 0xFFFFFFFF);
+    exti_writel(EXTI_EMR1, 0x00000000);
+    emr1 =3D exti_readl(EXTI_EMR1);
+    g_assert_cmpuint(emr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_RTSR1, 0xFFFFFFFF);
+    uint32_t rtsr1 =3D exti_readl(EXTI_RTSR1);
+    g_assert_cmpuint(rtsr1, =3D=3D, 0x007DFFFF);
+    exti_writel(EXTI_RTSR1, 0x00000000);
+    rtsr1 =3D exti_readl(EXTI_RTSR1);
+    g_assert_cmpuint(rtsr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_FTSR1, 0xFFFFFFFF);
+    uint32_t ftsr1 =3D exti_readl(EXTI_FTSR1);
+    g_assert_cmpuint(ftsr1, =3D=3D, 0x007DFFFF);
+    exti_writel(EXTI_FTSR1, 0x00000000);
+    ftsr1 =3D exti_readl(EXTI_FTSR1);
+    g_assert_cmpuint(ftsr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_IMR2, 0xFFFFFFFF);
+    uint32_t imr2 =3D exti_readl(EXTI_IMR2);
+    g_assert_cmpuint(imr2, =3D=3D, 0x000000FF);
+    exti_writel(EXTI_IMR2, 0x00000000);
+    imr2 =3D exti_readl(EXTI_IMR2);
+    g_assert_cmpuint(imr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_EMR2, 0xFFFFFFFF);
+    uint32_t emr2 =3D exti_readl(EXTI_EMR2);
+    g_assert_cmpuint(emr2, =3D=3D, 0x000000FF);
+    exti_writel(EXTI_EMR2, 0x00000000);
+    emr2 =3D exti_readl(EXTI_EMR2);
+    g_assert_cmpuint(emr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_RTSR2, 0xFFFFFFFF);
+    uint32_t rtsr2 =3D exti_readl(EXTI_RTSR2);
+    g_assert_cmpuint(rtsr2, =3D=3D, 0x00000078);
+    exti_writel(EXTI_RTSR2, 0x00000000);
+    rtsr2 =3D exti_readl(EXTI_RTSR2);
+    g_assert_cmpuint(rtsr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_FTSR2, 0xFFFFFFFF);
+    uint32_t ftsr2 =3D exti_readl(EXTI_FTSR2);
+    g_assert_cmpuint(ftsr2, =3D=3D, 0x00000078);
+    exti_writel(EXTI_FTSR2, 0x00000000);
+    ftsr2 =3D exti_readl(EXTI_FTSR2);
+    g_assert_cmpuint(ftsr2, =3D=3D, 0x00000000);
+}
+
+static void test_direct_lines_write(void)
+{
+    /* Test that direct lines reserved bits are not written to */
+
+    exti_writel(EXTI_RTSR1, 0xFF820000);
+    uint32_t rtsr1 =3D exti_readl(EXTI_RTSR1);
+    g_assert_cmpuint(rtsr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_FTSR1, 0xFF820000);
+    uint32_t ftsr1 =3D exti_readl(EXTI_FTSR1);
+    g_assert_cmpuint(ftsr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_SWIER1, 0xFF820000);
+    uint32_t swier1 =3D exti_readl(EXTI_SWIER1);
+    g_assert_cmpuint(swier1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_PR1, 0xFF820000);
+    uint32_t pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_RTSR2, 0x00000087);
+    const uint32_t rtsr2 =3D exti_readl(EXTI_RTSR2);
+    g_assert_cmpuint(rtsr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_FTSR2, 0x00000087);
+    const uint32_t ftsr2 =3D exti_readl(EXTI_FTSR2);
+    g_assert_cmpuint(ftsr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_SWIER2, 0x00000087);
+    const uint32_t swier2 =3D exti_readl(EXTI_SWIER2);
+    g_assert_cmpuint(swier2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_PR2, 0x00000087);
+    const uint32_t pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+}
+
+static void test_reserved_bits_write(void)
+{
+    /* Test that reserved bits stay are not written to */
+
+    exti_writel(EXTI_IMR2, 0xFFFFFF00);
+    uint32_t imr2 =3D exti_readl(EXTI_IMR2);
+    g_assert_cmpuint(imr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_EMR2, 0xFFFFFF00);
+    uint32_t emr2 =3D exti_readl(EXTI_EMR2);
+    g_assert_cmpuint(emr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_RTSR2, 0xFFFFFF00);
+    const uint32_t rtsr2 =3D exti_readl(EXTI_RTSR2);
+    g_assert_cmpuint(rtsr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_FTSR2, 0xFFFFFF00);
+    const uint32_t ftsr2 =3D exti_readl(EXTI_FTSR2);
+    g_assert_cmpuint(ftsr2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_SWIER2, 0xFFFFFF00);
+    const uint32_t swier2 =3D exti_readl(EXTI_SWIER2);
+    g_assert_cmpuint(swier2, =3D=3D, 0x00000000);
+
+    exti_writel(EXTI_PR2, 0xFFFFFF00);
+    const uint32_t pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+}
+
+static void test_software_interrupt(void)
+{
+    /*
+     * Test that we can launch a software irq by :
+     * - enabling its line in IMR
+     * - and then setting a bit from '0' to '1' in SWIER
+     *
+     * And that the interruption stays pending in NVIC
+     * even after clearing the pending bit in PR.
+     */
+
+    /*
+     * Testing interrupt line EXTI0
+     * Bit 0 in EXTI_*1 registers (EXTI0) corresponds to GPIO Px_0
+     */
+
+    enable_nvic_irq(EXTI0_IRQ);
+    /* Check that there are no interrupts already pending in PR */
+    uint32_t pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that this specific interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI0_IRQ));
+
+    /* Enable interrupt line EXTI0 */
+    exti_writel(EXTI_IMR1, 0x00000001);
+    /* Set the right SWIER bit from '0' to '1' */
+    exti_writel(EXTI_SWIER1, 0x00000000);
+    exti_writel(EXTI_SWIER1, 0x00000001);
+
+    /* Check that the write in SWIER was effective */
+    uint32_t swier1 =3D exti_readl(EXTI_SWIER1);
+    g_assert_cmpuint(swier1, =3D=3D, 0x00000001);
+    /* Check that the corresponding pending bit in PR is set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000001);
+    /* Check that the corresponding interrupt is pending in the NVIC */
+    g_assert_true(check_nvic_pending(EXTI0_IRQ));
+
+    /* Clear the pending bit in PR */
+    exti_writel(EXTI_PR1, 0x00000001);
+
+    /* Check that the write in PR was effective */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the corresponding bit in SWIER was cleared */
+    swier1 =3D exti_readl(EXTI_SWIER1);
+    g_assert_cmpuint(swier1, =3D=3D, 0x00000000);
+    /* Check that the interrupt is still pending in the NVIC */
+    g_assert_true(check_nvic_pending(EXTI0_IRQ));
+
+    /*
+     * Testing interrupt line EXTI35
+     * Bit 3 in EXTI_*2 registers (EXTI35) corresponds to PVM 1 Wakeup
+     */
+
+    enable_nvic_irq(EXTI35_IRQ);
+    /* Check that there are no interrupts already pending */
+    uint32_t pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+    g_assert_false(check_nvic_pending(EXTI35_IRQ));
+
+    /* Enable interrupt line EXTI0 */
+    exti_writel(EXTI_IMR2, 0x00000008);
+    /* Set the right SWIER bit from '0' to '1' */
+    exti_writel(EXTI_SWIER2, 0x00000000);
+    exti_writel(EXTI_SWIER2, 0x00000008);
+
+    /* Check that the write in SWIER was effective */
+    uint32_t swier2 =3D exti_readl(EXTI_SWIER2);
+    g_assert_cmpuint(swier2, =3D=3D, 0x00000008);
+    /* Check that the corresponding pending bit in PR is set */
+    pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000008);
+    /* Check that the corresponding interrupt is pending in the NVIC */
+    g_assert_true(check_nvic_pending(EXTI35_IRQ));
+
+    /* Clear the pending bit in PR */
+    exti_writel(EXTI_PR2, 0x00000008);
+
+    /* Check that the write in PR was effective */
+    pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+    /* Check that the corresponding bit in SWIER was cleared */
+    swier2 =3D exti_readl(EXTI_SWIER2);
+    g_assert_cmpuint(swier2, =3D=3D, 0x00000000);
+    /* Check that the interrupt is still pending in the NVIC */
+    g_assert_true(check_nvic_pending(EXTI35_IRQ));
+
+    /* Clean NVIC */
+    unpend_nvic_irq(EXTI0_IRQ);
+    g_assert_false(check_nvic_pending(EXTI0_IRQ));
+    unpend_nvic_irq(EXTI35_IRQ);
+    g_assert_false(check_nvic_pending(EXTI35_IRQ));
+}
+
+static void test_no_software_interrupt(void)
+{
+    /*
+     * Test that software irq doesn't happen when :
+     * - corresponding bit in IMR isn't set
+     * - SWIER is set to 1 before IMR is set to 1
+     */
+
+    /*
+     * Testing interrupt line EXTI0
+     * Bit 0 in EXTI_*1 registers (EXTI0) corresponds to GPIO Px_0
+     */
+
+    enable_nvic_irq(EXTI0_IRQ);
+    /* Check that there are no interrupts already pending in PR */
+    uint32_t pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that this specific interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI0_IRQ));
+
+    /* Mask interrupt line EXTI0 */
+    exti_writel(EXTI_IMR1, 0x00000000);
+    /* Set the corresponding SWIER bit from '0' to '1' */
+    exti_writel(EXTI_SWIER1, 0x00000000);
+    exti_writel(EXTI_SWIER1, 0x00000001);
+
+    /* Check that the write in SWIER was effective */
+    uint32_t swier1 =3D exti_readl(EXTI_SWIER1);
+    g_assert_cmpuint(swier1, =3D=3D, 0x00000001);
+    /* Check that the pending bit in PR wasn't set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI0_IRQ));
+
+    /* Enable interrupt line EXTI0 */
+    exti_writel(EXTI_IMR1, 0x00000001);
+
+    /* Check that the pending bit in PR wasn't set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI0_IRQ));
+
+    /*
+     * Testing interrupt line EXTI35
+     * Bit 3 in EXTI_*2 registers (EXTI35) corresponds to PVM 1 Wakeup
+     */
+
+    enable_nvic_irq(EXTI35_IRQ);
+    /* Check that there are no interrupts already pending in PR */
+    uint32_t pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+    /* Check that this specific interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI35_IRQ));
+
+    /* Mask interrupt line EXTI35 */
+    exti_writel(EXTI_IMR2, 0x00000000);
+    /* Set the corresponding SWIER bit from '0' to '1' */
+    exti_writel(EXTI_SWIER2, 0x00000000);
+    exti_writel(EXTI_SWIER2, 0x00000008);
+
+    /* Check that the write in SWIER was effective */
+    uint32_t swier2 =3D exti_readl(EXTI_SWIER2);
+    g_assert_cmpuint(swier2, =3D=3D, 0x00000008);
+    /* Check that the pending bit in PR wasn't set */
+    pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI35_IRQ));
+
+    /* Enable interrupt line EXTI35 */
+    exti_writel(EXTI_IMR2, 0x00000008);
+
+    /* Check that the pending bit in PR wasn't set */
+    pr2 =3D exti_readl(EXTI_PR2);
+    g_assert_cmpuint(pr2, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI35_IRQ));
+}
+
+static void test_masked_interrupt(void)
+{
+    /*
+     * Test that irq doesn't happen when :
+     * - corresponding bit in IMR isn't set
+     * - SWIER is set to 1 before IMR is set to 1
+     */
+
+    /*
+     * Testing interrupt line EXTI1
+     * with rising edge from GPIOx pin 1
+     */
+
+    enable_nvic_irq(EXTI1_IRQ);
+    /* Check that there are no interrupts already pending in PR */
+    uint32_t pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that this specific interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI1_IRQ));
+
+    /* Mask interrupt line EXTI1 */
+    exti_writel(EXTI_IMR1, 0x00000000);
+
+    /* Configure interrupt on rising edge */
+    exti_writel(EXTI_RTSR1, 0x00000002);
+
+    /* Simulate rising edge from GPIO line 1 */
+    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
+                     NULL, 1, 1);
+
+    /* Check that the pending bit in PR wasn't set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI1_IRQ));
+
+    /* Enable interrupt line EXTI1 */
+    exti_writel(EXTI_IMR1, 0x00000002);
+
+    /* Check that the pending bit in PR wasn't set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI1_IRQ));
+}
+
+static void test_interrupt(void)
+{
+    /*
+     * Test that we can launch an irq by :
+     * - enabling its line in IMR
+     * - configuring interrupt on rising edge
+     * - and then setting the input line from '0' to '1'
+     *
+     * And that the interruption stays pending in NVIC
+     * even after clearing the pending bit in PR.
+     */
+
+    /*
+     * Testing interrupt line EXTI1
+     * with rising edge from GPIOx pin 1
+     */
+
+    enable_nvic_irq(EXTI1_IRQ);
+    /* Check that there are no interrupts already pending in PR */
+    uint32_t pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that this specific interrupt isn't pending in NVIC */
+    g_assert_false(check_nvic_pending(EXTI1_IRQ));
+
+    /* Enable interrupt line EXTI1 */
+    exti_writel(EXTI_IMR1, 0x00000002);
+
+    /* Configure interrupt on rising edge */
+    exti_writel(EXTI_RTSR1, 0x00000002);
+
+    /* Simulate rising edge from GPIO line 1 */
+    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
+                     NULL, 1, 1);
+
+    /* Check that the pending bit in PR was set */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000002);
+    /* Check that the interrupt is pending in NVIC */
+    g_assert_true(check_nvic_pending(EXTI1_IRQ));
+
+    /* Clear the pending bit in PR */
+    exti_writel(EXTI_PR1, 0x00000002);
+
+    /* Check that the write in PR was effective */
+    pr1 =3D exti_readl(EXTI_PR1);
+    g_assert_cmpuint(pr1, =3D=3D, 0x00000000);
+    /* Check that the interrupt is still pending in the NVIC */
+    g_assert_true(check_nvic_pending(EXTI1_IRQ));
+
+    /* Clean NVIC */
+    unpend_nvic_irq(EXTI1_IRQ);
+    g_assert_false(check_nvic_pending(EXTI1_IRQ));
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+    qtest_add_func("stm32l4x5/exti/direct_lines", test_direct_lines_write);
+    qtest_add_func("stm32l4x5/exti/reserved_bits", test_reserved_bits_write);
+    qtest_add_func("stm32l4x5/exti/reg_write_read", test_reg_write_read);
+    qtest_add_func("stm32l4x5/exti/no_software_interrupt",
+                   test_no_software_interrupt);
+    qtest_add_func("stm32l4x5/exti/software_interrupt",
+                   test_software_interrupt);
+    qtest_add_func("stm32l4x5/exti/masked_interrupt", test_masked_interrupt);
+    qtest_add_func("stm32l4x5/exti/interrupt", test_interrupt);
+
+    qtest_start("-machine b-l475e-iot01a");
+    ret =3D g_test_run();
+    qtest_end();
+
+    return ret;
+}
--=20
2.38.5

