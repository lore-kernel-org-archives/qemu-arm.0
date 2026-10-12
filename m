Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA66CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:40:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGI8l-00045v-80; Mon, 12 Oct 2026 11:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI8j-000447-Ij
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:40:37 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI8g-00041y-Ec
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:40:37 -0400
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b02b1b4cfso2615757f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819633; x=1792424433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DtmNqWBTeMCh3h6zcOOCMvs2LhtYSQ9Lz7AsIV3ilrU=;
 b=LHit9kyoGz19Cr3FPUmKrnx4Too1RwKF7iZxRSW7+LLuE1uKsTB0AQqZUFxDJDgcP7
 mlvWdO2J6DsJr7otn4053w3q5M8bN64Jj9Ljzzr+4auPJbfGW7384I9K6zM4+X+JBUo0
 uJHZI64v8Ixe4tQ/PMhsktByr5HKD/ngGVpwysiOp/cGDHRMnPeZ5+B3gPxHEU96B9Re
 wA1QoF7c/MBSbIuKCZu2jx1XYGBDx6tg1aKgNeSdsgWWE1E4je77ArRBuKlCPTmA+XIi
 7atA0lekBsZVi1bmD1aVjCil/LAHr3GPb9vDaEP690YMSCHKU5Mvw63SzQn/XEaK9aPJ
 1Nsg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDcL8MfFCrbH7ZUXPvaaZAUk+wSGs9T/Jk6rDjThQUrHLFby/f4HELKJxzDbJFeHpANtqvVhkkjw==@nongnu.org
X-Gm-Message-State: AFq9FYIIcvoi9gLCRL898r7TjrKeEefWJ3UfO85pWqxD2ZPGXdzhUDPC
 IElk+nVzub2UTHo1QjbRsNRK0Q2JmxCRB5+uV6DE80wNTWXhjkGY8ICj
X-Gm-Gg: AYBFou2So8y9MKIoHtQmd0NspyJwx5EvmAAoUU2+lMWUkpLpuQTqqqYHfpgiStB5Dvj
 fIOknDb0LDfjJk6qPhzRKtZSzGXqzXeiAsAMmHmdhZKYMeuURcdNvJlvPrfrfXH/v+KPDbgh8+X
 W5EwVySq7plVx3YWfDPgBHTk/r7/fomq2RVefiE3W1GZ2f6TSUoDnEQ/Y7lHF/HMHuVCaaJT/Rw
 jSiPffGlAi26OsxyBnk+PrLFvSFhAhSKFBij/8p1a/0F1Z0fr2jNNQ5wWWap3rO8U463zuXetbc
 k+BLczsg4Gnmnlb6ubtSU461z+fzrS1P+AjuzXnz5zg8asOuT6My5yRleoKtzRD5fD9w3zZ/R/F
 CCl4RnAaSN3WRmaRL1qSzxLC3AInPafMOKw6n/ATLRzNN9p3vut0v3maxtZD3DeX7a8gvAWGBNc
 X5bzGZc7nV0AnzPCe41fg5QOMxeH0umKiIFnvedm1eiD/a+POriA1/OaiZI/bAfpQkufTqWla1n
 MmiyTbckQGqhIplNPxXSNltsoXJSLDf/WbrvXOwL22skQ==
X-Received: by 2002:adf:f885:0:b0:488:5468:c23a with SMTP id
 ffacd0b85a97d-48dbace0ba6mr14073207f8f.17.1791819631671; 
 Mon, 12 Oct 2026 08:40:31 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab48a7sm101118f8f.24.2026.10.12.08.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:40:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:40 +0200
Subject: [PATCH v2 47/50] tests/qtest: ina238: cover a cleared calibration
 per channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-47-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=4048;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=AlHMNosYKAAxMErgMhv2dpLo39gC6fRYeKA3EA+XnDY=;
 b=i9znjbhG13bAsAynFkdjHhVE3Aru1IvoKMi09Y0UyWvn1LLe5qJ0/G+VSVqhWG2GLtep1YVDm
 YZWEHcWI2zMA/brdrNV1sVSvI1fRbHiJrYcCq/PS+swf17XQDzBFsPk
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f42.google.com
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

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index e7dd50a822..4e4146461c 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -282,6 +282,30 @@ static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
 }
 
+/* Clearing SHUNT_CAL zeroes both derived registers in any mode */
+static void test_zero_cal_channels(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const uint16_t modes[] = { 0x9000, 0xA000, 0xF000 };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(modes); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+        qmp_ina238_set("shunt-voltage", 97200000);
+        qmp_ina238_set("bus-voltage", 48000000);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), !=, 0x0000);
+        g_assert_cmpuint(i2c_get24(dev, REG_POWER), !=, 0);
+
+        i2c_set16(dev, REG_ADC_CONFIG, modes[idx]);
+        i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+        g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
+    }
+}
+
 /* ADCRANGE changes the shunt LSB, not the current divisor. */
 static void test_adcrange(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -458,6 +482,27 @@ static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
 }
 
+/* Clearing SHUNT_CAL drops the power alert with the power reading */
+static void test_alert_power_zero_cal(void *obj, void *data,
+                                      QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+    i2c_set16(dev, REG_PWR_LIMIT, 0x0100);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, DIAG_POL);
+
+    /* Continuous shunt-only: the power register is not reconverted. */
+    i2c_set16(dev, REG_ADC_CONFIG, 0xA000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+
+    g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
+}
+
 /* Two thresholds crossed at once are reported simultaneously (multi-alert) */
 static void test_alert_multi(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -733,6 +778,7 @@ static void ina238_register_nodes(void)
                  NULL);
     qos_add_test("power", "ina238", test_power, NULL);
     qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
+    qos_add_test("zero-cal-channels", "ina238", test_zero_cal_channels, NULL);
     qos_add_test("adcrange", "ina238", test_adcrange, NULL);
     qos_add_test("mode-shutdown", "ina238", test_mode_shutdown, NULL);
     qos_add_test("mode-triggered", "ina238", test_mode_triggered, NULL);
@@ -742,6 +788,8 @@ static void ina238_register_nodes(void)
     qos_add_test("alert-bus", "ina238", test_alert_bus, NULL);
     qos_add_test("alert-temp", "ina238", test_alert_temp, NULL);
     qos_add_test("alert-power", "ina238", test_alert_power, NULL);
+    qos_add_test("alert-power-zero-cal", "ina238", test_alert_power_zero_cal,
+                 NULL);
     qos_add_test("alert-multi", "ina238", test_alert_multi, NULL);
     qos_add_test("alert-latch", "ina238", test_alert_latch, NULL);
     qos_add_test("alert-latch-persist", "ina238", test_alert_latch_persist,

-- 
2.50.1


