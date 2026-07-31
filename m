Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B56C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:33:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmQQ-0005z8-8g; Fri, 31 Jul 2026 08:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmQG-0005yD-IG
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:33:08 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmQE-0000cd-PE
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:33:08 -0400
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso231303f8f.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501185; x=1786105985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9ybIPSWx99Q7+Eklnb4vS/+BIhbklG+PwBUudNNw6Z0=;
 b=e6+mwtWsSx1Tt7uY3gpbuI1AmhhE+K2CxH76m9X7YD+tZ3zzM3Zn2AQpAlb5NUTRWL
 aipmyqmaQkRuU1LGGVFxtKP6yLE7zkLjT3dxs2uJXLPZT1U7SbNM4D351kXDxB+YTmc7
 4FdCvjUeVa9mIIiUOYfQvrrPt4bvzLAyRctwjH3aTo/AVmdor3IUfwOktqBCkIjaFRb+
 gCu8yrC89CLv7vMKZPaAS7/XaR3PfUR+XAs4k7+ZusGnw5La0CmftAO7evjBt3bzWQmZ
 p9ZjjVoucZWsCjxCV7+I069/eCJe9zxgceDewnkZoDRi1bW3WkSdicoaZsDSbqo/roao
 +DcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrErHBmirEyh7JnAummQfiOLK62ZBjwMrs0D4Rpr+rNwtYPsUEspQdx+JGIG6q13TR9BR9iG6r5pw==@nongnu.org
X-Gm-Message-State: AOJu0YwlS2QmbpCnhVvZG6cukvNGsT6+XLM2wcGQ6VS3egH0Z4BvFUEK
 EEtXPWixlvRWiKk9iUkH+Na6y6Isg5K3ZVrqnh0P9Mm1viU5MiWz0EJN
X-Gm-Gg: AR+sD10AxoApfC7FeAV9KiEiZ7zT6Rx+uKa31V5+t+HhSIDajb9/U/Yop/JSuhz2N/+
 s980P28IbjginNW9ipcInjmDxmLpfgg+J4CPdjphNXYo8dwjA2O8dV3Qn0g9tvOBNxzxNRpSAd3
 5m9UWHdVfe6a9NkR7B5qwk7Hx1x65kAlZFF3cPu/ZjPpAC0uAY3kXwR/5TTWb4SOagU1yqcOqhE
 GZaGZ4KXfxMJvFrKJbzHQJR4l0azPcG5lMr4+tHUXaEFODsl2BJ8akR6H6c2okWOhrIbBb+BKRY
 LSmqSs+Fz8ikk26ljgEOP6vKhWNMxIiSABB26xgIhmphMMo2kpnKJgDjmMgrw8MOGsYDVzQRiNN
 ++DYVFCf2z5W+KVicV9Ia71nYTCSUc3HjG9VWDmwPL+d4z2/BOfRkNiNykaP0Mm/QuYkNuZ880C
 nEwNhf5ZMk0KEQ7Xa64xUgZSt2R6TyQHFWC/1ntx0hV2y1mwr7S+6FF9CfD9pKNhJGfRpMRjo/c
 HLac80+riS0wKGvEs2KuAYgjVgGejABwfqP
X-Received: by 2002:a5d:5e92:0:b0:47f:9763:9870 with SMTP id
 ffacd0b85a97d-47fd2b40d2cmr4352161f8f.35.1785501184944; 
 Fri, 31 Jul 2026 05:33:04 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458ab61sm4379525f8f.25.2026.07.31.05.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:33:04 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:08 +0200
Subject: [PATCH v2 09/25] tests/qtest: tmp105: cover the TMP75, TMP175 and
 LM75B variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-9-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=6772;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=q1iz7++LpszDUzhYyAvlbngfO8Xpf8a9SAQco0QYEVY=;
 b=R66a86lWmprJH57UOQW7MCirOjDwMPG8+XCGBY1CJDwnRtw6j6rOHxUC2S++/a7JkJu3rMKE6
 +ri/vGXWz+IDB+mWbAItcWjF2sqMTFoR1+fin2BFFRoYcXSJSpmuR+s
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f49.google.com
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

Exercise the per-variant differences added to the model: the TMP75 and
TMP175 fault-queue depths, the TMP75 alert-clear on thermostat-mode
change, and the LM75B's reserved config bits and fixed set-point and
temperature resolutions.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 138 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index 29a031fb7b..ea6803715a 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -19,9 +19,20 @@
 #define TMP105_TEST_ADDR 0x49
 #define TMP105_TEST_PATH "/machine/peripheral/" TMP105_TEST_ID
 
+#define TMP75_TEST_ID    "tmp75-test"
+#define TMP75_TEST_PATH  "/machine/peripheral/" TMP75_TEST_ID
+
+#define TMP175_TEST_ID   "tmp175-test"
+#define TMP175_TEST_PATH "/machine/peripheral/" TMP175_TEST_ID
+
+#define LM75B_TEST_ID    "lm75b-test"
+#define LM75B_TEST_PATH  "/machine/peripheral/" LM75B_TEST_ID
+
 #define TMP105_CONFIG_POL   (1 << 2)   /* ALERT active-high when set */
+#define TMP105_CONFIG_TM    (1 << 1)   /* interrupt (thermostat) mode */
 #define TMP105_CONFIG_FQ_1  (0 << 3)   /* fault queue: 1 consecutive fault */
 #define TMP105_CONFIG_FQ_4  (2 << 3)   /* fault queue: 4 consecutive faults */
+#define TMP105_CONFIG_FQ(f) ((f) << 3) /* raw F1:F0 fault-queue field value */
 
 static int qmp_tmp105_get_temperature(const char *id)
 {
@@ -166,6 +177,98 @@ static void test_fault_queue(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_false(get_irq(0));
 }
 
+/*
+ * Drive @need consecutive over-limit conversions and check that the ALERT pin
+ * only asserts on the last one. This exercises the fault-queue length.
+ */
+static void check_fault_queue(QI2CDevice *i2cdev, const char *id,
+                              const char *path, uint8_t fq_field, int need)
+{
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, path);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ(fq_field));
+    g_assert_false(get_irq(0));
+
+    for (i = 0; i < need - 1; i++) {
+        qmp_tmp105_set_temperature(id, 85000);
+        g_assert_false(get_irq(0));
+    }
+    qmp_tmp105_set_temperature(id, 85000);
+    g_assert_true(get_irq(0));
+}
+
+/* The TMP75 maps F1:F0 = 10b to 3 consecutive faults. */
+static void test_tmp75_fault_queue(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    check_fault_queue(obj, TMP75_TEST_ID, TMP75_TEST_PATH, 2, 3);
+}
+
+/* The TMP175 keeps the TMP105 mapping: F1:F0 = 10b means 4 faults. */
+static void test_tmp175_fault_queue(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    check_fault_queue(obj, TMP175_TEST_ID, TMP175_TEST_PATH, 2, 4);
+}
+
+/*
+ * Toggling the thermostat mode (TM) bit clears any active alert on the TMP75.
+ */
+static void test_tmp75_tm_clears_alert(void *obj, void *data,
+                                       QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, TMP75_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ(3));
+    for (i = 0; i < 4; i++) {
+        qmp_tmp105_set_temperature(TMP75_TEST_ID, 85000);
+    }
+    g_assert_true(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ(3) | TMP105_CONFIG_TM);
+    g_assert_false(get_irq(0));
+}
+
+/*
+ * The LM75B has a fixed 11-bit (0.125 C) converter: the resolution and one-shot
+ * Config bits are reserved (read/write as zero) and the temperature register is
+ * always masked to 11 bits regardless of what is written to Config.
+ */
+static void test_lm75b_resolution(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint16_t value;
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, 0x60);
+    g_assert_cmphex(i2c_get8(i2cdev, TMP105_REG_CONFIG), ==, 0x00);
+
+    qmp_tmp105_set_temperature(LM75B_TEST_ID, 20938);
+    value = i2c_get16(i2cdev, TMP105_REG_TEMPERATURE);
+    g_assert_cmphex(value, ==, 0x14e0);
+}
+
+/* The LM75B set-point registers store only 9 bits. */
+static void test_lm75b_limits(void *obj, void *data,
+                              QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set16(i2cdev, TMP105_REG_T_HIGH, 0x4231);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_HIGH), ==, 0x4200);
+
+    i2c_set16(i2cdev, TMP105_REG_T_LOW, 0x12b4);
+    g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_LOW), ==, 0x1280);
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -179,5 +282,40 @@ static void tmp105_register_nodes(void)
     qos_add_test("tx-rx", "tmp105", send_and_receive, NULL);
     qos_add_test("alert-single-fault", "tmp105", test_alert_single_fault, NULL);
     qos_add_test("fault-queue", "tmp105", test_fault_queue, NULL);
+
+    /* TMP75: register-compatible, but with a 1/2/3/4 fault queue. */
+    QOSGraphEdgeOptions tmp75_opts = {
+        .extra_device_opts = "id=" TMP75_TEST_ID ",address=0x48"
+    };
+    add_qi2c_address(&tmp75_opts, &(QI2CAddress) { 0x48 });
+
+    qos_node_create_driver("tmp75", i2c_device_create);
+    qos_node_consumes("tmp75", "i2c-bus", &tmp75_opts);
+
+    qos_add_test("fault-queue", "tmp75", test_tmp75_fault_queue, NULL);
+    qos_add_test("tm-clears-alert", "tmp75", test_tmp75_tm_clears_alert, NULL);
+
+    /* TMP175: like the TMP105, with a 1/2/4/6 fault queue. */
+    QOSGraphEdgeOptions tmp175_opts = {
+        .extra_device_opts = "id=" TMP175_TEST_ID ",address=0x4a"
+    };
+    add_qi2c_address(&tmp175_opts, &(QI2CAddress) { 0x4a });
+
+    qos_node_create_driver("tmp175", i2c_device_create);
+    qos_node_consumes("tmp175", "i2c-bus", &tmp175_opts);
+
+    qos_add_test("fault-queue", "tmp175", test_tmp175_fault_queue, NULL);
+
+    /* LM75B: fixed 11-bit conversion and 9-bit set-point registers. */
+    QOSGraphEdgeOptions lm75b_opts = {
+        .extra_device_opts = "id=" LM75B_TEST_ID ",address=0x4c"
+    };
+    add_qi2c_address(&lm75b_opts, &(QI2CAddress) { 0x4c });
+
+    qos_node_create_driver("lm75b", i2c_device_create);
+    qos_node_consumes("lm75b", "i2c-bus", &lm75b_opts);
+
+    qos_add_test("resolution", "lm75b", test_lm75b_resolution, NULL);
+    qos_add_test("limits", "lm75b", test_lm75b_limits, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.50.1


