Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71531C9832F
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 17:57:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAWdn-00015T-3r; Sat, 26 Sep 2026 13:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwhitakera@gmail.com>)
 id 1xAWdf-000152-Fz
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 13:56:44 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jwhitakera@gmail.com>)
 id 1xAWdd-0005o8-G9
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 13:56:43 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-14373bcc010so1686222c88.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790445400; x=1791050200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=maHY6REF4PxHvCHUgnPtzCMxPlo1A+DkehQAFQcOH2c=;
 b=N/MmgGIrlKZHD1596o5G3el0POVCldkfOHw0EaAbt3o7jikC3Mv0cJvUlMt5+loBgU
 iEsMpyK4bZYX4mdlIPTtcXWN8ubqZZaXRnljIDyqHAfWSJxC9FjLAHn6rRnMUHmvkcl1
 A8QXTGhjibLllCxiWlOeu4giOVKq9kguMSMRRaXbI8lNX0ekJWL5OqTWDzUmzs4V6Uyr
 635Zds6pZoHFOhdawtKOOJOWa2ZMSiJpXnzu5mhegJOZaOAgBLXAwaa8s5li+zqBsPVb
 1PZH/1C5+TCCXeu96XZ8sB9lvSxpI+wB/xzLzi0zPj+vTSuoa9i8f4TbMrL9LBkOveqm
 kRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790445400; x=1791050200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=maHY6REF4PxHvCHUgnPtzCMxPlo1A+DkehQAFQcOH2c=;
 b=pDN/EVgVMA14xKLXoCu7LZTd2ncgLMcsfgtCl7RnoCjXTEpabI6uuHG9a0RSW9WRha
 YV1PSR0tMCev7dlrCW7aNMFks2yHnFfSxPvYidRtVFKyqoqFa7cidDO40IDoq3uzRbkc
 +pyL3JWEYfV/KyZ01gawtyMoGvqo5jt17+QKuJTYzsvXEenXS4BUXtYPvR4uRRHeNiJf
 3IRzjRHEvWnYZSB3j/aO5h+gc3c5DuoLOOpDqeuxS8QtEEMQ6Vak+TRXggb1O/I9UjPa
 JbgyhjJtwKdXdjhb6NnxRKm+M1tCQj69ARbwMMKi0rJV+DlWI859F8mhLM61TNialcQR
 TSyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBypCoGOh+tbkTGUYmUxS00YO0KhcsQkDfPhU4kC3/Rs2HtHRPt5p8w5iBnC3BlIhE7c61VSsi9Glg==@nongnu.org
X-Gm-Message-State: AFuF++lDC9fLe4/nEUj9rSuvlYbVoIzqi+1VQ5e62MfKZMEsgoAU9WFC
 k27Jh01jusT8x3VQfMYugC4Es+aw/Ncn3FBrroOQD8A/ohcORcwGpLgM
X-Gm-Gg: AYBFou1hY+ABYB5mGVbuMOL/2319Ahy16pgnYDVyWRmNcvYaWwq/63/OAHfzs/sIqqm
 UXMKDywm7/YRReEratYul+rkCENnwGW2D/S2KFs09FKXAeQk/E/kjG5r+wxx88jX56gNPoBhLOR
 CAID3QoXS0dt3es017VD2YRysIBdbQ5+HKCR/dRxY1dCKPSAnuOtWPUJNXRlhRGshogLjMh/KsV
 gMLbc5ZKXmOAnjaT6ixXKA2IQJjklRZSHdIyqMsmNWuEaE+EiUMhWwgWfWLPRi4EMQkhNeVU5Ab
 dgAB6lHR0xLdGrdMUAGvJ4rMa8jp6PRSgnpxbhfYlY3eyiohPEoM2itcgyUJMXu5Yzhqk94reJ7
 4HFgQvfeZvsSlJfvVw75mL4dLzoY7pVR0DL3CvN0mjzPlQyLsc8MViUve9hMlW8RJZVBr8sFot5
 W+5ozRj2eOly9akse6MNz/OMmCFbMQatTiuShraZZqrz1b6T2xC5Jreed6B7Xc6NdPKIPOhRqkZ
 BbY984/
X-Received: by 2002:a05:701a:c909:b0:144:fd77:5b0d with SMTP id
 a92af1059eb24-146ce1a9f1amr4229780c88.2.1790445399539; 
 Sat, 26 Sep 2026 10:56:39 -0700 (PDT)
Received: from jacob-pop23u.lan ([2600:1700:88b2:a50:9eb0:e16a:8f0e:f9cb])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm13553669c88.0.2026.09.26.10.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 10:56:39 -0700 (PDT)
From: Jacob Whitaker Abrams <jwhitakera@gmail.com>
X-Google-Original-From: Jacob Whitaker Abrams <satur9nine@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Jacob Whitaker Abrams <satur9nine@gmail.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org (open list:STM32L4x5 SoC Family)
Subject: [PATCH v3] hw/char/stm32l4x5_usart.c: Support 16-bit writes
Date: Sat, 26 Sep 2026 10:56:34 -0700
Message-ID: <20260926175634.2034094-1-satur9nine@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=jwhitakera@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Official STM32CubeL4 drivers use and require support for 16-bit writes to
UART registers for proper function despite datasheet claims.

Signed-off-by: Jacob Whitaker Abrams <satur9nine@gmail.com>
---
v3:
 - Add suggested comment and set only valid.min_access_size to 4
v2:
 - Remove all changes other than supporting 16-bit writes UART regs

 hw/char/stm32l4x5_usart.c          |  7 ++++++-
 tests/qtest/stm32l4x5_usart-test.c | 22 +++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index 0b02dde1f8..c4ffc0d6ce 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -522,7 +522,12 @@ static const MemoryRegionOps stm32l4x5_usart_base_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .max_access_size = 4,
-        .min_access_size = 4,
+        /*
+         * Official STM32CubeL4 drivers use and require support for 16-bit
+         * writes to UART registers for proper function despite datasheet
+         * claims.
+         */
+        .min_access_size = 2,
         .unaligned = false
     },
     .impl = {
diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_usart-test.c
index a72c5a685d..3c6437e75d 100644
--- a/tests/qtest/stm32l4x5_usart-test.c
+++ b/tests/qtest/stm32l4x5_usart-test.c
@@ -332,6 +332,26 @@ static void test_ack(void)
     qtest_quit(qts);
 }
 
+static void test_16bit_access(void)
+{
+    QTestState *qts = qtest_init("-M b-l475e-iot01a");
+
+    /* GTPR is declared uint16_t in the official STM driver. */
+    qtest_writew(qts, USART1_BASE_ADDR + A_GTPR, 0xABCD);
+    uint16_t gtpr16 = qtest_readw(qts, USART1_BASE_ADDR + A_GTPR);
+    g_assert_cmpuint(gtpr16, ==, 0xABCD);
+
+    /* TDR is uint16_t and r/w, register is 9-bits */
+    qtest_writew(qts, USART1_BASE_ADDR + A_TDR, 0x01CD);
+    uint16_t tdr16 = qtest_readw(qts, USART1_BASE_ADDR + A_TDR);
+    g_assert_cmpuint(tdr16, ==, 0x01CD);
+
+    /* RDR is uint16_t and read only, register is 9-bits */
+    qtest_writew(qts, USART1_BASE_ADDR + A_RDR, 0x01FA);
+
+    qtest_quit(qts);
+}
+
 static void check_clock(QTestState *qts, const char *path, uint32_t rcc_reg,
                         uint32_t reg_offset)
 {
@@ -370,6 +390,6 @@ int main(int argc, char **argv)
     qtest_add_func("stm32l4x5/usart/send_str", test_send_str);
     qtest_add_func("stm32l4x5/usart/ack", test_ack);
     qtest_add_func("stm32l4x5/usart/clock_enable", test_clock_enable);
+    qtest_add_func("stm32l4x5/usart/16bit_access", test_16bit_access);
     return g_test_run();
 }
-
-- 
2.43.0


