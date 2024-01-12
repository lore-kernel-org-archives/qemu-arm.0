Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2500946ejs;
        Fri, 12 Jan 2024 09:08:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRmrCdvifPGXS10lnEWYpWX/qVbGo6LytHKcrX8BYO7452aRTWtXAsoOeAS/MB8fM1JzVf
X-Received: by 2002:a05:620a:470f:b0:783:35d4:540d with SMTP id bs15-20020a05620a470f00b0078335d4540dmr2522215qkb.44.1705079282744;
        Fri, 12 Jan 2024 09:08:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705079282; cv=none;
        d=google.com; s=arc-20160816;
        b=TzUki6EOuITBkPRyL3TgxhfYDyZWejF7Bau4Px3+D2cbBEUGg2aMmVYsCnRWkWFElF
         KJn/AyNSbfsBBJ6aqsfTPaDtQmT9G4w56gLvlF8Rio2ApPqsBUk/PUGqNFLm64PXoFur
         f+pIG71Lz3qbfpcAS0fQR7FzJjSOTo61UtGZ5JzG0FdMc0k9I5oIjAJ0eOPTF5K6ypr5
         kXPU+Vq1uYllZhLN1OhfzeW7jSWXSh9B55du8FhW3chcrK0lRVXlDLBv8j6nDwuful6J
         Lrg5J4XKV3avToM85i+NrENvI1n09M++14Rc/QCKyPiS51CL8XdgXwqHI/DRReOnWdW8
         ay1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=P6WJopXc7gLArim+Ur0KHnmkk8r4TzVNbo6tKdriGlU=;
        fh=H4j+w7DFGN5ZRWLtnlYR7eibAzEyLeay0bJsCJBlOgY=;
        b=MIgNPH/HvabdLDxaCf1zq3uVi2rVqk4HeYALxAWyN7so9F60TyedxoWssjbUJw/PXR
         snHN04heYtretSvTMFfG0CEHxJmnDpS9qltIG2fCow4FeRxfzMlLbsCi6CC/voCn7Rn3
         MC1P0CEzIdDbdKMiXyQDRf5xBR6vp3d6qFRSf8xmDN2Vm8B7ppbaNnpQM+XswADEMoR/
         gpBW/1bH7qoVM1X6bNnlMo7nabLKX/9Avw++Z7u7uUfxAWxknSkmIXSt/2LGo08ofcfw
         JiG4eUwDHL2fGyM/qF05AhmxgCp0mAFHOqqFl8pjiYNlxK1FwJH0Pd/PQbA1DaAHTe/h
         0YKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=FrVp735u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da33-20020a05620a362100b0078331431074si3190940qkb.673.2024.01.12.09.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 09:08:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=FrVp735u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOKzd-0005Js-70; Fri, 12 Jan 2024 12:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rOKzb-0005IN-MZ; Fri, 12 Jan 2024 12:06:51 -0500
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rOKzY-000506-41; Fri, 12 Jan 2024 12:06:51 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 5C5AD80691;
 Fri, 12 Jan 2024 18:06:42 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id i98td2gUyzt1; Fri, 12 Jan 2024 18:06:41 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 9D45980689;
 Fri, 12 Jan 2024 18:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 9D45980689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1705079201;
 bh=P6WJopXc7gLArim+Ur0KHnmkk8r4TzVNbo6tKdriGlU=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=FrVp735u4n9WOdavWXQfcFV8o7gZbss0HMLHWc8cKoaHCnqzWfAxdUlfj+ax+KiYO
 wzM2jNB+c9RnsMv4rJqu74SUJhDF3zUD9A1FWHOM53pHjm0gXZL449ZY7H2Vn08keW
 nb2ipYRz1M6CVKZZVsXHxlR4UNerCeuitqgEWM+o=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id DJX_QNfrwGhR; Fri, 12 Jan 2024 18:06:41 +0100 (CET)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:240:fa97:9da:79c1:e167])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 5411980671;
 Fri, 12 Jan 2024 18:06:41 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [RFC 3/3] tests/qtest: Add STM32L4x5 GPIO QTest testcase
Date: Fri, 12 Jan 2024 18:05:40 +0100
Message-ID: <20240112170635.303226-4-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112170635.303226-1-ines.varhol@telecom-paris.fr>
References: <20240112170635.303226-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
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
X-TUID: bS7dzptKjQPK

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 tests/qtest/meson.build           |   3 +-
 tests/qtest/stm32l4x5_gpio-test.c | 319 ++++++++++++++++++++++++++++++
 2 files changed, 321 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/stm32l4x5_gpio-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index a926af92f6..a80552c012 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -197,7 +197,8 @@ qtests_aspeed =3D \
=20
 qtests_stm32l4x5 =3D \
   ['stm32l4x5_exti-test',
-   'stm32l4x5_syscfg-test']
+   'stm32l4x5_syscfg-test',
+   'stm32l4x5_gpio-test']
=20
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
diff --git a/tests/qtest/stm32l4x5_gpio-test.c b/tests/qtest/stm32l4x5_gp=
io-test.c
new file mode 100644
index 0000000000..189083bc4f
--- /dev/null
+++ b/tests/qtest/stm32l4x5_gpio-test.c
@@ -0,0 +1,319 @@
+/*
+ * QTest testcase for STM32L4x5_EXTI
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#define GPIO_A_BASE_ADDR 0x48000000
+#define GPIO_B_BASE_ADDR 0x48000400
+#define GPIO_C_BASE_ADDR 0x48000800
+#define GPIO_D_BASE_ADDR 0x48000C00
+#define GPIO_E_BASE_ADDR 0x48001000
+#define GPIO_F_BASE_ADDR 0x48001400
+#define GPIO_G_BASE_ADDR 0x48001800
+#define GPIO_H_BASE_ADDR 0x48001C00
+#define GPIO_MODER 0x00
+#define GPIO_OTYPER 0x04
+#define GPIO_OSPEEDR 0x08
+#define GPIO_PUPDR 0x0C
+#define GPIO_IDR 0x10
+#define GPIO_ODR 0x14
+#define GPIO_BSRR 0x18
+#define GPIO_LCKR 0x1C
+#define GPIO_AFRL 0x20
+#define GPIO_AFRH 0x24
+#define GPIO_BRR 0x28
+#define GPIO_ASCR 0x2C
+#define GPIO_DISCONNECTED_PINS 0x30
+
+static uint32_t gpio_a_readl(unsigned int offset)
+{
+    return readl(GPIO_A_BASE_ADDR + offset);
+}
+
+static uint32_t gpio_b_readl(unsigned int offset)
+{
+    return readl(GPIO_B_BASE_ADDR + offset);
+}
+
+static uint32_t gpio_c_readl(unsigned int offset)
+{
+    return readl(GPIO_C_BASE_ADDR + offset);
+}
+
+static uint32_t gpio_h_readl(unsigned int offset)
+{
+    return readl(GPIO_H_BASE_ADDR + offset);
+}
+
+static void gpio_a_writel(unsigned int offset, uint32_t value)
+{
+    writel(GPIO_A_BASE_ADDR + offset, value);
+}
+
+static void gpio_a_set_irq(int num, int level)
+{
+    qtest_set_irq_in(global_qtest, "/machine/soc/gpioa",
+                     NULL, num, level);
+}
+
+static void test_idr_reset_value(void)
+{
+    /*
+     * Check that IDR register as well as other registers
+     * determining its value have the exepcted value
+     * GPIOA->IDR value after reset is not identical
+     * to the real one ad Alternate Functions aren't
+     * implemented
+     */
+    uint32_t moder =3D gpio_a_readl(GPIO_MODER);
+    uint32_t odr =3D gpio_a_readl(GPIO_ODR);
+    uint32_t otyper =3D gpio_a_readl(GPIO_OTYPER);
+    uint32_t pupdr =3D gpio_a_readl(GPIO_PUPDR);
+    uint32_t idr =3D gpio_a_readl(GPIO_IDR);
+    /* 15: AF, 14: AF, 13: AF, 12: Analog ... */
+    /* here AF is the same as Analog */
+    g_assert_cmpint(moder, =3D=3D, 0xABFFFFFF);
+    g_assert_cmpint(odr, =3D=3D, 0x00000000);
+    g_assert_cmpint(otyper, =3D=3D, 0x00000000);
+    /* 15: pull-up, 14: pull-down, 13: pull-up, 12: neither ... */
+    g_assert_cmpint(pupdr, =3D=3D, 0x64000000);
+    /* 15 : 1, 14: 0, 13: 1, 12 : reset value ... */
+    g_assert_cmpint(idr, =3D=3D, 0x0000A000);
+
+    moder =3D gpio_b_readl(GPIO_MODER);
+    odr =3D gpio_b_readl(GPIO_ODR);
+    otyper =3D gpio_b_readl(GPIO_OTYPER);
+    pupdr =3D gpio_b_readl(GPIO_PUPDR);
+    idr =3D gpio_b_readl(GPIO_IDR);
+    /* ... 5: Analog, 4: AF, 3: AF, 2: Analog ... */
+    /* here AF is the same as Analog */
+    g_assert_cmpint(moder, =3D=3D, 0xFFFFFEBF);
+    g_assert_cmpint(odr, =3D=3D, 0x00000000);
+    g_assert_cmpint(otyper, =3D=3D, 0x00000000);
+    /* ... 5: neither, 4: pull-up, 3: neither ... */
+    g_assert_cmpint(pupdr, =3D=3D, 0x00000100);
+    /* ... 5 : reset value, 4 : 1, 3 : reset value ... */
+    g_assert_cmpint(idr, =3D=3D, 0x00000010);
+
+    moder =3D gpio_c_readl(GPIO_MODER);
+    odr =3D gpio_c_readl(GPIO_ODR);
+    otyper =3D gpio_c_readl(GPIO_OTYPER);
+    pupdr =3D gpio_c_readl(GPIO_PUPDR);
+    idr =3D gpio_c_readl(GPIO_IDR);
+    /* Analog */
+    g_assert_cmpint(moder, =3D=3D, 0xFFFFFFFF);
+    g_assert_cmpint(odr, =3D=3D, 0x00000000);
+    g_assert_cmpint(otyper, =3D=3D, 0x00000000);
+    /* no pull-up or pull-down */
+    g_assert_cmpint(pupdr, =3D=3D, 0x00000000);
+    /* reset value */
+    g_assert_cmpint(idr, =3D=3D, 0x00000000);
+
+    moder =3D gpio_h_readl(GPIO_MODER);
+    odr =3D gpio_h_readl(GPIO_ODR);
+    otyper =3D gpio_h_readl(GPIO_OTYPER);
+    pupdr =3D gpio_h_readl(GPIO_PUPDR);
+    idr =3D gpio_h_readl(GPIO_IDR);
+    /* Analog */
+    g_assert_cmpint(moder, =3D=3D, 0x0000000F);
+    g_assert_cmpint(odr, =3D=3D, 0x00000000);
+    g_assert_cmpint(otyper, =3D=3D, 0x00000000);
+    /* no pull-up or pull-down */
+    g_assert_cmpint(pupdr, =3D=3D, 0x00000000);
+    /* reset value */
+    g_assert_cmpint(idr, =3D=3D, 0x00000000);
+
+}
+
+static void test_gpio_output_mode(void)
+{
+    /*
+     * Test that setting and resetting a bit in ODR sends signal
+     * to SYSCFG when this bit is configured in output mode
+     * (even if output mode if configured after the bit in ODR is set)
+     */
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+
+    /* Set bit 0 in ODR */
+    gpio_a_writel(GPIO_ODR, 0x00000001);
+
+    /* Check that IDR wasn't updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    /* Check no signal was transmitted to syscfg */
+    g_assert_false(get_irq(0));
+
+    /* Configure GPIOA line 0 as output */
+    gpio_a_writel(GPIO_MODER, 0xABFFFFFD);
+
+    /* Check that IDR was updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A001);
+
+    /* Check that the signal was transmitted to syscfg */
+    g_assert_true(get_irq(0));
+
+    /* Clean the test */
+    gpio_a_writel(GPIO_ODR, 0x00000000);
+    gpio_a_writel(GPIO_MODER, 0xABFFFFFF);
+}
+
+static void test_gpio_input_mode(void)
+{
+    /*
+     * Test that configuring a line in input mode allows to send
+     * a signal to SYSCFG when raising and lowering the line
+     */
+    qtest_irq_intercept_in(global_qtest,
+                           "/machine/soc/syscfg");
+
+    /* Configure GPIOA line 0 as input */
+    gpio_a_writel(GPIO_MODER, 0x00000000);
+
+    /* Raise line 0 */
+    gpio_a_set_irq(0, 1);
+
+    /* Check that IDR was updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A001);
+
+    /* Check that the signal was transmitted to syscfg */
+    g_assert_true(get_irq(0));
+
+    /* Lower line 0 */
+    gpio_a_set_irq(0, 0);
+
+    /* Check that IDR was updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    /* Check that the signal was transmitted to syscfg */
+    g_assert_false(get_irq(0));
+
+    /* Clean the test */
+    gpio_a_writel(GPIO_ODR, 0x00000000);
+    gpio_a_writel(GPIO_MODER, 0xABFFFFFF);
+    gpio_a_writel(GPIO_DISCONNECTED_PINS, 0xFFFF);
+}
+
+static void test_pull_up_pull_down(void)
+{
+    /*
+     * Test that configuring a line in input mode allows to send
+     * a signal to SYSCFG just by changing pull-up and pull-down
+     */
+    qtest_irq_intercept_in(global_qtest,
+                           "/machine/soc/syscfg");
+
+    /* Configure GPIOA line 0 as input */
+    gpio_a_writel(GPIO_MODER, 0x00000000);
+
+    /* Configure pull-up for GPIOA line 0 */
+    gpio_a_writel(GPIO_PUPDR, 0x00000001);
+
+    /* Check that IDR was updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A001);
+
+    /* Check that the signal was transmitted to syscfg */
+    g_assert_true(get_irq(0));
+
+    /* Configure pull-down for GPIOA line 0 */
+    gpio_a_writel(GPIO_PUPDR, 0x00000002);
+
+    /* Check that IDR was updated */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    /* Check that the signal was transmitted to syscfg */
+    g_assert_false(get_irq(0));
+
+    /* Clean the test */
+    gpio_a_writel(GPIO_ODR, 0x00000000);
+    gpio_a_writel(GPIO_MODER, 0xABFFFFFF);
+}
+
+static void test_no_short_circuit(void)
+{
+    /*
+     * Test that configuring a line in output mode
+     * disconnects the pin, that the pin can't be set or reset
+     * in push-pull mode, and that it can only be reset
+     * in open-drain mode
+     */
+    qtest_irq_intercept_in(global_qtest,
+                           "/machine/soc/syscfg");
+
+    gpio_a_set_irq(0, 1);
+
+    /* Configuring pin 0 in push-pull output mode */
+    gpio_a_writel(GPIO_MODER, 0x00000001);
+
+    /* Checking that the pin is disconnected */
+    g_assert_cmpuint(gpio_a_readl(GPIO_DISCONNECTED_PINS), =3D=3D, 0xFFF=
F);
+
+    /* Checking that IDR was updated accordingly */
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    /* Trying to set and reset the pin and checking it doesn't work */
+    gpio_a_set_irq(0, 1);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_DISCONNECTED_PINS), =3D=3D, 0xFFF=
F);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    gpio_a_writel(GPIO_ODR, 0x00000001);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A001);
+
+    gpio_a_set_irq(0, 0);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_DISCONNECTED_PINS), =3D=3D, 0xFFF=
F);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A001);
+
+    /* Configuring pin 0 in open-drain output mode */
+    gpio_a_writel(GPIO_OTYPER, 0x00000001);
+
+    /* Trying to set the pin and checking it doesn't work */
+    gpio_a_set_irq(0, 1);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_DISCONNECTED_PINS), =3D=3D, 0xFFF=
F);
+
+    /* Resetting the pin and checking it works */
+    gpio_a_set_irq(0, 0);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_DISCONNECTED_PINS), =3D=3D, 0xFFF=
E);
+
+    g_assert_cmpuint(gpio_a_readl(GPIO_IDR), =3D=3D, 0x0000A000);
+
+    /* Cleaning the test */
+    gpio_a_writel(GPIO_DISCONNECTED_PINS, 0xFFFF);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+    qtest_add_func("stm32l4x5/gpio/test_idr_reset_value",
+                   test_idr_reset_value);
+    qtest_add_func("stm32l4x5/gpio/test_gpio_output_mode",
+                   test_gpio_output_mode);
+    qtest_add_func("stm32l4x5/gpio/test_gpio_input_mode",
+                   test_gpio_input_mode);
+    qtest_add_func("stm32l4x5/gpio/test_pull_up_pull_down",
+                   test_pull_up_pull_down);
+    qtest_add_func("stm32l4x5/gpio/test_no_short_circuit",
+                   test_no_short_circuit);
+
+    qtest_start("-machine b-l475e-iot01a");
+    ret =3D g_test_run();
+    qtest_end();
+
+    return ret;
+}
--=20
2.43.0

