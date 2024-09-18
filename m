Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978317njg;
        Wed, 18 Sep 2024 12:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0ur5iD6+VUamZ8bFFb6UgDQ+8aqraM6k1jAUHSy/RonDjxfcStfNn82qTucDgwpm8AsMlwCCXYg1DQg==@linaro.org
X-Google-Smtp-Source: AGHT+IECQnID/mcy0lQrTjQiagwTiWw/chtoksYFJnK7pTZrS8MtlIjoylVFWn1CPzw9/RHUkt+B
X-Received: by 2002:a05:6902:dca:b0:e1d:30bb:f68c with SMTP id 3f1490d57ef6-e1daff97323mr14699909276.33.1726687470546;
        Wed, 18 Sep 2024 12:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687470; cv=none;
        d=google.com; s=arc-20240605;
        b=GeujXxthBMNFUSELHYkpZtiSiJu5nnJ7tq5N0qzQIz0hxgXL5hUs5TFVZZncB27rOE
         pwOJgsBGg6Z3JNKkZcmWZQzNHNPxvkvEWOtFtFpde7LZNpoCnVTGujZIEI9/w910N0EP
         MSbubZOuEct0bJb3EwZ1kKpHIoLJWZX8zipcOkgZQY4UoSZEBnIeyk0Pl9sQgSEuUa7K
         ys2e2V6fPGeDkrcrVSdvLqf927hSIQal8J2NQxOvpB+Ba/pYttr5lcFNTjPMXHX+qXSz
         a2sFPEyH7eA6rZARfLNTO+7LlkFefGDOpLfkdRxEsBEHv5Z7OrAsdbPDxz74t7c8BMWi
         2jKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=CWax01LO11cCMxk7XAjv93ylNJE01EbdgJ7/Pszq034=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=dyrui+6BZ1Ww4LxNxMV5JeDVqYKtAJOD3GJ2ySwVUMRkNoLkQilpKASE77U9AUd+s6
         xTGBWXixjPEcIcuLhKbjrgScX1/dlZ61KnIBrUdAtcURbYecyE8PsTRUbSMgVGaioCk1
         VJMnC1Db4soeBWXtrEnwnNV137Wwj9Qf4DJhXDk246ekrPFuxeynWuOohjs2Z4zFSX4A
         3WOK75UEJj4aRizDdsNWFW9Ry2+yLUsQhB+bVPu/w2/btQao318aEsMMylSXm/dpw8BM
         K2pHZWlFvZZwyJsDDXcllhjE3JqpXz08zK3/KYqVB0p3iJ4pgWxyJRjtsHT4ysTuh/gp
         5A4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bonJFtTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e563e9esi1044446d6.297.2024.09.18.12.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bonJFtTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0HB-0006St-TJ; Wed, 18 Sep 2024 15:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uyjrZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com>)
 id 1sr0H9-0006J5-Jb
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:43 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uyjrZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com>)
 id 1sr0H7-0007RE-Lw
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:43 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-7190c5e73cdso70922b3a.0
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687420; x=1727292220; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CWax01LO11cCMxk7XAjv93ylNJE01EbdgJ7/Pszq034=;
 b=bonJFtTkGzuFTcTqgPJX2wVx4P9ER0k+bErI48bGonMtO78S44wS4fJ6lSquiG8tEn
 XjMO888d1n20R2zgxNd8VJwYjwnaTYE+DZh95LOch2G0GOsxN/vlEhCql6ar4wELphNf
 4Cmvs5HaH2ZDO5C1F39BczAdLDg6F3hpPt6M+XeEZ0GbraEanzUBIsr38Gj6CRCBiFvG
 7vXP5J/8DgWfpgO7jWE9fePd44n3zrD/T7JCE5NGJbxn3dRT+5fBFALfbBAoQ639oSgT
 m/Ijxd7m0tViVsGDfhjzssT1J38daP66Fr3D+TxCVsKw6108TMlnjDPdcwM8SDOPvKjj
 w/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687420; x=1727292220;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CWax01LO11cCMxk7XAjv93ylNJE01EbdgJ7/Pszq034=;
 b=qqlfxynIQqi3gqRVRCxhI59QFNc9r4EY0EItwWTkzi5enu3c/fyHTntCyooPVTLNDw
 nsn96Gz/O5nyEE+i9PaG7T6sOkqvKeAQdrR71yMBNRp5cpwYhkw9rFoT4BRTD/hOa4x8
 P1rSqy+OYOW5mSt08qkfGlae40itjrypdTMLwJIlYIKyfyiBj/42euuCkc4RPTC/Yzvo
 awYjQqYxYWCqzICF0XIePUaGe4b4eXgkKGJRCHaJRNwC+16HfJfjSTuBKD06FpCFjV64
 JLj5ZCMl46c98qLSCSvNrR7ADKafeQgMeArMqus1TJfFw8aBXI8WJetUhUwZAwKn/W3W
 I+wA==
X-Gm-Message-State: AOJu0Yw3PCMblxETJN3HxPVWpdceB0whlk+9JnsqBkwBEjCsC/A5XNZy
 4BRBlJ5SUCnT1Mbr+080JGIOuOsn5AKRNtV8Mc0+nKVQvB/yDIDNFbsYkHNxBN8YYzQ7VE/G6g=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a62:aa14:0:b0:717:9798:a8ca with
 SMTP id
 d2e1a72fcca58-719262286femr63984b3a.4.1726687419607; Wed, 18 Sep 2024
 12:23:39 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:51 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-24-tavip@google.com>
Subject: [PATCH 23/25] tests/qtest: add tests for flexcomm spi
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3uyjrZgUKCPYrYtgnemmejc.amkocks-Ypklmlels.mpe@flex--tavip.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
X-TUID: g+neFGSIY63m

From: Sebastian Ene <sebastianene@google.com>

Add master and loopback tests for flexcomm spi.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
[tavip: add master mode test, convert to qtest]
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-spi-test.c | 145 ++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |   2 +-
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/flexcomm-spi-test.c

diff --git a/tests/qtest/flexcomm-spi-test.c b/tests/qtest/flexcomm-spi-test.c
new file mode 100644
index 0000000000..4658835b8f
--- /dev/null
+++ b/tests/qtest/flexcomm-spi-test.c
@@ -0,0 +1,145 @@
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
+#include "hw/arm/svd/flexcomm_spi.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+/* The number of words sent on the SPI in loopback mode. */
+#define SEQ_LOOPBACK_MODE   (8)
+
+/* This value is used to set the cycle counter for the spi tester */
+#define SPI_TESTER_CONFIG (0x10)
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+#define FLEXCOMM_SPI_BASE RT500_FLEXCOMM0_BASE
+#define DEVICE_NAME "/machine/soc/flexcomm0"
+
+static void configure_spi(bool master, bool is_loopback_mode)
+{
+    uint32_t tmp;
+
+    /* Select and lock SPI */
+    tmp = FLEXCOMM_PERSEL_SPI;
+    FIELD_DP32(tmp, FLEXCOMM_PSELID, LOCK, 1);
+    REG32_WRITE(FLEXCOMM, PSELID, tmp);
+
+    /* Disable the FIFO */
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, ENABLE, 0);
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, FIFOCFG, ENABLETX, 0);
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, FIFOCFG, ENABLERX, 0);
+
+    if (is_loopback_mode) {
+        /* Set up SPI interface - loop mode, master mode */
+        REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, LOOP, 1);
+        g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, CFG, LOOP) == 1);
+    }
+
+    if (master) {
+        REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, MASTER, 1);
+        g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, CFG, MASTER) == 1);
+    } else {
+        REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, MASTER, 0);
+        g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, CFG, MASTER) == 0);
+    }
+
+    /* Enable the FIFO */
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, FIFOCFG, ENABLETX, 1);
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, FIFOCFG, ENABLERX, 1);
+
+    /* Enable the SPI */
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, ENABLE, 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, CFG, ENABLE) == 1);
+}
+
+/* The SPI controller running in master mode can run in loopback mode for */
+/* internal testing. Transmit and receive lines are connected together. */
+static void loopback_test(gconstpointer user_data)
+{
+    configure_spi(true, true);
+
+    /* Write a sequence */
+    for (int i = 0; i < SEQ_LOOPBACK_MODE; i++) {
+        REG32_WRITE(FLEXCOMM_SPI, FIFOWR, i);
+    }
+
+    /* Read the sequence back */
+    for (int i = 0; i < SEQ_LOOPBACK_MODE; i++) {
+        g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFORD, RXDATA) == i);
+    }
+}
+
+static void master_test(gconstpointer user_data)
+{
+    uint32_t tmp;
+
+    configure_spi(true, false);
+
+    REG32_WRITE_FIELD(FLEXCOMM_SPI, CFG, LSBF, 1);
+
+    /* single 16bit word transfer */
+
+    tmp = FIELD_DP32(0x1122, FLEXCOMM_SPI_FIFOWR, EOT, 1);
+    tmp = FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, TXSSEL0_N, 1);
+    tmp = FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, LEN, 0xF);
+    REG32_WRITE(FLEXCOMM_SPI, FIFOWR, tmp);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_SPI, FIFORD, RXDATA),
+                     ==, 0x1122);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 0);
+
+    /* multi word 8 bits transfer */
+
+    tmp = FIELD_DP32(0x11, FLEXCOMM_SPI_FIFOWR, TXSSEL0_N, 1);
+    tmp = FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, LEN, 0x7);
+    REG32_WRITE(FLEXCOMM_SPI, FIFOWR, tmp);
+    tmp = 0x22;
+    FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, EOT, 1);
+    FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, TXSSEL0_N, 1);
+    FIELD_DP32(tmp, FLEXCOMM_SPI_FIFOWR, LEN, 0x7);
+    REG32_WRITE(FLEXCOMM_SPI, FIFOWR, tmp);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFORD, RXDATA) == 0x11);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFORD, RXDATA) == 0x22);
+    g_assert(REG32_READ_FIELD(FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/flexcomm-spi/loopack", NULL, loopback_test);
+    qtest_add_data_func("/flexcomm-spi/master", NULL, master_test);
+
+    qtest_start("-M rt595-evk -device spi-tester,bus=/flexcomm0-spi");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 74fef28551..2cb0fa08c0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -231,7 +231,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test', 'flexcomm-spi-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.662.g92d0881bb0-goog

