Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85093C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmSF-0007Mq-ST; Fri, 31 Jul 2026 08:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmSF-0007Mh-4S
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:35:11 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmSD-0000v4-HT
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:35:10 -0400
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47fd4ee0b01so266945f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501308; x=1786106108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cgbT+Nkm1dADHvR/4vLeWGsR4IryoIoADhqYOAUzjvs=;
 b=OhaWEHX9AffeaNQ8wlxlR0ZwZsDYEXOdB2UioVVzRRNSjp4uhTHR+t3YRyOmYYoQd+
 ExVHYCWuc2svY65K6E7bjvRbFuWHSM04wgHqFYL9KnVYb/e4p2F49wGDuXmOy140LMtp
 dfkiOzcAMgCgxJD88nkqxFchFj1Bqo0RglU9KdF6A5O4z+UADJT4pWfp0woQ0wNGsuY6
 CvWS04y4Hxu24HurJVVCFQTtmHZDo9RsyXH/bZDnF7yv32HoEn3NpUAqcw8BEHR/a5IE
 sPxECOGaQMgC5rNa/ykljSuPjW2x8WMizTt6FS/Q9Eglp0zaPMIXozWXZplDYuMV4DZz
 abbw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8CUwZ7p+xkVbkPbayaUrN8Ep7IyDQLWQjoA1++rC2wWMinn03C0BmEWizDQ5Y5n6xbecTH6tBvg==@nongnu.org
X-Gm-Message-State: AOJu0YxFSceNwWTR7MZhYQV4iLGiQaopNKwihWR8ieIFa91ylDsANPiQ
 MyAuk1HneY0znDd9YQiu+jkrRs29dmx42rm5gud5/oAkhuuzMTOEvA6h
X-Gm-Gg: AR+sD12W2NRFTRryeqRLnEHddK389vJc94XgwpadlPwWnZLByR/WEnLQ2LMb0Pd9t2B
 y0rYfdWlN9OdCOwwzZAy96HjnFW7FO48/RRIKLNcSMU1UWRst92KFH0XY+k4y1kM3hS/pRN21SH
 vuIqvMEEMRW/27T+oLpTvK6RHhD7wF0ZTbiyBCofz1/CqnjROfn+xHo3+uNdy+YqaQlOxPDNo1U
 hCJ/1hAsUNcvBTHdXI3p4z2zQByngfMw2G/FjB4WK4ZhbN8etqO16h2xiQ0QhYReht/hqlosCrW
 iTC2502WY/3sBvyaUBGWTJBXg80uJtGTs8cm2qn2YAkd4gdkNoMoEqAQwTMHpNvXLylQqJrS9Cv
 Y3PY9Bjhul5GKNWL5QeKfD4jeAGqDqXUKqkhDMfPZDtC0cY9uRV2wD1ycmIhH1F36hcdepx3qJ8
 wPqnXujVgEYSmjTsdXt7tB3+NPxe7AcJlRvuC7LTLhJroe/IAJTdWtECKnn0hBQxZhRh2FWJNMq
 yFpFO5JJI/dqJWMIMnvAinZ4vk4VheC1T7U
X-Received: by 2002:a05:6000:2994:20b0:47f:8fb6:c32e with SMTP id
 ffacd0b85a97d-47fd2b578damr3454076f8f.46.1785501307713; 
 Fri, 31 Jul 2026 05:35:07 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd4562a38sm4162627f8f.21.2026.07.31.05.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:35:07 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:10 +0200
Subject: [PATCH v2 11/25] tests/qtest: tmp105: cover shutdown clearing the
 ALERT across variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-11-1266926ba769@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494708; l=3738;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=2fRBCplKTjlFLd6EsRzXdhUj/5B9QVDOaJYG5Z5CWwc=;
 b=3oPlxId5SWQ2928LfG4btUnPH189fpHIha7nQppuFkIJ9+uXf+Ofh3wiHE38jShW05QjqR5rL
 yvY+L+QuG4XA2Elxtcj5VqniL6MpixKAq21fMUkJslEnLr+TO5+z3C0
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f44.google.com
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

Verify that entering shutdown clears the ALERT/OS output in interrupt
mode but leaves it asserted in comparator mode, for both the TMP75 and
the LM75B.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index e586a634d8..504f6b7202 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -335,6 +335,41 @@ static void test_tmp75_tm_clears_alert(void *obj, void *data,
     g_assert_false(get_irq(0));
 }
 
+/*
+ * Entering shutdown clears the ALERT in interrupt mode but leaves it asserted
+ * in comparator mode.
+ */
+static void test_tmp75_shutdown_clears_alert(void *obj, void *data,
+                                             QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, TMP75_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_TM | TMP105_CONFIG_FQ(3));
+    for (i = 0; i < 4; i++) {
+        qmp_tmp105_set_temperature(TMP75_TEST_ID, 85000);
+    }
+    g_assert_true(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_TM | TMP105_CONFIG_FQ(3) |
+             TMP105_CONFIG_SD);
+    g_assert_false(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ(3));
+    for (i = 0; i < 4; i++) {
+        qmp_tmp105_set_temperature(TMP75_TEST_ID, 85000);
+    }
+    g_assert_true(get_irq(0));
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ(3) | TMP105_CONFIG_SD);
+    g_assert_true(get_irq(0));
+}
+
 /*
  * The LM75B has a fixed 11-bit (0.125 C) converter: the resolution and one-shot
  * Config bits are reserved (read/write as zero) and the temperature register is
@@ -367,6 +402,23 @@ static void test_lm75b_limits(void *obj, void *data,
     g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_LOW), ==, 0x1280);
 }
 
+/* The LM75B likewise resets its OS output on shutdown in interrupt mode. */
+static void test_lm75b_shutdown_clears_alert(void *obj, void *data,
+                                             QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    qtest_irq_intercept_out(global_qtest, LM75B_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_TM);
+    qmp_tmp105_set_temperature(LM75B_TEST_ID, 85000);
+    g_assert_true(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_TM | TMP105_CONFIG_SD);
+    g_assert_false(get_irq(0));
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -396,6 +448,8 @@ static void tmp105_register_nodes(void)
 
     qos_add_test("fault-queue", "tmp75", test_tmp75_fault_queue, NULL);
     qos_add_test("tm-clears-alert", "tmp75", test_tmp75_tm_clears_alert, NULL);
+    qos_add_test("shutdown-clears-alert", "tmp75",
+                 test_tmp75_shutdown_clears_alert, NULL);
 
     /* TMP175: like the TMP105, with a 1/2/4/6 fault queue. */
     QOSGraphEdgeOptions tmp175_opts = {
@@ -419,5 +473,7 @@ static void tmp105_register_nodes(void)
 
     qos_add_test("resolution", "lm75b", test_lm75b_resolution, NULL);
     qos_add_test("limits", "lm75b", test_lm75b_limits, NULL);
+    qos_add_test("shutdown-clears-alert", "lm75b",
+                 test_lm75b_shutdown_clears_alert, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.50.1


