Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp641297njb;
        Wed, 27 Nov 2024 01:17:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDTvKOzy/jkkWHUK+2VtXfzPXiwpcOm6fm28kNx0nYo5I7ffw69nhYZAgmX/pZclFtStJbHzWxDn0TFg==@linaro.org
X-Google-Smtp-Source: AGHT+IHWa/aZmLdrY+d3XKMoX1uoy9qPnUE7UIhX9ohrFrB5yDjTSTctdtYT6B+NUjDZlY98ZEg6
X-Received: by 2002:a05:620a:179f:b0:7b6:5dbe:1b49 with SMTP id af79cd13be357-7b67451f35fmr1081446085a.11.1732699025855;
        Wed, 27 Nov 2024 01:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732699025; cv=none;
        d=google.com; s=arc-20240605;
        b=gekClG2mGqioqj2VqPe8QN9QGp/f4QxwxdL+/UzCNfOUgFn7Iv/AslRnlGFzscYnT7
         MxOpbl0z0cTvICxqHctaRGzY5eQ8cnLfryiFKs02hmp2bKcIjMVF6js42zb+Ar5rvjNG
         Tjrtc+cjQnqlM0dm2sF6cz9afSraQBoypQeEzSnbvD+sdxU6pa/xIug5XLjFkjp4gHzV
         br7kvmwl9vkJ+58daCgXD/HCRK76olw0vaMDi7IFfAPUsFS10tZsWFDAWruYSvMTlrHr
         Io8ylVKqMwY76fJQ9Ud1AzmKWS3Wo+wnbpIUnHpqlm8EOZvbFWsOwCshJ3MgbTzxSuCR
         yEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TcqNlE8aFf5kAan2sZ+DQ2xiwBIs29DlVBhRIl7Sb2E=;
        fh=YxB9KrK/apG3GPSS9N0BU3U6VgGYnn8GG91b26MqXlY=;
        b=BTuf+2/57bDZyR1Z3y9UUr4/yWZZ+nOqxu0wwev+4xfttsKS4tSU/WM/U9S/sBvDxs
         VUbvyruvxmit8a+vxj98d0u4r7ChoNIVMplu+k38OFEhCFm4jp7e2wuAVWngCIitcZlL
         J+HipSpsSCG5vXBfIxE350fFAYVOR9jf74gE2/f8VFuTwp6VYvyalbcM5gPYGciaj5hI
         ZFasNTeqbKuBZOsZPbMcNbU2e6kIHmiJ0SLppkm8eTSc0CVz48MGvqj9otL1y4YVydic
         +EN2d+TNZf7yy6g9h7pTIfY4lw7eqVnLzVoypz1kUDHcvtI612GW4WtGU48lcvp1nOef
         2TAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b4c6adsi133870656d6.350.2024.11.27.01.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGE9u-0002Wc-VG; Wed, 27 Nov 2024 04:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9q-0002Nr-OI; Wed, 27 Nov 2024 04:16:26 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9p-0004K2-1h; Wed, 27 Nov 2024 04:16:26 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 27 Nov
 2024 17:15:46 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 27 Nov 2024 17:15:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 08/10] test/qtest/aspeed_smc-test: Support write page
 command with QPI mode
Date: Wed, 27 Nov 2024 17:15:41 +0800
Message-ID: <20241127091543.1243114-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
References: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eyg2mkk29gAb

Add a new testcase for write page command with QPI mode testing.
Currently, only run this testcase for AST2500, AST2600 and AST1030.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index c5c38e23c5..59f3876cdc 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -36,6 +36,7 @@
 #define R_CE_CTRL           0x04
 #define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
 #define R_CTRL0             0x10
+#define   CTRL_IO_QUAD_IO      BIT(31)
 #define   CTRL_CE_STOP_ACTIVE  BIT(2)
 #define   CTRL_READMODE        0x0
 #define   CTRL_FREADMODE       0x1
@@ -62,6 +63,7 @@ enum {
     ERASE_SECTOR = 0xd8,
 };
 
+#define CTRL_IO_MODE_MASK  (BIT(31) | BIT(30) | BIT(29) | BIT(28))
 #define FLASH_PAGE_SIZE           256
 
 typedef struct TestData {
@@ -171,6 +173,18 @@ static void spi_ctrl_stop_user(const TestData *data)
     spi_writel(data, ctrl_reg, ctrl);
 }
 
+static void spi_ctrl_set_io_mode(const TestData *data, uint32_t value)
+{
+    uint32_t ctrl_reg = R_CTRL0 + data->cs * 4;
+    uint32_t ctrl = spi_readl(data, ctrl_reg);
+    uint32_t mode;
+
+    mode = value & CTRL_IO_MODE_MASK;
+    ctrl &= ~CTRL_IO_MODE_MASK;
+    ctrl |= mode;
+    spi_writel(data, ctrl_reg, ctrl);
+}
+
 static void flash_reset(const TestData *data)
 {
     spi_conf(data, 1 << (CONF_ENABLE_W0 + data->cs));
@@ -659,6 +673,60 @@ static void test_write_block_protect_bottom_bit(const void *data)
     flash_reset(test_data);
 }
 
+static void test_write_page_qpi(const void *data)
+{
+    const TestData *test_data = (const TestData *)data;
+    uint32_t my_page_addr = test_data->page_addr;
+    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
+    uint32_t page[FLASH_PAGE_SIZE / 4];
+    uint32_t page_pattern[] = {
+        0xebd8c134, 0x5da196bc, 0xae15e729, 0x5085ccdf
+    };
+    int i;
+
+    spi_conf(test_data, 1 << (CONF_ENABLE_W0 + test_data->cs));
+
+    spi_ctrl_start_user(test_data);
+    flash_writeb(test_data, 0, EN_4BYTE_ADDR);
+    flash_writeb(test_data, 0, WREN);
+    flash_writeb(test_data, 0, PP);
+    flash_writel(test_data, 0, make_be32(my_page_addr));
+
+    /* Set QPI mode */
+    spi_ctrl_set_io_mode(test_data, CTRL_IO_QUAD_IO);
+
+    /* Fill the page pattern */
+    for (i = 0; i < ARRAY_SIZE(page_pattern); i++) {
+        flash_writel(test_data, 0, make_be32(page_pattern[i]));
+    }
+
+    /* Fill the page with its own addresses */
+    for (; i < FLASH_PAGE_SIZE / 4; i++) {
+        flash_writel(test_data, 0, make_be32(my_page_addr + i * 4));
+    }
+
+    /* Restore io mode */
+    spi_ctrl_set_io_mode(test_data, 0);
+    spi_ctrl_stop_user(test_data);
+
+    /* Check what was written */
+    read_page(test_data, my_page_addr, page);
+    for (i = 0; i < ARRAY_SIZE(page_pattern); i++) {
+        g_assert_cmphex(page[i], ==, page_pattern[i]);
+    }
+    for (; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, my_page_addr + i * 4);
+    }
+
+    /* Check some other page. It should be full of 0xff */
+    read_page(test_data, some_page_addr, page);
+    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], ==, 0xffffffff);
+    }
+
+    flash_reset(test_data);
+}
+
 static void test_palmetto_bmc(TestData *data)
 {
     int ret;
@@ -736,6 +804,8 @@ static void test_ast2500_evb(TestData *data)
                         data, test_write_page_mem);
     qtest_add_data_func("/ast2500/smc/read_status_reg",
                         data, test_read_status_reg);
+    qtest_add_data_func("/ast2500/smc/write_page_qpi",
+                        data, test_write_page_qpi);
 }
 
 static void test_ast2600_evb(TestData *data)
@@ -773,6 +843,8 @@ static void test_ast2600_evb(TestData *data)
                         data, test_write_page_mem);
     qtest_add_data_func("/ast2600/smc/read_status_reg",
                         data, test_read_status_reg);
+    qtest_add_data_func("/ast2600/smc/write_page_qpi",
+                        data, test_write_page_qpi);
 }
 
 static void test_ast1030_evb(TestData *data)
@@ -810,6 +882,8 @@ static void test_ast1030_evb(TestData *data)
                         data, test_write_page_mem);
     qtest_add_data_func("/ast1030/smc/read_status_reg",
                         data, test_read_status_reg);
+    qtest_add_data_func("/ast1030/smc/write_page_qpi",
+                        data, test_write_page_qpi);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1

