Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD6C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmRH-0006oA-AH; Fri, 31 Jul 2026 08:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmRF-0006kb-LO
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:34:09 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmRD-0000ga-Ui
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:34:09 -0400
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47362928f65so929339f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501246; x=1786106046;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ifMbamIfJSoLu7/f73249giIpMXwm2cmTQROI/W8L9A=;
 b=na/4F3oh3gpUEkIJuUXiubfXlGKXNW4S4CKo4vtlyjFSBFC+ImQLQvL8/aQf0Iyb/D
 kFkoe0a4BbForVyF+ycSiFQH8yvR9MeTuLOaGzYkGGRW98+A8dP8HK70dVV5Ex65qL6N
 2vSLSw45sYgZkgWUB9LpZC80nqffKn6CgG8bhgQQaqYZhAX1O4TZBuk0FDcuHze/FvMe
 AHXt5qaG0j062/vbvjycH4oH3o2MoA2KPbT4JI9WwcSxWsYZbLpU8rtuaXy8yiFYGr7/
 tMEUAbnZrDPJcp7tWIXxiX3TE64cLxRBkIK09sO6eG9t5ozCRw5J5wbGM2im3TtS/ZvL
 CWNg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ros/iaS55inNVCFZ5Hf9gNp8p7TyEwbYNMwn/QvhiQcCEZGlSb7+R6f3oySDwP1LwKPFN6YDadegg==@nongnu.org
X-Gm-Message-State: AOJu0Ywf9QtvHpVkYyMHHgk5KRqjbEsfVih12AmlUbC7Z+mydFqrIUJZ
 jcd/Toi7049iiAo2ycpRDBwMFp1+eIlWJ8yRfTA6QgPdJRMGd3cnSLP2
X-Gm-Gg: AR+sD10jPEzC9jFkLAFKPVTrIZjmb48Mkxqo/mKueBfCiuEjoC+/uvesVTJOB7DLo37
 GDakz+HTpAWNbOa49JstsSXmxCwg4Nu5FV2W57GYbK1q9mY+v9G7TduncWcPKWhdi9nSO/yanZa
 xIboVYDcYyN+Wz6wufx0uezztBeAlGcqzF3mgx9osqFtgyvMUEDmhDCx/AlYAM+bmwZVDoOxt9k
 ZdcEk2JFP6bD5zt3Lv0AgiRAnm+M9UjK0fTcyglo3rhddps0ShRpRhIch7xV+NyADrF5TYTAbEk
 5tFYsGDkif+qmIfIUMDu9s0AAK60FBP+1B7E4nNHSZU8nUO7XoDvPRNwcIRsTLw2ksDTeBMViKG
 0ILMcVDElrvGt6tpOpdPlYIjACDKaolJyyk5mNk/y98MsmK1SwtGYioyWC821JlCZORYtozobbf
 nujygRruHApQcVc7t99KDWWLo0HhLWE7bLcunW2edYtCNHcXJMGfP/1/wwPvu5IRo6lFRJs7bbH
 1gonYABbSOhOdeoy9BKC6l4dsHTPeN2c5gnJBYot286DbA=
X-Received: by 2002:a05:6000:385:b0:47f:d0fb:ea40 with SMTP id
 ffacd0b85a97d-47fd2add54fmr4435535f8f.21.1785501246321; 
 Fri, 31 Jul 2026 05:34:06 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2abbsm4345519f8f.9.2026.07.31.05.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:34:05 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:09 +0200
Subject: [PATCH v2 10/25] tests/qtest: tmp105: cover one-shot and
 fault-queue write immunity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-10-1266926ba769@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494708; l=5455;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=bmmLFTJHN8a4jRPifYNuZA58n5LYCH8vK49esOFrf4o=;
 b=VE3J4rAQZ+CX0YQwXuO1U0Zal5PI/MwDee/JsD7ayPXRzONhWAnQ4vwX4mWjT68c3zYjA8cKh
 TZMN6n8H2Q4B6WBMemkfhcmo5udauNlNT0sB/sH0hUC7hUH0SeHwWBN
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f45.google.com
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

Verify that the one-shot (OS) bit triggers a conversion only in shutdown
mode and is ignored in continuous mode, and that
configuration/limit-register writes never advance the fault queue — only
real conversions do.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index ea6803715a..e586a634d8 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -33,6 +33,8 @@
 #define TMP105_CONFIG_FQ_1  (0 << 3)   /* fault queue: 1 consecutive fault */
 #define TMP105_CONFIG_FQ_4  (2 << 3)   /* fault queue: 4 consecutive faults */
 #define TMP105_CONFIG_FQ(f) ((f) << 3) /* raw F1:F0 fault-queue field value */
+#define TMP105_CONFIG_SD    (1 << 0)   /* shutdown mode */
+#define TMP105_CONFIG_OS    (1 << 7)   /* one-shot conversion */
 
 static int qmp_tmp105_get_temperature(const char *id)
 {
@@ -200,6 +202,102 @@ static void check_fault_queue(QI2CDevice *i2cdev, const char *id,
     g_assert_true(get_irq(0));
 }
 
+/*
+ * The one-shot (OS) bit starts a conversion only in shutdown mode. In
+ * continuous mode it is ignored, so writing it must not advance the fault
+ * queue; in shutdown each OS write performs one conversion that does.
+ */
+static void test_one_shot(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, TMP105_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4);
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+    g_assert_false(get_irq(0));
+
+    for (i = 0; i < 8; i++) {
+        i2c_set8(i2cdev, TMP105_REG_CONFIG,
+                 TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4 | TMP105_CONFIG_OS);
+        g_assert_false(get_irq(0));
+    }
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4 | TMP105_CONFIG_SD);
+    for (i = 0; i < 2; i++) {
+        i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL |
+                 TMP105_CONFIG_FQ_4 | TMP105_CONFIG_SD | TMP105_CONFIG_OS);
+        g_assert_false(get_irq(0));
+    }
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL |
+             TMP105_CONFIG_FQ_4 | TMP105_CONFIG_SD | TMP105_CONFIG_OS);
+    g_assert_true(get_irq(0));
+}
+
+/*
+ * Configuration and limit-register writes are not conversions and must not
+ * advance the fault queue.
+ */
+static void test_fault_queue_ignores_writes(void *obj, void *data,
+                                            QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, TMP105_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4);
+    g_assert_false(get_irq(0));
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+    g_assert_false(get_irq(0));
+
+    for (i = 0; i < 8; i++) {
+        i2c_set8(i2cdev, TMP105_REG_CONFIG,
+                 TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4);
+        i2c_set16(i2cdev, TMP105_REG_T_HIGH, 0x5000);
+        i2c_set16(i2cdev, TMP105_REG_T_LOW, 0x4b00);
+        g_assert_false(get_irq(0));
+    }
+
+    for (i = 0; i < 2; i++) {
+        qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+        g_assert_false(get_irq(0));
+    }
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+    g_assert_true(get_irq(0));
+}
+
+/*
+ * Leaving shutdown (SD 1->0) resumes continuous conversion, which must
+ * re-evaluate the current temperature against the limits.
+ */
+static void test_wake_from_shutdown(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    qtest_irq_intercept_out(global_qtest, TMP105_TEST_PATH);
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_FQ_1);
+    g_assert_false(get_irq(0));
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+    g_assert_true(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG,
+             TMP105_CONFIG_POL | TMP105_CONFIG_FQ_1 | TMP105_CONFIG_SD);
+    g_assert_true(get_irq(0));
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 70000);
+    g_assert_true(get_irq(0));
+
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_FQ_1);
+    g_assert_false(get_irq(0));
+}
+
 /* The TMP75 maps F1:F0 = 10b to 3 consecutive faults. */
 static void test_tmp75_fault_queue(void *obj, void *data,
                                    QGuestAllocator *alloc)
@@ -282,6 +380,10 @@ static void tmp105_register_nodes(void)
     qos_add_test("tx-rx", "tmp105", send_and_receive, NULL);
     qos_add_test("alert-single-fault", "tmp105", test_alert_single_fault, NULL);
     qos_add_test("fault-queue", "tmp105", test_fault_queue, NULL);
+    qos_add_test("fault-queue-ignores-writes", "tmp105",
+                 test_fault_queue_ignores_writes, NULL);
+    qos_add_test("one-shot", "tmp105", test_one_shot, NULL);
+    qos_add_test("wake-from-shutdown", "tmp105", test_wake_from_shutdown, NULL);
 
     /* TMP75: register-compatible, but with a 1/2/3/4 fault queue. */
     QOSGraphEdgeOptions tmp75_opts = {

-- 
2.50.1


