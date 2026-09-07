Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FCDC79FA7
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cVZ-00029Z-3I; Mon, 07 Sep 2026 12:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVX-00024z-Bj
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:47:47 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVV-0003sK-GP
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:47:47 -0400
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so2793343f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799664; x=1789404464;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zfzexpI+Sf5r0TVpd7delVcigz2TZ/5dYES5EEOvYCg=;
 b=Dgi2zbsAR5hHFHhxyAFnyPk2drwFhVHFcZ37Oi2HcKYRVp8zmtL8d1fV+UZKkNLtYn
 yCg7QAW4xgllhKnfa2+xWS9Zthgy0c3s/J9VIGJlSOjMkuxUSt1uZOkIwBtNzW42x5mZ
 3W4btGe7h5fD1dCtgLTOJu0FYLAIgEoT4FgPvAOUn9/H8PmRsel8KULjmVr/B/YnjQdq
 CHer61dFDLJsGMvom7xnB2o6vLQmm7GIITY524fzo1y6y0Hu763sdvO5X76lw7+Woj70
 b8ENIMsjgBq0eAKGywdisx0oaeowH9nzbpUyHxRF5orgrkEIuwhHvKmp2bmDicKBRghZ
 z7Wg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCfISIArjGCHB7qDYz0vaOJ0XhZ/53AVOeknZ1SSguRlNQLvJkWOqh/UN9vEo3sKnDoW11sFl9nA==@nongnu.org
X-Gm-Message-State: AFuF++leyFCZoFHCU0Wenz0OJus6gJmlDU+grk9F7a4H9NpWE4Td+0Fl
 CCDUb2Qq5vQID+A1xxpvsABgJ8YNJScHzS68zJJjH9XUMSvUrpPcGXOp
X-Gm-Gg: AYBFou37QJuFEmpAbVxRUj13vvgKnimuFqAt4Hv7E2dNt5/Gs67IG2WBr9l33CK2+3J
 8o9D3mu4GCVNr3VHC10iqQScV4ehPuy1jzbL0bSaUWVgB6D9ZAO09WjbJr5jV6sUTjMIjxjZeam
 b90Ds5H80C/432tuO8k2flwa+9VaBs2UiI8s0/dpCRVxn4/wVxb/8RJCAPA7rxlyHHzGmWbSNho
 ewDR2EuytFF2NxrOmfzrxeLkTS4L80T3+Nbxhb71Y6GiIn0d9UgEEF1op3uPAKNLn0DklOh0RyE
 rYcOsKWy176f0uQTJvaM4EyOXnlE7CHOs46dLf2yImKOnEoAW2pIz7/P929zClcPuML5yRr+pxJ
 wMbbRPLZHsf8Cwp2FfsXDMQSir7glCtKwkaoP5CR5Jc14RErnfORE6QI7vGmaU6yKup9nGnmqBM
 4dYF8aqin/RpzW9Co+oyL3ItJ2bH7HNVckbq9+Y8D62XLP6+dWSmpTD6pITLBpBmcRvgEsR9pdj
 nm7vT2w3xJ9QyEQQ3JtOaicb8LEMwAI96w=
X-Received: by 2002:a05:6000:41d8:b0:485:8a46:b3cd with SMTP id
 ffacd0b85a97d-4858a46b548mr22685488f8f.53.1788799664002; 
 Mon, 07 Sep 2026 09:47:44 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48591eb3d3bsm17621952f8f.0.2026.09.07.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:47:43 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:17 +0200
Subject: [PATCH 27/50] tests/qtest: ds1339: cover the end-of-month rollover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-27-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799321; l=3753;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=X7KAfuckHBZBi2zykYy65RlVdT/TDTky7m/n0BwbF7w=;
 b=Ao2XdiYTwB0rOlIowzuxajU4TNkrIJ9vNUDQYB3nyEJ7cWEsG8cLBnyXIvxkz7OchYjPl5Bl9
 uReD+wIM4WOAcK+15fzMkyPBni9xNvGyPRDYuTBz/MdFDTPlVaVdmPN
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f52.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The end-of-month rollover was untested, for any of the lengths the
calendar gives a month.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 8c144579e6..7eec163049 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -14,6 +14,7 @@
 
 /* DS1339 register map */
 #define DS1339_SECONDS   0x00
+#define DS1339_DATE      0x04
 #define DS1339_MONTH     0x05
 #define DS1339_YEAR      0x06
 #define DS1339_ALARM1    0x07
@@ -169,6 +170,61 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* Program 23:59:59 on the last day of a month and run the clock past it. */
+static void check_month_rollover(QI2CDevice *i2cdev,
+                                 uint8_t date, uint8_t month, uint8_t year,
+                                 uint8_t next_date, uint8_t next_month,
+                                 uint8_t next_year)
+{
+    const uint8_t tod[7] = { 0x59, 0x59, 0x23, 0x01, date, month, year };
+    uint8_t resp[7];
+    unsigned idx;
+
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_DATE) != date) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[4], ==, next_date);
+    g_assert_cmphex(resp[5] & 0x1f, ==, next_month);
+    g_assert_cmphex(resp[6], ==, next_year);
+}
+
+/* A 31-day month rolls over to the first of the next. */
+static void test_month_31_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x31, 0x01, 0x23, 0x01, 0x02, 0x23);
+}
+
+/* A 30-day month rolls over to the first of the next. */
+static void test_month_30_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x30, 0x04, 0x23, 0x01, 0x05, 0x23);
+}
+
+/* Outside a leap year, February rolls over after the 28th. */
+static void test_month_28_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_month_rollover((QI2CDevice *)obj,
+                         0x28, 0x02, 0x23, 0x01, 0x03, 0x23);
+}
+
+/* In a leap year the 28th is not the last day of February. */
+static void test_month_29_days(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    check_month_rollover(i2cdev, 0x28, 0x02, 0x24, 0x29, 0x02, 0x24);
+    check_month_rollover(i2cdev, 0x29, 0x02, 0x24, 0x01, 0x03, 0x24);
+}
+
 /* The Century bit is guest-writable and survives an oscillator restart. */
 static void test_century_bit(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -314,6 +370,10 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("month-28-days", "ds1339", test_month_28_days, NULL);
+    qos_add_test("month-29-days", "ds1339", test_month_29_days, NULL);
+    qos_add_test("month-30-days", "ds1339", test_month_30_days, NULL);
+    qos_add_test("month-31-days", "ds1339", test_month_31_days, NULL);
     qos_add_test("century-bit", "ds1339", test_century_bit, NULL);
     qos_add_test("century-write-no-toggle", "ds1339",
                  test_century_write_no_toggle, NULL);

-- 
2.50.1


