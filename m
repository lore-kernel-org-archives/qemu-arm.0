Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1231154lfj;
        Tue, 3 May 2022 00:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLQ5QO6Rqajv3BCsvSUK0M3Nn5OHqbgwMz+xBZeVmwo66H3Xdez4BLugWh524HkrAzqWE7
X-Received: by 2002:ad4:5bc4:0:b0:45a:ac6f:f3f2 with SMTP id t4-20020ad45bc4000000b0045aac6ff3f2mr117570qvt.44.1651562082554;
        Tue, 03 May 2022 00:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651562082; cv=none;
        d=google.com; s=arc-20160816;
        b=r12evUTZgZuiLUp3jZqJuJNEEaiR9FlqZmZPA7zW/VvI/loavz5U5INAmYQ4Aw/A7V
         wdSoFfZFwQgoc50B4KnKWhv3IY0QH8bpG1X306iQOYAJ0i27BD7ao3wljXRBzYlxwQDT
         5sA6avlLRnK9/7jaJ0gdMstNZG/QFkigh2Br1E0ttIcPoIKqQrlCx+0trSbGGYNWKjin
         Cl/Cee639lPRprkvvr3Zw1psxSHvQCJeZGz4TOcSHNYTllhQiXmgdAufSgi+kUeCm9+F
         OpBYXOZfeGFKGpt1SrszWpVQyQa6H6P+Zarzp0O56k8w5eTGSJujEtqLUtzdx2xpYN6V
         /YRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=DrMwcoJgFO0VfLZhNEoPs10xHMV3jdXw/AKXpKjyf5w=;
        b=knQ4VoFwJJkk8mmsjYiyaN1MyCiDrkjcSPik77gVayR2q6Z/eF0efuXufoGb4ykiD6
         AQaHsTX28N8z7eo2t8kRsTLkUQ5YWFLyrwTs8S9Q3E17E31sqrcVyxxO4JGGzJehc3Do
         pNQhheONieRo38DB4gVhFdG0/pqi0/91yz8lrd+6XopBZfl7+3yxwol1FF+2vbPHCf0I
         Tnri574BVa6Vjr5UTE35VfFUYXPimdSI1VUP5wMaZpRHP3qPMW1eA3awjFquguyHsQZS
         pPs3YMWyTZ0bAw3kIgX7jFgZ5jczWKq8OBYu95yMF/+qaxIhZ1Ll2phCDTlhUSe2zp/L
         5tyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05622a118d00b002f39740d82bsi5127201qtk.701.2022.05.03.00.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmk6-0007XJ-0b
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVg-0003TH-DC; Tue, 03 May 2022 02:59:51 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:47861
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVb-0007XI-Fl; Tue, 03 May 2022 02:59:45 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRx1L1mz4ySb;
 Tue,  3 May 2022 16:59:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRv17qhz4yST;
 Tue,  3 May 2022 16:59:38 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 18/19] hw/gpio/aspeed_gpio: Fix QOM pin property
Date: Tue,  3 May 2022 08:58:47 +0200
Message-Id: <20220503065848.125215-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XRMGEksgwmBD

From: Peter Delevoryas <pdel@fb.com>

I was setting gpioV4-7 to "1110" using the QOM pin property handler and
noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.

    (qemu) qom-set /machine/soc/gpio gpioV4 true
    (qemu) qom-set /machine/soc/gpio gpioV5 true
    (qemu) qom-set /machine/soc/gpio gpioV6 true
    (qemu) qom-get /machine/soc/gpio gpioV4
    true
    (qemu) qom-set /machine/soc/gpio gpioV7 false
    (qemu) qom-get /machine/soc/gpio gpioV4
    false

An expression in aspeed_gpio_set_pin_level was using a logical NOT
operator instead of a bitwise NOT operator:

    value &= !pin_mask;

The original author probably intended to make a bitwise NOT expression
"~", but mistakenly used a logical NOT operator "!" instead. Some
programming languages like Rust use "!" for both purposes.

Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and
AST2500")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220502080827.244815-1-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c          |  2 +-
 tests/qtest/aspeed_gpio-test.c | 87 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  3 +-
 3 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/aspeed_gpio-test.c

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index c63634d3d3e2..9b736e7a9f26 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -312,7 +312,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
     if (level) {
         value |= pin_mask;
     } else {
-        value &= !pin_mask;
+        value &= ~pin_mask;
     }
 
     aspeed_gpio_update(s, &s->sets[set_idx], value);
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
new file mode 100644
index 000000000000..c1003f2d1bc4
--- /dev/null
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -0,0 +1,87 @@
+/*
+ * QTest testcase for the Aspeed GPIO Controller.
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/timer.h"
+#include "qapi/qmp/qdict.h"
+#include "libqtest-single.h"
+
+static bool qom_get_bool(QTestState *s, const char *path, const char *property)
+{
+    QDict *r;
+    bool b;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
+                     "{ 'path': %s, 'property': %s } }", path, property);
+    b = qdict_get_bool(r, "return");
+    qobject_unref(r);
+
+    return b;
+}
+
+static void qom_set_bool(QTestState *s, const char *path, const char *property,
+                         bool value)
+{
+    QDict *r;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
+                     "{ 'path': %s, 'property': %s, 'value': %i } }",
+                     path, property, value);
+    qobject_unref(r);
+}
+
+static void test_set_colocated_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+
+    /*
+     * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
+     * sure that modifying one doesn't affect the other.
+     */
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
+    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
+    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
+    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
+    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
+}
+
+int main(int argc, char **argv)
+{
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_init("-machine ast2600-evb");
+    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
+                        test_set_colocated_pins);
+    r = g_test_run();
+    qtest_quit(s);
+
+    return r;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6b9807c1830d..32fb8cf75583 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -189,7 +189,8 @@ qtests_npcm7xx = \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_aspeed = \
   ['aspeed_hace-test',
-   'aspeed_smc-test']
+   'aspeed_smc-test',
+   'aspeed_gpio-test']
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
-- 
2.35.1

