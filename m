Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp175876ejb;
        Wed, 28 Feb 2024 04:03:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXk7d6nONEIVsep0kv4pV8hmGCXEHk1HEiqrqiFpDdsws9oE0JIgEefBnVwcd90h0K3pKLXvo9JylPponnFrx++24MiruH
X-Google-Smtp-Source: AGHT+IFi6IJEVQ7k7K5miLtjMO8T9NszZcrUwyCcBEW4DoxZr711cf44PURxuTVR6hHRfK3bvWqS
X-Received: by 2002:a05:620a:2492:b0:787:caf2:e1b1 with SMTP id i18-20020a05620a249200b00787caf2e1b1mr5825597qkn.51.1709121824260;
        Wed, 28 Feb 2024 04:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709121824; cv=none;
        d=google.com; s=arc-20160816;
        b=sO7RPUoLuc9hwL9i5+YouJjWCqpGEjO3Qw09jFc/zEru9+nAfkaVob1wny/7obQnef
         KPDw6U1OjLeFh8bQcVg1sXmipYDdHGQwXkn0By2HGPFAxoC9zhEjHeXmuk1LJllwF14Q
         iXfGOt+4H05BP8zm3m3jDkzf2jbeLLIhD0Nzv0xN+MBwcM7Oyx1imzOnwc5vpSTPK3vI
         0HHnjwcvaR73Y6VlQ/LvoK9+1n6wKzmrFzOQyW3ORT9riCQHiIn1+u2EAjrQmNCXCtV3
         MKkqkRdQHjfou5FpfPJ8cR4SQ8ZVO577tFwqLXfDpuNTqBRtP5O4QY1mfAqkXdKPGn0U
         nxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=f3NS7fPrtXqoagp8rCB11HFdQzPWCS1YJlqct7gyccY=;
        fh=YkzlLM/B5rINvM6IVNmtbeUPm8x2JYcYDb51Z7uR+U4=;
        b=VS8KOf/DPF8B49nOprSe3WMzGvqHTkBA/knKVWQPUUgclunCl8ONXHwLU1L0LwjjAS
         GVS65hrhohQboB5D9mXgjM5i9F447G7lvdlMsM7Vc9VqhGBOzll9QeWNGjQsVimadmdU
         KoXvWD12QRfRHaV0NBxIxhsF++Di4LPvgKyHM784U4COJI5uBScZp3i7vIMMd9+di9b8
         L9b3/ukuLeiCCieOi1/UQE7mMZXz0pqoT94/ViDpAuIi9aZm71p47GgWJo5AGhj+M7r1
         2Lppd46HM466dyPaKgZOcBDCRLNTj3/RCTfrf6PAOOPqdlkn80lvJtE9EZF/Dh62liiq
         JRug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=s6DmIAVr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a37c446000000b00787bb718176si9420194qkm.739.2024.02.28.04.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 04:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=s6DmIAVr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfIdw-00049e-Pt; Wed, 28 Feb 2024 07:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIdo-00043B-MS; Wed, 28 Feb 2024 07:02:29 -0500
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIdm-0002z4-6T; Wed, 28 Feb 2024 07:02:28 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 2D0BEA06FF;
 Wed, 28 Feb 2024 13:02:24 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id ZsPidsl2YPEQ; Wed, 28 Feb 2024 13:02:23 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 8F555A06ED;
 Wed, 28 Feb 2024 13:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 8F555A06ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709121743;
 bh=f3NS7fPrtXqoagp8rCB11HFdQzPWCS1YJlqct7gyccY=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=s6DmIAVrKwAf4lvOX5YWhE/+2z/xo91xlmSwwfPz52vG/GUJ6B8jGigrxSC9PrLGD
 SJzqqrgTODt6CDHkitr75Lc24QXzzPphSoUoVSS5MuRjT9dH1H1KLUpbyHgTgAnR6j
 PyR9K+Mm7Ik2CaIem/3HKO3DELf8Sh00v2oi1uwY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 2uB5g5s1_oQM; Wed, 28 Feb 2024 13:02:23 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 2C10BA054C;
 Wed, 28 Feb 2024 13:02:23 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/5] hw/arm : Pass STM32L4x5 SYSCFG gpios to STM32L4x5 SoC
Date: Wed, 28 Feb 2024 13:01:05 +0100
Message-ID: <20240228120215.277717-3-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240228120215.277717-1-ines.varhol@telecom-paris.fr>
References: <20240228120215.277717-1-ines.varhol@telecom-paris.fr>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rc+a9B/CEX/h

Exposing SYSCFG inputs to the SoC is practical in order to wire the SoC
to the optional DM163 display from the board code (GPIOs outputs need
to be connected to both SYSCFG inputs and DM163 inputs).

STM32L4x5 SYSCFG in-irq interception needed to be changed accordingly.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---

Hello,

If SYSCFG inputs are exposed, should GPIOs be part of the board
rather than the SoC?

Best regards,

Ines

 hw/arm/stm32l4x5_soc.c              |  6 ++++--
 tests/qtest/stm32l4x5_gpio-test.c   | 12 +++++++-----
 tests/qtest/stm32l4x5_syscfg-test.c | 16 +++++++++-------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 072671bdfb..8ba0dfc5e7 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -1,8 +1,8 @@
 /*
  * STM32L4x5 SoC family
  *
- * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
- * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2024 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
@@ -196,6 +196,8 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
         }
     }
=20
+    qdev_pass_gpios(DEVICE(&s->syscfg), dev_soc, NULL);
+
     /* EXTI device */
     busdev =3D SYS_BUS_DEVICE(&s->exti);
     if (!sysbus_realize(busdev, errp)) {
diff --git a/tests/qtest/stm32l4x5_gpio-test.c b/tests/qtest/stm32l4x5_gp=
io-test.c
index cd4fd9bae2..bec83b3c1d 100644
--- a/tests/qtest/stm32l4x5_gpio-test.c
+++ b/tests/qtest/stm32l4x5_gpio-test.c
@@ -50,6 +50,8 @@
 #define OTYPER_PUSH_PULL 0
 #define OTYPER_OPEN_DRAIN 1
=20
+#define SYSCFG "/machine/soc"
+
 const uint32_t moder_reset[NUM_GPIOS] =3D {
     0xABFFFFFF,
     0xFFFFFEBF,
@@ -306,7 +308,7 @@ static void test_gpio_output_mode(const void *data)
     uint32_t gpio =3D ((uint64_t)data) >> 32;
     unsigned int gpio_id =3D get_gpio_id(gpio);
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+    qtest_irq_intercept_in(global_qtest, SYSCFG);
=20
     /* Set a bit in ODR and check nothing happens */
     gpio_set_bit(gpio, ODR, pin, 1);
@@ -341,7 +343,7 @@ static void test_gpio_input_mode(const void *data)
     uint32_t gpio =3D ((uint64_t)data) >> 32;
     unsigned int gpio_id =3D get_gpio_id(gpio);
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+    qtest_irq_intercept_in(global_qtest, SYSCFG);
=20
     /* Configure a line as input, raise it, and check that the pin is hi=
gh */
     gpio_set_2bits(gpio, MODER, pin, MODER_INPUT);
@@ -370,7 +372,7 @@ static void test_pull_up_pull_down(const void *data)
     uint32_t gpio =3D ((uint64_t)data) >> 32;
     unsigned int gpio_id =3D get_gpio_id(gpio);
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+    qtest_irq_intercept_in(global_qtest, SYSCFG);
=20
     /* Configure a line as input with pull-up, check the line is set hig=
h */
     gpio_set_2bits(gpio, MODER, pin, MODER_INPUT);
@@ -400,7 +402,7 @@ static void test_push_pull(const void *data)
     uint32_t gpio =3D ((uint64_t)data) >> 32;
     uint32_t gpio2 =3D GPIO_BASE_ADDR + (GPIO_H - gpio);
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+    qtest_irq_intercept_in(global_qtest, SYSCFG);
=20
     /* Setting a line high externally, configuring it in push-pull outpu=
t */
     /* And checking the pin was disconnected */
@@ -447,7 +449,7 @@ static void test_open_drain(const void *data)
     uint32_t gpio =3D ((uint64_t)data) >> 32;
     uint32_t gpio2 =3D GPIO_BASE_ADDR + (GPIO_H - gpio);
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/syscfg");
+    qtest_irq_intercept_in(global_qtest, SYSCFG);
=20
     /* Setting a line high externally, configuring it in open-drain outp=
ut */
     /* And checking the pin was disconnected */
diff --git a/tests/qtest/stm32l4x5_syscfg-test.c b/tests/qtest/stm32l4x5_=
syscfg-test.c
index ed4801798d..eed9d5940b 100644
--- a/tests/qtest/stm32l4x5_syscfg-test.c
+++ b/tests/qtest/stm32l4x5_syscfg-test.c
@@ -1,8 +1,8 @@
 /*
  * QTest testcase for STM32L4x5_SYSCFG
  *
- * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
- * Copyright (c) 2023 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
+ * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
+ * Copyright (c) 2024 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
  * See the COPYING file in the top-level directory.
@@ -25,6 +25,9 @@
 #define SYSCFG_SWPR2 0x28
 #define INVALID_ADDR 0x2C
=20
+#define EXTI "/machine/soc/exti"
+#define SYSCFG "/machine/soc"
+
 static void syscfg_writel(unsigned int offset, uint32_t value)
 {
     writel(SYSCFG_BASE_ADDR + offset, value);
@@ -37,8 +40,7 @@ static uint32_t syscfg_readl(unsigned int offset)
=20
 static void syscfg_set_irq(int num, int level)
 {
-   qtest_set_irq_in(global_qtest, "/machine/soc/syscfg",
-                    NULL, num, level);
+   qtest_set_irq_in(global_qtest, SYSCFG, NULL, num, level);
 }
=20
 static void system_reset(void)
@@ -197,7 +199,7 @@ static void test_interrupt(void)
      * Test that GPIO rising lines result in an irq
      * with the right configuration
      */
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");
+    qtest_irq_intercept_in(global_qtest, EXTI);
=20
     /* GPIOA is the default source for EXTI lines 0 to 15 */
=20
@@ -230,7 +232,7 @@ static void test_irq_pin_multiplexer(void)
      * Test that syscfg irq sets the right exti irq
      */
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");
+    qtest_irq_intercept_in(global_qtest, EXTI);
=20
     syscfg_set_irq(0, 1);
=20
@@ -257,7 +259,7 @@ static void test_irq_gpio_multiplexer(void)
      * Test that an irq is generated only by the right GPIO
      */
=20
-    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");
+    qtest_irq_intercept_in(global_qtest, EXTI);
=20
     /* GPIOA is the default source for EXTI lines 0 to 15 */
=20
--=20
2.43.2

