Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2290504njb;
        Mon, 7 Oct 2024 18:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH+CY96dfSfZvYsXEn/GvAG8O44IrVbd4DJs+QOxFxPXumj+JtLRvqZyi39TFgssPUZfdD7COEEESOIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH2BCuoqo36592VCIxpWr0P3kBuJ3ImzDtyZhV0TmOoy0VYvYb19b95hkSLbSWiQjLuIjz2
X-Received: by 2002:a05:620a:1710:b0:7a7:f989:58c7 with SMTP id af79cd13be357-7ae6f437407mr2073976585a.17.1728350736764;
        Mon, 07 Oct 2024 18:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350736; cv=none;
        d=google.com; s=arc-20240605;
        b=dHxOdUW6ECnFeULvtrea1EWOkp77K3WXtBahLUwukCFwlyGGU3g6E0VlxazjcGkSbc
         5oQqiFwiTrf4yVf75qjYdNotxmp98PyinW5exHpBzewFIOAE3Lg6M5tVq843TqABulmY
         RGo2zSchq1Y9iIaypFJzWHsh4iv/nfDpbnBmAbUyTSzoMzm8U2raYWuPJraxJ/n3aai+
         4QS01v6sUbycSlWkdkrK+qxx0aErtpffgRKpYW2tIklpZcPnlWndO7IC8hBYMLYwO67B
         XGkm8oL4PWGyCg7yBfX10hwYNo5iuhV27XaLOksfLVFlI5rH6NTAN/NdejB9CZPjz4x2
         1DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=1slVDOqEB8KWMUfUEIu1Co2wfDTjYSlNZhTPxBm4iBk=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=O4f6k7W7pogIm6WJam0VkmWnbzxx9OUJf9S32UxPa8sYe18HOdA1ux7KOWIUJapM/v
         eZHkDuiJ8qslrTG5HTnPY5LYHZyuzkFxsVU4wuSN+Vy8LDo4Qsfx4tGrDK+AoGlRcmBF
         ONlWGHiuuEe3olllVEVOOMZcdtehfZtCXuZkqrc5X6vy7Ia34PEx7vyU+jBMNnmaIkbu
         w7mO0wxPsuKMA1Zp34PfD4xTZn96jHqeGo8juGvq+f/h523MSB7jyfuJxIi1S6mD/z3n
         9TcxrnVsoU3zEVT9GUQ4wBNoTQ1/y0MlGeVIfDIQKhP9M2mksQ+FCctPj+IP4/yzMQRM
         iPWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0dm5WD+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75662558si736972485a.325.2024.10.07.18.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0dm5WD+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyuN-0006Gv-Nq; Mon, 07 Oct 2024 21:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oogEZwUKCAUyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxysy-0008GR-CA
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:36 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oogEZwUKCAUyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxysv-0000Dr-8p
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:36 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e2605ce4276so8766175276.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350370; x=1728955170; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1slVDOqEB8KWMUfUEIu1Co2wfDTjYSlNZhTPxBm4iBk=;
 b=0dm5WD+p8k1mkYwvDQsvCgT14WY4LSPCt/Q1uThQGNEbjDUeusAlBGthjD61NR46YS
 D6kSw7YNuS6mz7DaoEMNucFjY0Oi/E50ncjJv3DvMIAjnbVUR9hydezZ2J6WX4pddDiM
 HDGWPIUJkOC3//N7pW1nBy+Di5aIgxeRcwL3D7iiDaVmg7Kso0hvAd7hs/P/ehbYX9i5
 scbp3NETRn00fJns2FcwjpnKrjxZQh52I0DYyShNRvM4AMBhI3erNakOMdSzX7Eg2lqq
 KkPeXZmBMht8t9A7WKyHPQpr0a7m/1xDKFoONJ/VqX9V9FvhCeSVCqbzPp0n2OGGbLLY
 3hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350370; x=1728955170;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1slVDOqEB8KWMUfUEIu1Co2wfDTjYSlNZhTPxBm4iBk=;
 b=WOo3nlht9o8iNWlcRfJopuyEOCqxOckAaMJ51j9s0fPhJ9Btk9tvtzd0daXErCQ3ih
 HOmE33pfons4ezw6E8qek1W0u3AK7y4urnpu8AuZs9G5SrhbBaU+zqIVvSiuqzKZ6ao8
 99JoCM2K0rPllUzhxHlwCkEdV/jKY0CYYD9Qp6Aont4r6N5DS701F8f+AkiRN+3EuVY8
 7fzKuwEOVhK8blw+fJyBHE6iOkiKzYd3KcfHnT+QhB3u9fdbtmWx5YPSZ5Ud+UUJiOB+
 a9YE0tI1ZbBQ9vgmFluKuJN9Mo1tI+j0DatDEptw1tIHTclsNe0OjE3ekAgrEZW4rBRp
 8HsA==
X-Gm-Message-State: AOJu0YyvSt29SQ/5/UIhMMFPpXlMJAu4Ek5kNXl3rMl/v3eZ4YihOSFq
 YaUyhTMg1zMuOZkQ4iMrGTXOUZ26DtWMqMPgjkCF9VrqeDE5+04oqOgv13f+AV7uXK6YwRzqwA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a5b:388:0:b0:e20:2502:be14 with
 SMTP id
 3f1490d57ef6-e289391f4abmr10789276.7.1728350370295; Mon, 07 Oct 2024 18:19:30
 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:46 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-21-tavip@google.com>
Subject: [PATCH v2 20/25] tests/qtest: add tests for flexcomm i2c
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3oogEZwUKCAUyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RgRXIoAz1maZ

Add master mode tests for flexcomm i2c.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-i2c-test.c | 170 ++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |   2 +-
 2 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/flexcomm-i2c-test.c

diff --git a/tests/qtest/flexcomm-i2c-test.c b/tests/qtest/flexcomm-i2c-test.c
new file mode 100644
index 0000000000..45f31da7de
--- /dev/null
+++ b/tests/qtest/flexcomm-i2c-test.c
@@ -0,0 +1,170 @@
+/*
+ * Copyright (c) 2024 Google LLC.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/config-file.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qemu/sockets.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qemu/option.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+
+#include "hw/misc/flexcomm.h"
+#include "hw/arm/svd/flexcomm_i2c.h"
+#include "hw/arm/svd/rt500.h"
+#include "hw/misc/i2c_tester.h"
+#include "reg-utils.h"
+
+#define PERIPH_ADDR (0x50)
+#define INVALID_ADDR (0x10)
+
+#define REG_ADDR 11
+#define REG_VALUE 0xAA
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+#define FLEXCOMM_I2C_BASE RT500_FLEXCOMM0_BASE
+#define DEVICE_NAME "/machine/soc/flexcomm0"
+
+struct TestState {
+    QTestState *qtest;
+};
+
+static void master_test(gconstpointer user_data)
+{
+    struct TestState *t = (struct TestState *)user_data;
+    uint32_t tmp;
+
+    qtest_irq_intercept_out_named(t->qtest, DEVICE_NAME,
+                                  SYSBUS_DEVICE_GPIO_IRQ);
+
+    /* Select and lock I2C */
+    tmp = FLEXCOMM_PERSEL_I2C;
+    FIELD_DP32(tmp, FLEXCOMM_PSELID, LOCK, 1);
+    REG32_WRITE(FLEXCOMM, PSELID, tmp);
+
+    /* Enable master mode */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, CFG, MSTEN, 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, CFG, MSTEN) == 1);
+
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTPENDING) == 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_IDLE);
+
+    /* Enable interrupts */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, INTENSET, MSTPENDINGEN, 1);
+    g_assert_true(get_irq(0));
+
+    /* start for invalid address  */
+    REG32_WRITE(FLEXCOMM_I2C, MSTDAT, INVALID_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKADR);
+    g_assert_true(get_irq(0));
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* write past the last register */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, I2C_TESTER_NUM_REGS + 10);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKDAT);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* write value to register */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, REG_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, REG_VALUE);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_IDLE);
+
+    /* read value back from register */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, REG_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, (PERIPH_ADDR + 1));
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert_true(get_irq(0));
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_RXRDY);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_I2C, MSTDAT, DATA), ==,
+                     REG_VALUE);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /*
+     * Check that the master ended the transaction (i.e. i2c_end_transfer was
+     * called). If the master does not properly end the transaction this would
+     * be seen as a restart and it would not be NACKed.
+     */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, MSTDAT, DATA, INVALID_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+
+    g_assert(REG32_READ_FIELD(FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKADR);
+    g_assert_true(get_irq(0));
+    REG32_WRITE_FIELD_NOUPDATE(FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* Disable interrupts */
+    REG32_WRITE_FIELD(FLEXCOMM_I2C, INTENCLR, MSTPENDINGCLR, 1);
+    g_assert_false(get_irq(0));
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    struct TestState test;
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/flexcomm-i2c/master", &test, master_test);
+
+    test.qtest = qtest_start("-M rt595-evk "
+                          "-device i2c-tester,address=0x50,bus=/flexcomm0-i2c");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c7a5bb61e9..c21b18c304 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -233,7 +233,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog

