Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7248CCA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:37:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGI4x-0001C8-4z; Mon, 12 Oct 2026 11:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI4k-0001A5-Mx
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:36:33 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI4i-0003O8-OW
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:36:30 -0400
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a168355946so17614635e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819386; x=1792424186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3XplpicYtnjwg/F/PhuqE/con32vEXnk067HsKJkOiY=;
 b=1puJ8JSxGW1tkYB21i0mIvhMFVBjVD4mGwDPwFcviOC4Vubm7z+IXe7CAzzVG+R0Cx
 JyaAfVS8sYLzv9lXsAnpejLbUDgrZSTaiCLv1wmgpsPLQO1cXXR6xoF4IM+VLRePJF4z
 4z8RQfDd1qk0k5ak14Us1ZKZAxKRtctYG+5rQmjF/Cr2Ti9+4KdwaQtbXGNKlLTbjQ4G
 fDovyCqM9RbOoHyKS14kUOGeodJAM6RBNl0Z0Bo5sJUGqrkLL3APhnBusX9tMKiwuuaa
 xYQbmp4toSxdndd9wpOcBB4hiogrkAta8iO8Zya/JZm4c/Z3Sef7uvv0+2/1b0xN2jXJ
 3rKg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWcYMUs9Iw59SoxpoLmtkocTL1jRR0NBNN8c2t8yc9qgOkDmJU9yqnCZuRkA8ywqdnG0y7buQdvw==@nongnu.org
X-Gm-Message-State: AFq9FYJ+BaWcYZ+BU1dDAc6tQDYofxQuqk1M71PvukL+Fxhx4VGCwyUz
 XoPODrPNfwApBT8mFssKx6nys7nL5wjXB1mRf8D8wi9yJzpQgSud9SQI
X-Gm-Gg: AYBFou3PFE4g1T7h61RZBiel3J8iozJ9uXyMjK+0Rq+lC9j1ZCmgpqA+dBAl1zRC/Ef
 ueNRUF/BBpyN9ITQPH0GafexKShqRVbdbl9ursfGgKPFe//XG24SaVTJxFkUAS9y0SjlEeCkK9V
 jd7cTgN6HGJ7uQJ6YUTpJ7ejZFZGNKiplkatwsVpLnA/8t9ty/pXYUfq0s38vwyHThYjnpGY1PB
 omZCzQE5nD3qqhn9yjklZ3rIO7retRC7P788tjYIRAdacZ5691a+Vjpz4pBg5dpaI/GngrnqnNR
 MCXF4Sq0+BpM7Gkfuzcnat5wmoQ/tTswo6nkuwdNdbNkY+pr1ZSTtbB+bcSxnMrAMLKsRnnAUvX
 zwIitCo0Fe9VwmbEp0RYBrjGjxQ5xZK598+eU/KCMpWZ33CqeR5+xpfam43Fd6IF23SSxRnyv4h
 34+y8pffEib/Skl+RNE5d89GpjlprIko5XxyRWiWXPlGfEhZ5ipCC7IxsHseCAcywrHN/hRfJ0L
 gZIo/HN5qfOLMOSRuvWJh1rfbCzsZYOsHuTmtA64x6oiA==
X-Received: by 2002:a05:600c:3488:b0:4a1:7690:d878 with SMTP id
 5b1f17b1804b1-4a18e4b8028mr195587315e9.17.1791819386106; 
 Mon, 12 Oct 2026 08:36:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf214a1sm340431605e9.7.2026.10.12.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:36:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:36 +0200
Subject: [PATCH v2 43/50] tests/qtest: ina238: cover the ALERT path and
 conversion-ready flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-43-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=6665;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=in5M3OrP79f45k7Uk1wA7KrYQ9pr2rECNsyuX2iK4go=;
 b=lPTDkqyx2BghMey/BI0wIZhMVQa4ufsY6iBk7KaIPkYXxxuFogIVDoCCKXbE+WJ1rHzcPAcKF
 rU09oHfyp2pA5eSTsJjp0rSmPfVIIq4OtqC7vlmv+uxYkgPBUi7cXj6
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.54; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f54.google.com
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

Cover the shunt/bus/temperature/power alert thresholds, the multi-alert
OR behaviour, the alert latch, the DIAG_ALRT control bits and the
conversion-ready (CNVRF) flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 146 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index 693139f988..08813377c9 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -306,7 +306,143 @@ static void test_overflow(void *obj, void *data, QGuestAllocator *alloc)
                     DIAG_MATHOF);
 }
 
-/* Shunt over-limit alert (transparent mode) */
+/* Shunt over-limit alert */
+static void test_alert_shunt(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+
+    qmp_ina238_set("shunt-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==,
+                    DIAG_SHNTOL);
+
+    qmp_ina238_set("shunt-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+}
+
+/* Bus over-limit alert */
+static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_BOVL, 0x1000);
+
+    qmp_ina238_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_BUSOL, ==, 0);
+
+    qmp_ina238_set("bus-voltage", 48000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_BUSOL, ==, DIAG_BUSOL);
+}
+
+/* Over-temperature alert */
+static void test_alert_temp(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_TEMP_LIMIT, 0x0A00);
+
+    qmp_ina238_set("die-temperature", 10000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_TMPOL, ==, 0);
+
+    qmp_ina238_set("die-temperature", 25000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_TMPOL, ==, DIAG_TMPOL);
+}
+
+/* Power over-limit alert */
+static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+
+    i2c_set16(dev, REG_PWR_LIMIT, 0x0100);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, DIAG_POL);
+
+    i2c_set16(dev, REG_PWR_LIMIT, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
+}
+
+/* Two thresholds crossed at once are reported simultaneously (multi-alert) */
+static void test_alert_multi(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t diag;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+    i2c_set16(dev, REG_BOVL, 0x1000);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+
+    diag = i2c_get16(dev, REG_DIAG_ALRT);
+    g_assert_cmphex(diag & DIAG_SHNTOL, ==, DIAG_SHNTOL);
+    g_assert_cmphex(diag & DIAG_BUSOL, ==, DIAG_BUSOL);
+}
+
+/* Latch mode holds the flag until the DIAG_ALRT register is read */
+static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+    i2c_set16(dev, REG_DIAG_ALRT, DIAG_ALATCH);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("shunt-voltage", 5000000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==,
+                    DIAG_SHNTOL);
+
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+}
+
+/* DIAG_ALRT control bits are writable; status bits are read-only */
+static void test_diag_control(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t diag;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_DIAG_ALRT,
+              DIAG_ALATCH | DIAG_CNVR | DIAG_SLOWALERT | DIAG_APOL);
+    diag = i2c_get16(dev, REG_DIAG_ALRT);
+    g_assert_cmphex(diag & DIAG_ALATCH, ==, DIAG_ALATCH);
+    g_assert_cmphex(diag & DIAG_CNVR, ==, DIAG_CNVR);
+    g_assert_cmphex(diag & DIAG_SLOWALERT, ==, DIAG_SLOWALERT);
+    g_assert_cmphex(diag & DIAG_APOL, ==, DIAG_APOL);
+    /* MEMSTAT stays set */
+    g_assert_cmphex(diag & DIAG_MEMSTAT, ==, DIAG_MEMSTAT);
+}
+
+/* Every DIAG_ALRT read clears CNVRF, whatever the alert-latch mode. */
+static void test_cnvrf(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, DIAG_CNVRF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
+
+    i2c_set16(dev, REG_DIAG_ALRT, DIAG_ALATCH);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, DIAG_CNVRF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
+}
+
 static void ina238_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -329,5 +465,13 @@ static void ina238_register_nodes(void)
     qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
     qos_add_test("adcrange", "ina238", test_adcrange, NULL);
     qos_add_test("overflow", "ina238", test_overflow, NULL);
+    qos_add_test("alert-shunt", "ina238", test_alert_shunt, NULL);
+    qos_add_test("alert-bus", "ina238", test_alert_bus, NULL);
+    qos_add_test("alert-temp", "ina238", test_alert_temp, NULL);
+    qos_add_test("alert-power", "ina238", test_alert_power, NULL);
+    qos_add_test("alert-multi", "ina238", test_alert_multi, NULL);
+    qos_add_test("alert-latch", "ina238", test_alert_latch, NULL);
+    qos_add_test("diag-control", "ina238", test_diag_control, NULL);
+    qos_add_test("cnvrf", "ina238", test_cnvrf, NULL);
 }
 libqos_init(ina238_register_nodes);

-- 
2.50.1


