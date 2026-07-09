Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA1C44507
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 15:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whr2i-0002EV-Tw; Thu, 09 Jul 2026 11:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1whr2h-0002DZ-9O
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:52:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1whr2f-0000ra-Je
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 11:52:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493b7612475so18247835e9.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783612320; x=1784217120; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t/xmYhKZn0Bc7nNNZK3nmHGczU4Df7R8ARsnuvrZ+gI=;
 b=EOGpvwi+a9R396CXyzeoor754NeWpV5NXWA/kLlln5kFHPHSKZ8yVHApB02k23Iu+V
 6Q1OKoAM0qW+am5RZPiHuUK9vgW4aWjfaDrFv0vfOxOFp2RUg90NepnLioRUPLQhPdUN
 KurvtYnYkBGGCMgxVWVUodypVFY1hsKwaTBCfKXPCD+30B1LGOPEfAxu5kJZo+6H3KMa
 e03pndfsdLULkISYPCZFUpeIorvl2bonHbIf2c5FaslpXiE9V9PtWzc+DLzSXAxMvdcT
 wW7fMchE5osMpxaqXHC9D4S8jOv2iK31WjnG0PD9WSFC6qtKPX1x8sU3EjiwTeoeVWzG
 J6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783612320; x=1784217120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=t/xmYhKZn0Bc7nNNZK3nmHGczU4Df7R8ARsnuvrZ+gI=;
 b=YAZNGxPf1Ec/BTDO6fUhJenOd0dO6y1m/WpBUuWMdd/uvhMmSrcVU2XCVls33Ejvpn
 nejfw9yOUWJ2uoA1i91BVty+322fACtc0v2DmqXRmO4vtoHXZBN5itLRXqC1/thk+o0G
 7F6VMEYjASGOI5LXQ/V2GtxGHHR22lPwrFwV0JpBr3faG7DA94SuHjX6K0VxHzA2oUDL
 OkdKndMqkHddw4ALiz38sZp5S+42LB64Xifdl6awRxVCzltMQphzwrxoS7x4sBVZYNdM
 feFpDaJ1m6KUBrZWmRiLWUu881EV+AwiggSuBtczAIfJntnW7oC3ONplUTu1vZgJChX6
 d62A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpxSYQrcGwxmYM5VsymjAuORfTzdpu2BPQYhYjAxtbw42pc/6xomAnjU3a5GOrpf7i/V1xQ4Tmc4g==@nongnu.org
X-Gm-Message-State: AOJu0Yzp779X5j/yasZAwp/VfGMEap6WEfCIHARQEovv3Ph3tiPAEb0b
 yEIANgwL/QMaGwsOCxpwmeeCFHe9SQ4P9Z48eSNoyjFxhr+bJ84zrBOn
X-Gm-Gg: AfdE7cmu8PnVfznaOQCp5LpgWc0gflAfpphnWtl54X3HoFOp7+xlqEea6O1eSA2NELq
 TxyR8+QBwRz4sGjPEGtl6OugBaMQmNOebi9bJ8Pq2bNdOqDT7c9I0SJFckRZJYNsqOIPuleefYi
 4vLtBOIGrzqhgRQBOnShOdBYpBi3XHrJP9fyVtqL6Ptox2bcdStC1bi9LLCFr/1UxyF3NYlK91I
 nnhTJzir4wVOntDpFXEd98e/2IE9BNtghcJYOJ+OZ3XZdQrqHmIZ5eDwlvpLcEq5ux1SKrRF9EK
 RIZc6tHBB1PhZetHTFzFdvsVI2AdGItgAXwS+jp3B8gHXgiWKV43oZhlixN5ND7iDPsrKmxcyEM
 4EQCeXDz5EUHe5uX3DpxM+Md2h5OYX7tMM6fi1BvWuEjt3loFgCnYmoGLjGsPXTIPm4eyIisDPs
 lHQiHJ7SFMnHbcIYsA+NTZ7E3Iu4sO0YpJ7vZxmwpzrPtyWJqWeXqQrTSEsX/0jO5wUAMDdg==
X-Received: by 2002:a05:600c:c8a:b0:493:cfc8:12e7 with SMTP id
 5b1f17b1804b1-493e6874216mr79074565e9.25.1783612319436; 
 Thu, 09 Jul 2026 08:51:59 -0700 (PDT)
Received: from localhost (89-92-102-124.hfc.dyn.abo.bbox.fr. [89.92.102.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6d5055sm71160065e9.5.2026.07.09.08.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 08:51:58 -0700 (PDT)
From: Emmanuel Blot <eblot.ml@gmail.com>
X-Google-Original-From: Emmanuel Blot <emmanuel.blot@free.fr>
Date: Thu, 09 Jul 2026 17:23:03 +0200
Subject: [PATCH 11/29] tests/qtest: pca9555: test output-to-input
 reflection and pull-ups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-catalina-upgrade-v1-11-82a63fead90c@free.fr>
References: <20260709-catalina-upgrade-v1-0-82a63fead90c@free.fr>
In-Reply-To: <20260709-catalina-upgrade-v1-0-82a63fead90c@free.fr>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Corey Minyard <cminyard@mvista.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783610579; l=3988;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=5Z31IGvHoQJpOOVUEtYuqMr4o0UKYDZH+6sdNVkwanU=;
 b=5QLWQXaK+nrzCuL1diD0o7j1Kf/37bBcB+SHcAxAEFpHct+V6wChdTVXBc7CbeWq/6BxssqHa
 VwNRWyp8BoeDadGn8eJpPYyo/QnG9FCrRyF1EkqyYpsP5lAtunkjoP+
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=eblot.ml@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add tests covering the pin I/O semantics of the expander: output-driven
pins reflected in the input register, the pull-up seen on input-configured
pins, and the independence of the two 8-bit ports.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/pca9555-test.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tests/qtest/pca9555-test.c b/tests/qtest/pca9555-test.c
index 5945c3441e..6b085702c3 100644
--- a/tests/qtest/pca9555-test.c
+++ b/tests/qtest/pca9555-test.c
@@ -28,6 +28,77 @@ static void test_reset_defaults(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get8(dev, PCA9535_CONFIG1), ==, 0xFF);
 }
 
+/*
+ * When a pin is configured as output and driven low (output=0, config=0),
+ * the input register should reflect 0 for that pin.
+ * When driven high (output=1, config=0), input should reflect 1.
+ * When configured as input (config=1), PCA5555 pull-up makes it read 1.
+ */
+static void test_output_drives_input(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set8(dev, PCA9535_CONFIG0, 0xF0);
+    i2c_set8(dev, PCA9535_OUTPUT0, 0xFA);
+
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0xFA);
+
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT1), ==, 0xFF);
+
+    i2c_set8(dev, PCA9535_CONFIG0, 0x00);
+    i2c_set8(dev, PCA9535_OUTPUT0, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0x00);
+
+    i2c_set8(dev, PCA9535_OUTPUT0, 0xFF);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0xFF);
+}
+
+/*
+ * When all pins are inputs (config=0xFF) and no external driver,
+ * PCA9555 pull-ups should make the input register read all ones.
+ * Switching a pin to output mode with output=0 should drive it low.
+ */
+static void test_input_pullup(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0xFF);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT1), ==, 0xFF);
+
+    i2c_set8(dev, PCA9535_OUTPUT0, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0xFF);
+
+    i2c_set8(dev, PCA9535_CONFIG0, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0x00);
+}
+
+/*
+ * Test that both ports are independent: changing port 0 registers
+ * should not affect port 1 and vice versa.
+ */
+static void test_port_independence(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set8(dev, PCA9535_CONFIG0, 0x00);
+    i2c_set8(dev, PCA9535_OUTPUT0, 0x00);
+
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT1), ==, 0xFF);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_CONFIG1), ==, 0xFF);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_OUTPUT1), ==, 0xFF);
+
+    i2c_set8(dev, PCA9535_CONFIG1, 0x00);
+    i2c_set8(dev, PCA9535_OUTPUT1, 0xAA);
+
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT0), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_INPUT1), ==, 0xAA);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_OUTPUT0), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, PCA9535_OUTPUT1), ==, 0xAA);
+}
+
 static void pca9555_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -39,6 +110,10 @@ static void pca9555_register_nodes(void)
     qos_node_consumes("pca9555", "i2c-bus", &opts);
 
     qos_add_test("reset-defaults", "pca9555", test_reset_defaults, NULL);
+    qos_add_test("output-drives-input", "pca9555", test_output_drives_input,
+                 NULL);
+    qos_add_test("input-pullup", "pca9555", test_input_pullup, NULL);
+    qos_add_test("port-independence", "pca9555", test_port_independence, NULL);
 }
 
 libqos_init(pca9555_register_nodes);

-- 
2.50.1


