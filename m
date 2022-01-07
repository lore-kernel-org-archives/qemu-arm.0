Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp431834lfb;
        Fri, 7 Jan 2022 14:33:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRtOJCtiWoGk5OWN29g9DPKVird3ytikR5FNuf75F4w87ZCYjI1EHHl4HzL2CDE+X0YYeu
X-Received: by 2002:a5b:b4c:: with SMTP id b12mr4655799ybr.339.1641594786854;
        Fri, 07 Jan 2022 14:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641594786; cv=none;
        d=google.com; s=arc-20160816;
        b=esmXNlLI+pL7l9w3SywyjzcflSoWeRCFm7B2ql8AeydTIkqHtbTFOlb1JTjPTcx7Px
         41l+nc75KxnVBzf539dQw0S8BJ+E7HRoDbF1IsplsZ+iolLZTDUiAK6J3Mu3XgV+4qMO
         FPWQnzKvyVbWSpWopNPOc/6jzdmeMLubRC83QYUeRaoEkSA003rgEX5JVhS0lKh/VC+M
         OwvwT1G/u40oaeO1/dXcAwGwap3PjliytHfjkwGH5nNtoHWLjdi5IaISRnmafGCK7bIj
         zr1mWzhLpKpvwJyn28XCNTCcSG1iHXuA6Y5kuY8sluWUR/xpFHRsNrgghXqColuoB2ag
         zoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=Bew94qxoEdSzZldQXSEl8nkpDsglLZc+907U9iDzJXg=;
        b=vpoVSIePFUiwIGsVZjbE84SivH7hbVRjZQqYZIGgxfVm4Q4bVk/LlpXACSROyM8h21
         rsV620EYRSDxwpYPNOcMIjNtX/X5PS2eZHLnrAYRYJ3DIGfI3v+/nvEI3v6tV2Egudqt
         oOCuQajmD20oxesaz99RzBQUk4SznJ41kQKEdYfrhLaDQw1SWDtN/voTw13Xvl+GN4EG
         6V3PwR+PSGtaHYCAySVxcVZSN8lrgjIXtRRNRMCGtLPnA6MrKBrBu6+cGJ/D2Hu/OdW+
         Fkur+YqOTRF1aeT2dGA9UsMpV3uTmvrcIRboeUzn6ITRjR4w5LADK2I1Pw6uI6pmP3Nq
         CxAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jzzC0+TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si1768361ybk.94.2022.01.07.14.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 14:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jzzC0+TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5xnF-0003CS-Pk
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 17:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Cr7YYQcKCP00jsyzwjlttlqj.htrvjrz-fwrstslsz.twl@flex--venture.bounces.google.com>)
 id 1n5xmL-0001oB-6k
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 17:32:09 -0500
Received: from [2607:f8b0:4864:20::b49] (port=53807
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Cr7YYQcKCP00jsyzwjlttlqj.htrvjrz-fwrstslsz.twl@flex--venture.bounces.google.com>)
 id 1n5xmJ-0007Mt-7D
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 17:32:08 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 a9-20020a251a09000000b0060b2c94d515so14503138yba.20
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 14:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Bew94qxoEdSzZldQXSEl8nkpDsglLZc+907U9iDzJXg=;
 b=jzzC0+TGuWfOW6X36qr+hH2ThEOMcDCHdbW78O97Ma0LVo7S4AGqZvVSiDtNw8F4TO
 WvAR/dhbEUT7UXAxPl6EB+cEMCEED6n5IXpfk9DQprdfIZSiMIGOeTQQuTkq/Jym7eXz
 j69acq26ApQROXX30KZQjOwN57kYnI8qh6yd7pXkX39weC/v1R5JC2xR+Uj520f6tK74
 bqdqPoFQ0TrNsqZwlno+UX+J3IKcmPEbY6tBTZqzf0e3u2i22GEFZUWD+WruzMerE1c4
 e0UwibETUgF6tNzthIVHilAEcKuh1Qvt2Sfaq2KCs8HBDTmXwYHJfDLisYGbXee2KE9W
 aJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Bew94qxoEdSzZldQXSEl8nkpDsglLZc+907U9iDzJXg=;
 b=R07I249tShu3xzKWzysxwxMKlgPq5816X+KuP0/B7ZG9eCjSP3Btqp6VYlbHmTznqH
 rynjWv5RjpzlPCAsjC0xSKzGKXw4dp7FhHf6H1YGZEFZAbrj2wHIMOoZJP8zZnNLP3Nb
 lfbjRuKjeruyWyfS0dCrSVGSloDbC4ONskmlZKpMgBtjKo2pxyyGugVLwqTAyp8njklx
 wUOLT2w4JYLvWmHMoyDBGvqT+lyECxC3vkUEVz1W4BVr65Jmn/dIKd/NOkshnPRFLVed
 YK5PRfZNpNVSl7MJzVexF4CxPEJYd83Zc/MQmwiRAJ0z6Q3uMKHpjWdSYQteWv6oSTHm
 13dA==
X-Gm-Message-State: AOAM533HDBaYK8PHaAW9GRLantu1Nd0WvOnUXIyoEjjJKkszWI4Hs75x
 CH9tPbfJGKmAfkCPzK1qx8Esg0UWWPYA
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:8c24:9ca4:d79e:839d])
 (user=venture job=sendgmr) by 2002:a25:cc55:: with SMTP id
 l82mr73818914ybf.408.1641594378605; Fri, 07 Jan 2022 14:26:18 -0800 (PST)
Date: Fri,  7 Jan 2022 14:25:57 -0800
Message-Id: <20220107222557.3812222-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH] tests/qtest: add qtests for npcm7xx sdhci
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Shengtan Mao <stmao@google.com>,
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Cr7YYQcKCP00jsyzwjlttlqj.htrvjrz-fwrstslsz.twl@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: H88FOwEU+jqz

From: Shengtan Mao <stmao@google.com>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Signed-off-by: Shengtan Mao <stmao@google.com>
---
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
 2 files changed, 202 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa449..b406eba8f6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -189,6 +189,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..feb09b921a
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,201 @@
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
+char *sd_path;
+
+static QTestState *setup_sd_card(void)
+{
+    QTestState *qts = qtest_initf(
+        "-machine kudo-bmc "
+        "-device sd-card,drive=drive0 "
+        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
+        sd_path);
+
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
+    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
+                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
+                     SDHC_CLOCK_INT_EN);
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
+    int ret = write(fd, msg, len);
+    close(fd);
+    g_assert(ret == len);
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
+    int ret = read(fd, rmsg, len);
+    close(fd);
+    g_assert(ret == len);
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
+    QTestState *qts = qtest_init("-machine kudo-bmc");
+
+    uint64_t addr = NPCM7XX_MMC_BA;
+    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
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
+    sd_path = g_strdup("/tmp/qtest.XXXXXX");
+
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
2.34.1.575.g55b058a8bb-goog

