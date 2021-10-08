Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1967416lfp;
        Thu, 7 Oct 2021 17:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNTeiHbfnZmoR4/NJ0+24CQQxF4CoSvtCsMf79luSHCI5JGsfsGLBeIJXWPBqiCYJFi62w
X-Received: by 2002:ac8:24e:: with SMTP id o14mr8342826qtg.183.1633653193948;
        Thu, 07 Oct 2021 17:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633653193; cv=none;
        d=google.com; s=arc-20160816;
        b=i3+FfEyMr49PAj6e6pFji0Zp5cWGsAmFytzA/ScanvF3DVf9+v3iWxOTEABCyoM66F
         pr4JiAk8Imzx0dfUr8gIrneWeszYMSjFSHyI+oqlGigmXmTud2FndU4kcNcVb5dwlGib
         h7vKm5p3cbOrP7Vp38l4CNzX3t4dJBaC1/2YXM+U+ZbH3JZ0LNhJ9E8fWBtQkcRnTTqH
         hZxH3A0EYj/u+l/aaZLoi1h/2NulA41Cn6nB/9cTOaLtKkfvSiLI4Q29SrAxRGTr2gjM
         8cjQRjtuQZXc6v+mbP9DZid1PrBB6JJ85Fi2uBZs8d19G25lrzAOJzClH7sHeg/36pV2
         UjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=0lpamIiCSj7zwyNuTtEiKwj83a+jInPHPYjASRzEVBU=;
        b=0he3GPvLvYY9r8T9+vqQef8zZ19td9QDuV7DeiyvExqTScXy493tKOYc4hY9ZrLHqj
         xzSIDRw1xzU9kTJM+u9a8TstP5cFPoSF7EIcqgzS1UtQYPcZZlOb/OygAyiCdxFj4xES
         u1icc/AbbhBpnhsbdmnCCWVGVbJHNo8IBeeMKT9O4hUvLbHaHP/Tn2H3dLEPJTsv7pa0
         oysFnGA2FaCV0ezFalHRN+7FsxIJMubb6+ceOp0KxZSL/yKH0nswRh8IwRVRIjNk8Ooi
         +YpmTmMw1PhU4ECHGQMeVROWS34qhCkvJHymHnLlCrWHp+tvvZ2WzFtDgyjZCqwK/3Zm
         nBbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QDqTl999;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i66si621035qkd.277.2021.10.07.17.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 17:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QDqTl999;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYdp3-0000Ut-EL
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 20:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3TpBfYQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mYdj0-0001Hz-U2
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:58 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:51143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3TpBfYQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiy-0004co-Tk
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:58 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 gg17-20020a17090b0a1100b0019fa04f17b5so3968887pjb.0
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 17:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0lpamIiCSj7zwyNuTtEiKwj83a+jInPHPYjASRzEVBU=;
 b=QDqTl999PekXC7t2+k8D+TxFfaZuSoynjUjMZUfhrjmqy75bFvq0iokJb72phLxm8H
 +bsMIzebBIg3gw4RgfJaj0vKPtH93916crPcpFuOv8mebPhObyom2KwpVAS4xe0rs1ou
 WA+0x/7ZQVRSQAxEaDCgtV2+LOuwcldUY3RWq0erySXl/mZrSH6x4/LgAKDozpbNdtMk
 YS9EpOOVjX6pWcry6Ah+FAbNzZHwTRA/OfoXPJjUXkxi2+ONwKkglHvpYe4FR8W1Deju
 t7cfjz0JtwnTPLZXiwfMQZqDwSGuM+bO1/XtbZTOL2n758c3F+B+01/Na2tFRsfIiUMU
 QqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0lpamIiCSj7zwyNuTtEiKwj83a+jInPHPYjASRzEVBU=;
 b=s3JH29327DIeFixVhfaKzf/JEoBH2zvxBguEUhAhWqEndLOlZp8RdnSCcLDpioyxnh
 JHPEJZpmWA0EWiRRKm2jnpBH3HJ30izaUjNNZhtaR22SzG9xlPtetY/4zYWN8/4F/Ef/
 /cUz57B1KVhasXErBAzk/dvkyBSpm3zaXccd3LT7mBpQcV+abU1Vv9wB/eiKXBsP5CB1
 tpArN/UiwD9OBj+hbCL/Tr1NPna2FLjmje8lJr7QTXZOIxASzUiYxcGoC9Gy1VBMc5z+
 YaVrTSPfL2V5PcK8Eig0PK4KwlbFtiMt2C2SIfeuXh6fXc4evjAl+rT7I+f8xZbRfioQ
 GgQA==
X-Gm-Message-State: AOAM53346cHH2T5G9pAlCltTs337E+6RX6mEKPVp0AU6B7RhY4E+XIk9
 Bo3PCAJsBbWu5pG9g/iqS4lYGtt4zuWppA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:3ee4:: with SMTP id
 k91mr194144pjc.1.1633652814411; Thu, 07 Oct 2021 17:26:54 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:28 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 5/5] tests/qtest: add qtests for npcm7xx sdhci
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3TpBfYQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: W/EQGVFq+Uav

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 19444d4752..989da9ceb4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -157,6 +157,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..a6732f657d
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,209 @@
+/*
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sd/npcm7xx_sdhci.h"
+
+#include "libqos/libqtest.h"
+#include "libqtest-single.h"
+#include "libqos/sdhci-cmd.h"
+
+#define NPCM7XX_MMC_BA 0xF0842000
+#define NPCM7XX_BLK_SIZE 512
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+
+static char *sd_path;
+
+static QTestState *setup_sd_card(void)
+{
+    QTestState *qts = qtest_initf(
+        "-machine quanta-gbs-bmc "
+        "-device sd-card,drive=drive0 "
+        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
+        sd_path);
+
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
+                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
+                 SDHC_CLOCK_INT_EN);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
+                   SDHC_SELECT_DESELECT_CARD);
+
+    return qts;
+}
+
+static void write_sdread(QTestState *qts, const char *msg)
+{
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message to sd */
+    int fd = open(sd_path, O_WRONLY);
+    int ret;
+
+    g_assert(fd > 0);
+    ret = write(fd, msg, len);
+    g_assert(ret == len);
+    ret = close(fd);
+    g_assert(ret == 0);
+
+    /* read message using sdhci */
+    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
+    g_assert(ret == len);
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
+}
+
+/* Check MMC can read values from sd */
+static void test_read_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    write_sdread(qts, "hello world");
+    write_sdread(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+static void sdwrite_read(QTestState *qts, const char *msg)
+{
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message using sdhci */
+    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
+
+    /* read message from sd */
+    int fd = open(sd_path, O_RDONLY);
+    int ret;
+
+    g_assert(fd > 0);
+    ret = read(fd, rmsg, len);
+    g_assert(ret == len);
+    ret = close(fd);
+    g_assert(ret == 0);
+
+    g_assert(!strcmp(rmsg, msg));
+
+    free(rmsg);
+}
+
+/* Check MMC can write values to sd */
+static void test_write_sd(void)
+{
+    QTestState *qts = setup_sd_card();
+
+    sdwrite_read(qts, "hello world");
+    sdwrite_read(qts, "goodbye");
+
+    qtest_quit(qts);
+}
+
+/* Check SDHCI has correct default values. */
+static void test_reset(void)
+{
+    QTestState *qts = qtest_init("-machine quanta-gbs-bmc");
+
+    uint64_t addr = NPCM7XX_MMC_BA;
+    uint64_t end_addr = addr + 0x100;
+    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
+                                  NPCM7XX_PRSTVALS_1_RESET,
+                                  0,
+                                  NPCM7XX_PRSTVALS_3_RESET,
+                                  0,
+                                  0};
+    int i;
+    uint32_t mask;
+    while (addr < end_addr) {
+        switch (addr - NPCM7XX_MMC_BA) {
+        case SDHC_PRNSTS:
+            /* ignores bits 20 to 24: they are changed when reading registers */
+            mask = 0x1f00000;
+            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
+                            NPCM7XX_PRSNTS_RESET | mask);
+            addr += 4;
+            break;
+        case SDHC_BLKGAP:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, NPCM7XX_BLKGAP_RESET);
+            addr += 1;
+            break;
+        case SDHC_CAPAB:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_CAPAB_RESET);
+            addr += 8;
+            break;
+        case SDHC_MAXCURR:
+            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_MAXCURR_RESET);
+            addr += 8;
+            break;
+        case SDHC_HCVER:
+            g_assert_cmphex(qtest_readw(qts, addr), ==, NPCM7XX_HCVER_RESET);
+            addr += 2;
+            break;
+        case NPCM7XX_PRSTVALS:
+            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
+                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
+                                prstvals_resets[i]);
+            }
+            addr += NPCM7XX_PRSTVALS_SIZE * 2;
+            break;
+        default:
+            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
+            addr += 1;
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+static void drive_destroy(void)
+{
+    unlink(sd_path);
+    g_free(sd_path);
+}
+
+static void drive_create(void)
+{
+    int fd, ret;
+
+    sd_path = g_strdup("/tmp/qtest_npcm7xx_sdhci.XXXXXX");
+    /* Create a temporary raw image */
+    fd = mkstemp(sd_path);
+    g_assert_cmpint(fd, >=, 0);
+    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    g_message("%s", sd_path);
+    close(fd);
+}
+
+int main(int argc, char **argv)
+{
+    drive_create();
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
+    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
+    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
+
+    int ret = g_test_run();
+    drive_destroy();
+    return ret;
+}
-- 
2.33.0.882.g93a45727a2-goog

