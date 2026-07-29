Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26E2C53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6FW-0004VS-U4; Wed, 29 Jul 2026 11:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6FS-0004P2-1A
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:31:10 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6FP-0000EV-Tc
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:31:09 -0400
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f64ca1c2dso377334f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785339066; x=1785943866;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jDYA5Xg1AcjoGqaDT6Y+c4Ycg06GuzHzyiFnFNhge4E=;
 b=ZFpQu4xgodpKpmlKYqXrTDavW1zFCg2IwvvDv+LAoc+Q4oMQ7flyjJhZ9AFReCAoOf
 H3sqDbPykdbGqJ3HkC6/An+vadk8SlIKw+lK659qLai1NfmhuxAVmefmQEyxIlEc4CuV
 Ux0WQoQ/z4LeAapObTg9lPxPm7wvCLusZk+uf7WZSUwW07PIHHW+d4mHPgpdBo+VucEM
 TaSDpLcAsn5AOwdqfrNlVVi0FT/SRfRUUnfoHOXRRcrWHHWyHwsaIv1H7qzyzIcL/nYb
 wpdzsqqTptQTDTx+GvC9Lx8y67gti5HY3frLMxmUDHmS3VS6M95DaaZaD6Wo4+DCNoTN
 ieFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqWWKSaHT50HdcHcBL459ax5kemOmHcLhfLwzGF6er+12e/ip6Bm2Kp12Xtdmg9J4aYtmBAJ0/B8Q==@nongnu.org
X-Gm-Message-State: AOJu0YyoFRGNbsQKqG3dbIEkn1PYuTVCZIkSbBxVmiL9tD47I265YGSA
 lEi5HMMG6sGkyX5OZZahkL4IRK2QaE2Su0uZ6G67QJJliKjs/khLqdbG
X-Gm-Gg: AR+sD12aDVIURsgnM8JzKEfTouLcpbq7ybZg9Iboqyh07idwFmOHEwz85KEY29MOCOp
 949qVzU5T/baq3IdUqkyAYKz654ZyH2BYH0Q2sEeObrY+5wqZHB3bBiYOFIue//9BrESs0nCOKZ
 eSkOy660s+mTHV5flLHaIloG1byVP2u3YqDHY5mLoDHZBXDJeiuWH2ewPvuwaMTiEu+IZD4PilI
 fLNUrRa0j2ASQzurbP10Qc03UhrZJJAiAttZJNs7J2KLVOjdCYWYSg2up9KESjUQIJQAi6mjUjS
 zdjZxaC6YyILgqE3VVF2TLweXbxtWSPGDJGELv3+TpjSmxPtmNRon8EW1Byn0zM3hCCTAJWutvn
 VCrrTHOKN0OwSAkDGBY3TmzDt3EtU5pqHQnMAe4dWCToQW/fg8pwvFqF5+2Qqp/x+L1GFu3fsOc
 Fsab2xQux1s13s837kbORSM6tZYJwg3KXQM6UBes8ogNRLj4NuYQ6LUbtHiZUdsmPrU3qNnd63X
 gw5POvTa8KfKtnliDpynWzZ0WH2oXlJRXUf
X-Received: by 2002:a05:6000:2505:b0:47f:93e2:a07b with SMTP id
 ffacd0b85a97d-47fb1f139bemr7833148f8f.30.1785339066052; 
 Wed, 29 Jul 2026 08:31:06 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6b19653sm9241418f8f.30.2026.07.29.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:31:05 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:44 +0200
Subject: [PATCH 08/25] tests/qtest: tmp105: cover the ALERT fault queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-8-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337963; l=3508;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=STa9fNUK+ufnQgeeZ6iWhS9xfz1DLS6Eh0Aq6teT5tE=;
 b=xtY694VImiCxYAX0qVieR4ERcGUo2zzwI4PDzEuYHi94dRFnY9GdIDtdgSu+C4m6898aqkBLc
 eugd46uxI4rD6qYoFHqjM+CUOx6BFnK0KArniCyu2zO6AK9pd5BhvOC
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


