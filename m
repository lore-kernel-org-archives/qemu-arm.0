Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289298njb;
        Mon, 7 Oct 2024 18:22:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXyrsmil7wUeXqQwiKF3lVgPtxYu5HPiLmG4cuMiBV4v0HkrWE6Idmpafv2ju/LyEUpYnDzs7IYHR0+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEltsUXMSl81fDzEXOL0O/jBr1wiKYtVVX3WILN65ZZgocj+1h3yOtaeMAo5u53ss+3Dkb9
X-Received: by 2002:a05:6214:5683:b0:6cb:ba3c:80f1 with SMTP id 6a1803df08f44-6cbba3c815bmr34803806d6.12.1728350527392;
        Mon, 07 Oct 2024 18:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350527; cv=none;
        d=google.com; s=arc-20240605;
        b=hMl+oyCmGgna0E8GlIcodBzgIAlTHh/FruyYK7pEhgIixO4jE3QpY6ceIfjEoJySJZ
         TRpV6F44sFgTvD8dvhdsfZOZTzjAMHHXFZjOi43L2KMgducwyMRyvT7ParLyK7+thAeW
         7KFpD06txwGyLqdAmObqN9IBTupluwFME2D7wArFUkT7igyMtoFWh3xtpwHTM/J1lvtX
         2MTXByOCBkmpno0uS5tTNuoNMahFAuoIcX/ajXm4lW+cxh35V4QJfNIWqp4Hu4Wa6rhy
         VBYKPfkFymrovNGf9c0308VQ1Sq+de7AugdmaiOf3UAf0qsWl7IPUcHaVCyr4g5QT6nq
         EOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6ZAi4gulNhaksWV2hV6e+8oRvcK8JyjNz4xRR0r3KZA=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=hPxy3+N7BL96M71CTWXrXxlABctHEmrDg16QdRpWS2ee06C0CTVpiVtHnOr6qDfcRl
         okExg2H9vO09D+xzOl5dQXqdojE29TkRppfZqq6825nKBaf4y6lZ66MTU8En8aescyEy
         8fJchWBXQ+r/uwdsxd/OKAUlaIZS1kGT2kwVD7Av+BvpN4owkvh/w0EVTeXNG6FA2GM5
         eFTkTsY2KgFF+zeSvvg9nSYTorDbKZk63C3DNJAZKgfArcfjmp2vitu7HymNWuCX5Ifk
         J8GI5DWTxd4Li3fvI63R3Oe5pCTQuyVrx4kc2MFPhVALPwZhqjWU7bxX3NDxtekq1U7A
         2RDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="tXLh1GD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba478bab8si74609786d6.475.2024.10.07.18.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="tXLh1GD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyue-0006tV-5F; Mon, 07 Oct 2024 21:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qIgEZwUKCAs4l6t0rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--tavip.bounces.google.com>)
 id 1sxyt2-0000EW-WA
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:41 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qIgEZwUKCAs4l6t0rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--tavip.bounces.google.com>)
 id 1sxyt0-0000Fw-36
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:40 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71def9ed5e2so3080568b3a.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350376; x=1728955176; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAi4gulNhaksWV2hV6e+8oRvcK8JyjNz4xRR0r3KZA=;
 b=tXLh1GD/Wg78gPiB8ctQ07VFJuNwUOP51wj7KYm5zFpXk2yTw3yZWCxAEZqqeSe8ri
 ksxhBL7chF8Gr2IMvWtxCpsXlZP0xRJoE5E9Eu7wC53hCVL2CyEI6cBTlnZEEpdGIp9J
 wvz0z6hrT/zX0WiwTFpPi3Lii3JJMAMP+40o+VSl9NwxDj52mjhwiMefqiRW2u397O9t
 1/SkVCLXI5XaRGo4SAnXsnQ5mbkx+f1X26BgVe1cPyNwDZV844GQiCWheK0PVF9QAQhx
 mEF8S5wNg1oxiDrzYZu9FZod6YzwMk2o9DuzmIMxX1pPnd3T7FBSGPhrenN+s/PcjZZg
 hi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350376; x=1728955176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAi4gulNhaksWV2hV6e+8oRvcK8JyjNz4xRR0r3KZA=;
 b=bsDvikOojCzyKNbVguStrTllA5KuEMbT7CR+xFODEbm49L3lptFDhnlfOyD+sovC9b
 V/SMwllAPtT2YePXjCcXVKkBvPGvdXYbP8JTjHnGJ29df7Ss/8x3EhbCPPDrOyokR/SY
 UL1Si44tfGYjv6lsptYNITa0whwLa8eLgrM+FYQTaC3DAVmalPp1uDH0KzLhwChz5Z5R
 GepJDFRKDskAmiaqown4C6uXK03TcRs6kiyujjF9uC//aacEEADq/sclX3OGB9UuLdPa
 tzKwLbXZTQJ/CIJs5wBOY2d5ER5QhW8mWoqajaXPTBSwH/p+zlavAkSvwoIuufy6izgd
 vSGg==
X-Gm-Message-State: AOJu0YyMB1YZChdB7qwCzH4kpZm52vl3O9fyWeRD2KqL73qLVUQc/jBf
 SaJbvU8JxtT9jxtiCLsY3UWkArJLTdiTjRB/LFOrdR+6EZrICSrXEK/iVO20GaDsza5n5gQurA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:2cf:b0:71d:f324:bd3e
 with SMTP id
 d2e1a72fcca58-71df324be2cmr39081b3a.3.1728350376065; Mon, 07 Oct 2024
 18:19:36 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:49 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-24-tavip@google.com>
Subject: [PATCH v2 23/25] tests/qtest: add tests for flexcomm spi
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3qIgEZwUKCAs4l6t0rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
X-TUID: NS2xKCYU8lWx

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
index c21b18c304..d3bf33b855 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -233,7 +233,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test', 'flexcomm-spi-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog

