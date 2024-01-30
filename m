Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp924556ejk;
        Tue, 30 Jan 2024 08:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/tS3LfXimPw7VIpvD+FrN3q1RhsYw5pTgBI16Ag6yz+YxRt502DxkoD2l8vmwt3rkn8rm
X-Received: by 2002:a05:6808:d49:b0:3be:97d3:2f68 with SMTP id w9-20020a0568080d4900b003be97d32f68mr1595428oik.36.1706631222014;
        Tue, 30 Jan 2024 08:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706631221; cv=none;
        d=google.com; s=arc-20160816;
        b=yWgSsgQ3MkuCaaCsEUnOU3vSrLMfWHPkvLHbG1svxmpCzdgk2FbJyNOM2lpS3NALd/
         WmRcBiqt8Z28Wt72vM230pN/rCKbMmXvtObxxejM6L7NrcvvRNlHsLYw+mHfqQ9SyOBw
         MVqfL0+kQespWlfNAAT9HvZ6d3dZ1hI+50U+NSmHRiWnELVtpJmLMUcF0JIz9CnHFbMu
         mqqkhfpijohIyjIB1GDd6nuLuAoMcp+5nvfMehDM8HDYeDJ6YzG2tp5VlW7K9Mw/F8R/
         +MPOs9U+YLgwB3b/CHyVfkqYIcKTcA6vvelykgmUozQoVAdSodfx3+VpzBo80snQq332
         zR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=6YWMdlOIz5twvF2x5Q7DcGkcdBzFvr5h+gkPk8b68wU=;
        fh=ZLCZyxT2KIi/7Nnksma9PMMmnQ5DwTIEO0CMX69eemI=;
        b=TymHnH9E88HT1HKgJeCb0+apDDMQA6+DzPRCFMPhl6hWMAcFOPYcUkyyDOXrwVJdAL
         +uT4q9OFKDUWyScv9prMcPUqmfneh1lHo4ipKSlguuNCvGjEx4IMyZj/sAw4DKu74Q2d
         CbrLoBwBA5G5lJO3sThWpGl9jwP6TOmZbMsWfFP5hGQzjC+x6Oc0095Yq422CRTYAeDh
         D2jfx4NbWEV490cUAg/yfApF8Fzyivkpbl6+en+e1uJmOMx7nm4+nEtEX5c+qR47CuFd
         /LTnlDicrH0xqtKue36Kdy8WishCBFkf4cSXUWzIOcgstxKLYBUO9nIlpPz7lkXoJrFr
         yk/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=g8krer91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr6-20020a056130278600b007d2cbd4524bsi1120950uab.150.2024.01.30.08.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:13:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=g8krer91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUqju-00087N-Mk; Tue, 30 Jan 2024 11:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rUqjq-00084e-H6; Tue, 30 Jan 2024 11:13:32 -0500
Received: from zproxy1.enst.fr ([137.194.2.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rUqjn-0008MK-5N; Tue, 30 Jan 2024 11:13:30 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 8FCCEC0571;
 Tue, 30 Jan 2024 17:13:23 +0100 (CET)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id oTLzdEOi1Fht; Tue, 30 Jan 2024 17:13:23 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 0E0B3C05E3;
 Tue, 30 Jan 2024 17:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 0E0B3C05E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1706631203;
 bh=6YWMdlOIz5twvF2x5Q7DcGkcdBzFvr5h+gkPk8b68wU=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=g8krer910l9KDRWc9EgB+qrBQ86AFHbucMtuykXv++ZominoePji2nIm3gvxaCTcf
 u61ZtJZGuXAutoQqp+SD6SO3WBfPdImti9+7qxA5ecK3PzmjVKaswwB+Gqx98tVbAb
 CFSOCBKywGFDFcXVtmXOuoRs0QVdFprS2m0qEpbI=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id hhjE4yXT4PVj; Tue, 30 Jan 2024 17:13:22 +0100 (CET)
Received: from AM-Inspiron-3585.numericable.fr (38.162.10.109.rev.sfr.net
 [109.10.162.38])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id A1C99C0571;
 Tue, 30 Jan 2024 17:13:22 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v4 8/8] Add tests for the STM32L4x5_RCC
Date: Tue, 30 Jan 2024 17:13:16 +0100
Message-Id: <20240130161316.114675-1-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130160656.113112-1-arnaud.minier@telecom-paris.fr>
References: <20240130160656.113112-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.220;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy1.enst.fr
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
X-TUID: uKzl3bGXkHif

Tests:
- the ability to change the sysclk of the device
- the ability to enable/disable/configure the PLLs
- if the clock multiplexers work
- the register flags and the generation of irqs

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 tests/qtest/meson.build          |   3 +-
 tests/qtest/stm32l4x5_rcc-test.c | 207 +++++++++++++++++++++++++++++++
 2 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/stm32l4x5_rcc-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 84a055a7d9..36f85c8920 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -201,7 +201,8 @@ qtests_aspeed =3D \
=20
 qtests_stm32l4x5 =3D \
   ['stm32l4x5_exti-test',
-   'stm32l4x5_syscfg-test']
+   'stm32l4x5_syscfg-test',
+   'stm32l4x5_rcc-test']
=20
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
diff --git a/tests/qtest/stm32l4x5_rcc-test.c b/tests/qtest/stm32l4x5_rcc=
-test.c
new file mode 100644
index 0000000000..4157291052
--- /dev/null
+++ b/tests/qtest/stm32l4x5_rcc-test.c
@@ -0,0 +1,207 @@
+/*
+ * QTest testcase for STM32L4x5_RCC
+ *
+ * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/registerfields.h"
+#include "libqtest-single.h"
+#include "hw/misc/stm32l4x5_rcc_internals.h"
+
+#define RCC_BASE_ADDR 0x40021000
+#define NVIC_ISER 0xE000E100
+#define NVIC_ISPR 0xE000E200
+#define NVIC_ICPR 0xE000E280
+#define RCC_IRQ 5
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
+static bool qts_wait_for_flag(QTestState *qts, uint32_t event_addr,
+                              uint32_t flag, uint32_t value)
+{
+    /* Wait at most 5 seconds */
+    for (int i =3D 0; i < 5000; i++) {
+        if ((qtest_readl(qts, event_addr) & flag) =3D=3D value) {
+            return true;
+        }
+        g_usleep(1000);
+    }
+
+    return false;
+}
+
+static bool rcc_wait_for_flag(uint32_t event_addr, uint32_t flag,
+                              uint32_t value)
+{
+    return qts_wait_for_flag(global_qtest, RCC_BASE_ADDR + event_addr, f=
lag, value);
+}
+
+static void rcc_writel(unsigned int offset, uint32_t value)
+{
+    writel(RCC_BASE_ADDR + offset, value);
+}
+
+static uint32_t rcc_readl(unsigned int offset)
+{
+    return readl(RCC_BASE_ADDR + offset);
+}
+
+static void test_init_msi(void)
+{
+    /* MSIRANGE can be set only when MSI is OFF or READY */
+    rcc_writel(A_CR, R_CR_MSION_MASK);
+    /* Wait until MSI is stable */
+    g_assert_true(rcc_wait_for_flag(A_CR, R_CR_MSIRDY_MASK, R_CR_MSIRDY_=
MASK));
+    /* TODO find a way to test MSI value */
+}
+
+static void test_set_msi_as_sysclk(void)
+{
+    /* Clocking from MSI, in case MSI was not the default source */
+    rcc_writel(A_CFGR, 0);
+    /* Wait until MSI is selected and stable */
+    g_assert_true(rcc_wait_for_flag(A_CFGR, R_CFGR_SWS_MASK, 0));
+}
+
+static void test_init_pll(void)
+{
+    uint32_t value;
+
+    /*
+     * Update PLL and set MSI as the source clock.
+     * PLLM =3D 1 --> 000
+     * PLLN =3D 40 --> 40
+     * PPLLR =3D 2 --> 00
+     * PLLDIV =3D unused, PLLP =3D unused (SAI3), PLLQ =3D unused (48M1)
+     * SRC =3D MSI --> 01
+     */
+    rcc_writel(A_PLLCFGR, R_PLLCFGR_PLLREN_MASK |
+            (40 << R_PLLCFGR_PLLN_SHIFT) |
+            (0b01 << R_PLLCFGR_PLLSRC_SHIFT));
+
+    /* PLL activation */
+    value =3D rcc_readl(A_CR);
+    rcc_writel(A_CR, value | R_CR_PLLON_MASK);
+
+    /* Waiting for PLL lock. */
+    g_assert_true(rcc_wait_for_flag(A_CR, R_CR_PLLRDY_MASK, R_CR_PLLRDY_=
MASK));
+
+    /* Switches on the PLL clock source */
+    value =3D rcc_readl(A_CFGR);
+    rcc_writel(A_CFGR, (value & ~R_CFGR_SW_MASK) |
+        (0b11 << R_CFGR_SW_SHIFT));
+
+    /* Wait until SYSCLK is stable. */
+    g_assert_true(rcc_wait_for_flag(A_CFGR, R_CFGR_SWS_MASK,
+        (0b11 << R_CFGR_SWS_SHIFT)));
+}
+
+static void test_activate_lse(void)
+{
+    /* LSE activation, no LSE Bypass */
+    rcc_writel(A_BDCR, R_BDCR_LSEDRV_MASK | R_BDCR_LSEON_MASK);
+    g_assert_true(rcc_wait_for_flag(A_BDCR, R_BDCR_LSERDY_MASK, R_BDCR_L=
SERDY_MASK));
+}
+
+static void test_irq(void)
+{
+    enable_nvic_irq(RCC_IRQ);
+
+    rcc_writel(A_CIER, R_CIER_LSIRDYIE_MASK);
+    rcc_writel(A_CSR, R_CSR_LSION_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_LSIRDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+
+    rcc_writel(A_CIER, R_CIER_LSERDYIE_MASK);
+    rcc_writel(A_BDCR, R_BDCR_LSEON_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_LSERDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+
+    /*
+     * MSI has been enabled by previous tests,
+     * shouln't generate an interruption.
+     */
+    rcc_writel(A_CIER, R_CIER_MSIRDYIE_MASK);
+    rcc_writel(A_CR, R_CR_MSION_MASK);
+    g_assert_false(check_nvic_pending(RCC_IRQ));
+
+    rcc_writel(A_CIER, R_CIER_HSIRDYIE_MASK);
+    rcc_writel(A_CR, R_CR_HSION_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_HSIRDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+
+    rcc_writel(A_CIER, R_CIER_HSERDYIE_MASK);
+    rcc_writel(A_CR, R_CR_HSEON_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_HSERDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+
+    /*
+     * PLL has been enabled by previous tests,
+     * shouln't generate an interruption.
+     */
+    rcc_writel(A_CIER, R_CIER_PLLRDYIE_MASK);
+    rcc_writel(A_CR, R_CR_PLLON_MASK);
+    g_assert_false(check_nvic_pending(RCC_IRQ));
+
+    rcc_writel(A_CIER, R_CIER_PLLSAI1RDYIE_MASK);
+    rcc_writel(A_CR, R_CR_PLLSAI1ON_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_PLLSAI1RDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+
+    rcc_writel(A_CIER, R_CIER_PLLSAI2RDYIE_MASK);
+    rcc_writel(A_CR, R_CR_PLLSAI2ON_MASK);
+    g_assert_true(check_nvic_pending(RCC_IRQ));
+    rcc_writel(A_CICR, R_CICR_PLLSAI2RDYC_MASK);
+    unpend_nvic_irq(RCC_IRQ);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+    /*
+     * These test separately that we can enable the plls, change the sys=
clk,
+     * and enable different devices.
+     * They are dependent on one another.
+     */
+    qtest_add_func("stm32l4x5/rcc/init_msi", test_init_msi);
+    qtest_add_func("stm32l4x5/rcc/set_msi_as_sysclk",
+        test_set_msi_as_sysclk);
+    qtest_add_func("stm32l4x5/rcc/activate_lse", test_activate_lse);
+    qtest_add_func("stm32l4x5/rcc/init_pll", test_init_pll);
+
+    qtest_add_func("stm32l4x5/rcc/irq", test_irq);
+
+    qtest_start("-machine b-l475e-iot01a");
+    ret =3D g_test_run();
+    qtest_end();
+
+    return ret;
+}
--=20
2.34.1

