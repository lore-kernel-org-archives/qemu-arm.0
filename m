Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82BCC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:35:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIkQ-0001bZ-3N; Thu, 15 Oct 2026 06:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgQ-00048c-AN
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:27:35 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgN-00048x-UX
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:27:34 -0400
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso48125545e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060050; x=1792664850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UoANilWHPQU+jFLM2oOvVUgxMcTpl1I7pWBnWHE9eEg=;
 b=QiNMQFBY2wAqDBu3tUvUqZL3BZSWhiM8QstmkbVavMg6qeq7DnnmqygzsUNT4Zf3IW
 09FnoXtsNIazN51dmjnJQcf+IEl05OzgP4U3ZZixXzhf93+uOywaHmXZqNN7iTmio6oe
 ANjDIHvphIqdm/BnuAeC9udkNacwuNZfi6TWXNTZypDmCtZjjEHpog+WHECgv+zUIUoI
 dZZEQyRFPZfMqpSlN/rHRAu3b37w19Ii4RD08QXXA2OqAs6QaZ+mxOn2ncvOSnqK+iJ5
 0CZAPMExMONvpbP/9jomLE9nEGoQrR0wWTdeQjgmWpb7+IFg4eqKP6Fe3nvJUBtorDgo
 geBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxI5eeJNJa6r41jWFu5x7US1iffrSaVBMCTMpuTU4F9Q76DeGpTQk3kDyaDMzJNW23P/eoZQ4T67A==@nongnu.org
X-Gm-Message-State: AFq9FYI7/BRZG2EMykYj057SM5IpAIVnt8gpWXdb5l+RS/rCtehAS5iw
 t5LFJm4ljr1SWRBGNfl9jUZC0YvBFJSaE/mY/40Q18s/c4h/xMpHkxwpvYHRxA==
X-Gm-Gg: AYBFou32nZq6/3Y612jbHIj/P98s7zc2nXkkoOlt/xxw+zBXQYlE41XAljuPUJyhZfg
 gl+plIipKf0VTeMORlHEbuuZIcSfEX4ARxD8QR3ClkhJtGpnCnDRz39q2x2Bei4GArl/nt2E0Un
 ArlYXgKnTw2PVtshznLaVloQaplZ6hOFsjEM4iDodyA6iE1UPSYKPWbCR3pyrBj5oD9wm/u/Nvw
 6QkD2sdthEUlaxgPrEXzR0bUXl/EVJ/W9kl+gFOLUz4CahZfUqpGlE3Gn2h/5NA/m1PZAf4UVmZ
 +hSIVHxCWKzDpuxW6vcF0BDyxqaXeEskF6FU94oNpIdyKaJMPPHndppCDrZ/DDGm9FjDFU/VzI4
 56AdSPgi/E+p7t9ZUxXyS3gqDzcbb7+L7pYI8hKZbsbPtjRO55ukMCOzYN6V8YY17WbyzzVBP6p
 Cdzda8fFlxQ1kXl2wHvFB71mc/5WJeDSjWxB6VlIiipvKvIuJFgF3g8fapDKBkhCKZd80+zhXrh
 ZF4DhFdlb5pucwqqafV/nOmLSbBwj7pP4pkquVWDo85NZ0=
X-Received: by 2002:a05:600c:4e4f:b0:4a1:ad27:e797 with SMTP id
 5b1f17b1804b1-4a1ad27e79cmr172612645e9.6.1792060050441; 
 Thu, 15 Oct 2026 03:27:30 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8ebdsm70000775e9.10.2026.10.15.03.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:27:30 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:17 +0200
Subject: [PATCH v3 30/50] tests/qtest: ds1339: cover persist-on-reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-30-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=3352;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=KvLAOs8b9crRgRWHo/H40bGm4hfaQpkysjJaNXTXaqY=;
 b=tI2W0YvPZs3nImo8wb9cBBEVQZMXOPKNTR9lUUKKuKaUw0bKTz1bMDVyfGlMzVaD+Wmp9obru
 YjRmfoU173DBHiOF4SemD1LdgwLDegyq93ELz8xs0Om85E2eWBNAsQF
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

The property was untested on this variant.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 12562eff5f..a1b5afb331 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -8,7 +8,10 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bcd.h"
+#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/i2c.h"
+#include "qobject/qdict.h"
 
 #define DS1339_ADDR 0x68
 
@@ -426,6 +429,52 @@ static void test_alarm_registers(void *obj, void *data,
     }
 }
 
+/* A reset restores the power-on state, unless persist-on-reset is set. */
+static void check_reset(QI2CDevice *i2cdev, bool persists)
+{
+    uint8_t year = i2c_get8(i2cdev, DS1339_YEAR);
+    /* A year the clock is not already showing, so the check discriminates. */
+    uint8_t marker = year == 0x42 ? 0x77 : 0x42;
+    QDict *rsp;
+
+    i2c_set8(i2cdev, DS1339_ALARM1, 0xa5);
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    i2c_set8(i2cdev, DS1339_YEAR, marker);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_ALARM1), ==, 0xa5);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_YEAR), ==, marker);
+
+    rsp = qmp("{ 'execute': 'system_reset' }");
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    qmp_eventwait("RESET");
+
+    if (persists) {
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_ALARM1), ==, 0xa5);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_YEAR), ==, marker);
+    } else {
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_ALARM1), ==, 0x00);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0x18);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==,
+                        DS1339_STATUS_OSF);
+        /* Back on host time, which is where the year came from. */
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_YEAR), ==, year);
+    }
+}
+
+/* Without persist-on-reset, a reset takes the part back to power-on. */
+static void test_reset_clears(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_reset((QI2CDevice *)obj, false);
+}
+
+/* With persist-on-reset, the registers and the clock survive a reset. */
+static void test_reset_persists(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_reset((QI2CDevice *)obj, true);
+}
+
 static void ds1339_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -459,6 +508,13 @@ static void ds1339_register_nodes(void)
     qos_add_test("block-wrap", "ds1339", test_block_wrap, NULL);
     qos_add_test("alarm-registers", "ds1339", test_alarm_registers,
                  NULL);
+    qos_add_test("reset-clears", "ds1339", test_reset_clears, NULL);
+
+    opts.extra_device_opts = "address=0x68,persist-on-reset=on";
+    qos_node_create_driver_named("ds1339-persist", "ds1339", i2c_device_create);
+    qos_node_consumes("ds1339-persist", "i2c-bus", &opts);
+
+    qos_add_test("reset-persists", "ds1339-persist", test_reset_persists, NULL);
 }
 
 libqos_init(ds1339_register_nodes);

-- 
2.53.0-Meta


