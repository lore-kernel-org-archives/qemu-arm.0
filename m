Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1415CC79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cUQ-0006md-AS; Mon, 07 Sep 2026 12:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cU4-0005gZ-CS
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:46:21 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cU1-0003d8-DK
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:46:16 -0400
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so2336225f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799572; x=1789404372;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QueqO13xdW/ZwsAlzziCNKkk2yOl7iMFMMHkLAoSdjc=;
 b=eVimV+2+7GnubwERWHAFwf8tJOGVQUNOe/SjhOkVLP6TlPzwUTZ0j9p7ZjYBUwm2eE
 T2wn/f7fR63YLMlxdojJTmgKo34FOBkJDT8lznSU4V98S7qA7YTlfquuEdtuZJbafGIr
 t7E3vx99wCiKZkpJrUpmz5QI/59laN+Ay/DED1SxLopH5TlQ9De+HYBY4v6edonw04VZ
 7bE3EEDwh6tNX7Qq8YGmvmtuod0kGBsPYXIfUf5Rh6ZElVgwNGT87RecXu5KwIctMPZ+
 c2XOoNRFUDYbVC4mEwPehDzCo8VWvnV9QJeWfREcrQrpQuIfoy/xEnxaS61yOozOWUrm
 nbeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8w4wjDuiv/BuJryAbBTGbHjvcMri32Qq3ZmpzN1+JPgSaFKoqXqpo8bq7TWILQ5Q2fPBcDc0c+g==@nongnu.org
X-Gm-Message-State: AFuF++kg5ORw8xa1umpTQ2Q4O2BcHfFK6t2BltUbKF2rk3bpMBi64Cqc
 MsDcDRo0mWzbeRqSIcxaJmT6GXNU/Jdakb4qi6iEhJFY9kg/AUGTzj1A
X-Gm-Gg: AYBFou1UNb6nCHL5yoPWjV8awuVl+REJlZy26gW8BJALtadHhsxF7/WtzbHXYtuKo3z
 v7fb+LjgOyqfUH5KfjrhAWOY+TivNV2ysFENyZYmOdERccyq8ac1GhVcRbDakE0rMYtcoleXc4W
 tPr6y4ne9/b1EgNUc7KwXJoiw0RMzuEem1cVx/FZpwBXwwDtrHlyfAXqnTofnILVBlQ+B2N14N3
 EEYRAgHyCwJHc+BIxaavP9fonCxP0AAivdqqpXs0dcR8/L3oebTnKy9n36Hzbh7WBuUad554mi4
 GMQ6t/3TUiSADwVKOe05zYTDAQ4j/Uw/LXopoN5U3CQ2ovmciWdDxd+3+DBMYRhMU8DJF3WxmkS
 5Roi7iJ9QgOOHQE5irWeMqu2gj4rVXBwRvkh1wHloIBDcGRP98wsyyRMlW9tquZGjI8fOfOCaXv
 +HfVAijK0T6z3Qz7UkhPscYYkUZZWJXXBrwgfmGu5TEeKq8DbWcoBF37zjshmXL7n+BkshV6pSi
 cHPaG5XfR7u5HIhk3NIOk/w+ABgkn0Njdo=
X-Received: by 2002:a05:6000:612:b0:485:8e19:1979 with SMTP id
 ffacd0b85a97d-4858e191d46mr38805662f8f.11.1788799571524; 
 Mon, 07 Sep 2026 09:46:11 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588135600sm25864304f8f.2.2026.09.07.09.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:46:11 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:09 +0200
Subject: [PATCH 19/50] tests/qtest: ds1338: cover the clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-19-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=2993;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PGqbxjw1SjqsGpwA7KFSLwn1aqj7opA+7ReWeQn2c+U=;
 b=mxihoUkXSwclIFf8U2Czb5eGHX6bwlGb6DU0RvxeGe+mLp9dNf4FZbOagdvHlxDFwvt7ikQuq
 uLsj5+k/vLuBlrF46LsUuA0EHcV0yftCDK+qEyuVCyejUXtbDf/qE8T
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f51.google.com
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

The clock-halt bit had no coverage, nor did its effect on the
oscillator-stop flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index fad0ca53d4..1b73dca98d 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -32,6 +32,7 @@
 
 #define DS1338_CTRL_OSF  0x20
 #define DS1338_CTRL_POR  0xb3
+#define DS1338_SEC_CH    0x80
 
 /* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
@@ -85,6 +86,42 @@ static void test_osf_write_protect(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
 }
 
+/* Halting the clock freezes the counters; clearing the halt resumes them. */
+static void test_clock_halt(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t frozen[7], again[7];
+    unsigned idx;
+
+    /* Clear OSF first, so that halting the clock is what sets it again. */
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
+
+    i2c_set8(i2cdev, DS1338_SECONDS, DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS), ==,
+                    DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+
+    i2c_read_block(i2cdev, DS1338_SECONDS, frozen, sizeof(frozen));
+    g_usleep(1200 * 1000);
+    i2c_read_block(i2cdev, DS1338_SECONDS, again, sizeof(again));
+    g_assert_cmpmem(frozen, sizeof(frozen), again, sizeof(again));
+
+    i2c_set8(i2cdev, DS1338_SECONDS, 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS) & DS1338_SEC_CH, ==, 0);
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1338_SECONDS) != 0x30) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmpuint(from_bcd(i2c_get8(i2cdev, DS1338_SECONDS)), >, 30);
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+}
+
 /* The user RAM returns what the guest wrote to it. */
 static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -122,6 +159,7 @@ static void ds1338_register_nodes(void)
     qos_add_test("reset-defaults", "ds1338", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
+    qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
 }

-- 
2.50.1


