Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D634606A330
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:16:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtZb-0000OT-Dv; Thu, 05 Nov 2026 04:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtZ9-0006eP-Di
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:15:27 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtZ7-0005kM-4c
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:15:26 -0500
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3ae1b34e0d2so233966a91.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870123; x=1794474923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tktjGaYiiPphflc+jwBY/yh3JfaTUnJhW1nAnyAEoO4=;
 b=H8or5nmyjJ4tV/I88Pq8d6By4xkB5QHBGRQqDCl1Wsy3cl40hcLbijBqV1ieW+C1eZ
 WnC8c2UQmiPgYc7VeVhnsXzlkmmh8DwSEsJ3WfrbgeLZKCpIzTourV/hTQ0yfyKuDGnt
 LcyGttUgqS/ukvNRFKaa0eG8ovavZ9cvfgE1TQzL+28QLKEGsN8A7ILoBfB/KPsdVI0V
 9RsJneJ7IDll3/RMM45sxkJC6CCuFo1OBs235mCBBqq18TfHgWBPiHK4CaS+48+91gDq
 W9/n8jAho+vrSi902JbFX6sGOYj6RvZVF1I//qtUPKuOfACnX1GryMlGT/Ro0F4q+ZtU
 7ZaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxt+yKtK5fIsmSWRLSbIgi249HcdCSE8x4/9ss4/m5n+/+oabSixu/E3VJQTNWawQEQv7Xpd9lw2w==@nongnu.org
X-Gm-Message-State: APuU4Z9AhRyVfcLrFfWkC7WTwy1S9xUMCXmBosQoyGMfW/oVrxd4QdaQ
 qdoSvGilhxDBhRxDIsoEiCactlutE770aGQ+J2x4yhel7LmFbatgheaw
X-Gm-Gg: AYBFou3x3f4l9CvlMBvoVfjTp9sO6yTgQWO3WOVH+ExZ9c58pjCBZ2WVO4YHzuU6gxC
 83NOziEsnIS2Zd55lk/Zk5qJ1UT8eqtEsIX8WJ0aRIJaUdtLYZ9FRQhPBd9tVcly840xOhJuoso
 M5bK53ucUZteCnbYuZ9P9n6Dq/6YDet0/Ro+01Uv7R7UZxzua1pqCC18kF4E9DO6nfLSanHdewm
 0zg0L1iSSIsYMDjqvPRyu+PVv7xO+bpBFYOApLEPeKLEfT2JRRf+2d5pGPRK0rR1+V3Qtc12BEh
 AaCWnNbCg6w/TaiphnBR62s3c3Q+n4wcWVCyTYauQ4m1Ux6T548nUCtBm4LFW8NlaWRQH6u0Wkc
 C/s1rNLvzwCrLzrzsMYsSq+fv2xkTXHHWSQvKbiJ55YJ7TQMS+Bq4RTPK4AOo0VH7Xx9oLmGSN9
 rhb5w5zI1Qj1ft6Vc6hkMfjj9KcIoCehidr/9xcd+mgFVdzVy3aFmJziTNzI0OsFYeS4H/XUJ8Q
 H4qvgiSSee+lpbSZ990kXfPVhvTZpeglQQ5egeK3IDiTsdsI0G+mNaRdqA/fv2IXUvcfs4tjj6Z
 3kG4INq8lSMVWo8fINUxREQu1aQbEss9ntER31EhdOSJsLnoTHiJHJ70U5BmxWWWkwEpDzuEUtp
 UoILJCQ==
X-Received: by 2002:a17:90b:39a6:b0:3ac:b6eb:e0de with SMTP id
 98e67ed59e1d1-3b0afbf6942mr1312128a91.4.1793870123361; 
 Thu, 05 Nov 2026 01:15:23 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b3160634sm3112356a91.6.2026.11.05.01.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:15:22 -0800 (PST)
Date: Thu, 05 Nov 2026 17:13:06 +0800
Subject: [PATCH 14/16] tests/qtest: ina238: cover the operating modes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-ina23x-v1-14-5433ed104990@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869976; l=4362;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=hpkKt0gJgZXEPALCwyXp/2SRP8/YiYX8+r6RcSGYDn4=;
 b=ZpB258RQdGACxUzFILGfC6NtxVavtYoFyXlLhtwxM/izkJ5mSUaZdipZJ68IAs4NwHFI0ZrZu
 nW59V/lPcA1BFVPA4ejZEA/DwoVAqpFQ1nDZt3vcOqevpZnZbr+L+e+
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.216.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-pj1-f51.google.com
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

Add coverage for the ADC_CONFIG MODE field: shutdown modes perform no
conversion and leave the measurement registers and CNVRF untouched,
triggered modes convert once per ADC_CONFIG write, and continuous
channel-select modes refresh only the enabled measurement registers.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
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
2.53.0-Meta


