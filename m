Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1949111lfq;
        Fri, 25 Feb 2022 09:58:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjqxgEVd9vBANEezlE0wDSz8VweWaThmbpScg9uOHRd0piUuF9cN517QtgNCIZrRsUP+xu
X-Received: by 2002:a05:6214:518c:b0:42c:2caf:ce8f with SMTP id kl12-20020a056214518c00b0042c2cafce8fmr6971916qvb.48.1645811922801;
        Fri, 25 Feb 2022 09:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645811922; cv=none;
        d=google.com; s=arc-20160816;
        b=NDfbW6G9XEf/Zqf1oZT/Y/K5ioHmNDr0EnDnz+m/VBAgfFyj8l5vrGWISXSg22tajA
         ji/U8Bz9T2jrXYmemBkEE1u7f35U1KA8U8geoK8ezHyAKQXY5UDItC6Y4nOz79zy5B+8
         YdgRCVCbOrClmhxbC7H/KIeqzFaBhfPccmkzckjgNl54GbXjhKO9MbtiCllzP+ejpnhj
         vrT6BEPDb/wz+LBoB5Iy9x717IltddZKGLNUtKQ/FCtULKvf3g02vDQ2EKWkC8T+agTk
         3tlKxSHic2JOMWOB4tZ0HCTKcbYb16eRkAMQBv+RYiYpa4VNsy63hsQ6oTH7kNT9Gbf+
         /YRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=NwrtIIr4XO5hQjGMRN+xQbv899VwnM/nnI4lqATjBBI=;
        b=FAHZ/fDk2XTOP3aKb1VIp8Kk8NBBcXUrjwoyr4vBqBx1FTlxiWCrl0KLFGfBH0SDNQ
         bx10i3duygBQlC+OozI/XBWKT5WO5ngsCjMsUoMfVXzlm5iy6b/hk9x20sYyQ8A0ZLhY
         MwTYtbGrnZtnK7YBT/rM20DiXNSx5IpyJE/ay9PqMVS14XNGm6jfWXWut0LaU0Bo7njf
         HVU1J/U1gvc19ZO/zlA+tkS0YdcNuUXsuRQug8GbbCIU+h45tTvXH1Idm0k+fqhbsRae
         2cyxVykOaRuqmKOrnGdJbhuMpwNg4MKm+LsyNUlPJN5PgMx1ef4/VeJmrhNtqxZQV+jd
         ZYag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=J4NFbNn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020ac85cd3000000b002de57e3c756si1907214qta.566.2022.02.25.09.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Feb 2022 09:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=J4NFbNn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNera-0000yw-8p
	for alex.bennee@linaro.org; Fri, 25 Feb 2022 12:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ohUZYggKCEk75slz43srzzrwp.nzx1px5-l2xyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1nNelv-000063-BP
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 12:52:51 -0500
Received: from [2607:f8b0:4864:20::a4a] (port=53783
 helo=mail-vk1-xa4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ohUZYggKCEk75slz43srzzrwp.nzx1px5-l2xyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1nNelt-0000Qh-4T
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 12:52:51 -0500
Received: by mail-vk1-xa4a.google.com with SMTP id
 n19-20020ac5c253000000b003030c0efe45so567287vkk.20
 for <qemu-arm@nongnu.org>; Fri, 25 Feb 2022 09:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NwrtIIr4XO5hQjGMRN+xQbv899VwnM/nnI4lqATjBBI=;
 b=J4NFbNn3xNLxWE/OgVwMm94gNFly3qwh7IeTPPh55dk205GzFRlgHYpJyn0xgdB9cn
 j63+kWILfD1l/Lasq0WG9EdMpTjtn9olGeKZDqyCM4LONAkRTfmsjEwKcFEH2xKDEtn5
 5gziCoGFMs9TMe4Up1V8uLMJProwgW3IVuTa1CnitWzNjG3Zykpm9EhcU9VoTf4h+RH6
 ek8SaHdwlx2jxVa5XP30WQKWUib8iEfzGSzf9+kzSCUm8hLSDOlyYPi6IXpR0/C0RYAt
 WLWwzja4Bx1UsMfvWAHsRRLsqYZUIT1YnQ4Lo+6BKPcIKj8T8tTL+pNMuaHX4GNAX/Cq
 wh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NwrtIIr4XO5hQjGMRN+xQbv899VwnM/nnI4lqATjBBI=;
 b=2EzuPveOJ9y+hdVQ7EnBVqoXGToy4LsmCuUWZwPQ39pueswCrKiNfAck3gMsaMbIZe
 JMaxXMDYNPBKWPtceHhb4QV81hzqnryaYV6E19CIE4L4lZpRI1sapw3TDg3mpzw6bAjj
 6Dy6irouHKMln9QvzuzMpQh6ONFETJJzZ5I097zuJDFMoCYOLxfniBcgNiUIe1ffJrIW
 QDjeSPXKUVeBeEY0xsuKrN9Dws1yQYJAkePJ0DYqZgEByFLpTbJjhXeGnvL+ys0PsWAB
 jgdgyUrGK5FYNfgyBvlTFlbE1viGJ9LDdLoMo2D6/pPBjG2Le+uHuWdK4My4tFYhpC62
 kwfw==
X-Gm-Message-State: AOAM531Qzzz/rmLfyZIgP/WiSBOk4qcP61GBnkWF4Fm9lfkWG2vqp8rd
 ntU6qbhrenAOhXFt7VZumJl0HG3b9vnHSw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1c09:0:b0:4e1:716c:7614 with SMTP id
 c9-20020a621c09000000b004e1716c7614mr8858468pfc.84.1645811106363; Fri, 25 Feb
 2022 09:45:06 -0800 (PST)
Date: Fri, 25 Feb 2022 09:44:51 -0800
Message-Id: <20220225174451.192304-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
Subject: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
From: Hao Wu <wuhaotsh@google.com>
To: thuth@redhat.com, peter.maydell@linaro.org, lvivier@redhat.com, 
 pbonzini@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 richard.henderson@linaro.org, Shengtan Mao <stmao@google.com>, 
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a4a;
 envelope-from=3ohUZYggKCEk75slz43srzzrwp.nzx1px5-l2xyzyry5.z2r@flex--wuhaotsh.bounces.google.com;
 helo=mail-vk1-xa4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: TFKQShg7/pX5

From: Shengtan Mao <stmao@google.com>

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Signed-off-by: Shengtan Mao <stmao@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
v5
 * use memcmp to compare whether strings are expected
v4
 * use strncmp instead of strcmp
v3:
 * fixup compilation from missing macro value
v2:
 * update copyright year
 * check result of open
 * use g_free instead of free
 * move declarations to the top
 * use g_file_open_tmp
---
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 215 +++++++++++++++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f33d84d19b..721eafad12 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -190,6 +190,7 @@ qtests_npcm7xx = \
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
+   'npcm7xx_sdhci-test',
    'npcm7xx_smbus-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
new file mode 100644
index 0000000000..c1f496fb29
--- /dev/null
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -0,0 +1,215 @@
+/*
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
+ *
+ * Copyright (c) 2022 Google LLC
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
+#define NPCM7XX_REG_SIZE 0x100
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
+    int fd, ret;
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message to sd */
+    fd = open(sd_path, O_WRONLY);
+    g_assert(fd >= 0);
+    ret = write(fd, msg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    /* read message using sdhci */
+    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
+    g_assert(ret == len);
+    g_assert(!memcmp(rmsg, msg, len));
+
+    g_free(rmsg);
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
+    int fd, ret;
+    size_t len = strlen(msg);
+    char *rmsg = g_malloc(len);
+
+    /* write message using sdhci */
+    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
+
+    /* read message from sd */
+    fd = open(sd_path, O_RDONLY);
+    g_assert(fd >= 0);
+    ret = read(fd, rmsg, len);
+    close(fd);
+    g_assert(ret == len);
+
+    g_assert(!memcmp(rmsg, msg, len));
+
+    g_free(rmsg);
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
+
+    while (addr < end_addr) {
+        switch (addr - NPCM7XX_MMC_BA) {
+        case SDHC_PRNSTS:
+            /*
+             * ignores bits 20 to 24: they are changed when reading registers
+             */
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
+    GError *error = NULL;
+
+    /* Create a temporary raw image */
+    fd = g_file_open_tmp("sdhci_XXXXXX", &sd_path, &error);
+    if (fd == -1) {
+        fprintf(stderr, "unable to create sdhci file: %s\n", error->message);
+        g_error_free(error);
+    }
+    g_assert(sd_path != NULL);
+
+    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
+    g_assert_cmpint(ret, ==, 0);
+    g_message("%s", sd_path);
+    close(fd);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    drive_create();
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
+    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
+    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
+
+    ret = g_test_run();
+    drive_destroy();
+    return ret;
+}
-- 
2.35.1.574.g5d30c73bfb-goog

