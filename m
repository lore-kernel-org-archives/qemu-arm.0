Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2EFCA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:38:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGI6m-00026O-Du; Mon, 12 Oct 2026 11:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI6j-00023w-4F
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:38:33 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI6g-0003b6-0h
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:38:32 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so20725645e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819508; x=1792424308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RR0BfuP3zH0vPwsVTweTuUz+ywrZng5C/2ivP+6b+uc=;
 b=VVTzejIykWIULVzkhxTWPXeA6yurUrm1oTGucOhsnNRtAqKp2inwDDjCSqXb5S55w0
 R5LxlcHlxKp2S0Ykg+21bZewQ+mhsP3Ec7TMSEbvZJ4K2vCXCtJQxEaWAdjSHU7u8P1x
 sz5HiYQ+Y0gc/+5jCVFV0W1Be60F/Gu3rz0Aby18D/Pd5u9ZZetf88w9tB55tc2789+Y
 1pTEWY7AI8BLQTbuAEaXl7PsKLfDxWhDXLfTV2dFZzt9j7iWvAIQqIiy/UeH1TPM4ID8
 FhfZAj3mDyQ7ahy3wi8JQkkkvmwuV+cKigAZ1+sLsRXVIYNvzqfiJvBk9kB6At10VcDL
 5HDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeu3Val/shkz61eKPxXRdrxQcGRpAaguKoEp4iUnvzJ83wxysNkOP1uySceedWLCiiIV6Y3e0Agw==@nongnu.org
X-Gm-Message-State: AFq9FYLl0DAuZpsiCQYBu3VjAghklh76PyTRUtvbFiJvbUXUoge4T3eH
 JSdDb9riijwPO8NoTl39Qrq/o4l+KYwZUv+aPj9q19XojWK4A5t58cIR
X-Gm-Gg: AYBFou3gaqFlzbBSxt3TBdEpP7iTPQF1jB5ODDY91XAru42VoQ6/nDJMysG3t7LcG2i
 d7P6QEQ5x8HFghJLRlbaUFSHAkOF/14dlOCOL5Qxo2n64dO+IImJQjnwzIIpys9Xlr3aKnKUDfN
 nLjEK5EK1rsNwRmwyeTTaKxd8BcNfSY9mycKPFcOcKHOhYi0mnMUuWBbNy3+TeP987INumPUNdp
 XnC8kELq0SMnwLR0NBYMxsAvDbTdigYdkEiQUwJC5et8pDDMe4XLvQEHSwDxcNRdQv/QPhlpswD
 OdOFwYXFkOzM5fPWVfQfrmngNRQV23owz+i3BjpR+NXSHCiXWt8RS4wiZ6TdZJbz8Tj0/kwiO/0
 HH1cJ5iEDMRNDmTzDNCrTvFamJjL+7nek8wisxHfJSi4REUinMttbkHG651C+9NpZ/+Ggqg+FUI
 H2g/LEIquAEjUpUWLGYq1h46y4GKacnVkaApy3clOUBizziILvDw5DKrHr9EBEK3a7shoXgL7oy
 XOED9TZ5F74cjiQ06zmGKE4NS/1w9657tcwdHjflgG2gQ==
X-Received: by 2002:a05:600c:3b0a:b0:4a0:f4:1c76 with SMTP id
 5b1f17b1804b1-4a18e448987mr196290585e9.4.1791819508387; 
 Mon, 12 Oct 2026 08:38:28 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm360428535e9.11.2026.10.12.08.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:38:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:38 +0200
Subject: [PATCH v2 45/50] tests/qtest: ina238: cover the operating modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-45-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=4308;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=lzxHz2iTzcTzaY4NX8qYKf/WE7cfp3wqr3BkHmJe9dY=;
 b=Gz0KMMxcqiIBjZWupaaaQONqSo2+vNw8uNiH6cijXNE/ZLXKYJndLY3cRooT7oqH+UBxqWQ2H
 EBez46XgVouARQK88TRDGiA9YO6bK1TwBk/qBEFMvgft/UsMuj96i7o
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f41.google.com
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

Add coverage for the ADC_CONFIG MODE field: shutdown modes perform no
conversion and leave the measurement registers and CNVRF untouched,
triggered modes convert once per ADC_CONFIG write, and continuous
channel-select modes refresh only the enabled measurement registers.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index 74912424c0..fb7bcc265c 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -304,6 +304,73 @@ static void test_adcrange(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x1F40);
 }
 
+/* Shutdown converts nothing: registers are held, CNVRF stays clear. */
+static void test_mode_shutdown(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x1000);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    qmp_ina238_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x0F00);
+
+    /* Clear CNVRF, then enter shutdown (MODE = 0). */
+    (void)i2c_get16(dev, REG_DIAG_ALRT);
+    i2c_set16(dev, REG_ADC_CONFIG, 0x0000);
+
+    /* Injecting while shut down performs no conversion: registers are held. */
+    qmp_ina238_set("shunt-voltage", 40000000);
+    qmp_ina238_set("bus-voltage", 24000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x0F00);
+
+    /* No conversion completed, so CNVRF stays clear. */
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
+}
+
+/* Triggered modes convert once per ADC_CONFIG write. */
+static void test_mode_triggered(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x1000);
+    qmp_ina238_set("shunt-voltage", 20000000);
+
+    /* Enter triggered bus+shunt+temp mode: one conversion. */
+    i2c_set16(dev, REG_ADC_CONFIG, 0x7000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+
+    /* A new input does not convert until the next trigger. */
+    qmp_ina238_set("shunt-voltage", 40000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+
+    /* Re-triggering with another ADC_CONFIG write samples the new input. */
+    i2c_set16(dev, REG_ADC_CONFIG, 0x7000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x1F40);
+}
+
+/* A bus-only mode refreshes the bus register alone; the rest are held. */
+static void test_mode_channels(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x1000);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    qmp_ina238_set("bus-voltage", 12000000);
+
+    /* Continuous bus-only mode. */
+    i2c_set16(dev, REG_ADC_CONFIG, 0x9000);
+    qmp_ina238_set("shunt-voltage", 40000000);
+    qmp_ina238_set("bus-voltage", 24000000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x1E00);
+}
+
 /* Clamping at full scale and the MATHOF flag */
 static void test_overflow(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -548,6 +615,9 @@ static void ina238_register_nodes(void)
     qos_add_test("power", "ina238", test_power, NULL);
     qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
     qos_add_test("adcrange", "ina238", test_adcrange, NULL);
+    qos_add_test("mode-shutdown", "ina238", test_mode_shutdown, NULL);
+    qos_add_test("mode-triggered", "ina238", test_mode_triggered, NULL);
+    qos_add_test("mode-channels", "ina238", test_mode_channels, NULL);
     qos_add_test("overflow", "ina238", test_overflow, NULL);
     qos_add_test("alert-shunt", "ina238", test_alert_shunt, NULL);
     qos_add_test("alert-bus", "ina238", test_alert_bus, NULL);

-- 
2.50.1


