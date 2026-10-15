Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3DECC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIgT-0004Sr-VT; Thu, 15 Oct 2026 06:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIew-0001vi-9g
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:02 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeu-0003qC-FK
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:26:01 -0400
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so46017895e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059959; x=1792664759;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xmNroMpGWl2lemJA5PX/kG1o2rPRZcL22w1qYRUbH5U=;
 b=fqlsdZMeTvMfbIHKLz8o9PUlxzi7tFU97ZYOcJDEPiIFKaeGE1Q5tmkC6THEN/5wRL
 265L93nKU10nGnEL0SBC52F/mGEH3SwqTLnjbY7g6EPdQ2u7CsRBSy24gv85u8LBPPl2
 b2Sl8No7yNZ0mFTTuFkt6glEhDsXAVqDcQkF6uSLWkxP4EY+tKn5Otasi+2MEUpgpr/b
 BfxgHxVDZl5IohgDhrZ94uh3QOtpUjpZivQS3jUEC0KzQFfLPbjTMyu+MqcdGpqbRa7D
 eF/aLqOdYq6WeHi7fIONwxSE6kYzlju/guKKQsZyn9o0bdHkzTJNSAJ58w8i859SvZwX
 Z/eQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwD0qCbDzyC1qmp9WNg0bMgo30L/KMkr13viLMbHCt89saX7cZKfCEKyit3/hqQ/ApMBErNoEKgSw==@nongnu.org
X-Gm-Message-State: AFq9FYJSBva5epEnTBdTLr9v+Lv0r1T4IE4SPIOqLVSr2BOebM6YePSm
 nQ0PMTkdxwfKoDZ+9fZDvBmtx9wBjiARDnKES+x8ETr01n+i/TpS36fU
X-Gm-Gg: AYBFou3xmpuc9HsDwNMkJb1GlEhTXuxjdML9JF9UmugVHxSsrdowCKDWZWNtYDKicgC
 1woyBHLt6Vcruei2vpeqcZ5HEjES3yO8GGzfrcc+1my8CTHbogtYrWSl3YXrTl3MBnKlmlSY+aK
 M5GJNmjPrquiFNlnjvib2SiOUnWcSaFvGzeQoEkTyZ1n9+xAvwKh1Uvn1MhghUWB+ICtHo6IuzN
 pLdkQlUdVMJjNPWKTINdA58uiy2402/FS2nMHtoz7+1vcsq0/NggmZizynL9c+CRRRqiGhbQj1z
 w6RXHXadMVqAAV0xzvcluEGoq3CUqFBXmwtXd9rD9cipnJfFByc+Va3vLeYJuzL8nZfE70BAKHo
 JyG5jy8/3T7seWnXZWBfk6c5ebPLCsiFSIXtL8KYLrYfQ/nUwJ8LloUZfFGpBFMmySJKqw1OldG
 tHf5OTNAq8rvIc1DOVI0utRyQ4g7aRVk4o99+/gm3CzQZs0E+OdWgv5kOblQORAnvR4YpjG92bX
 LfLhsXN3MzdjoL2Bdyu5OVw5aLn+rjDOmAf1131xlOIkZU=
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-4a18e4b6241mr446293375e9.16.1792059958924; 
 Thu, 15 Oct 2026 03:25:58 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd91c55bsm54623395e9.0.2026.10.15.03.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:58 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:04 +0200
Subject: [PATCH v3 17/50] tests/qtest: ds1338: cover the DS1338-specific
 register map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-17-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=4130;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=rUA8d+d6nAk/JSdhMcKg9/bMZjbXLM8xkCDgafupUKA=;
 b=WV8kiec4D8UG1IPo0+OIdQ65s2MIYFxffCzb8BWuC0TXdr93lt8ByV+s8nGEupUodQriReOi3
 ES2dwfXGyyJCTJrSxO+xxQRiCpTyDBlc0FgHw6umwEo+bO0ygqwO8vB
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.48; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f48.google.com
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

The register map is a set of per-model class properties. Pin the
values it holds for this part, so a later change cannot alter them
unnoticed.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index b8d0e65ec4..6066a34846 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -24,6 +24,15 @@
 
 #define DS1338_ADDR 0x68
 
+/* DS1338 register map */
+#define DS1338_SECONDS   0x00
+#define DS1338_CONTROL   0x07
+#define DS1338_NVRAM     0x08
+#define DS1338_NUM_REGS  0x40
+
+#define DS1338_CTRL_OSF  0x20
+
+/* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
 {
     QI2CDevice *i2cdev = (QI2CDevice *)obj;
@@ -32,7 +41,7 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     time_t now = time(NULL);
     struct tm *tm_ptr = gmtime(&now);
 
-    i2c_read_block(i2cdev, 0, resp, sizeof(resp));
+    i2c_read_block(i2cdev, DS1338_SECONDS, resp, sizeof(resp));
 
     /* check retrieved time against local time */
     g_assert_cmpuint(from_bcd(resp[4]), == , tm_ptr->tm_mday);
@@ -40,6 +49,56 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpuint(2000 + from_bcd(resp[6]), == , 1900 + tm_ptr->tm_year);
 }
 
+/* Writable control bits round-trip; the reserved ones read back zero. */
+static void test_control_register(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x93);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, 0x93);
+
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x4c);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, 0x00);
+}
+
+/* The oscillator-stop flag can only be cleared by a write, never set. */
+static void test_osf_write_protect(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
+    i2c_set8(i2cdev, DS1338_CONTROL, DS1338_CTRL_OSF);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
+}
+
+/* The user RAM returns what the guest wrote to it. */
+static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, 0x08, 0xaa);
+    i2c_set8(i2cdev, 0x20, 0x55);
+    i2c_set8(i2cdev, 0x3f, 0xc3);
+
+    g_assert_cmphex(i2c_get8(i2cdev, 0x08), ==, 0xaa);
+    g_assert_cmphex(i2c_get8(i2cdev, 0x20), ==, 0x55);
+    g_assert_cmphex(i2c_get8(i2cdev, 0x3f), ==, 0xc3);
+}
+
+/* The register pointer wraps at the end of the map. */
+static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1338_NVRAM, 0x5a);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_NVRAM + DS1338_NUM_REGS), ==, 0x5a);
+}
+
 static void ds1338_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -49,6 +108,12 @@ static void ds1338_register_nodes(void)
 
     qos_node_create_driver("ds1338", i2c_device_create);
     qos_node_consumes("ds1338", "i2c-bus", &opts);
+
     qos_add_test("tx-rx", "ds1338", send_and_receive, NULL);
+    qos_add_test("control-register", "ds1338", test_control_register, NULL);
+    qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
+    qos_add_test("nvram", "ds1338", test_nvram, NULL);
+    qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
 }
+
 libqos_init(ds1338_register_nodes);

-- 
2.53.0-Meta


