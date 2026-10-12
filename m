Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1557CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:28:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHwr-0004Lo-0a; Mon, 12 Oct 2026 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHwn-0004Is-AR
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:28:18 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHwl-0001rs-JX
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:28:17 -0400
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so1092594f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818894; x=1792423694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MZwOnu4u3mbwMqdzuk9WWRV5vzGX0PpwyIdVH5RHZDU=;
 b=A/+3BhpmbT0HzFxQjAmNG5WZo1lwYhJBRFc/KFi3JpRT5Mi9e4UgK/oCw+Ib/ytqjN
 bQUQ2o2K5iTCYGtVHofoFOKQ2hm9jMQHyU6mHxgdVLbMp5AK9iz6yjfKmQzVzcHd3NlN
 EHktx83gQK3FofYKG5BZuffyJo1ff4PA3YmBa7IYshCOyxZvSv8MyG1DBccmHMHzT6KP
 yG33u3A6zS1pBWpwosAcOImZLjXsGTgQhzX3WTj3tJgTcydAdg0x1sefN3Z3Z4RQZs6A
 XHjNtkyZUsav0TClGs65hr2r2D0KAsNwwhoAMZ8hXoqE8HuBOoA1Hb0gSXti8bl4TqPf
 O32A==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+KdtVTY1YWWvlH0x7nFVIALJn97WHHH4g+Wf7mc5BdaBUj5wJyTw8Pi55pXu0K5Ilq0R3/DKq2A==@nongnu.org
X-Gm-Message-State: AFq9FYLUzTE7Lyal+ySQ5Xe0GVp/E3492SbAgSPX6o+heqZM29n02ASE
 4I+ZBSw7t/rVjVH3SO/GcIyG9+CeR/x+dtEFHlk00pWu4MO9dQnR4joW
X-Gm-Gg: AYBFou1Mjag+VefcGgV9V9zm+CaUhgXMaDZD3jzoeC+Ndevh2WEq3fJF2otaftuNkB4
 kZR0WdBCEOmd8Kt+d0kR0ZxCck32sCnN1WscYbMWX9ezDxPkAG3LCl8O4SHpIEoik3Rd/mdF4gT
 Nebznrp52mvRCE0Pstw2WAH7Ct4GwbbF0J81V8ARwZVhGNt7rCVkjHHCn/roieH5qU8o9O1P2Qe
 t1lcbi6SKK1XGWpDDYVj+bsJXeUyPRpWXNwHq81A/M2zTVsxeI16pw66exocn6xsbGy6LDO8TES
 dIAiBCTz9QOuxKt/caJ3C+4iD3R7/54E9WjABgmOTe4YrBUKPHjIoJ3IQgbIxqtGEhRDdz0fj9D
 vHpW5jMK+wRIo7910NN80bVWsXlY2wyNY/7WUuE2D4sV5585lpgR7GiGLiJXHLO+AEGE7f70fDj
 TbKZcikNY0aCDccxKvbnOCLbahTBCO/TL608v0a+eWGMM8w01nB3oAOyqz6I8WAMUxerrVmNP5H
 fv79T9OHEoRZNWINCCx8L0Ad1u10Zc0K2razbcuGA7u/czfzEp2p7Ab5g==
X-Received: by 2002:a05:6000:481b:b0:48b:11ee:de66 with SMTP id
 ffacd0b85a97d-48dbad1217fmr16296782f8f.34.1791818894054; 
 Mon, 12 Oct 2026 08:28:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc50e0sm45948f8f.49.2026.10.12.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:28:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:28 +0200
Subject: [PATCH v2 35/50] tests/qtest: ina230: cover the ALERT limit
 functions and CVRF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-35-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=4599;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=g1WQNWNWvejsNUmKknPzwDjtl/zzqUIEuhP5ANmhVl4=;
 b=65OnQLfX8QBukL+ykDWwsyLTTx2PdYzkrPwt93bRTQOwUz6a3SBgM8G/Y8a6EqH1nmCbL95Pz
 f02zXQq2+KlBIlZ4Blc/ffjRIeXlvDSBzpkHxXTPvXVni3VSXIToVvl
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f46.google.com
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

Cover the shunt/bus/power alert-limit functions, the alert latch
behaviour and the conversion-ready flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index b01f9445d1..1c55028fcb 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -215,6 +215,98 @@ static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_OVF, ==, ME_OVF);
 }
 
+/* Shunt over-limit alert (transparent mode) sets the AFF flag */
+static void test_alert_shunt_over(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL);
+
+    qmp_ina230_set("shunt-voltage", 2500000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    qmp_ina230_set("shunt-voltage", 2500000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Latch mode holds the alert until the Mask/Enable register is read */
+static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t me;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("shunt-voltage", 2500000);
+
+    me = i2c_get16(dev, REG_MASK_ENABLE);
+    g_assert_cmphex(me & ME_AFF, ==, ME_AFF);
+
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Bus over-limit alert */
+static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_BOL);
+
+    qmp_ina230_set("bus-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* Power over-limit alert */
+static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_POL);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Conversion Ready Flag: set on conversion, cleared by reading Mask/Enable */
+static void test_cvrf(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    /* A conversion (triggered by injection) sets CVRF */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_CVRF, ==, ME_CVRF);
+
+    /* The previous read cleared CVRF; no conversion since, so it stays clear */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_CVRF, ==, 0);
+}
+
 static void ina230_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -235,5 +327,10 @@ static void ina230_register_nodes(void)
     qos_add_test("power", "ina230", test_power, NULL);
     qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
+    qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
+    qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);
+    qos_add_test("alert-bus", "ina230", test_alert_bus, NULL);
+    qos_add_test("alert-power", "ina230", test_alert_power, NULL);
+    qos_add_test("cvrf", "ina230", test_cvrf, NULL);
 }
 libqos_init(ina230_register_nodes);

-- 
2.50.1


