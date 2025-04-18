Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp101770njd;
        Fri, 18 Apr 2025 02:12:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjEz+cuH9F9DMmDcM8IigBKn6rZl+xRW9CvxxFrwU+bJ2g2ZCqnoqAXkri0A7KyntYJP7eBOWCtS1LTw==@linaro.org
X-Google-Smtp-Source: AGHT+IHJAC3Bh3QTlN5GjGaweK4WLhln7lwK+VBgRy/z6+NZ4pNyzPUHrKpxXCWDZtpPjO22kx0D
X-Received: by 2002:a05:620a:1aa4:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7c92800eb4dmr266552385a.39.1744967558163;
        Fri, 18 Apr 2025 02:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744967558; cv=none;
        d=google.com; s=arc-20240605;
        b=g/BcXnSlW5iX/QuS57meI3A8ggVyszTavewtZGFwwDW5q0RnPHwhAsoihViWYaxUwa
         0H3UODF5CQ/+8OFufXQbSzGPisCFONiqAOQn0uiUucH+VAO/rkXzZHWSavovd5c0Z6jn
         AwKs08b22Dk1ndFhg/jkZUWAFAV+YkGAEVCOFySUbW5x4N4wPOtTaoPDZ2fhl2L1x9cD
         QNP2pBTvdc96TqndmKhg7pGHw1IDaOYzNjyIMDq719kOK93AGaB6y+YRVRcHF/ryDvRh
         SMl2VClR/+kEVuGanrqEGhRsc4C9/nRY1dcdVi4/2l56BrFz3a6/cQd8iq7BcSWjnPNm
         NgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6CI12ttItHcMSh53TsGyuf/PuGGoebtdM3ZV8W4rVlU=;
        fh=lkOgkDa1aJAp2lPq/glICE+Jj8OxibxgzXkAQy3GDBM=;
        b=AK4T+vhtVZ3+QhhJhsOq8LjvMZ+W4qgv4gqieUKv08Bl129dJzS8C6eCRwzpXMsAjV
         KK0DB9ZEFJ7xCfLEDc3iywIRipVTYyDVF4AsaPy5/MwDHLDct3Qj17H8pQAkWyxnNhZR
         3vHqeR4U2DHTGWyQvZR0UIy3d7d+pCOXW4nkkWvB3GhpqRcCzwLyPRjQo76gGmseZ4Q6
         abKxNPAXDI4TGKJlkzg7b4Ov9GXTGZM8G7zE3F/ROJray06or/ppga+74ee7WAKwOCi7
         nW6LqjBxCSDJH3lnQA/wdsIsB/q83OQunH2xgPg2bOL/cdS+j6+hnd/xAhLRKJjI/SVS
         ZeHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H58c+KaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925ab072fsi188552985a.126.2025.04.18.02.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 02:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H58c+KaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5hls-0007HZ-Im; Fri, 18 Apr 2025 05:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1u5hlr-0007GG-EU; Fri, 18 Apr 2025 05:12:27 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1u5hlp-00055R-6s; Fri, 18 Apr 2025 05:12:27 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-af523f4511fso1428457a12.0; 
 Fri, 18 Apr 2025 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744967542; x=1745572342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6CI12ttItHcMSh53TsGyuf/PuGGoebtdM3ZV8W4rVlU=;
 b=H58c+KaBNS2COqQH/D3Ujf7qfJh6HINrTmgpv5tdx/X3X2UhqdtRXV/VSO3MFxgTXT
 xZHFYvNwSAB6tSMryHPa1Eyn/OwkNWDsROHhY+Bl2Pp4wfUlpuqV9iaqG60+qA2ehvcY
 x3P6ZoyXxeio4gn05pvpMCnbQu+3h1jTSLIZ2bETcvRds4AbdfQIxPbHQ9bG+wa1yrJO
 E+HdtmG5+KDC5ZDsAVe++LNZZiB3lnnYXJMvU6cbLVNolZO1lRXjzc0REuM3YJMPHtQn
 dr0cBFCtcY2vnSdiZ1BXukfxD6qww60Tzf0RuoSf0uAEfnhbI2cX0XoCrsi41gE8QDVd
 Z0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744967542; x=1745572342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6CI12ttItHcMSh53TsGyuf/PuGGoebtdM3ZV8W4rVlU=;
 b=Nws/Y9rRRIA4v+P5dTx9NT5uheHFWTyOnoTKvQSyuRflJ5i0yCLQ2vsWMBs88KSUQ+
 WVHsIVsw0TDqQBdg30l10oQTRxyh6XgChIgRPUrd0xWrLRUbItiXnqpunUerqrHbzcyk
 pbFIWsQBSAuq24JFMLTm0twp0iIgW6yJsGg6JRcdd9jV030uhsrqqqBXIZdb2Oa6mGAp
 tI4GxGeeJU9/4/Yb1gZu8JxqHJi3rJTIBemFuqqNANnAGq9cGPXlBDCB3WkSJ60H5eDN
 N542eWsmtgMU2Cl1i4YIG7yZFto4hBYx4SFao8yAeEJWrGlA3qSlb7fB8Z3WRuK+2MX9
 lfvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXblFyaqCasn+1yHhmeuQZ0Dr3/FfLO26+WN4sx9Kj3QybKBGfM6+PPoOX5mvcOJHEr5fkqUXzaKcv0@nongnu.org
X-Gm-Message-State: AOJu0YzADXgJSjqDqGwM8P03sl4boPWTjy/ojL19kAKgJcT1rclE2ngm
 XRwbUYLi+bLQXPcn5SB5V5buSMaXxDg/vMe96Atmc3Rlw9+k3KIt
X-Gm-Gg: ASbGncsz8ZWEBnABnzfcNMRbxRdJlN8f4fCC+++bycTw95Hon953zMJIze3mVX4QlwA
 X2ECWAHt2aeOPzr+XTxDHKbVLiuT1GZ0Hvi/0lqBwdliopOzwZ0dHuX/hAM5P89Y/DT4p18gU6S
 mpGMUwWyV/XVeYTnD7Dm0Zkp7qvlL7hRYRzEkJGeYd9DAflYeBT5SndPCwcGOhn0mx0zpD/EGv9
 +mIpeeHtgyMwnQV62rVnWOEiTPtvQ+LwWlbKdrqZ6hTLg8oZZF2IUNjM54+FR+7xJfMrT3BbgZw
 Lbi8kVHlZAKPz7SNNN3J7MVf+Akx9YMosDPC3ZgoplvJDgFyMVmfGRk/FY4vzdKbkM9CmqLPVAK
 dVjQS5oZy
X-Received: by 2002:a17:90b:51c2:b0:2ee:edae:75e with SMTP id
 98e67ed59e1d1-3087bb53218mr3339214a91.13.1744967542136; 
 Fri, 18 Apr 2025 02:12:22 -0700 (PDT)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3085380966csm3899344a91.0.2025.04.18.02.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 02:12:21 -0700 (PDT)
From: Tim Lee <timlee660101@gmail.com>
To: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Tim Lee <timlee660101@gmail.com>
Subject: [PATCH] tests/qtest: Add qtest for NPCM8XX PSPI module
Date: Fri, 18 Apr 2025 17:12:08 +0800
Message-Id: <20250418091208.1888768-1-timlee660101@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=timlee660101@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: w+GjoNLgoTa+

- Created qtest to check initialization of registers in PSPI Module
- Implemented test into Build File

Tested:
./build/tests/qtest/npcm8xx-pspi_test

Signed-off-by: Tim Lee <timlee660101@gmail.com>
---
 MAINTAINERS                     |   1 +
 tests/qtest/meson.build         |   3 +
 tests/qtest/npcm8xx_pspi-test.c | 104 ++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 tests/qtest/npcm8xx_pspi-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f8..0162f59bf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -892,6 +892,7 @@ F: hw/sensor/adm1266.c
 F: include/hw/*/npcm*
 F: tests/qtest/npcm*
 F: tests/qtest/adm1266-test.c
+F: tests/qtest/npcm8xx_pspi-test.c
 F: pc-bios/npcm7xx_bootrom.bin
 F: pc-bios/npcm8xx_bootrom.bin
 F: roms/vbootrom
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3136d15e0f..88672a8b00 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -210,6 +210,8 @@ qtests_npcm7xx = \
    'npcm7xx_watchdog_timer-test',
    'npcm_gmac-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
+qtests_npcm8xx = \
+  ['npcm8xx_pspi-test']
 qtests_aspeed = \
   ['aspeed_hace-test',
    'aspeed_smc-test',
@@ -257,6 +259,7 @@ qtests_aarch64 = \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
+  (config_all_devices.has_key('CONFIG_NPCM8XX') ? qtests_npcm8xx : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
diff --git a/tests/qtest/npcm8xx_pspi-test.c b/tests/qtest/npcm8xx_pspi-test.c
new file mode 100644
index 0000000000..107bce681f
--- /dev/null
+++ b/tests/qtest/npcm8xx_pspi-test.c
@@ -0,0 +1,104 @@
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+
+#define DATA_OFFSET 0x00
+#define CTL_SPIEN   0x01
+#define CTL_OFFSET  0x02
+#define CTL_MOD     0x04
+
+typedef struct PSPI {
+    uint64_t base_addr;
+} PSPI;
+
+PSPI pspi_defs = {
+    .base_addr  = 0xf0201000
+};
+
+static uint16_t pspi_read_data(QTestState *qts, const PSPI *pspi)
+{
+    return qtest_readw(qts, pspi->base_addr + DATA_OFFSET);
+}
+
+static void pspi_write_data(QTestState *qts, const PSPI *pspi, uint16_t value)
+{
+    qtest_writew(qts, pspi->base_addr + DATA_OFFSET, value);
+}
+
+static uint32_t pspi_read_ctl(QTestState *qts, const PSPI *pspi)
+{
+    return qtest_readl(qts, pspi->base_addr + CTL_OFFSET);
+}
+
+static void pspi_write_ctl(QTestState *qts, const PSPI *pspi, uint32_t value)
+{
+    qtest_writel(qts, pspi->base_addr + CTL_OFFSET, value);
+}
+
+/* Check PSPI can be reset to default value */
+static void test_init(gconstpointer pspi_p)
+{
+    const PSPI *pspi = pspi_p;
+
+    QTestState *qts = qtest_init("-machine npcm845-evb");
+    pspi_write_ctl(qts, pspi, CTL_SPIEN);
+    g_assert_cmphex(pspi_read_ctl(qts, pspi), ==, CTL_SPIEN);
+
+    qtest_quit(qts);
+}
+
+/* Check PSPI can be r/w data register */
+static void test_data(gconstpointer pspi_p)
+{
+    const PSPI *pspi = pspi_p;
+    uint16_t test = 0x1234;
+    uint16_t output;
+
+    QTestState *qts = qtest_init("-machine npcm845-evb");
+
+    /* Write to data register */
+    pspi_write_data(qts, pspi, test);
+    printf("Wrote 0x%x to data register\n", test);
+
+    /* Read from data register */
+    output = pspi_read_data(qts, pspi);
+    printf("Read 0x%x from data register\n", output);
+
+    qtest_quit(qts);
+}
+
+/* Check PSPI can be r/w control register */
+static void test_ctl(gconstpointer pspi_p)
+{
+    const PSPI *pspi = pspi_p;
+    uint8_t control = CTL_MOD;
+
+    QTestState *qts = qtest_init("-machine npcm845-evb");
+
+    /* Write CTL_MOD value to control register for 16-bit interface mode */
+    qtest_memwrite(qts, pspi->base_addr + CTL_OFFSET,
+                   &control, sizeof(control));
+    g_assert_cmphex(pspi_read_ctl(qts, pspi), ==, control);
+    printf("Wrote CTL_MOD to control register\n");
+
+    qtest_quit(qts);
+}
+
+static void pspi_add_test(const char *name, const PSPI* wd,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf("npcm8xx_pspi/%s",  name);
+    qtest_add_data_func(full_name, wd, fn);
+}
+
+#define add_test(name, td) pspi_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    add_test(init, &pspi_defs);
+    add_test(ctl, &pspi_defs);
+    add_test(data, &pspi_defs);
+    return g_test_run();
+}
-- 
2.34.1

