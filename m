Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C4CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:29:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHxq-00054Y-30; Mon, 12 Oct 2026 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHxo-00053e-OP
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:29:20 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHxl-0001xi-MC
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:29:20 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so13565535e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818956; x=1792423756;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tT25q+kAs26amHD55A44HNQvdNP+ZXuCq/4WXpNirRE=;
 b=1MLJjJYwbZkSx3kCSIzNWkHcWNJLRs81f0y8baU9sjpnE/62oaUf6lnauPNh9poWIl
 1SNq7Jt60dLDD9kd5+IMSapRY6lEQ5nWcqhviWH7yglS52vnorA9WfPmlBLP/Mu+BNbg
 whh4HCRqW7+uFHbMFCvqJ3zjcDKArFNE+UFUXdppoFjYiQUNfZVxZqeiS1Vz0EnjhWvo
 gRDbuB85OcR9XS2KGiYiGmOOL/7C4lN8MJlEw4+7wYDUsOIlKvbzOy0A/6zK4Y/vsHHk
 Yyi2IGmGFM947ikklaB0tigLy1xRCnsLFGn297Lgtg0WdKJaH7CzMYFdtmtxfQ7UdWVJ
 LtlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVSV5gyQRS/jWM9TFsIArR1uLCH7DooXGdweWHNPTzC8/FYksXXVB3CMWvViT0LRwLvXOWhg+HtQ==@nongnu.org
X-Gm-Message-State: AFq9FYKS9gCMRVz9cuKbYVjGX0onGPTbVMmjkH7UKZ0EQbZgmxCjjnf2
 mbulzAiYtJwOREOxTqkMvXMNvmD1Ig74+MrG8Zsak5vK0ptYMruVwcF/
X-Gm-Gg: AYBFou24+zy638rAmOeOOoA6KTva4cSi6rhemgr7XhEOUQiTvMReDBxpPq+8lUI2f1Q
 GkrnW9Asfj4qGuXZWmDcoZ16Q+BeEY5U/k9LXsWFgSUYhUvQlP9Xk9nupiTEYvjW/cxiRWp+b+V
 Ae3cA44Ia7sQ3QRN5on+YSmMHRMvyFjKl6OxU4yxSrVWeXsxR7vB6xcmaOxdSFxxHmCeir1/nzN
 N4v1aoL65qVB4EGc3EQiF2zUSpRxxxJeQaokB0rSR7RDKu7/VU3gQtObDI3khJG9+s9V8gyabNd
 PbGViJRsQUremXpy4I7kyne/Cq6iEFuzcaXtuEyTrCfnzC4kWeVYg9BImY5AnjvRqgGRLpTHcPz
 DAxlWIieQMwussOAY2D7abghRJ0kT+Gn2EWkfnemwR2Z6LmmwO/QsjWH0T+Gvhr/3i87uEJYJWt
 9QLytkp0KBH7yQ5ap6KozOBmeDQwwrLfPgYux2GzbVpQMlVwP8gbw081G8k9skLyl+izEQy3PcF
 2RMhWW6Sxb4Ln23XIoZ0rochBzJqAZG6wH3TFjCUJSyhA==
X-Received: by 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id
 5b1f17b1804b1-4a18e4a9b31mr206769825e9.12.1791818955589; 
 Mon, 12 Oct 2026 08:29:15 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm412198175e9.6.2026.10.12.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:29:14 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:29 +0200
Subject: [PATCH v2 36/50] tests/qtest: ina230: cover the injection-property
 limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-36-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=4015;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=wQmdLPHBw+ci32U6sjobS3P/cDhoGbED08CSbaHRchk=;
 b=ULt1AFcU9DxFHXJ8AO/WqFOV1c/kzM1HuvBVB9jjlltna8IL1WYAGKBhqrT4nxsaL5rUnaqhy
 INMx42npWwSDmSQzBatjaKyfm6Ff6+ltj3emotsR+wJFudx/vR7TFCr
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
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


