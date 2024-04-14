Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp699467ejc;
        Sun, 14 Apr 2024 06:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkYg6XtzxKQS/1JCaKta8u1XnAaR3+4PnBkY4Q4N4C8Yghx5t6o/ocQUVrfbHOeqpvqijTBVQ4xfSh4k8JkuYYiqR0hUHR
X-Google-Smtp-Source: AGHT+IE6qr5bWFDd6CWQzfHVOPr4iz6qSaRzBhqFBKPM+ScLAKTO8Qp9L+8wGThvB2r8y/C6Y3UR
X-Received: by 2002:a05:6122:3c56:b0:4da:9d3e:a7df with SMTP id fv22-20020a0561223c5600b004da9d3ea7dfmr5663010vkb.5.1713100036765;
        Sun, 14 Apr 2024 06:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713100036; cv=none;
        d=google.com; s=arc-20160816;
        b=FNAwesdrYtKod7Nm6XHoXtdLSMUjkcaWn+SJ/rqcP5DTdLbtysAXuuLdzHg8IANghU
         hp26pomUXH6NZ+F4H9Kd9deskJge4zP+lNenKySBlfxGgG+oSu5xbFRl5jx/vPNW9L4d
         RAeMkQiHrK4IHnH+Oy1ev8MVIgS2FD+FcYx8YRzXjf8dnNQEKdSDadfCtlCEemQDgW/f
         3L2hT3U/T6kfcpiIxGGgj6FPlsb0rKB2DA2DJ7k1TQs1nglEIMAANj/UJ6TF6o1YzMRX
         TPwEli4Ji1oBEJ7B131sIhFLfiyjqTikPi26IBVSAieX/x065PWvCSgr5iYpfpc0gUZ0
         x/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=scv+tSGsMDxwgzTjQ2FNU25k6u4QcLDqfUadKkzh9PE=;
        fh=2x6HCGWGjZwwDBqVUNtqKQ917y8ksgmj+9l5aeOu5X4=;
        b=oo9eb4Ekk1aiEhmMB2PuyqQMwlWPOYg9He/Uvz+6LqGrgeLt/JQGodwTWA7K+9BPGo
         2Di7Gjt5t7AF0IJt2+ct8uc/Cd5luYQgBawuvfC1JmF8GeL9kOjX9+85N/Lhaou/ljLT
         jTRISTX7MfxHua4//uDoO66ZYjC4D6Lc5tohnQ49uIPXnFzaeO7NfrGm9eJrwO54qUaJ
         oOyTyMr0kx27yyq+l9n0av5QLQjMe72f2XgFiLyjcttGR8ra8HHMErU/0MbT2lf0Vtx0
         zA9bAj762++ZiZ8/qWwYrXGcEHBHqzKeOLmwiWfT2kSdn2ZLROefudZlunzRpSyDpK7d
         9Hcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=uSEsu60O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020ac5c904000000b004d897c4483fsi1008807vkl.154.2024.04.14.06.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2024 06:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=uSEsu60O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvzZ2-0007kb-4m; Sun, 14 Apr 2024 09:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rvzYx-0007jG-UO; Sun, 14 Apr 2024 09:06:29 -0400
Received: from zproxy1.enst.fr ([137.194.2.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rvzYt-0007FE-Tf; Sun, 14 Apr 2024 09:06:27 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 6834AC0628;
 Sun, 14 Apr 2024 15:06:21 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id MJo78FWTD1xu; Sun, 14 Apr 2024 15:06:20 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id C08E4C0593;
 Sun, 14 Apr 2024 15:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr C08E4C0593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1713099980;
 bh=scv+tSGsMDxwgzTjQ2FNU25k6u4QcLDqfUadKkzh9PE=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=uSEsu60Op7VtvNpfNLf64tKNTYq4cyZPlUeDBWNc0EAMh75QYbnACX7d8gIMofNJL
 OxklmCIRv/mezvkQ7NpAdOsJuunb44FerFRQ7DHda0wFgv6NKKoStWVowsAEHkln/F
 fRuE9U1fFYHPBRdBB5o+0HXkRWWoFhfsFOaKdufY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id iPvWYTWZa7v3; Sun, 14 Apr 2024 15:06:20 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id CA77DC0628;
 Sun, 14 Apr 2024 15:06:19 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 5/5] tests/qtest : Add testcase for DM163
Date: Sun, 14 Apr 2024 15:05:48 +0200
Message-ID: <20240414130604.182059-6-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
References: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.220;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: J5OFODHolewd

`test_dm163_bank()`
Checks that the pin "sout" of the DM163 led driver outputs the values
received on pin "sin" with the expected latency (depending on the bank).

`test_dm163_gpio_connection()`
Check that changes to relevant STM32L4x5 GPIO pins are propagated to the
DM163 device.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 tests/qtest/dm163-test.c | 192 +++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build  |   5 +
 2 files changed, 197 insertions(+)
 create mode 100644 tests/qtest/dm163-test.c

diff --git a/tests/qtest/dm163-test.c b/tests/qtest/dm163-test.c
new file mode 100644
index 0000000000..6f88ceef44
--- /dev/null
+++ b/tests/qtest/dm163-test.c
@@ -0,0 +1,192 @@
+/*
+ * QTest testcase for DM163
+ *
+ * Copyright (C) 2024 Samuel Tardieu <sam@rfc1149.net>
+ * Copyright (C) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (C) 2024 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+#define SIN 8
+#define DCK 9
+#define RST_B 10
+#define LAT_B 11
+#define SELBK 12
+#define EN_B 13
+
+#define DEVICE_NAME "/machine/dm163"
+#define GPIO_OUT(name, value) qtest_set_irq_in(qts, DEVICE_NAME, NULL, n=
ame,   \
+                                               value)
+#define GPIO_PULSE(name)                                                =
       \
+  do {                                                                  =
       \
+    GPIO_OUT(name, 1);                                                  =
       \
+    GPIO_OUT(name, 0);                                                  =
       \
+  } while (0)
+
+
+static void rise_gpio_pin_dck(QTestState *qts)
+{
+    /* Configure output mode for pin PB1 */
+    qtest_writel(qts, 0x48000400, 0xFFFFFEB7);
+    /* Write 1 in ODR for PB1 */
+    qtest_writel(qts, 0x48000414, 0x00000002);
+}
+
+static void lower_gpio_pin_dck(QTestState *qts)
+{
+    /* Configure output mode for pin PB1 */
+    qtest_writel(qts, 0x48000400, 0xFFFFFEB7);
+    /* Write 0 in ODR for PB1 */
+    qtest_writel(qts, 0x48000414, 0x00000000);
+}
+
+static void rise_gpio_pin_selbk(QTestState *qts)
+{
+    /* Configure output mode for pin PC5 */
+    qtest_writel(qts, 0x48000800, 0xFFFFF7FF);
+    /* Write 1 in ODR for PC5 */
+    qtest_writel(qts, 0x48000814, 0x00000020);
+}
+
+static void lower_gpio_pin_selbk(QTestState *qts)
+{
+    /* Configure output mode for pin PC5 */
+    qtest_writel(qts, 0x48000800, 0xFFFFF7FF);
+    /* Write 0 in ODR for PC5 */
+    qtest_writel(qts, 0x48000814, 0x00000000);
+}
+
+static void rise_gpio_pin_lat_b(QTestState *qts)
+{
+    /* Configure output mode for pin PC4 */
+    qtest_writel(qts, 0x48000800, 0xFFFFFDFF);
+    /* Write 1 in ODR for PC4 */
+    qtest_writel(qts, 0x48000814, 0x00000010);
+}
+
+static void lower_gpio_pin_lat_b(QTestState *qts)
+{
+    /* Configure output mode for pin PC4 */
+    qtest_writel(qts, 0x48000800, 0xFFFFFDFF);
+    /* Write 0 in ODR for PC4 */
+    qtest_writel(qts, 0x48000814, 0x00000000);
+}
+
+static void rise_gpio_pin_rst_b(QTestState *qts)
+{
+    /* Configure output mode for pin PC3 */
+    qtest_writel(qts, 0x48000800, 0xFFFFFF7F);
+    /* Write 1 in ODR for PC3 */
+    qtest_writel(qts, 0x48000814, 0x00000008);
+}
+
+static void lower_gpio_pin_rst_b(QTestState *qts)
+{
+    /* Configure output mode for pin PC3 */
+    qtest_writel(qts, 0x48000800, 0xFFFFFF7F);
+    /* Write 0 in ODR for PC3 */
+    qtest_writel(qts, 0x48000814, 0x00000000);
+}
+
+static void rise_gpio_pin_sin(QTestState *qts)
+{
+    /* Configure output mode for pin PA4 */
+    qtest_writel(qts, 0x48000000, 0xFFFFFDFF);
+    /* Write 1 in ODR for PA4 */
+    qtest_writel(qts, 0x48000014, 0x00000010);
+}
+
+static void lower_gpio_pin_sin(QTestState *qts)
+{
+    /* Configure output mode for pin PA4 */
+    qtest_writel(qts, 0x48000000, 0xFFFFFDFF);
+    /* Write 0 in ODR for PA4 */
+    qtest_writel(qts, 0x48000014, 0x00000000);
+}
+
+static void test_dm163_bank(const void *opaque)
+{
+    const long bank =3D (uintptr_t) opaque;
+    const int width =3D bank ? 192 : 144;
+
+    QTestState *qts =3D qtest_initf("-M b-l475e-iot01a");
+    qtest_irq_intercept_out_named(qts, DEVICE_NAME, "sout");
+    GPIO_OUT(RST_B, 1);
+    GPIO_OUT(EN_B, 0);
+    GPIO_OUT(DCK, 0);
+    GPIO_OUT(SELBK, bank);
+    GPIO_OUT(LAT_B, 1);
+
+    /* Fill bank with zeroes */
+    GPIO_OUT(SIN, 0);
+    for (int i =3D 0; i < width; i++) {
+        GPIO_PULSE(DCK);
+    }
+    /* Fill bank with ones, check that we get the previous zeroes */
+    GPIO_OUT(SIN, 1);
+    for (int i =3D 0; i < width; i++) {
+        GPIO_PULSE(DCK);
+        g_assert(!qtest_get_irq(qts, 0));
+    }
+
+    /* Pulse one more bit in the bank, check that we get a one */
+    GPIO_PULSE(DCK);
+    g_assert(qtest_get_irq(qts, 0));
+
+    qtest_quit(qts);
+}
+
+static void test_dm163_gpio_connection(void)
+{
+    QTestState *qts =3D qtest_init("-M b-l475e-iot01a");
+    qtest_irq_intercept_in(qts, DEVICE_NAME);
+
+    g_assert_false(qtest_get_irq(qts, SIN));
+    g_assert_false(qtest_get_irq(qts, DCK));
+    g_assert_false(qtest_get_irq(qts, RST_B));
+    g_assert_false(qtest_get_irq(qts, LAT_B));
+    g_assert_false(qtest_get_irq(qts, SELBK));
+
+    rise_gpio_pin_dck(qts);
+    g_assert_true(qtest_get_irq(qts, DCK));
+    lower_gpio_pin_dck(qts);
+    g_assert_false(qtest_get_irq(qts, DCK));
+
+    rise_gpio_pin_lat_b(qts);
+    g_assert_true(qtest_get_irq(qts, LAT_B));
+    lower_gpio_pin_lat_b(qts);
+    g_assert_false(qtest_get_irq(qts, LAT_B));
+
+    rise_gpio_pin_selbk(qts);
+    g_assert_true(qtest_get_irq(qts, SELBK));
+    lower_gpio_pin_selbk(qts);
+    g_assert_false(qtest_get_irq(qts, SELBK));
+
+    rise_gpio_pin_rst_b(qts);
+    g_assert_true(qtest_get_irq(qts, RST_B));
+    lower_gpio_pin_rst_b(qts);
+    g_assert_false(qtest_get_irq(qts, RST_B));
+
+    rise_gpio_pin_sin(qts);
+    g_assert_true(qtest_get_irq(qts, SIN));
+    lower_gpio_pin_sin(qts);
+    g_assert_false(qtest_get_irq(qts, SIN));
+
+    g_assert_false(qtest_get_irq(qts, DCK));
+    g_assert_false(qtest_get_irq(qts, LAT_B));
+    g_assert_false(qtest_get_irq(qts, SELBK));
+    g_assert_false(qtest_get_irq(qts, RST_B));
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_data_func("/dm163/bank0", (void *)0, test_dm163_bank);
+    qtest_add_data_func("/dm163/bank1", (void *)1, test_dm163_bank);
+    qtest_add_func("/dm163/gpio_connection", test_dm163_gpio_connection)=
;
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 36c5c13a7b..2c6fd4ebbb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -207,6 +207,9 @@ qtests_stm32l4x5 =3D \
    'stm32l4x5_rcc-test',
    'stm32l4x5_gpio-test']
=20
+qtests_dm163 =3D \
+  ['dm163-test']
+
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-ap=
b-dualtimer-test'] : []) + \
@@ -222,6 +225,8 @@ qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : [=
]) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') ? qtests_stm32l4x5=
 : []) + \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fs=
i-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
+   config_all_devices.has_key('CONFIG_DM163')? qtests_dm163 : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
=20
--=20
2.43.2

