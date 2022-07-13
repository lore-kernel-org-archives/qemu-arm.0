Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp77367lfp;
        Wed, 13 Jul 2022 01:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfmFCtb8p4PjCEg746u/mZuoNLHjZ9uK/rG6YcxyuwPmjGX50GutT4D63ZgYFRmY8INIIA
X-Received: by 2002:a05:6214:cc7:b0:472:f2c1:cf39 with SMTP id 7-20020a0562140cc700b00472f2c1cf39mr1769949qvx.38.1657700487703;
        Wed, 13 Jul 2022 01:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657700487; cv=none;
        d=google.com; s=arc-20160816;
        b=L7cnbE4M+xgfa5ZTnOdbxw/SbD5g6Grw3t6MkLA6gb0AaSgXGI9t7T8GXMyGb3BUsW
         KrplSYkTCWMrcyJpwy65t/DfnCOBPtppGf0QNi40m3/3HtlZoCExKNqRRfkv2MHZgDip
         cPqrke1gk0heqbVuZ0JIiNQEIdboZ74pQkEuRQFCQ+tffm3bhFeawZMaogwMvk/bsE/s
         j6bhZjh4c9qfqmL603mr2k+lLcQT+J/rrwVoovW/dONZLydleiFB5GZRPAWAKgWMpkDa
         g6KqXlKS6JjCbTP1yk8FCTChH90YnU/AWPAICPCndJbM++Lnt9UITjBcfG1qHWS27fHW
         Nq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0PC2pdviT33r4mmOvELrpazkWz56BPJcKuPmrjJp3tc=;
        b=RsdK4mbi/yQorj1OqpW2CPqLs+QwgKFs4hg8tM2EiAyjwf3laGxvoLxrbwFkVtQPTk
         KzFWr1Xt348mnzQdvMKAYs5yf/oOytRdYOCo1pozFMlurGO1fzO+AA7AGqsCCblqb2r0
         PFCErLnYdderSN1HaR6QXVJ2ceUidp60J1n+OTuXaFCrjzZN3MGbvlcFJVKdPx0/9LOv
         rExFCuijz0xS25dn8uD2FWtKRfCRN2XRiZu2PeY9TeFErdzkIDVdGEENTwzsbOMFcrnE
         J407j+7fEtgNxVpkMW7XZJFn4p0bpv9twAYmn4U00nh+4Ud1AQZ+rz4JZv+DtA8MSZTh
         Pq7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ad45ae4000000b0047302f487cbsi8116631qvh.41.2022.07.13.01.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 01:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXcd-0000l1-4T
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 04:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBu-0008EW-Or; Wed, 13 Jul 2022 03:53:51 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52951
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBs-0002bb-M2; Wed, 13 Jul 2022 03:53:50 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHb4ql9z4ySb;
 Wed, 13 Jul 2022 17:53:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHY4LLXz4ySW;
 Wed, 13 Jul 2022 17:53:45 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Iris Chen <irischenlj@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/19] hw: m25p80: add tests for BP and TB bit write protect
Date: Wed, 13 Jul 2022 09:52:52 +0200
Message-Id: <20220713075255.2248923-17-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uSNJIv1BI3fA

From: Iris Chen <irischenlj@fb.com>

Signed-off-by: Iris Chen <irischenlj@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627185234.1911337-3-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_smc-test.c | 111 ++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 1258687eacd8..05ce941566e6 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -192,6 +192,24 @@ static void read_page_mem(uint32_t addr, uint32_t *page)
     }
 }
 
+static void write_page_mem(uint32_t addr, uint32_t write_value)
+{
+    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
+
+    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE + addr + i * 4, write_value);
+    }
+}
+
+static void assert_page_mem(uint32_t addr, uint32_t expected_value)
+{
+    uint32_t page[FLASH_PAGE_SIZE / 4];
+    read_page_mem(addr, page);
+    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, expected_value);
+    }
+}
+
 static void test_erase_sector(void)
 {
     uint32_t some_page_addr = 0x600 * FLASH_PAGE_SIZE;
@@ -501,6 +519,95 @@ static void test_status_reg_write_protection(void)
     flash_reset();
 }
 
+static void test_write_block_protect(void)
+{
+    uint32_t sector_size = 65536;
+    uint32_t n_sectors = 512;
+
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+    spi_conf(CONF_ENABLE_W0);
+
+    uint32_t bp_bits = 0b0;
+
+    for (int i = 0; i < 16; i++) {
+        bp_bits = ((i & 0b1000) << 3) | ((i & 0b0111) << 2);
+
+        spi_ctrl_start_user();
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, WRSR);
+        writeb(ASPEED_FLASH_BASE, bp_bits);
+        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        spi_ctrl_stop_user();
+
+        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
+        uint32_t protection_start = n_sectors - num_protected_sectors;
+        uint32_t protection_end = n_sectors;
+
+        for (int sector = 0; sector < n_sectors; sector++) {
+            uint32_t addr = sector * sector_size;
+
+            assert_page_mem(addr, 0xffffffff);
+            write_page_mem(addr, make_be32(0xabcdef12));
+
+            uint32_t expected_value = protection_start <= sector
+                                      && sector < protection_end
+                                      ? 0xffffffff : 0xabcdef12;
+
+            assert_page_mem(addr, expected_value);
+        }
+    }
+
+    flash_reset();
+}
+
+static void test_write_block_protect_bottom_bit(void)
+{
+    uint32_t sector_size = 65536;
+    uint32_t n_sectors = 512;
+
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+    spi_conf(CONF_ENABLE_W0);
+
+    /* top bottom bit is enabled */
+    uint32_t bp_bits = 0b00100 << 3;
+
+    for (int i = 0; i < 16; i++) {
+        bp_bits = (((i & 0b1000) | 0b0100) << 3) | ((i & 0b0111) << 2);
+
+        spi_ctrl_start_user();
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        writeb(ASPEED_FLASH_BASE, WRSR);
+        writeb(ASPEED_FLASH_BASE, bp_bits);
+        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+        writeb(ASPEED_FLASH_BASE, WREN);
+        spi_ctrl_stop_user();
+
+        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
+        uint32_t protection_start = 0;
+        uint32_t protection_end = num_protected_sectors;
+
+        for (int sector = 0; sector < n_sectors; sector++) {
+            uint32_t addr = sector * sector_size;
+
+            assert_page_mem(addr, 0xffffffff);
+            write_page_mem(addr, make_be32(0xabcdef12));
+
+            uint32_t expected_value = protection_start <= sector
+                                      && sector < protection_end
+                                      ? 0xffffffff : 0xabcdef12;
+
+            assert_page_mem(addr, expected_value);
+        }
+    }
+
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -529,6 +636,10 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
     qtest_add_func("/ast2400/smc/status_reg_write_protection",
                    test_status_reg_write_protection);
+    qtest_add_func("/ast2400/smc/write_block_protect",
+                   test_write_block_protect);
+    qtest_add_func("/ast2400/smc/write_block_protect_bottom_bit",
+                   test_write_block_protect_bottom_bit);
 
     flash_reset();
     ret = g_test_run();
-- 
2.35.3

