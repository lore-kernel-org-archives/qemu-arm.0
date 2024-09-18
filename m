Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp980284njg;
        Wed, 18 Sep 2024 12:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMQ12a7o0OstHZEASuJvU8hhGRnoryKera/w9iRXo6EBK9968Db8NoSUx3A6g8seg23uCWDuXYB+YQfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGrNvgaObs0UYlvfR4X1lHRdYTphY2ZPFyGxf9EkyIV2Xqgn87QFjNY6LwCjmH6dPetKyN9
X-Received: by 2002:ac8:5802:0:b0:458:3eb3:7496 with SMTP id d75a77b69052e-458603edb1fmr412829771cf.45.1726687773056;
        Wed, 18 Sep 2024 12:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687773; cv=none;
        d=google.com; s=arc-20240605;
        b=h3wJRDyr1YvCBdRsjlpe31dhqa/SLsJxYBViBD69N463Ne04k9npnCFXmp/Ig4k6YS
         WJSM29UvRaFgZR/Yc6cvEcvhi8ld94t+WPwEiCb6RooGeZu6jhjMFyG1ubh5fSYsNy/K
         Yy7o7Ev8pRq4qlmq+C2mjAMkmh92p0H+yuTq2mOoIZ73rq3d8WcRLs3jNw2mIFmGUpEy
         YAur62/N8kuknkvhVQN30gv4srYA3UuqFPqUeapM29eE0JTu7jaXLQy0H/rO9IVGEym+
         U65z9sPfYhyt9HQhK2BG/zCRMS6UzC8Ey8jKsMM7Mc06hG6BfstK0SUidJh161BHvtSs
         meoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=j5CsnkrzorKCa1JKdBu6zJdVCIAE7wiQPKdUlC6Xodk=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=h81WHT6ON2p1W8wHveHzN1x+cBat+C6G7MiwQO4m3TPhZOZqOg0kZG2s7E7AuW6/0G
         16DuOxQ3VrDXOIJPh04+OQdo7YmuE+ILr4qYicD90iVaOrI1J893HZVnatVam81AqpMt
         DMN4I2HgJMHayoCbQIUmHggK4ibk5ygIRT945fmshosPMEgWtF1r3CnwUH4pyupUBK/D
         UXQvDyWxOBiKctsMHw4ho9jShfxahUjlhHo18RTdjv9bX7cgU+haEDXXz+Tl1mUYr2aG
         /IorYLiPoKf3k9bkRIxjVImR5YgHKphopShWwcVuU0FVEg5TRfBOmgkjHwQ8TjLs9n53
         S2cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eDl230l9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1790ef67si1014311cf.415.2024.09.18.12.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eDl230l9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sr0H6-00064v-BU; Wed, 18 Sep 2024 15:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tSjrZgUKCvAlSnahYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--tavip.bounces.google.com>)
 id 1sr0H4-0005wW-7T
 for qemu-devel@nongnu.org; Wed, 18 Sep 2024 15:23:38 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tSjrZgUKCvAlSnahYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--tavip.bounces.google.com>)
 id 1sr0H2-0007Py-EK
 for qemu-devel@nongnu.org; Wed, 18 Sep 2024 15:23:37 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-7190c5e73cdso70788b3a.0
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2024 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687415; x=1727292215; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=j5CsnkrzorKCa1JKdBu6zJdVCIAE7wiQPKdUlC6Xodk=;
 b=eDl230l9bIYG93zlieor77rVvz/LSQXHsKjCBmAdj/na7dDSBz9wizbK88eQD0fZVy
 zBRLyy0W0/4i17Vj/vvYkjdR9k5O1xWoTyo6AWP8HaAGKM9wRF4C8xyX4XjsgK5LCn/S
 Z6stsTvMjYdnw3+/PCS3Wiwq5gS8FKr/b/ilx8tpu6TIcx0LJqJEj0P6KgV3EPXQAG8r
 fBut1c6t4e+wJbbntsvaMvX8Kl+4f3X/oBAz9MjFnZ9geEgDOqN++VC4pefe9oTxTSnh
 I1Xl+aKuFWKT0tVqTzSzg772pdu4OeqisbkGr/yWobJfq895D6LgA63OrelzuHteds3t
 UN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687415; x=1727292215;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j5CsnkrzorKCa1JKdBu6zJdVCIAE7wiQPKdUlC6Xodk=;
 b=MRrR5aYbJLcFBWjAWyn2m6FgeSMRxjsnwB0jM5ZqXCpF9xBNpFsAuEydtakW4SUUD1
 BBhNGflc/bbExl3dwkFcxawwe5EpPHacNjJdbCKVQ94bEz27yYAVMnnP9qZRafDZK/fx
 dTmxKQOU/hImO1vaNaaGc8otZejQfHhnDZtDjlFn28eJlPircOm7E8e8Tt5yhHsQhlF5
 7vGZZnnkSAr/rmcFkOr75vKP5Lv6CeMHJyWq7yNf1USSARFrcDY66KY3TzFXBhpy6DUN
 dPOoD/V1j0jctDVmChzJvLifIda55ItjRVXevt/FnEODGeqBBEcqxIQNVvsApCswOGkL
 Y/eQ==
X-Gm-Message-State: AOJu0YymOag+KqVYeCMy/YjT8lvXGuY+pmtqGHGq663R5XZAgLPfK/bT
 Sd8k7d4njRDiv3kIAlfjr+dMAfOSaaG1AvP/dwugjyFnpNjBvgTrPy8vOr9Dvff3NQhWorgic9v
 +ZDUhSUG3hJvYvOjpb6ezMEcyWPGtTO7WV5TJnPscAKXeegGVPYrXCt9w7pvWALww27jwRH0gPW
 HDA+MenntcZ9ztRQt6To6Kzlk5hw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:6419:b0:70d:1285:bbcf
 with SMTP id
 d2e1a72fcca58-71925fa7878mr71729b3a.0.1726687413707; Wed, 18 Sep 2024
 12:23:33 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:48 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-21-tavip@google.com>
Subject: [PATCH 20/25] tests/qtest: add tests for flexcomm i2c
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3tSjrZgUKCvAlSnahYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kSzajIsnrO3Z

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
index 663e44f3c6..74fef28551 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -231,7 +231,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.662.g92d0881bb0-goog

