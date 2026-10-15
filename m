Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD8CCA462
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 15:12:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHN7U-0007o2-AN; Thu, 15 Oct 2026 11:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN7P-0007aV-OD
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:11:44 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHN7M-0001qS-W2
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 11:11:42 -0400
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso20940155e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 08:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077100; x=1792681900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZT03pXOUyF1VnCcltW3we9XEJr4ijAWCTIBb53nAbTQ=;
 b=tO10jeZQXKPYOVE/pWxxUPmOnjxYbUdsaL1yJRlPiCe6ks/lXTuL4UPjMah8WTKJXW
 QSEYubsXtnrxeGERdVUOYYPXosLTmtwqmJp8EwicXQe3RQRgbG3832QiUighPG87YOnc
 eFVRTfOGKkhrjZOZLj3fiYwlRCHOg3ccnmLFLaEUk3ieSzq3NXrJWudSED3LVFomYncP
 D2ugQSKAVue8c2vIBczKPayuCA9jx4HwLF3g3VEiKgYEL1EbO0Iokh4bHPzvYM5sAJGJ
 M+Lf1i80z/YWDK3Rs5dAZGTsrcasOv4zbszwY3yUDmGE59acoeerNpuOTeET+6My5zwx
 hw9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxARXPKPNWivkNAQTxe9cOLr9JLBtQz40LdKXtwOT1hP0tXtKfXuuMMCSgij6ww6oYXGvB1996a3w==@nongnu.org
X-Gm-Message-State: AFq9FYKvTFN6qnXWcNEm3R/oLhvfYZGoxKgfaGPex7gbzQgAyEDCLNFf
 VCpxayjAefbbT0iRY/lo31fVvevczqASt1bApBrkd3y18swBxOdiQ/6J
X-Gm-Gg: AYBFou2+hcUgKzleWv43HwJD2af7t1lE1f4HQkY8OXZcottN/rINJxUe60xXnHsI+D3
 brfXiobR/Ae78KxQ2JQUKAV0yrFvdrQpY8X89K+EnfGjhsqu8z8BregQoCUDUViBalgN85sT6+6
 RfqrI3xjeQtji7eR0Qq6cQDEMm9tipB+Huqep2ph9oWR8zW9GUYlcWSOJABQ7DrLlRZXK8bJi67
 RmwJ5WmR5CsldNTlM5uEeiza7h1HGlXC5D5q7zVztXqONvvyo+i3e3XAspB9SszcWvx/wBZ+cu+
 GN21XwTGUcEoUhkkGvSAd8d6lRcF0C4Jt01ZDWM1JxRsce1P9XZXjrUIX87Z6UuctjTRCkd2k2X
 Ah2jTlZLbMROhV9NOoo3o7FRD8dWhzxzfjUk3Hz5q5URqV2vFsaUSpWHM/KoW33jNPt933tZN5g
 B/Szt7uaUpPByaYI347UXfp2VIlN6zi8tEtunPGAJdSXrc1U8GBB1GCIOShfbv3EThyj1dXk/MM
 g8TiVEghbNu6NbqQ3H4AEtknJMvL7IAgrbC5ErehQVkGBwWjLCYKSqaCw==
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id
 5b1f17b1804b1-4a18e4e0963mr401128545e9.34.1792077099451; 
 Thu, 15 Oct 2026 08:11:39 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd5ec195sm73095455e9.0.2026.10.15.08.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:11:38 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:57:51 +0200
Subject: [PATCH 13/22] tests/qtest: tmp421: cover temperature encoding and
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-clemente-v1-13-bf591886b5b6@free.fr>
References: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
In-Reply-To: <20261015-bmc-clemente-v1-0-bf591886b5b6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792065465; l=6462;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=AEzQURKuJZlDUat8fg72pNeAc6ypqWG6k7Vbs2+CVL0=;
 b=FxUvpuxrGsxanAAo9GuczGCFhcMe3pGZNR2l4tjgPP5c6ZXWCSuttDzbEKWfJ4v5nJxhHx+IS
 enJzZ+GywB2AWOfWmddbTCRt0l9SCssxwu4uuN/5+YxfRhufZ9Myp0Q
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f52.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Set a temperature over QMP and read it back through the two-byte and
single-byte register paths, checking the fixed-point encoding and the
extended-range offset. A second case pins the saturation: a temperature
the standard range cannot express reads back clamped, without harming
the measurement itself.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp421-test.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/qtest/tmp421-test.c b/tests/qtest/tmp421-test.c
index 2307e5f603..390f17b6b2 100644
--- a/tests/qtest/tmp421-test.c
+++ b/tests/qtest/tmp421-test.c
@@ -18,9 +18,13 @@
  * shared with the model, so the test states the values it expects
  * independently of the implementation it is checking.
  */
+#define TMP421_TEMP_MSB0                0x00
 #define TMP421_CONFIG_REG_1             0x09
+#define    TMP421_CONFIG_RANGE            (1 << 2)
 #define TMP421_CONFIG_REG_2             0x0A
 #define TMP421_CONVERSION_RATE_REG      0x0B
+#define TMP421_TEMP_LSB0                0x10
+#define TMP421_RESET                    0xFC
 #define TMP421_MANUFACTURER_ID_REG      0xFE
 #define TMP421_DEVICE_ID_REG            0xFF
 #define TMP421_MANUFACTURER_ID          0x55
@@ -44,6 +48,36 @@ static const TMP421Variant tmp421_variant = { TMP421_TEST_ID, 0x21, 0x1c, 2 };
 static const TMP421Variant tmp422_variant = { TMP422_TEST_ID, 0x22, 0x3c, 3 };
 static const TMP421Variant tmp423_variant = { TMP423_TEST_ID, 0x23, 0x7c, 4 };
 
+static QDict *qmp_get_temperature(const char *id, unsigned channel)
+{
+    g_autofree char *prop = g_strdup_printf("temperature%u", channel);
+
+    return qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+               "'property': %s } }", id, prop);
+}
+
+static int get_temperature(const char *id, unsigned channel)
+{
+    QDict *response = qmp_get_temperature(id, channel);
+    int ret;
+
+    g_assert(qdict_haskey(response, "return"));
+    ret = qdict_get_int(response, "return");
+    qobject_unref(response);
+    return ret;
+}
+
+static void set_temperature(const char *id, unsigned channel, int value)
+{
+    g_autofree char *prop = g_strdup_printf("temperature%u", channel);
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %d } }", id, prop, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
 static void test_ids(void *obj, void *data, QGuestAllocator *alloc)
 {
     const TMP421Variant *var = data;
@@ -58,6 +92,70 @@ static void test_ids(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get8(i2cdev, TMP421_CONVERSION_RATE_REG), ==, 0x07);
 }
 
+static void test_temperature(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = obj;
+
+    /* A whole degree lands on a whole register value, fraction cleared. */
+    set_temperature(TMP421_TEST_ID, 0, 25000);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x1900);
+
+    /* The standard range is two's complement below 0 C. */
+    set_temperature(TMP421_TEST_ID, 0, -25000);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xE700);
+
+    /* A temperature the register form represents exactly. */
+    set_temperature(TMP421_TEST_ID, 0, 25063);
+    g_assert_cmpint(get_temperature(TMP421_TEST_ID, 0), ==, 25063);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x1910);
+
+    /* A lone low-byte read returns the same conversion as the pair. */
+    g_assert_cmphex(i2c_get8(i2cdev, TMP421_TEMP_LSB0), ==, 0x10);
+
+    /* Extended range encodes the same measurement with a +64 C offset. */
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    set_temperature(TMP421_TEST_ID, 0, 25063);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x5910);
+
+    /* Leaving it, whether by a write or a reset, reports the same value */
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, 0);
+    g_assert_cmpint(get_temperature(TMP421_TEST_ID, 0), ==, 25063);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x1910);
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x5910);
+    i2c_set8(i2cdev, TMP421_RESET, 0);
+    g_assert_cmpint(get_temperature(TMP421_TEST_ID, 0), ==, 25063);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x1910);
+
+    /* The extended range is unsigned: it reaches past +64 C (Table 1). */
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    set_temperature(TMP421_TEST_ID, 0, 100063);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xA410);
+}
+
+/*
+ * A temperature the standard range cannot express saturates at +127 C (7Fh)
+ * instead of wrapping, and the extended range still reports it in full: the
+ * range picks an encoding, it does not alter the measurement.
+ */
+static void test_range_saturation(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = obj;
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    set_temperature(TMP421_TEST_ID, 0, 149938);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xD5F0);
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, 0);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0x7FF0);
+    g_assert_cmpint(get_temperature(TMP421_TEST_ID, 0), ==, 149938);
+
+    i2c_set8(i2cdev, TMP421_CONFIG_REG_1, TMP421_CONFIG_RANGE);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP421_TEMP_MSB0), ==, 0xD5F0);
+}
+
 static void tmp421_register_node(const TMP421Variant *var, const char *type,
                                  uint8_t addr)
 {
@@ -79,6 +177,10 @@ static void tmp421_register_nodes(void)
     tmp421_register_node(&tmp421_variant, "tmp421", 0x4c);
     tmp421_register_node(&tmp422_variant, "tmp422", 0x4d);
     tmp421_register_node(&tmp423_variant, "tmp423", 0x4e);
+
+    /* Temperature encoding is variant-independent; exercise it once. */
+    qos_add_test("temperature", "tmp421", test_temperature, NULL);
+    qos_add_test("range-saturation", "tmp421", test_range_saturation, NULL);
 }
 
 libqos_init(tmp421_register_nodes);

-- 
2.53.0-Meta


