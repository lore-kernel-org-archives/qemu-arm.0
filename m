Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612144njb;
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhkMify+Poqney0uQ03zN2huedNExHBAlbpMWsPLweK4I6Rm2UvRYujXyMToBMBTFwhWgxB5YNMKJ5jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEm80yMDvaBObWLETc2ydxo+EeemdSA08tAZEwKUemXLBfWQi7f+eTFo7IvYBtU2tktz7GQ
X-Received: by 2002:a05:622a:1992:b0:460:a9ec:b506 with SMTP id d75a77b69052e-460aee5f221mr16690601cf.49.1729229607535;
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229607; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMj6S1miVXxcdeM6Tbhyu2h+GJd0i7EUKgruzEK5vGiGofOiSoT4zs1VPl0t6lZNoB
         cH4DpZJOJHmpireUPAjxajWcQiDVozD/ah0vFDifMk8HR7qmwhkI/04POetBFtBlJIWo
         Q1WkbPhgjQT3GRmiT80zbzfyMLLxgkKeanGhIcAuuvK4mfG9/LcZtjrZ8KrRs88DlbJu
         K8zDwnEd3yTzojhty58X1GT6WJni92HHHHO9WDyOay1kMWkVzDINAU9MvXerUp9lkeBy
         Yw4TgoGjFCWeRqGzKdU0fmKcnLeDFbQOW914hxWUx1SFf5s4ZSiqDgmsUL2A/UAfb2Sj
         4sFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=0m69Y8h+b6psWuAm+UExKemnStE93TR4UTSivA3HOJo=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=E9aO4O5GmhOnn3yFoVNfdorkuicU4tZFX5Zu5l/ne1jT5cb3knvpGGpHjHSWyD/kWq
         4ljDjlcHptqRB8e3gmRg/DIaUotWYcHy+XnRtMamlbXVLHDQLnDvrp0vzUlXZm8uvQRu
         C7JaLSvo8A9NMBc3tKSeibrSVteO1uLQTFNA9j3rVTZ51mY/vG08iUPjCgdh/Vj6a2+x
         j9Y/hh5eOpghFSRWOoB6CX9iU5zNuZNI52/Pu3cvZYukALkoJ0OKo8HpfWwrx0LEbiCI
         hgQZwpwOZloD36A4xaXQQ/9h9T2z0Rq5g7r5M5Ul4AO0m0ru3JoBX3XvD7ZaLyOGs53P
         ZbAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aea7f340si9580581cf.522.2024.10.17.22.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t1fbo-0002lD-4r; Fri, 18 Oct 2024 01:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fba-0002JI-Je; Fri, 18 Oct 2024 01:32:57 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fbX-0008E2-1d; Fri, 18 Oct 2024 01:32:53 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:17 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 15/16] test/qtest/aspeed_smc-test: Support write page
 command with QPI mode
Date: Fri, 18 Oct 2024 13:31:11 +0800
Message-ID: <20241018053112.1886173-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T8/2g22Ow99h

Add a new testcase for write page command with QPI mode testing.
Currently, only run this testcase for AST2500, AST2600 and AST1030.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

