Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E771606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIv+w3G+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJQBt-0003E0-2S; Wed, 21 Oct 2026 02:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conti.manuele@gmail.com>)
 id 1xJQBq-0003D6-St
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 02:52:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <conti.manuele@gmail.com>)
 id 1xJQBn-0006JQ-U6
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 02:52:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso195870f8f.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792565562; x=1793170362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GwZQMrdWb0dxuu5Dhmk9+4HjGZXH4eH3BqXJTEFnghs=;
 b=kIv+w3G+X+mIThK3hqlo5kj/p95UwC5qtcujXpGQCU1OSM+sRZ90Kn0X9ZlIccQbrU
 j6fz8MUbFQ3iuOCRMfyEYmhD3ZwmwVTp1qXvAiVi3X0N73KEKUUKV3tXArFYN71QtUvd
 1+WVIS62YWLH4T/Ry2tEmaueCHgfUxcVgBt+Uq4g5rstw9NmG6tEp9q5655CLjXl/PAj
 9J/RHmMBChzuE0ojlH0ndv5fKBLwVv+17U6STBpZOM78G2fzA8cVP6MIH+v6/441x5OC
 rEdKoZu+20tAxoY2hCZaHzSOq4ujeslw1W13iL4coSTEF5adeXnY668bFyOocbniYgDY
 awiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792565562; x=1793170362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GwZQMrdWb0dxuu5Dhmk9+4HjGZXH4eH3BqXJTEFnghs=;
 b=SGvoldtJMUVwmubwZZ2mUxgVMw53gEqmp4BEKY7793gapRpHCBz1SCGjhfSkW75qIP
 ayzbAzDJkAXK51ipmaWi7ARSJYLzD+Vajqfn/OOGp4wCjhMbE+vINNFaU76YwSqN90QK
 14MvnY1IF8h2YY4N1bFMP0k/9B+WIo/RP5OZIEkk94NWOd/vaEwBgerthaLvdWbxQqQa
 dcILuaBSC7rf/1ivqMQO1zMOtP6xgXszfI/pcOk2WLKV/JhkicuHnMmYy7r+ZTrWqQcm
 ZKPh3pvAPRaO7b+C9BsHrdXt+BzzUf7WsZQ/hkizfTDfmhHRspCiGmW+rdr1AqWZqxME
 uLPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6+Zu1Ff6xO0UbVvR8NWIONPLvsZtiMG5ooamd2vLabrycrNUGS+7XijbTIFfseQpvNQAuKXRQbQ==@nongnu.org
X-Gm-Message-State: AFq9FYKFHzWLY/aRvkAWJEfyLBTQPftnq8rWeKZKSFiTALlfQPMjDQcH
 PP4EatRPJPWtT8iI4J15BF3v6HiIV5n3B61ZiU9BR6+u/ivKvD6twHEc
X-Gm-Gg: AYBFou3ifavxc0K2w/PV4C/YRZmPUeDtYNgOfjlQXSaR1JZlOF3fwfqubf8Jc9bJZ4v
 NZmz7gati5N7LwiAh++FXY8n0Jjv1iSlg1OR1FTtYhSorrIlc9x2iLdYgoy9HjSak9QLcprknMd
 G+JcAMdv8u5wxTlvzleWB2g0Rva7qC+uuBPDGD5bbNZZvUzYDDP2P7zsD4zOjjkNShR9kNqPIZa
 m7lZmMbq9/QNcWcZdGIiArewXfiaHFHyPbWRZV0BINqCgc813TSTxY9q5OMDn6rSJC3qn/9jdDx
 uzkU6RaBZXYRE5TodQXpOPFfTDANoHO4UoU55AcMnVIFR0n0alLF1P9MMlq4nelYc/Z9+3GWOOJ
 J0mSaEiFbaxMuuok26YxUEE5R1UqiMXQiQhMZG6Izdo1+Cm1Gc7aKhBIgRg+pWoYbtBQ+quIs6k
 l9g7H+upbxu+FyY6LGioK8bSR8DKJjHDsfMli9NmvePJsqfUSqAkazyPOlLx6F9K0KDv8Ve27X3
 UvbTeIQ8O4gt7GQHXIZOvxo3a6Q00v8isCgzbqOKqj5sQlJN1Gxr2LdccVhhnzgFXaC6BefTDjA
 ec4Q9y+p3UqXBnzsf94OlPplkLIFPprPs5U6JbvSpb8=
X-Received: by 2002:adf:ecc3:0:b0:487:6f2:1a4c with SMTP id
 ffacd0b85a97d-48e264e0fafmr1454238f8f.25.1792565561840; 
 Tue, 20 Oct 2026 23:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:7d0:d21a:4a00:39f5:8799:5de1:6dc6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25841fe4sm3724549f8f.53.2026.10.20.23.52.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 23:52:40 -0700 (PDT)
From: Manuele Conti <conti.manuele@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair@alistair23.me, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 Manuele Conti <conti.manuele@gmail.com>
Subject: [PATCH] hw/ssi/stm32f2xx_spi: avoid transferring data on DR reads
Date: Wed, 21 Oct 2026 08:52:38 +0200
Message-ID: <20261021065238.15220-1-conti.manuele@gmail.com>
X-Mailer: git-send-email 2.41.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=conti.manuele@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Writing SPI_DR already performs the synchronous SSI transfer and stores
its response in spi_dr. Reading SPI_DR performs another transfer, using
the previous response as transmit data, and returns the new response.
Consequently a normal write/read pair clocks two frames on the bus and
can skip bytes in a peripheral's response.

Return the response saved by the write and clear RXNE without starting
another transfer. Repeated reads then leave the peripheral state alone.

Add a qtest using the upstream netduino2 machine and an M25P80 flash.
Check the JEDEC ID, RXNE clearing, and repeated DR reads. The test requires
no board changes and reproduces the unwanted extra transfers before the
fix.

Fixes: 5ae74402d1f ("STM32F2xx: Add the SPI device")
Signed-off-by: Manuele Conti <conti.manuele@gmail.com>
---
 MAINTAINERS                      |  1 +
 hw/ssi/stm32f2xx_spi.c           |  1 -
 tests/qtest/meson.build          |  2 ++
 tests/qtest/stm32f2xx-spi-test.c | 50 ++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/stm32f2xx-spi-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 902db77..822c60a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1201,6 +1201,7 @@ F: hw/char/stm32f2xx_usart.c
 F: hw/timer/stm32f2xx_timer.c
 F: hw/adc/*
 F: hw/ssi/stm32f2xx_spi.c
+F: tests/qtest/stm32f2xx-spi-test.c
 F: include/hw/*/stm32*.h
 
 STM32F405
diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
index 871d573..da1dbb7 100644
--- a/hw/ssi/stm32f2xx_spi.c
+++ b/hw/ssi/stm32f2xx_spi.c
@@ -82,7 +82,6 @@ static uint64_t stm32f2xx_spi_read(void *opaque, hwaddr addr,
     case STM_SPI_SR:
         return s->spi_sr;
     case STM_SPI_DR:
-        stm32f2xx_spi_transfer(s);
         s->spi_sr &= ~STM_SPI_SR_RXNE;
         return s->spi_dr;
     case STM_SPI_CRCPR:
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 78b3010..5984e9c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -238,6 +238,8 @@ qtests_stm32l4x5 = \
    'stm32l4x5_usart-test']
 
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_NETDUINO2') and
+   config_all_devices.has_key('CONFIG_SSI_M25P80') ? ['stm32f2xx-spi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
diff --git a/tests/qtest/stm32f2xx-spi-test.c b/tests/qtest/stm32f2xx-spi-test.c
new file mode 100644
index 0000000..619191c
--- /dev/null
+++ b/tests/qtest/stm32f2xx-spi-test.c
@@ -0,0 +1,50 @@
+/*
+ * STM32F2XX SPI controller tests
+ *
+ * Copyright (c) 2026 Manuele Conti <conti.manuele@gmail.com>
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/* The first SSI bus found by -device belongs to SPI3. */
+#define SPI3_BASE 0x40003c00
+#define SPI_CR1   (SPI3_BASE + 0x00)
+#define SPI_SR    (SPI3_BASE + 0x08)
+#define SPI_DR    (SPI3_BASE + 0x0c)
+#define SPI_RXNE  (1U << 0)
+
+static void test_jedec_id(void)
+{
+    static const uint8_t jedec_id[] = { 0x20, 0x20, 0x14 };
+    QTestState *qts = qtest_init("-machine netduino2 "
+                               "-device m25p80,bus=ssi");
+
+    /* Enable SPI in master mode, with software slave management. */
+    qtest_writel(qts, SPI_CR1, (1U << 9) | (1U << 8) |
+                             (1U << 6) | (1U << 2));
+
+    qtest_writeb(qts, SPI_DR, 0x9f);
+    qtest_readb(qts, SPI_DR);
+
+    for (unsigned i = 0; i < ARRAY_SIZE(jedec_id); i++) {
+        qtest_writeb(qts, SPI_DR, 0);
+        g_assert_cmphex(qtest_readl(qts, SPI_SR) & SPI_RXNE, ==, SPI_RXNE);
+        g_assert_cmphex(qtest_readb(qts, SPI_DR), ==, jedec_id[i]);
+        g_assert_cmphex(qtest_readl(qts, SPI_SR) & SPI_RXNE, ==, 0);
+
+        /* Reading DR again must not clock another byte out of the flash. */
+        g_assert_cmphex(qtest_readb(qts, SPI_DR), ==, jedec_id[i]);
+        g_assert_cmphex(qtest_readl(qts, SPI_SR) & SPI_RXNE, ==, 0);
+    }
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/stm32f2xx/spi/jedec-id", test_jedec_id);
+    return g_test_run();
+}
-- 
2.54.0 (Apple Git-157)


