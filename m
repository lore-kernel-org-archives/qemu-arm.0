Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C46CC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:34:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIlS-00041o-Jv; Thu, 15 Oct 2026 06:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhM-0007k9-Vg
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:28:43 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhH-0004Oi-Ss
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:28:32 -0400
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so46043885e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060106; x=1792664906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SXVkV6BmIYa4CM52mZdbIuwD6cqbidYPD1oEQTmNrJw=;
 b=qBotHtpUG7oyB6uvQwrh9dZO2ELIKpQgpIVDHL9Es1kaHbeFHXbU5mEGmp3U/LGKqm
 goKd3dcB83iJWT1BZResnuEzDUDENtOyNdrGjxpTYdQg7Uho09h8f4f0KV1Oqy1vtvRO
 aWYv6PbBRmQxWyWKPXGeTd0H/Gg4JaNpHSXB7g3leEBrvBwC/X8FdtSVo9wIUirbzazR
 sSphOQ6rJ/2ZrTgnV4kLYJz1ZoqMs7RBzhIAdiSqCBt6Se1kZyg5HQ4UbyVVB7/+ZxDt
 2MqRzdVVXnPn5HdBQDkGQABDnK/jQBArEpkgMjzYNEl6DB7ks5bqCCjhtmaVNNYavDLW
 xlhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzp6djNtiudXq9vhWKCaqB8sr1/63q4o/R+iiquOEtarSDlyCpq3D0ojK9+uC5YbWedJVaHvnvzoQ==@nongnu.org
X-Gm-Message-State: AFq9FYJdIanpuXRfmqwQSywpd2bNPfPSrRLMaRaxalaQ8+PCboTKmGtC
 iUETgsAKkemRXldvDItoJDwTJBCF6BW6dfKHcVWMOPVvzMHRcVmY+KW4
X-Gm-Gg: AYBFou3nwJzzK91/HfykcsliigPGQ+o6xfK2KKVaaV5rTNHOzJcGKC0bL8dHTGd8p95
 x+YbW4H+8QBFwFKtZIY1jrRJV3C/0muiZ9qZKBO0OnAHXIGYZunJVfw/M5TyMNCIZkjOhiyzMKp
 gjgz24jgq1a0qfi7HmgjohDNxmyQY1B0hFl2m7shov3HhcIMdhYNawXBXSPOcvAmQhD2z9oK5QD
 70TFa67UrTH3Ogfr6aeybFMl9hn+Bpr8qews+jQl0/IMxQgTeQ6yUKuwk5bjCvQylPwfyC42BOO
 aaX4Me9GyjNTeQQsU4jjHa8/y4RGsXBEb7mlqHq/i4BXm6sdW8W+UE0cxMegpZqR5zj2ssDMuOf
 sT9x3VJZ4nnvHmu+ZUPRLkbtyR8Wp+ST5nTtDchqQju4VrnSkceXCYhtz/ENWv0rf/OnyzYzOGI
 NrOZN9s5lQmyM7s/OGqtG/9JFA86Peyfmozf3e/KSdgUtQ7iE5pdT6F2nRvkkhnBFq128VRhUG3
 jwAEecwDKn2GYbQU/0CH60GngG+TPiuOpNfu40RmA7dMg==
X-Received: by 2002:a05:600c:4e4f:b0:4a1:ad27:e797 with SMTP id
 5b1f17b1804b1-4a1ad27e79cmr172669715e9.6.1792060106381; 
 Thu, 15 Oct 2026 03:28:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bd733fsm17897744f8f.58.2026.10.15.03.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:28:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:25 +0200
Subject: [PATCH v3 38/50] tests/qtest: ina230: cover ALERT latch
 persistence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-38-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>, Glenn Miles <milesg@linux.ibm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=4970;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=W8bVV49/k/VdCQ886gBN1IQ0GLO/G1VK52xof55CHLg=;
 b=izrE0Ei6LuVlDgzOoZf5xuAgBouG0QHhkfTEsa/7pbev/U3Uk7z+E4Ja5k+nRLGxqwR5nXzYS
 u2PQjP6AGAoCGASkJaqegIcA9ii1On1IQoO2ZeIcCinpXIBF0aPN45j
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f49.google.com
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

Verify what releases a latched alert and what can bring it back: a
Mask/Enable read and a Configuration write both clear it, and only a
conversion that re-samples the fault on a channel it converted asserts
it again.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 4d601c74b5..cda52bb815 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -364,6 +364,88 @@ static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
 }
 
 /* Bus over-limit alert */
+static void test_alert_latch_persist(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+
+    /* First read shows the latched AFF and clears the latch */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    /* Fault still present but no new conversion: AFF stays cleared */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* A Configuration write releases the latch as a Mask/Enable read does. */
+static void test_alert_latch_config(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    /* Latch a fault, then bring the input back below the limit */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("shunt-voltage", 2500000);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    /* With the fault present, the reconversion latches it again */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    i2c_set16(dev, REG_CONFIG, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* The releasing write need not reconvert: a power-down leaves it clear. */
+static void test_alert_latch_shutdown(void *obj, void *data,
+                                      QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+
+    i2c_set16(dev, REG_CONFIG, 0x0000); /* power-down */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/*
+ * A conversion only re-samples the alert of a channel it converted: the bus
+ * register a shunt-only conversion left stale must not re-latch.
+ */
+static void test_alert_channel(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_BOL | ME_LEN);
+
+    qmp_ina230_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    /* Shunt-only mode: the bus register keeps its over-limit value */
+    i2c_set16(dev, REG_CONFIG, 0x0005);
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2580);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
 static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
 {
     QI2CDevice *dev = (QI2CDevice *)obj;
@@ -481,6 +563,13 @@ static void ina230_register_nodes(void)
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
     qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
     qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);
+    qos_add_test("alert-latch-persist", "ina230", test_alert_latch_persist,
+                 NULL);
+    qos_add_test("alert-latch-config", "ina230", test_alert_latch_config,
+                 NULL);
+    qos_add_test("alert-latch-shutdown", "ina230", test_alert_latch_shutdown,
+                 NULL);
+    qos_add_test("alert-channel", "ina230", test_alert_channel, NULL);
     qos_add_test("alert-bus", "ina230", test_alert_bus, NULL);
     qos_add_test("alert-power", "ina230", test_alert_power, NULL);
     qos_add_test("cvrf", "ina230", test_cvrf, NULL);

-- 
2.53.0-Meta


