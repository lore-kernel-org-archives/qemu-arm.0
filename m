Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B15606A32E
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:16:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtZQ-0007h0-Tg; Thu, 05 Nov 2026 04:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtYw-0006Fh-5K
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:15:19 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtYt-0005Xs-Ka
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:15:13 -0500
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-cc4aa0246b7so798975a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870108; x=1794474908;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dLcH89Q+3v52wJ3aHqyuR198A/y0zPJ5UzMGy5C22Zs=;
 b=Aa84xHgJhNZUt2YtEsVJmjhRQF+YtzY3VJfdDpO8BSQ4p+g0f+AGA7CVbM1dqUhWlk
 mNyANEQHPUwZQkg+eQfDVlE49V8J8pP9n1NdpBdofyMooPpYjMklc4knakzzm075It9S
 gFbNoVFWqWjNtV5tgtqXSty0NQdvD44lVRxbCnbDcUn83yqE16HCElg4UIpjNSGMNyhi
 GIm4R5LBObqmWRpGWD06tLZ4TCbgSL7U69hLq5f/GhhCkOyzRr3PrwJ5l20Kt36Ld+nn
 Srxjr6Yf7VoEnV/35EOlCGOloxoncUFlkAeL+IZZg2ZfU5oKNr8Iu3rSRAW7Dzw9HrZP
 hxJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLym3B3SBE1M4Cv8aIsFzWXxw3+hz6sO208Ij5ow5QszgpbDTvRfH4GApOv3t1PszUW8tGje5I5A==@nongnu.org
X-Gm-Message-State: APuU4Z8Lk9eXwwCQWYWr2Wre20xhOllgXMtM/Lkaw5OaKq1qp9MTiyhj
 az1iw6fdYNHEIFGY1WFqCxoLsaxFGo/PAgbf882Bn14lrl71oRbVF5z3
X-Gm-Gg: AYBFou1awW50OIcfFYzOIaP8xSDtDjAibuh6PHegQ2kirSEKPuZjB0Xvh8aY6kWMBOP
 s56scr9QbzkIc7jGZ1KZN/T7PkQzeOKQqWtNbTPaTOn6NWIpq8ZVPQrQGDDDvlXi27WjdVFVgJp
 LZcYcaALgk8fPCa4bCGZA7kr+6k0ak9VcP2WsHxPEWe53H31KhVKcKAxxzkFXZV3xpKIdaxW6li
 fE4TlPM7gKDh7OEFRy5WN+uyhar9Eb34iid6KcYTZcMt6Nqri/JxOlqdkIP7hJK0zHoi3+qENL1
 qqpAHTgFj+7BOddp5axNxn0dVhx8wiZd8tj1VJZwZPeyDSgRjgqZXAneGshzy3C9X0BLx82/fET
 UTFA4dI0xRaOqkxXjv2FClmjYEjGqVTufY9zSZZHxS66sW0oUs12BWFx7ndzHmujB0KVSBdeY/h
 v+Avr6Olt79se/M8VxdpGqDqOEfUSkdVeiIsxjakNRj/pltQaL9uBR+eB1IIwO/aT7RodJVuOGz
 mYqLCl6BATtAKEWa/ffuwDfO09cQ+xfylFJ8T57tDITAcYtV0MIs64o71TKBUeS8GhSEG7ii82/
 juX0uQXjnpkrjTHaJK3PyNFP4BnIGQgda6W0x40G06NRSLzMqWD/LTyoUpDYonuI0jVsfInfzPw
 yCIBsrA==
X-Received: by 2002:a17:90b:3ec6:b0:3a4:ba6e:65c9 with SMTP id
 98e67ed59e1d1-3ae8982640fmr13997959a91.59.1793870108470; 
 Thu, 05 Nov 2026 01:15:08 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdb46981369sm1942540a12.25.2026.11.05.01.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:15:07 -0800 (PST)
Date: Thu, 05 Nov 2026 17:13:04 +0800
Subject: [PATCH 12/16] tests/qtest: ina238: cover the ALERT path and
 conversion-ready flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-ina23x-v1-12-5433ed104990@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869976; l=6719;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=ZC7CGjlcMtlHZ+/DXyYJ8lCNdfyQ5Stw/MJqODCAIbA=;
 b=gRQlRMsfBHPrzmLSeFAxD23OdbuhdWRp6Bjx/VKs2jG1mxENA2oSsGLUE/ASk7IncWDudhmG2
 H87W1VE6vuZDG95GU0hArxRD2AvranXHbqJDuQ+4p8ZclajbOC58gnI
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.215.174; envelope-from=eblot.ml@gmail.com;
 helo=mail-pg1-f174.google.com
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cover the shunt/bus/temperature/power alert thresholds, the multi-alert
OR behaviour, the alert latch, the DIAG_ALRT control bits and the
conversion-ready (CNVRF) flag.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
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
2.53.0-Meta


