Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C786FEB106D
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 15:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzynr-00081K-KK; Tue, 10 Mar 2026 11:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzyni-0007IY-KW
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:15:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzyng-0000TW-6U
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:15:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so14348835e9.0
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773155710; x=1773760510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ym63ilovpE3fs1+AVhjYRXUzfWQaS0KSd4iVsrOzsEY=;
 b=XCexwV5/K+UoVxECz5gKu3t+zKQi1/KA1BGeX45ZfNqA7xSbaW9C6tAXtf9pJ6ky56
 imP0n1MzsMF4oJKXCZyTztBpijDdSOTsbP0gd/CynbWVuLpb+wAibcX5TKGfwob7vdQk
 gyUaS0dILGNZO5JffcHd8Xvsv/TKpS++wTwO01cDI9smqtHOQUTHMiRpEkMQwrxyF3mb
 yeaLG8+wukskRDtTw8PrPQQJPKYvwRjUCb+mkEznj0lNnVJwE0huUFxWeAOsY6mgCcxK
 7MSVOjC51ddCoO6Rtk7V3AZI/z1l4YANQIE+p43q8IT/mJj0GNcC2/vFgZpwr7uI2lF5
 Y42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773155711; x=1773760511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ym63ilovpE3fs1+AVhjYRXUzfWQaS0KSd4iVsrOzsEY=;
 b=gC0ki4eXxn6LmsD77qB0IiN6lDyUe/D+UtWbKK4eRMAcYsDVen+Cy7+oqZdmMgSwl8
 p5BdLY5YeW9ppvMz9onuonHPp8kqRKYNuLwGbeFUSfRhNVgT+6yZwPg+6/uL8W7b+OPL
 3sdeGuVOt+donW2cvvJ/iT7j9miGkdEXrW5iv3lohKSetlNq5KbUDbHLG4+5MnyHeY2z
 MAoAq9mBqmr5wCUqznTw629ZRjyhjo4Y4PMI7C5oJKMKg5SRrlDxGUff1YZ8jmeP6Q/v
 /mm76AtuV4o75uAnNQ0Pcey8k8FOMpLUPUexnoNyYk3KedEGDVoQJhMP1C/C3+IuI74I
 4xNQ==
X-Gm-Message-State: AOJu0YwWgIO6asxsx+ybqICBjW1uAnkusVOKOHCMZ260wrzmorq70kFQ
 3XAscY7Bg2lqi7a3pnLyzob0ebn9ivoMNyeUiUNIli8c9mOCpsl9gaxDXZfr/9GVlY8gvHTuz5o
 FoEEp
X-Gm-Gg: ATEYQzzENZaKTy1Qxuh7tXsGeWcxk66eLX6SFFQvbOS61OVjB+24Ds3O6u+Ud4ag4G4
 IeHDBD9wyl2RERxjzy6LriZ5vOYv2VHHCXiuLujVzPf+RoJ4UseNPnvwb8n7Pc5HeWekAH0jtbK
 TW/Au6NLlVJrfjBvl1MhN7v4kO0RiC6yWnMZWz1qggNuEzigBfO40dIe/dkiJ43e4APOcYd7KrQ
 WGJHNW2dM7iSk+NN/RZEkOZEpo4qqXQUuIWAElWsO4UCA1DjRRpwTTZT+Slg9ShzwKzo1VATeQz
 xt3OLdjDPo1g9EQIfekM6bRTAig2RHe4iXlK/A03nwlN1mgrXThWvcHFH2yef0v8V7Vi1/0D1HB
 FoDitygRCrWz48ry02SXZvYo8gxqULMbYC2QxOE4ChaqxdOmWqTlDmNELm9HmWU99ZzeVKLpgV8
 VKngnIiA2ASua1neuoQ29cXWhNuqxHT3U/IT7S+Vo0fhx1WVi74aI79eeB8bD5JpRYeMGimuc7n
 ML2xAgOgcdYQ3z3JNexv6hGhtOfwmZIANzCRXavrg==
X-Received: by 2002:a05:600c:4e94:b0:485:3fc6:c0f3 with SMTP id
 5b1f17b1804b1-4853fc6c35fmr101139245e9.0.1773155710416; 
 Tue, 10 Mar 2026 08:15:10 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853588758fsm127303185e9.4.2026.03.10.08.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 08:15:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] tests/qtest/ast2700-sgpio-test: Use g_strdup_printf()
 instead of char arrays
Date: Tue, 10 Mar 2026 15:15:06 +0000
Message-ID: <20260310151507.2973843-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310151507.2973843-1-peter.maydell@linaro.org>
References: <20260310151507.2973843-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Older versions of gcc with -Wformat-overflow=2 don't like the usage of
fixed size char arrays in this test; gcc 7.5.0 (SUSE Linux) says:

../tests/qtest/ast2700-sgpio-test.c: In function ‘test_output_pins’:
../tests/qtest/ast2700-sgpio-test.c:27:33: error: ‘sprintf’ may write a
terminating nul past the end of the destination
[-Werror=format-overflow=]

../tests/qtest/ast2700-sgpio-test.c: In function ‘test_irq_level_high’:
../tests/qtest/ast2700-sgpio-test.c:85:33: error: ‘sprintf’ may write a
terminating nul past the end of the destination
[-Werror=format-overflow=]

These can't actually happen because of the limited size of the values
being substituted in.  However rather than require readers to check
whether the arrays really have been declared large enough, we prefer
to use g_strdup_printf() for this kind of string work.

Reported-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/ast2700-sgpio-test.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/ast2700-sgpio-test.c b/tests/qtest/ast2700-sgpio-test.c
index 56c54cca9b..529408ca8f 100644
--- a/tests/qtest/ast2700-sgpio-test.c
+++ b/tests/qtest/ast2700-sgpio-test.c
@@ -18,14 +18,14 @@
 static void test_output_pins(const char *machine, const uint32_t base, int idx)
 {
     QTestState *s = qtest_init(machine);
-    char name[16];
-    char qom_path[64];
     uint32_t offset = 0;
     uint32_t value = 0;
     for (int i = 0; i < ASPEED_SGPIO_MAX_PIN_PAIR; i++) {
         /* Odd index is output port */
-        sprintf(name, "sgpio%03d", i * 2 + 1);
-        sprintf(qom_path, "/machine/soc/sgpio[%d]", idx);
+        g_autofree const char *name = g_strdup_printf("sgpio%03d", i * 2 + 1);
+        g_autofree const char *qom_path
+            = g_strdup_printf("/machine/soc/sgpio[%d]", idx);
+
         offset = base + (R_SGPIO_0_CONTROL + i) * 4;
         /* set serial output */
         qtest_writel(s, offset, 0x00000001);
@@ -45,14 +45,14 @@ static void test_output_pins(const char *machine, const uint32_t base, int idx)
 static void test_input_pins(const char *machine, const uint32_t base, int idx)
 {
     QTestState *s = qtest_init(machine);
-    char name[16];
-    char qom_path[64];
     uint32_t offset = 0;
     uint32_t value = 0;
     for (int i = 0; i < ASPEED_SGPIO_MAX_PIN_PAIR; i++) {
         /* Even index is input port */
-        sprintf(name, "sgpio%03d", i * 2);
-        sprintf(qom_path, "/machine/soc/sgpio[%d]", idx);
+        g_autofree const char *name = g_strdup_printf("sgpio%03d", i * 2);
+        g_autofree const char *qom_path
+            = g_strdup_printf("/machine/soc/sgpio[%d]", idx);
+
         offset = base + (R_SGPIO_0_CONTROL + i) * 4;
         /* set serial input */
         qtest_qom_set_bool(s, qom_path, name, true);
@@ -73,8 +73,6 @@ static void test_irq_level_high(const char *machine,
                                 const uint32_t base, int idx)
 {
     QTestState *s = qtest_init(machine);
-    char name[16];
-    char qom_path[64];
     uint32_t ctrl_offset = 0;
     uint32_t int_offset = 0;
     uint32_t int_reg_idx = 0;
@@ -82,8 +80,10 @@ static void test_irq_level_high(const char *machine,
     uint32_t value = 0;
     for (int i = 0; i < ASPEED_SGPIO_MAX_PIN_PAIR; i++) {
         /* Even index is input port */
-        sprintf(name, "sgpio%03d", i * 2);
-        sprintf(qom_path, "/machine/soc/sgpio[%d]", idx);
+        g_autofree const char *name = g_strdup_printf("sgpio%03d", i * 2);
+        g_autofree const char *qom_path =
+            g_strdup_printf("/machine/soc/sgpio[%d]", idx);
+
         int_reg_idx = i / 32;
         int_bit_idx = i % 32;
         int_offset = base + (R_SGPIO_INT_STATUS_0 + int_reg_idx) * 4;
-- 
2.43.0


