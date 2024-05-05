Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1018805ejc;
        Sun, 5 May 2024 07:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+ipsHBdhy/L/MufN9JP0zVbX/opuQFya4CABaBCNQALbtqbPuiTcDM0regYt9S8p0oJNmyijd0/sehoEhmyxcCL8p6s6k
X-Google-Smtp-Source: AGHT+IEcxHnv7UfZzQKd41O+uKctS/2GcX8TtYjagdmPenUmTVcUPCMntz0LCg5dkMCv7i5utijj
X-Received: by 2002:a05:622a:15cd:b0:43a:bd93:d5a1 with SMTP id d13-20020a05622a15cd00b0043abd93d5a1mr11007864qty.4.1714918047397;
        Sun, 05 May 2024 07:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714918047; cv=none;
        d=google.com; s=arc-20160816;
        b=yE4B/1UuJcPiAaeMqyxtdCHrdps0UZP8RpCvCRz7rTwGv4b6L4Ci8ZliJDmhbzBAD0
         Wc6ek8HpI2T6T+Y6k9ePribJYd8dL7QMHPRXYM3MYFRmM+GUTjBo/632qWsOJOGTKDzn
         AJhhFn1sVRL/4y6T8WyqPycjY1Ct7mpkJCZJcd+nnC0gk7sw1FF1QU+k1QJD/w9S1puN
         4sIJGaGFwS8+5EBooM8Cuj/M5RbvdD7DHnsFu1RNUXzw2RAGACa/RmmFnqNSLapH235J
         3/7BRyvHAqeQJ0taBRMGXKIyOvyvywJeX4BezznOhnTPnWVOrijZ4huTwxwedKTpG6zV
         PdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=a0JcXUYEaTT4impeQLCUpEzujhW/Bb2lou9Ofz38O+4=;
        fh=HZifwXm5fvflHYf2cbKVplOT47ne2uF6SUUZ3w7LV4M=;
        b=GG5xKtf+DVXrHoP/eeE2T9Z+p/cQawh5GbtEXgSyQ2gGYZFkj/JxserjwqMErC8+Is
         /dhOy6DI+x41bBRjQg4hoA/wITAmGWVUUO7+BRQ2OK/VzZcvv/Cn+FkjeqCaQEwo7qVI
         PUjTy8xu55HI9gHxSAwL1EeIWzM56/BNxLPOHwLm3HptZ9w65zJDu/WnVtBQVnPRINtV
         XbvVg5do3oBFDsHA+g8LCzaLlSrhHr+wu5Yti5CiT9BFOLK3b3DojSLbIsMg9xsAldWY
         /Cko+tgmnJRrvIJNAQoz9ibODubgDHVNtRQJSesiMJWY46hiyMahmLzMVlxytf9b7gcd
         MPDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=tUD+oOQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb36-20020a05622a1b2400b0043c798869a3si7668074qtb.430.2024.05.05.07.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 07:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=tUD+oOQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3cVN-0005tz-Dl; Sun, 05 May 2024 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVK-0005sy-Vl; Sun, 05 May 2024 10:06:15 -0400
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cVH-00086V-CT; Sun, 05 May 2024 10:06:14 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id EC5E8A0721;
 Sun,  5 May 2024 16:06:07 +0200 (CEST)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id il71TNKqggR8; Sun,  5 May 2024 16:06:07 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 8861AA06FC;
 Sun,  5 May 2024 16:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 8861AA06FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1714917967;
 bh=a0JcXUYEaTT4impeQLCUpEzujhW/Bb2lou9Ofz38O+4=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=tUD+oOQ+XMpd6j03y3uUdrkl+m0a2vVEDhEJarbXAPnJQRPrqMak0vJstA+h46beU
 3/BykhmFnBYR41FdQT2BKZoedUx36bq412Q/TDDMIGN30ElawVxdPM/jCd3l0dvCDL
 eTb5zMkM1y8LsZnCwjZyw2+szs4qS7XwNVbV74H4=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 8EElalwT4_uj; Sun,  5 May 2024 16:06:07 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 9D408A0721;
 Sun,  5 May 2024 16:06:06 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/4] tests/qtest: Check STM32L4x5 clock connections
Date: Sun,  5 May 2024 16:05:06 +0200
Message-ID: <20240505140556.373711-5-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: MoyRwBh+/BLV

For USART, GPIO and SYSCFG devices, check that clock frequency before
and after enabling the peripheral clock in RCC is correct.

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
Hello,

Should these tests be regrouped in stm32l4x5_rcc-test.c ?

Best regards,

In=C3=A8s Varhol

 tests/qtest/stm32l4x5_gpio-test.c   | 39 +++++++++++++++++++++++
 tests/qtest/stm32l4x5_syscfg-test.c | 38 +++++++++++++++++++++--
 tests/qtest/stm32l4x5_usart-test.c  | 48 +++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/stm32l4x5_gpio-test.c b/tests/qtest/stm32l4x5_gp=
io-test.c
index 72a7823406..896c16ad59 100644
--- a/tests/qtest/stm32l4x5_gpio-test.c
+++ b/tests/qtest/stm32l4x5_gpio-test.c
@@ -25,6 +25,14 @@
 #define GPIO_G 0x48001800
 #define GPIO_H 0x48001C00
=20
+/*
+ * MSI (4 MHz) is used as system clock source after startup
+ * from Reset.
+ * AHB prescaler is set to 1 at reset.
+ */
+#define SYSCLK_FREQ_HZ 4000000
+#define RCC_AHB2ENR 0x4002104C
+
 #define MODER 0x00
 #define OTYPER 0x04
 #define PUPDR 0x0C
@@ -168,6 +176,21 @@ static uint32_t reset(uint32_t gpio, unsigned int of=
fset)
     return 0x0;
 }
=20
+static uint32_t get_clock_freq_hz(unsigned int gpio)
+{
+    g_autofree char *path =3D g_strdup_printf("/machine/soc/gpio%c",
+                                            get_gpio_id(gpio) + 'a');
+    uint32_t clock_freq_hz =3D 0;
+    QDict *r;
+
+    r =3D qtest_qmp(global_qtest, "{ 'execute': 'qom-get', 'arguments':"
+        " { 'path': %s, 'property': 'clock-freq-hz'} }", path);
+    g_assert_false(qdict_haskey(r, "error"));
+    clock_freq_hz =3D qdict_get_int(r, "return");
+    qobject_unref(r);
+    return clock_freq_hz;
+}
+
 static void system_reset(void)
 {
     QDict *r;
@@ -505,6 +528,20 @@ static void test_bsrr_brr(const void *data)
     gpio_writel(gpio, ODR, reset(gpio, ODR));
 }
=20
+static void test_clock_enable(void)
+{
+    /*
+     * For each GPIO, enable its clock in RCC
+     * and check that its clock frequency changes to SYSCLK_FREQ_HZ
+     */
+    for (uint32_t gpio =3D GPIO_A; gpio <=3D GPIO_H; gpio +=3D GPIO_B - =
GPIO_A) {
+        g_assert_cmpuint(get_clock_freq_hz(gpio), =3D=3D, 0);
+        /* Enable the gpio clock */
+        writel(RCC_AHB2ENR, readl(RCC_AHB2ENR) | (0x1 << get_gpio_id(gpi=
o)));
+        g_assert_cmpuint(get_clock_freq_hz(gpio), =3D=3D, SYSCLK_FREQ_HZ=
);
+    }
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -556,6 +593,8 @@ int main(int argc, char **argv)
     qtest_add_data_func("stm32l4x5/gpio/test_bsrr_brr2",
                         test_data(GPIO_D, 0),
                         test_bsrr_brr);
+    qtest_add_func("stm32l4x5/gpio/test_clock_enable",
+                   test_clock_enable);
=20
     qtest_start("-machine b-l475e-iot01a");
     ret =3D g_test_run();
diff --git a/tests/qtest/stm32l4x5_syscfg-test.c b/tests/qtest/stm32l4x5_=
syscfg-test.c
index 506ca08bc2..616106460d 100644
--- a/tests/qtest/stm32l4x5_syscfg-test.c
+++ b/tests/qtest/stm32l4x5_syscfg-test.c
@@ -26,9 +26,18 @@
 #define INVALID_ADDR 0x2C
=20
 /* SoC forwards GPIOs to SysCfg */
-#define SYSCFG "/machine/soc"
+#define SOC "/machine/soc"
+#define SYSCFG "/machine/soc/syscfg"
 #define EXTI "/machine/soc/exti"
=20
+/*
+ * MSI (4 MHz) is used as system clock source after startup
+ * from Reset.
+ * AHB and APB2 prescalers are set to 1 at reset.
+ */
+#define SYSCLK_FREQ_HZ 4000000
+#define RCC_APB2ENR 0x40021060
+
 static void syscfg_writel(unsigned int offset, uint32_t value)
 {
     writel(SYSCFG_BASE_ADDR + offset, value);
@@ -41,7 +50,7 @@ static uint32_t syscfg_readl(unsigned int offset)
=20
 static void syscfg_set_irq(int num, int level)
 {
-   qtest_set_irq_in(global_qtest, SYSCFG, NULL, num, level);
+   qtest_set_irq_in(global_qtest, SOC, NULL, num, level);
 }
=20
 static void system_reset(void)
@@ -52,6 +61,19 @@ static void system_reset(void)
     qobject_unref(response);
 }
=20
+static uint32_t get_clock_freq_hz()
+{
+    uint32_t clock_freq_hz =3D 0;
+    QDict *r;
+
+    r =3D qtest_qmp(global_qtest, "{ 'execute': 'qom-get', 'arguments':"
+        " { 'path': %s, 'property': 'clock-freq-hz'} }", SYSCFG);
+    g_assert_false(qdict_haskey(r, "error"));
+    clock_freq_hz =3D qdict_get_int(r, "return");
+    qobject_unref(r);
+    return clock_freq_hz;
+}
+
 static void test_reset(void)
 {
     /*
@@ -301,6 +323,16 @@ static void test_irq_gpio_multiplexer(void)
     syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
 }
=20
+static void test_clock_enable(void)
+{
+    g_assert_cmpuint(get_clock_freq_hz(), =3D=3D, 0);
+
+    /* Enable SYSCFG clock */
+    writel(RCC_APB2ENR, readl(RCC_APB2ENR) | (0x1 << 0));
+
+    g_assert_cmpuint(get_clock_freq_hz(), =3D=3D, SYSCLK_FREQ_HZ);
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -325,6 +357,8 @@ int main(int argc, char **argv)
                    test_irq_pin_multiplexer);
     qtest_add_func("stm32l4x5/syscfg/test_irq_gpio_multiplexer",
                    test_irq_gpio_multiplexer);
+    qtest_add_func("stm32l4x5/syscfg/test_clock_enable",
+                   test_clock_enable);
=20
     qtest_start("-machine b-l475e-iot01a");
     ret =3D g_test_run();
diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_u=
sart-test.c
index 8902518233..6e6e66b6ab 100644
--- a/tests/qtest/stm32l4x5_usart-test.c
+++ b/tests/qtest/stm32l4x5_usart-test.c
@@ -17,6 +17,16 @@
 /* Use USART 1 ADDR, assume the others work the same */
 #define USART1_BASE_ADDR 0x40013800
=20
+/*
+ * MSI (4 MHz) is used as system clock source after startup
+ * from Reset.
+ * AHB, APB1 and APB2 prescaler are set to 1 at reset.
+ */
+#define SYSCLK_FREQ_HZ 4000000
+#define RCC_APB1ENR1 0x40021058
+#define RCC_APB1ENR2 0x4002105C
+#define RCC_APB2ENR  0x40021060
+
 /* See stm32l4x5_usart for definitions */
 REG32(CR1, 0x00)
     FIELD(CR1, M1, 28, 1)
@@ -64,6 +74,19 @@ static bool clear_nvic_pending(QTestState *qts, unsign=
ed int n)
     return true;
 }
=20
+static uint32_t get_clock_freq_hz(QTestState *qts, const char *path)
+{
+    uint32_t clock_freq_hz =3D 0;
+    QDict *r;
+
+    r =3D qtest_qmp(qts, "{ 'execute': 'qom-get', 'arguments':"
+        " { 'path': %s, 'property': 'clock-freq-hz'} }", path);
+    g_assert_false(qdict_haskey(r, "error"));
+    clock_freq_hz =3D qdict_get_int(r, "return");
+    qobject_unref(r);
+    return clock_freq_hz;
+}
+
 /*
  * Wait indefinitely for the flag to be updated.
  * If this is run on a slow CI runner,
@@ -296,6 +319,30 @@ static void test_send_str(void)
     qtest_quit(qts);
 }
=20
+static void check_clock(QTestState *qts, const char *path, uint32_t rcc_=
reg,
+                        uint32_t reg_offset)
+{
+    g_assert_cmpuint(get_clock_freq_hz(qts, path), =3D=3D, 0);
+    qtest_writel(qts, rcc_reg, qtest_readl(qts, rcc_reg) | (0x1 << reg_o=
ffset));
+    g_assert_cmpuint(get_clock_freq_hz(qts, path), =3D=3D, SYSCLK_FREQ_H=
Z);
+}
+
+static void test_clock_enable(void)
+{
+    /*
+     * For each USART device, enable its clock in RCC
+     * and check that its clock frequency is SYSCLK_FREQ_HZ
+     */
+    QTestState *qts =3D qtest_init("-M b-l475e-iot01a");
+
+    check_clock(qts, "machine/soc/usart[0]", RCC_APB2ENR, 14);
+    check_clock(qts, "machine/soc/usart[1]", RCC_APB1ENR1, 17);
+    check_clock(qts, "machine/soc/usart[2]", RCC_APB1ENR1, 18);
+    check_clock(qts, "machine/soc/uart[0]", RCC_APB1ENR1, 19);
+    check_clock(qts, "machine/soc/uart[1]", RCC_APB1ENR1, 20);
+    check_clock(qts, "machine/soc/lpuart1", RCC_APB1ENR2, 0);
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -308,6 +355,7 @@ int main(int argc, char **argv)
     qtest_add_func("stm32l4x5/usart/send_char", test_send_char);
     qtest_add_func("stm32l4x5/usart/receive_str", test_receive_str);
     qtest_add_func("stm32l4x5/usart/send_str", test_send_str);
+    qtest_add_func("stm32l4x5/usart/clock_enable", test_clock_enable);
     ret =3D g_test_run();
=20
     return ret;
--=20
2.43.2

