Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAE0C79FA0
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:50:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cXH-0006qG-WF; Mon, 07 Sep 2026 12:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXF-0006hI-Ij
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:49:33 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXD-0004AV-Iw
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:49:33 -0400
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so4557324f8f.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799770; x=1789404570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tT25q+kAs26amHD55A44HNQvdNP+ZXuCq/4WXpNirRE=;
 b=n6ohqE44dM+PTb9kDhr/fMCas/oX13GYG9KiQwgvF8AWVGJ4PBA1CCUaB1K1MZkmDT
 vm7K6D9wWW93IFSOzj3/sUbaNVPBxidnQL5s194yNOocfWu+f3lpbnjZVbgU8hZ2m0FK
 Sq0YbMfxXzwS5a3oz+Z9i6vqUniXiGOtj4bcWfIXb+n7ut1Mb6H564xQVmPPf5edYqPu
 s/qDr9DE0ajbaiHrnuFfheK7m7QQp5dp0H5EAzzpXvCELuSTvJr1ykyx98+C2rbkmaOJ
 q5dk/LZeVi4Cu2ViiVOAQdir/WfSR61q2YqwHGeAT0rBph8xTFF//HIt1/tsJxmXqunn
 pbvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBziFApjPRTQIKpc2DDb31tET10vSgU7KIXajQaI3PAPKh5LtEisZ44e0FoPCngkH1Fo5I9J8X87lw==@nongnu.org
X-Gm-Message-State: AFuF++lLNf3MGIjxEFSZvJZsL4BhulOD6YAMvqf7+aOyecS7SEHB9+XH
 tBhB+9Lsws7E2HhsflTv4hURtq4zOk3/yJHefZLOlVAuB0zRf85+kNMS
X-Gm-Gg: AYBFou17Oqzc/ZcEYQOInie+xqqEYT4dqq9JH1QUnW1X+4H0cmFjQuagjc3ARI3374i
 e9mm+nfCtplzFhNVgyDFQl6vDDdAEpg1GyA9rxGlLnmnF6xbittP7/kS9i3zqHjxHZf80br4p7W
 UQHR1nO9gIg04iEVeSMBxyJY3ARqw06UoduNEj8CQXCXeBRensfYtLaQzQoI8NLSJ+W27iu+s85
 QRCsiekC5KLU24BufDTRK5XvGfLX9jLgBhn8XaBRc+9e+ll5yYMyzqZrEL4dcXPIvYbodXr5o4i
 kcqC+Ft4K+siWOQv+zvU4Rn9UPkNuyniptfefcjZCfUE26uLsSifhKa+R/xj3MNO+Y/i8W1ZXhL
 QIEA0AOYd6KmVcw8bQD0Ny15IIk+3GK/dBu/ZuqRsfpTrT+u9YvZGJQa/CJ+9cOn1dpVtIpEOuI
 8FkRo3qaPOh9oWElm4acK1v4WOwgHoWg8x7BeLv/zkpdxNttu+v8jvC/FsaI7UyYBb1J5pX8Ivj
 3bgBVuGBljaFFfZeMYW+nQeQRLyVteCAvA=
X-Received: by 2002:a05:6000:64e:b0:485:8226:c69c with SMTP id
 ffacd0b85a97d-4858226cab5mr34722144f8f.27.1788799769985; 
 Mon, 07 Sep 2026 09:49:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfdf6sm30892594f8f.34.2026.09.07.09.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:49:29 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:26 +0200
Subject: [PATCH 36/50] tests/qtest: ina230: cover the injection-property limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-36-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=4015;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=wQmdLPHBw+ci32U6sjobS3P/cDhoGbED08CSbaHRchk=;
 b=GWOaAHfudsUURaeLwOMp7pfcXhHPS8GB2EvTl3/ozpztdphpgnCY7uvriPe0Fot2GqmxEg5Zc
 /zmtqj8gauhBcywwNPhC+NyBsfPi1OXovHlwngRNyJMdVwJzF93rFDC
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

Verify that the extremes of the shunt- and bus-voltage injection ranges
round-trip through the QOM property without truncation or wraparound,
and that values just outside are rejected rather than silently wrapped.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 1c55028fcb..36c899efee 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -47,6 +47,11 @@
 #define SHUNT_LSB_NV        2500
 #define BUS_LSB_UV          1250
 
+/* Injection-property limits (see ina230.c) */
+#define SHUNT_MIN_NV        (-81920000)
+#define SHUNT_MAX_NV        81917500
+#define BUS_MAX_UV          36000000
+
 #define DIE_ID_VAL          0x2310
 
 /* QMP helpers for injecting the physical inputs */
@@ -76,6 +81,18 @@ static int qmp_ina230_get(const char *property)
     return ret;
 }
 
+/* A qom-set expected to be rejected (value outside the supported range) */
+static void qmp_ina230_set_fail(const char *property, int64_t value)
+{
+    QDict *resp;
+
+    resp = qmp("{ 'execute': 'qom-set', 'arguments':"
+               " { 'path': %s, 'property': %s, 'value': %lld } }",
+               INA230_TEST_ID, property, (long long)value);
+    g_assert(qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+}
+
 /* Power-on-reset default values and the Die ID */
 static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -307,6 +324,46 @@ static void test_cvrf(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_CVRF, ==, 0);
 }
 
+/* Shunt-voltage injection limits */
+static void test_shunt_limits(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", SHUNT_MAX_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x7FFF);
+    g_assert_cmpint(qmp_ina230_get("shunt-voltage"), ==, SHUNT_MAX_NV);
+
+    qmp_ina230_set("shunt-voltage", SHUNT_MIN_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x8000);
+    g_assert_cmpint(qmp_ina230_get("shunt-voltage"), ==, SHUNT_MIN_NV);
+
+    qmp_ina230_set_fail("shunt-voltage", (int64_t)SHUNT_MAX_NV + 1);
+    qmp_ina230_set_fail("shunt-voltage", (int64_t)SHUNT_MIN_NV - 1);
+    g_assert_cmpint(qmp_ina230_get("shunt-voltage"), ==, SHUNT_MIN_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x8000);
+}
+
+/* Bus-voltage injection limits. */
+static void test_bus_limits(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("bus-voltage", 0);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x0000);
+
+    qmp_ina230_set("bus-voltage", BUS_MAX_UV);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x7080);
+    g_assert_cmpint(qmp_ina230_get("bus-voltage"), ==, BUS_MAX_UV);
+
+    qmp_ina230_set_fail("bus-voltage", (int64_t)BUS_MAX_UV + 1);
+    qmp_ina230_set_fail("bus-voltage", -1);
+    g_assert_cmpint(qmp_ina230_get("bus-voltage"), ==, BUS_MAX_UV);
+}
+
 static void ina230_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -322,6 +379,8 @@ static void ina230_register_nodes(void)
     qos_add_test("config-wmask", "ina230", test_config_wmask, NULL);
     qos_add_test("shunt-injection", "ina230", test_shunt_injection, NULL);
     qos_add_test("bus-injection", "ina230", test_bus_injection, NULL);
+    qos_add_test("shunt-limits", "ina230", test_shunt_limits, NULL);
+    qos_add_test("bus-limits", "ina230", test_bus_limits, NULL);
     qos_add_test("calibration-current", "ina230", test_calibration_current,
                  NULL);
     qos_add_test("power", "ina230", test_power, NULL);

-- 
2.50.1


