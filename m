Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA594C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmPI-0005WV-6B; Fri, 31 Jul 2026 08:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmPG-0005Vf-KP
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:32:06 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmPF-0000Yn-0F
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:32:06 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47fd4ee0b01so264631f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501123; x=1786105923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jDYA5Xg1AcjoGqaDT6Y+c4Ycg06GuzHzyiFnFNhge4E=;
 b=aV//AmNR7ZrJg9VMerqUq6AxvIiBcjB9R6Y3xBEjhdz5qjukawkrkOfIx/qfoXUdvc
 n4P36BufE7LrC3mYdP6tuirpGkxpK1vwgzRj2I3D7C7BGoNssUmakL6t8pWvKcjQamw6
 tJC6UWBfN720nBCwb0IVnE6cVcMscBDZHi63H42s6R7Awgc/35gx7OevuA0FjMdQ+0k1
 QxoVjMCgEyUgLHW7xGE2CNs4Gm+kPJdPvrGVFqWjC7GBmONJnDgsXYKdEZmXpP4tO7fj
 bL+sRlO/hYldAWfdJzMfe0APXJ6SomE0CgCjZFZ3JwASVdFv5HQch3iPGWo0G6gX+LXE
 PLQw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqCxmsuBdb95Bkn5bqnwmqh44O3Y0menjWZsIPKrx6WmMnuCEQCvdd9JmIo79AoRzcdjCxnp7zaw==@nongnu.org
X-Gm-Message-State: AOJu0YxmtF3Qeuwv7PEqGZXROGw3V26asw0a9fiIp+6PdnMKkbZMBauc
 3fvrHQrCIxaUq/RWREovkQE2FVbBk7bsAGEslue3b0GE8szh74r/8+fR
X-Gm-Gg: AR+sD13Pm6AeQBr4CdaZq0p2u7GFJ6UpFhE2jZOEr5xKQkKsBzZmaaA//uAc/IZEwbz
 v57oQ33iY9K4ZcdR3HVdc9IftBwh1f3NLkC9jkPqIh6fqi9xLdtZk2BFntp1RCjWXQtvsMN6PSu
 Y7nkMhpwQwQOcOwov7XhyQV0/XTu03K39kdiav15Iiwy2LajRILQ5U6yaCo7DZB+ik4hL9w8IQ9
 b6JvdTWfqisW3ultP0cNMxDM5nNZBm0qjavUBTP4EU6rEPHpS44QWlG6B5MSZiuV+gzQhJUqJeN
 fSmURCX5A8++50545owouS/6zdf0c0IyvRJl+8gkWNm7nSiNLchSL2lzOus1X6bxO2bj09tR4J2
 sQGWDX31DBn8aovDsEpGv6whI6Y3Yssiv26PWsmJETfuEkGLsOBC60M2UYRx7VojDJR+13vLZYB
 mjwAX1I+9o71tNyfu5sOhQ3mH1orTLPk5P2SzzxvI85u0vmtT4808mxrw8yEvHZv2Vhq70b68sn
 xxvsjHCPv7Y/3YCHD7U0bShrSndo7ncCZ2w
X-Received: by 2002:a05:6000:290a:b0:47f:c206:7d0 with SMTP id
 ffacd0b85a97d-47fd2b648fbmr4369004f8f.52.1785501123434; 
 Fri, 31 Jul 2026 05:32:03 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456220esm4525736f8f.18.2026.07.31.05.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:32:02 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:07 +0200
Subject: [PATCH v2 08/25] tests/qtest: tmp105: cover the ALERT fault queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-8-1266926ba769@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=3508;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=STa9fNUK+ufnQgeeZ6iWhS9xfz1DLS6Eh0Aq6teT5tE=;
 b=6XmVQsZ66/Bw9+YAmfrKhBbf4l4TfAyq4U6bmZN57njvEe0cDzVwUtfIIw5o63M/r1k+L5T27
 kGpw6/NdFrsDWeOXEPrz2jRMim4+M9UsjbRXtCDX+LXDGzxqBA/PEv1
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
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

Add two qgraph tests exercising the ALERT pin, the only way the TMP105
exposes its alarm state. One checks the default single-fault behaviour;
the other checks a deeper fault queue, including the running-count reset
on an in-range conversion and its effect on both asserting and releasing
the alarm.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/tmp105-test.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index 3b114a50f55..29a031fb7bf 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -17,6 +17,11 @@
 
 #define TMP105_TEST_ID   "tmp105-test"
 #define TMP105_TEST_ADDR 0x49
+#define TMP105_TEST_PATH "/machine/peripheral/" TMP105_TEST_ID
+
+#define TMP105_CONFIG_POL   (1 << 2)   /* ALERT active-high when set */
+#define TMP105_CONFIG_FQ_1  (0 << 3)   /* fault queue: 1 consecutive fault */
+#define TMP105_CONFIG_FQ_4  (2 << 3)   /* fault queue: 4 consecutive faults */
 
 static int qmp_tmp105_get_temperature(const char *id)
 {
@@ -105,6 +110,62 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(i2cdev, TMP105_REG_T_HIGH), ==, 0x4230);
 }
 
+/*
+ * The TMP105 exposes its alarm state only through the ALERT pin.
+ */
+static void test_alert_single_fault(void *obj, void *data,
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
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 70000);
+    g_assert_false(get_irq(0));
+}
+
+static void test_fault_queue(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int i;
+
+    qtest_irq_intercept_out(global_qtest, TMP105_TEST_PATH);
+
+    /* Comparator mode, active-high ALERT, fault queue of four. */
+    i2c_set8(i2cdev, TMP105_REG_CONFIG, TMP105_CONFIG_POL | TMP105_CONFIG_FQ_4);
+    g_assert_false(get_irq(0));
+
+    for (i = 0; i < 3; i++) {
+        qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+        g_assert_false(get_irq(0));
+    }
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 25000);
+    g_assert_false(get_irq(0));
+
+    for (i = 0; i < 3; i++) {
+        qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+        g_assert_false(get_irq(0));
+    }
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 85000);
+    g_assert_true(get_irq(0));
+
+    for (i = 0; i < 3; i++) {
+        qmp_tmp105_set_temperature(TMP105_TEST_ID, 70000);
+        g_assert_true(get_irq(0));
+    }
+
+    qmp_tmp105_set_temperature(TMP105_TEST_ID, 70000);
+    g_assert_false(get_irq(0));
+}
+
 static void tmp105_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -116,5 +177,7 @@ static void tmp105_register_nodes(void)
     qos_node_consumes("tmp105", "i2c-bus", &opts);
 
     qos_add_test("tx-rx", "tmp105", send_and_receive, NULL);
+    qos_add_test("alert-single-fault", "tmp105", test_alert_single_fault, NULL);
+    qos_add_test("fault-queue", "tmp105", test_fault_queue, NULL);
 }
 libqos_init(tmp105_register_nodes);

-- 
2.50.1


