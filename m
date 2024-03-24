Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp271214ejj;
        Sun, 24 Mar 2024 09:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJjS/ztJ8w7n0ufXQ4p29DNOPRJ1w+bJR8wRB1dW8vPa95mAhgNNt0kO/iCKm9rPx1uHmWopXhtxbcyDsUAMXthDbxtWz4
X-Google-Smtp-Source: AGHT+IGAcxi4C8Ie/hEl4VAQ5cK56osNgwgGyIBAFOZPK4g3L9bNivmgMUeZMoxHwMph7Gsb2/JB
X-Received: by 2002:a05:622a:2a0a:b0:431:3df7:6fd3 with SMTP id hc10-20020a05622a2a0a00b004313df76fd3mr6110586qtb.29.1711299556842;
        Sun, 24 Mar 2024 09:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711299556; cv=none;
        d=google.com; s=arc-20160816;
        b=HKRmTGUEMmTX9kjElfFpb71k0zYfRLyieWmiklS5TrDmct3/syfODtfALsGkBjHLNv
         DPdUZVognFzA2nDdmi/ZSixuken5+JHxj9a8VNdo9rZX9g8WRRPuqdUrO6Oqc7HSXYeB
         V9tByNtBoKIXlgRnQI4fB0LXyVIlu5M1Rtp/Ug4QqTuuRpaoCdIrN/jfV/LzIeZFXtUN
         ENp5h6ED3ScM15em4KqSORbiCt36E2IzLHWiWjlxYXfYOWA0rhU76KXLw5em+LEu3uaG
         iGpW5R4neEcUBNdBjN4iMq4YdM6hGwl6P161IC1Fgs5h1h7qXdF/mTqIpZ79FrgXP5Nu
         N3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=qYF1K+POpgb3rrtKFTApXeZmwUCPl/8pgbjvgRwOoZA=;
        fh=EsR1pYVLfRVJvpelbFzln9vs9h7oPSeWdjYRcFXVeQs=;
        b=NW7zFZvUeHf3PDuVnSnhxFTJLQJsJuGalKE4bI3YCadACd36x1XbkVRRXsG2tvmLJB
         YS2G0UbPQSMfut8eEvx4NZqE/GMFcd/24K3u/Kt41h7aYuER+Q4E/Kj2Wh3LxXehstzR
         ar6hD1uv2pEgWrndVhY6/sYvP69GEm+VawL3P6PRF4hLYKK/7vPgRbE12DIj4fPY3hJP
         VTjnxKY6VmllFytrsetUpi3rt336lh+gyVp2TZt2aDAGFlwujcuzLRlHlngK5mGUZLAV
         ytiVDHNf8Ru1ZaxW6CjEApSUZB2updsdE97FmbbR15TiXMbq2Gbqb+UlhUHnSC7wqETF
         +JIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="O43/ZKhE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac87d05000000b00431203ee43dsi3644680qtb.2.2024.03.24.09.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2024 09:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="O43/ZKhE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1roRBD-0001Sr-QL; Sun, 24 Mar 2024 12:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1roRBC-0001RW-Gm; Sun, 24 Mar 2024 12:58:42 -0400
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1roRBA-0005e4-AI; Sun, 24 Mar 2024 12:58:42 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 0105FA0576;
 Sun, 24 Mar 2024 17:58:39 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id w71bSlQnnT0C; Sun, 24 Mar 2024 17:58:38 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 712B4A0586;
 Sun, 24 Mar 2024 17:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 712B4A0586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1711299518;
 bh=qYF1K+POpgb3rrtKFTApXeZmwUCPl/8pgbjvgRwOoZA=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=O43/ZKhExqBb46BHh5gUFqGfXU9/EG/YBhRtkl5nd5IEbyVJN7+4CLRJG2VKZmCNC
 JIF7jBoZhVHXOANZlrYxvNawk3ONIWQyd3SPqIrvX55lApRhlWrqB5/BwWWs8NjyXo
 fqGn2PH35T8gGeDEKleV49lV7vIJtzm22NIPA6fY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id Gq4yRvlln0aT; Sun, 24 Mar 2024 17:58:38 +0100 (CET)
Received: from AM-Inspiron-3585.. (unknown [78.208.223.3])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 4A92AA0576;
 Sun, 24 Mar 2024 17:58:37 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/6] tests/qtest: Add tests for the STM32L4x5 USART
Date: Sun, 24 Mar 2024 17:55:46 +0100
Message-Id: <20240324165545.201908-7-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: Dk6NWKtsPz/B

Test:
- read/write from/to the usart registers
- send/receive a character/string over the serial port

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 tests/qtest/meson.build            |   3 +-
 tests/qtest/stm32l4x5_usart-test.c | 326 +++++++++++++++++++++++++++++
 2 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/stm32l4x5_usart-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 36c5c13a7b..e0d72ee91e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -205,7 +205,8 @@ qtests_stm32l4x5 =3D \
   ['stm32l4x5_exti-test',
    'stm32l4x5_syscfg-test',
    'stm32l4x5_rcc-test',
-   'stm32l4x5_gpio-test']
+   'stm32l4x5_gpio-test',
+   'stm32l4x5_usart-test']
=20
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_u=
sart-test.c
new file mode 100644
index 0000000000..2d42f053f6
--- /dev/null
+++ b/tests/qtest/stm32l4x5_usart-test.c
@@ -0,0 +1,326 @@
+/*
+ * QTest testcase for STML4X5_USART
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
+#include "libqtest.h"
+#include "hw/misc/stm32l4x5_rcc_internals.h"
+#include "hw/registerfields.h"
+
+#define RCC_BASE_ADDR 0x40021000
+/* Use USART 1 ADDR, assume the others work the same */
+#define USART1_BASE_ADDR 0x40013800
+
+/* See stm32l4x5_usart for definitions */
+REG32(CR1, 0x00)
+    FIELD(CR1, M1, 28, 1)
+    FIELD(CR1, OVER8, 15, 1)
+    FIELD(CR1, M0, 12, 1)
+    FIELD(CR1, PCE, 10, 1)
+    FIELD(CR1, TXEIE, 7, 1)
+    FIELD(CR1, RXNEIE, 5, 1)
+    FIELD(CR1, TE, 3, 1)
+    FIELD(CR1, RE, 2, 1)
+    FIELD(CR1, UE, 0, 1)
+REG32(CR2, 0x04)
+REG32(CR3, 0x08)
+    FIELD(CR3, OVRDIS, 12, 1)
+REG32(BRR, 0x0C)
+REG32(GTPR, 0x10)
+REG32(RTOR, 0x14)
+REG32(RQR, 0x18)
+REG32(ISR, 0x1C)
+    FIELD(ISR, TXE, 7, 1)
+    FIELD(ISR, RXNE, 5, 1)
+    FIELD(ISR, ORE, 3, 1)
+REG32(ICR, 0x20)
+REG32(RDR, 0x24)
+REG32(TDR, 0x28)
+
+#define NVIC_ISPR1 0XE000E204
+#define NVIC_ICPR1 0xE000E284
+#define USART1_IRQ 37
+
+static bool check_nvic_pending(QTestState *qts, unsigned int n)
+{
+    /* No USART interrupts are less than 32 */
+    assert(n > 32);
+    n -=3D 32;
+    return qtest_readl(qts, NVIC_ISPR1) & (1 << n);
+}
+
+static bool clear_nvic_pending(QTestState *qts, unsigned int n)
+{
+    /* No USART interrupts are less than 32 */
+    assert(n > 32);
+    n -=3D 32;
+    qtest_writel(qts, NVIC_ICPR1, (1 << n));
+    return true;
+}
+
+/*
+ Tests should never need to sleep(), because while it might be plenty of=
 time on a
+ fast development machine, it can cause intermittent failures due
+ to timeouts if the test is on some heavily-loaded slow CI runner.
+ */
+static bool usart_wait_for_flag(QTestState *qts, uint32_t event_addr, ui=
nt32_t flag)
+{
+    /* Wait at most 10 minutes */
+    for (int i =3D 0; i < 600000; i++) {
+        if ((qtest_readl(qts, event_addr) & flag)) {
+            return true;
+        }
+        g_usleep(1000);
+    }
+
+    return false;
+}
+
+static void usart_receive_string(QTestState *qts, int sock_fd, const cha=
r *in,
+                           char *out)
+{
+    int i, in_len =3D strlen(in);
+
+    g_assert_true(send(sock_fd, in, in_len, 0) =3D=3D in_len);
+    for (i =3D 0; i < in_len; i++) {
+        g_assert_true(usart_wait_for_flag(qts,
+            USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK));
+        out[i] =3D qtest_readl(qts, USART1_BASE_ADDR + A_RDR);
+    }
+    out[i] =3D '\0';
+}
+
+static void usart_send_string(QTestState *qts, const char *in)
+{
+    int i, in_len =3D strlen(in);
+
+    for (i =3D 0; i < in_len; i++) {
+        qtest_writel(qts, USART1_BASE_ADDR + A_TDR, in[i]);
+        g_assert_true(usart_wait_for_flag(qts,
+            USART1_BASE_ADDR + A_ISR, R_ISR_TXE_MASK));
+    }
+}
+
+/* Init the RCC clocks to run at 80 MHz */
+static void init_clocks(QTestState *qts)
+{
+    uint32_t value;
+
+    /* MSIRANGE can be set only when MSI is OFF or READY */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CR), R_CR_MSION_MASK);
+
+    /* Clocking from MSI, in case MSI was not the default source */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CFGR), 0);
+
+    /*
+     * Update PLL and set MSI as the source clock.
+     * PLLM =3D 1 --> 000
+     * PLLN =3D 40 --> 40
+     * PPLLR =3D 2 --> 00
+     * PLLDIV =3D unused, PLLP =3D unused (SAI3), PLLQ =3D unused (48M1)
+     * SRC =3D MSI --> 01
+     */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_PLLCFGR), R_PLLCFGR_PLLREN_MASK=
 |
+            (40 << R_PLLCFGR_PLLN_SHIFT) |
+            (0b01 << R_PLLCFGR_PLLSRC_SHIFT));
+
+    /* PLL activation */
+
+    value =3D qtest_readl(qts, (RCC_BASE_ADDR + A_CR));
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CR), value | R_CR_PLLON_MASK);
+
+    /* RCC_CFGR is OK by defaut */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CFGR), 0);
+
+    /* CCIPR : no periph clock by default */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CCIPR), 0);
+
+    /* Switches on the PLL clock source */
+    value =3D qtest_readl(qts, (RCC_BASE_ADDR + A_CFGR));
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CFGR), (value & ~R_CFGR_SW_MASK=
) |
+        (0b11 << R_CFGR_SW_SHIFT));
+
+    /* Enable SYSCFG clock enabled */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_APB2ENR), R_APB2ENR_SYSCFGEN_MA=
SK);
+
+    /* Enable the IO port B clock (See p.252) */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_AHB2ENR), R_AHB2ENR_GPIOBEN_MAS=
K);
+
+    /* Enable the clock for USART1 (cf p.259) */
+    /* We rewrite SYSCFGEN to not disable it */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_APB2ENR),
+                 R_APB2ENR_SYSCFGEN_MASK | R_APB2ENR_USART1EN_MASK);
+
+    /* TODO: Enable usart via gpio */
+    /* Set Pin 6 & 7 of port B in Alternate Function mode */
+    /* GPIOB->MODER =3D (GPIOB->MODER & ~(GPIO_MODER_MODE6_Msk |
+                    GPIO_MODER_MODE7_Msk)) |
+                    (AF_MODE << GPIO_MODER_MODE6_Pos) |
+                    (AF_MODE << GPIO_MODER_MODE7_Pos); */
+
+    /* Specify Alternate Function mode n=C2=B07 for Pin 6 & 7 of port B =
*/
+    /* GPIOB->AFR[0] =3D (GPIOB->AFR[0] & ~(GPIO_AFRL_AFSEL6_Msk |
+                        GPIO_AFRL_AFSEL7_Msk )) |
+                        (AF7 << GPIO_AFRL_AFSEL6_Pos) |
+                        (AF7 << GPIO_AFRL_AFSEL7_Pos); */
+
+    /* Set PCLK as the clock for USART1(cf p.272) i.e. reset both bits *=
/
+    qtest_writel(qts, (RCC_BASE_ADDR + A_CCIPR), 0);
+
+    /* Reset USART1 (see p.249) */
+    qtest_writel(qts, (RCC_BASE_ADDR + A_APB2RSTR), 1 << 14);
+    qtest_writel(qts, (RCC_BASE_ADDR + A_APB2RSTR), 0);
+}
+
+static void init_uart(QTestState *qts)
+{
+    uint32_t cr1;
+
+    init_clocks(qts);
+
+    /*
+     * For 115200 bauds, see p.1349.
+     * The clock has a frequency of 80Mhz,
+     * for 115200, we have to put a divider of 695 =3D 0x2B7.
+     */
+    qtest_writel(qts, (USART1_BASE_ADDR + A_BRR), 0x2B7);
+
+    /*
+     * Set the oversampling by 16,
+     * disable the parity control and
+     * set the word length to 8. (cf p.1377)
+     */
+    cr1 =3D qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
+    cr1 &=3D ~(R_CR1_M1_MASK | R_CR1_M0_MASK | R_CR1_OVER8_MASK | R_CR1_=
PCE_MASK);
+    qtest_writel(qts, (USART1_BASE_ADDR + A_CR1), cr1);
+
+    /* Enable the transmitter, the receiver and the USART. */
+    qtest_writel(qts, (USART1_BASE_ADDR + A_CR1),
+        R_CR1_UE_MASK | R_CR1_RE_MASK | R_CR1_TE_MASK);
+}
+
+static void test_write_read(void)
+{
+    QTestState *qts =3D qtest_init("-M b-l475e-iot01a");
+
+    /* Test that we can write and retrieve a value from the device */
+    qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 0xFFFFFFFF);
+    const uint32_t tdr =3D qtest_readl(qts, USART1_BASE_ADDR + A_TDR);
+    g_assert_cmpuint(tdr, =3D=3D, 0x000001FF);
+}
+
+static void test_receive_char(void)
+{
+    int sock_fd;
+    uint32_t cr1;
+    QTestState *qts =3D qtest_init_with_serial("-M b-l475e-iot01a", &soc=
k_fd);
+
+    init_uart(qts);
+
+    /* Try without initializing IRQ */
+    g_assert_true(send(sock_fd, "a", 1, 0) =3D=3D 1);
+    usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
+    g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), =3D=3D, =
'a');
+    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
+
+    /* Now with the IRQ */
+    cr1 =3D qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
+    cr1 |=3D R_CR1_RXNEIE_MASK;
+    qtest_writel(qts, USART1_BASE_ADDR + A_CR1, cr1);
+    g_assert_true(send(sock_fd, "b", 1, 0) =3D=3D 1);
+    usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
+    g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), =3D=3D, =
'b');
+    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
+    clear_nvic_pending(qts, USART1_IRQ);
+
+    close(sock_fd);
+
+    qtest_quit(qts);
+}
+
+static void test_send_char(void)
+{
+    int sock_fd;
+    char s[1];
+    uint32_t cr1;
+    QTestState *qts =3D qtest_init_with_serial("-M b-l475e-iot01a", &soc=
k_fd);
+
+    init_uart(qts);
+
+    /* Try without initializing IRQ */
+    qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'c');
+    g_assert_true(recv(sock_fd, s, 1, 0) =3D=3D 1);
+    g_assert_cmphex(s[0], =3D=3D, 'c');
+    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
+
+    /* Now with the IRQ */
+    cr1 =3D qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
+    cr1 |=3D R_CR1_TXEIE_MASK;
+    qtest_writel(qts, USART1_BASE_ADDR + A_CR1, cr1);
+    qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'd');
+    g_assert_true(recv(sock_fd, s, 1, 0) =3D=3D 1);
+    g_assert_cmphex(s[0], =3D=3D, 'd');
+    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
+    clear_nvic_pending(qts, USART1_IRQ);
+
+    close(sock_fd);
+
+    qtest_quit(qts);
+}
+
+static void test_receive_str(void)
+{
+    int sock_fd;
+    char s[10];
+    QTestState *qts =3D qtest_init_with_serial("-M b-l475e-iot01a", &soc=
k_fd);
+
+    init_uart(qts);
+
+    usart_receive_string(qts, sock_fd, "hello", s);
+    g_assert_true(memcmp(s, "hello", 5) =3D=3D 0);
+
+    close(sock_fd);
+
+    qtest_quit(qts);
+}
+
+static void test_send_str(void)
+{
+    int sock_fd;
+    char s[10];
+    QTestState *qts =3D qtest_init_with_serial("-M b-l475e-iot01a", &soc=
k_fd);
+
+    init_uart(qts);
+
+    usart_send_string(qts, "world");
+    g_assert_true(recv(sock_fd, s, 10, 0) =3D=3D 5);
+    g_assert_true(memcmp(s, "world", 5) =3D=3D 0);
+
+    close(sock_fd);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
+
+    qtest_add_func("stm32l4x5/usart/write_read", test_write_read);
+    qtest_add_func("stm32l4x5/usart/receive_char", test_receive_char);
+    qtest_add_func("stm32l4x5/usart/send_char", test_send_char);
+    qtest_add_func("stm32l4x5/usart/receive_str", test_receive_str);
+    qtest_add_func("stm32l4x5/usart/send_str", test_send_str);
+    ret =3D g_test_run();
+
+    return ret;
+}
+
--=20
2.34.1

