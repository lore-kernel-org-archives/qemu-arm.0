Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC911606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:15:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtYj-0006A1-Kw; Thu, 05 Nov 2026 04:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtYO-0005es-37
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:14:41 -0500
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtYM-0005Uz-BZ
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:14:39 -0500
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3acdcfa2bd3so1439826a91.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870077; x=1794474877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eT68nxMn01vW7O3JJprDmDkWOIfn9yjPcnQ/rqWRCTw=;
 b=AEV40WOeojn6s2GaiYVJ2I+vckBPupn4HYVMiET3rfq6r+mHVXfpoDhjE8FAek9BDI
 44JjWf8Ozyy8oZ1ZdMmSmKTNBr+OoFocwXAqoJ9T7iozMIVfFzZ9o8biJRZ3YZcH/6aC
 g8MV8TdlzyzW6IyDjYaOQbO5TBUG01cFKRM4knQFjgcxELbWelmOSKeJtYnoTJlr7oK3
 xo+jQNvKrZ5R2yHwdjVHfXyxou/aQUGc85fuUuzNGpjE7pUXhIVRP3DgX7vRO30+GIMx
 D4HgeE8mR9dGjGO+MtZpBpAt8Lg1iBdSopfU+iGw0vP9EVp/SI1vmzToBMg9u+wP4Aiy
 +14g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6GMmYF6jjG5mCedFqx/uUFb7mfGxD6MnzDkwmaEPkqSiSrPrtVP6jzN7jZEXvSkWL/ELNTFDV7A==@nongnu.org
X-Gm-Message-State: APuU4Z+E4kGhjOKX/lncX4OL/UJGUw9vKDekf/vSHi9mXvQ34pAeWRZ+
 esgBFY7L8gGAgaSEC6UG/2aLatD27cUvUVpyffPgE+oLsMs4o/n0O5/Z
X-Gm-Gg: AYBFou03u44Z65q9Xx3oeMaeXcJoLxE2n2eWpXY6SC9TRBsxMA/cg41LMGIgcNndm4w
 m64z83/jLWNPArRv+FYDFp1T5GRDlgvyy/yenkjPzVWIGDbFXRBtSggwNesfsggZ0iy04TvWRsy
 o6G+0sLactVs6gBTg+5ARAFkm2klis/uRc6QpmNhc6Xcis6adfud/pCBUBdb7S2KJl+GRuUM/rV
 lwkA8V6PB2dSzVtFIpC9hdiVGi3PVgdPoVs7kAZ8JlCeUFD40Vd1Dm0k+Xp5nptkqBJqMgTarUy
 5OHDmPJwJPfGZ7rjzUf6CzOwUDAoJvPCGvN7wBM1wLnHnPug2zNIItYBLUynfK1c/OCSe+MoMB2
 xlZuPJs3RdI2MfuG8aFynmV+GmWa2BYQe+zlgawLidOF3e7+RkUlJFlojwqvWhw6fPxzcHRAMgV
 5GcNGim3lm9kDWtWsqSzBCWSxKQHCpexARGk69h8YWkuJ1HSm7X7HaUMSPuszFXfsH+0/4lVUVD
 2Ik2ZuvZvWXZF62jljA4xtgVjRnB0s5ZecsuOgel4diJW0atFUmPSwhvGympCul5H3f1exEPsVm
 6gx7frrsKLTMtweROcj2cmPPsuziNr7waXH3WEXkqV1+vreed1J0R7rhhOcW6F1/XmCbpKDVHBR
 HdHYfPHk=
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id
 98e67ed59e1d1-3ae897f3919mr16515486a91.28.1793870076726; 
 Thu, 05 Nov 2026 01:14:36 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b312ccf1sm3041917a91.4.2026.11.05.01.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:14:36 -0800 (PST)
Date: Thu, 05 Nov 2026 17:13:00 +0800
Subject: [PATCH 08/16] tests/qtest: ina230: cover a cleared calibration per
 channel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-ina23x-v1-8-5433ed104990@free.fr>
References: <20261105-sensor-ina23x-v1-0-5433ed104990@free.fr>
In-Reply-To: <20261105-sensor-ina23x-v1-0-5433ed104990@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Emmanuel Blot <emmanuel.blot@free.fr>, 
 Glenn Miles <milesg@linux.ibm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869976; l=2313;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PzxGOCXpiAe3gOLqCnGKqAPPjR61GoJKj4uRIt53Dm4=;
 b=dw+HLS3qQ8EcVN16hejxQOg25AAbwHowtHtJdk5TUCGrqpys9CvMfiepCRDWk2BUrL1THRFLZ
 kNJXxJBtpRPCnAvSGbjKzosx2aLgOey6GH0Q1Fj+ZEXYjgRnjirGv7y
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.216.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-pj1-f44.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index cda52bb815..f9e8d3ab9f 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -301,6 +301,30 @@ static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
 }
 
+/* Clearing the Calibration zeroes both derived registers in any mode */
+static void test_zero_cal_channels(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const uint8_t modes[] = { 0x5, 0x6, 0x7 };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(modes); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+        qmp_ina230_set("shunt-voltage", 20000000);
+        qmp_ina230_set("bus-voltage", 11980000);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), !=, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), !=, 0x0000);
+
+        i2c_set16(dev, REG_CONFIG, modes[idx]);
+        i2c_set16(dev, REG_CALIBRATION, 0x0000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
+    }
+}
+
 /* Clamping at full scale and the OVF (math overflow) flag */
 static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -560,6 +584,7 @@ static void ina230_register_nodes(void)
                  NULL);
     qos_add_test("power", "ina230", test_power, NULL);
     qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
+    qos_add_test("zero-cal-channels", "ina230", test_zero_cal_channels, NULL);
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
     qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
     qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);

-- 
2.53.0-Meta


