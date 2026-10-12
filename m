Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89110CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHrt-0008VI-1Q; Mon, 12 Oct 2026 11:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHrq-0008UC-Hj
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:23:10 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHro-00019J-Tt
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:23:10 -0400
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso1954730f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818587; x=1792423387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UwwxETLAztE1k6Pih+RsWxpK5u/uYELdrNm5CxCbYqw=;
 b=lo382QbL9rNOIImoM08VJ5Qb0osK5M5tj6pV8oQr6yoA0zyJwJ+BJhUzSMjjJuRXbV
 JRvqxgPBSpi+flfIBdgF887jwXdKJyhicj+9J1ll81T4YxYQbj1EqCUfHNv4X2k6nsGI
 OLbM0C+0WuPqKFpU+q2+2cIVPQ3BAP35mAfjYqTsKhwo3cY+iakwGhS1JUaAEsXov3A8
 A9osZLbVzT5e5Fsvwwwzi3sWQSFsYLCtJKNrPwPoetQtpD9ixRLdZarGwGhaDfxhszQQ
 VABFnAZXdEdPse/yQG0gWGjEdqBtVaEZiSrQ9VdzrALYxeY9C5mkXhxvMmgGFAy3J0Du
 AZsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBziDoOyygsPCRGzKZtRrv+GJJIM7JnUokGob6IrQb/ImO2GWeH36plrDUvkyIIHhFp36TXPrjyOrg==@nongnu.org
X-Gm-Message-State: AFq9FYJrUvBDL4qbbMrECI8kWzkZyLs32t29L3T41QEjHCoTLcJuTcPK
 33JQaj2z98QgE8kKNN6v3lj4E+UH7++MZZ8qc4MX86lTNo/tqHEgrH+E
X-Gm-Gg: AYBFou3qzMymANcebSehqspV6GA0Kt7fiJ4+JzqRFEYAO0H1rP5za5kWPo4M5KUWIFg
 3WsAp0XesnuqCIKHEwqiHYzdC2+mE0yd39gcgS1a6YOnsbgBB2UkQp7hdjIGkVqFABzFtL1hywF
 bQN7vtkq+Izbws10rq+FrvZcJX8vbBZbK06w5vDxdVVqwxGR95LZKUTybF34w65to8sNj0lZsvy
 EimDrOedetdllozrc2fpeSGDpYsqTSibrSkpQIt6MW5FojWjWaketZDamslVfEv8YCoO5rSTmFG
 u8NqO00E44KVtz36PMujAbR4KD4FfHLTSt/dgTKMGmwpz6sL3vFQBlkFy5AsC9a9LqOHqpTE3KB
 RmiEV1fiMkkzLFxgic+9VJOxl1a1jOgYk1th1gTGGL0EG4mO9vjXRQtGrzh+THMR6Yxsfvej9G4
 Jq+eEKKDAaT2Y/LuBFatxwzH1whiNcupyp8NAxik6/F5we07j7Dp9V1hneAwUwZ4QjZEtMmC5Re
 zIurFfXuFvHJWS6NyrIIAm8VhH3Wc7vPeRLVpNXfOnKjg==
X-Received: by 2002:a05:6000:1ace:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48dba9dacf6mr20300737f8f.19.1791818587322; 
 Mon, 12 Oct 2026 08:23:07 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab48a7sm31524f8f.24.2026.10.12.08.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:23:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:23 +0200
Subject: [PATCH v2 30/50] tests/qtest: ds1339: cover persist-on-reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-30-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=3347;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=40jEbTSK65E3MsKCMaeknpjZMmqbQRo2Y3v73NUToek=;
 b=kcRzjDxjALOy3ssy8xfSwO6TSEFkSkA6pMvfUJLNuyInT+kHRJRipoqafXS6LlQlBb1JKQDoU
 Ej+9jnT/xftATiqrtNUOu2D0fgmTKgWMBuToQ3ywFhKXP9v7t3UAGig
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f44.google.com
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
2.50.1


