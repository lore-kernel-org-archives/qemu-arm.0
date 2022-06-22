Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1883151lft;
        Wed, 22 Jun 2022 03:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0F1aUtO0Llnqzjx09jEkWQMRbJMbSirpAHTCk28A5rCD6qdsb8wYEjcfmYXgxu8HcTz/X
X-Received: by 2002:ad4:5dcd:0:b0:470:3909:fc4c with SMTP id m13-20020ad45dcd000000b004703909fc4cmr15742651qvh.87.1655892803587;
        Wed, 22 Jun 2022 03:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655892803; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb21RM8oV9aHW3ouWKz4VwhdrHUuYqTvR4vkvJGz2bxdHOkQqwMS86UObEdbBiVozl
         I8vNcNRXcK3vfQZY53As6Xkgq2nbYHmZ65usoxIRQo27MDxBItNOaAZH+8e3b0PlvQhi
         33AnOEq2qzQpemyS3LNF2u3lntmDaAoXUzwquKduwxwFdGJ1C882a0Tsd5npJI/7C54M
         IGHBqlT5n8w4qgbBVqdfJJeU2ounDgdrhBxpUYS2dOj1aVWx+hThlIxxp68yQDpR6q5T
         WBlUJYh/OvwpKv5obzsg/sk/hKlC63vDrSOoeDKBwhiIf/kiyw4AUNaaMzvubtVoBGqZ
         CM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lImZ2p8NnQdfNjmau4Cq0cwt3/UTF+p0KXTqH/0AUzs=;
        b=Q+T+JKXqlddwDbqE4KQauCWmuZbjuiFFwp40hajX+mATKkYxKl/XlNnw7v5Xzld5Ox
         b9uy2eZVvLKd8ub+POXgxT3/r1Kpsl+2UFB2lV7P20x6+D0sYlXGrqWC+2s/1MmaUOHp
         ZPaYoYrIP1UB/BUw+Ut9CpNx7c5TKNC6Hp/HxZVMIQNneejO1yDdkZBIPy7U8FMk4Awz
         9h/41SGR5ietjU7i/r/96zuplABm+ueul7R60GM3AMnxaMoFHYAuEPW6LpVtC8wxSIq+
         1Cb/fqWV47tpnc2V4NBbdnmKQKcebtOTK+7s2jkE6vcn2vTjiNYh6nPGV1ZSKL+6iShT
         faSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de7-20020a05620a370700b006a75bf356a3si12175264qkb.664.2022.06.22.03.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xMR-00053G-2Z
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x63-00070M-Is; Wed, 22 Jun 2022 05:56:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5x-0004rR-44; Wed, 22 Jun 2022 05:56:27 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0b4PTbz4xYD;
 Wed, 22 Jun 2022 19:56:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0Y2dcQz4xD9;
 Wed, 22 Jun 2022 19:56:13 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Iris Chen <irischenlj@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/19] hw: m25p80: fixing individual test failure when tests
 are running in isolation
Date: Wed, 22 Jun 2022 11:55:20 +0200
Message-Id: <20220622095520.3683321-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: j9XevEqkPWe/

From: Iris Chen <irischenlj@fb.com>

Signed-off-by: Iris Chen <irischenlj@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index ec233315e6c6..b1e682db6545 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -135,6 +135,9 @@ static void flash_reset(void)
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, RESET_ENABLE);
     writeb(ASPEED_FLASH_BASE, RESET_MEMORY);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+    writeb(ASPEED_FLASH_BASE, WRDI);
     spi_ctrl_stop_user();
 
     spi_conf_remove(CONF_ENABLE_W0);
@@ -195,21 +198,41 @@ static void test_erase_sector(void)
 
     spi_conf(CONF_ENABLE_W0);
 
+    /*
+     * Previous page should be full of 0xffs after backend is
+     * initialized
+     */
+    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+
     spi_ctrl_start_user();
-    writeb(ASPEED_FLASH_BASE, WREN);
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
-    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
     writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
+    }
     spi_ctrl_stop_user();
 
-    /* Previous page should be full of zeroes as backend is not
-     * initialized */
-    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    /* Check the page is correctly written */
+    read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
-        g_assert_cmphex(page[i], ==, 0x0);
+        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
     }
 
-    /* But this one was erased */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
+    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+    spi_ctrl_stop_user();
+
+    /* Check the page is erased */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
         g_assert_cmphex(page[i], ==, 0xffffffff);
@@ -226,11 +249,31 @@ static void test_erase_all(void)
 
     spi_conf(CONF_ENABLE_W0);
 
-    /* Check some random page. Should be full of zeroes as backend is
-     * not initialized */
+    /*
+     * Previous page should be full of 0xffs after backend is
+     * initialized
+     */
+    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
+    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
+    }
+    spi_ctrl_stop_user();
+
+    /* Check the page is correctly written */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
-        g_assert_cmphex(page[i], ==, 0x0);
+        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
     }
 
     spi_ctrl_start_user();
@@ -238,7 +281,7 @@ static void test_erase_all(void)
     writeb(ASPEED_FLASH_BASE, BULK_ERASE);
     spi_ctrl_stop_user();
 
-    /* Recheck that some random page */
+    /* Check the page is erased */
     read_page(some_page_addr, page);
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
         g_assert_cmphex(page[i], ==, 0xffffffff);
@@ -299,6 +342,14 @@ static void test_read_page_mem(void)
     spi_conf(CONF_ENABLE_W0);
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, PP);
+    writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(my_page_addr + i * 4));
+    }
     spi_ctrl_stop_user();
     spi_conf_remove(CONF_ENABLE_W0);
 
@@ -417,6 +468,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
 
+    flash_reset();
     ret = g_test_run();
 
     qtest_quit(global_qtest);
-- 
2.35.3

