Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612073njb;
        Thu, 17 Oct 2024 22:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmDEgO5TomIgVCfzAP71ARL4+JXUPEUiwCwjy6+saPDfVfnCrKl72WJ5P+Q2HH8Vx/XZFNecn6SABjVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHShAbPlPXs1HB79z2upVa4Oh4IIfI6g/DXB0cMEQBRo/LoAkGEHbdnbafy8gAs701uZ4CX
X-Received: by 2002:a05:6214:3b86:b0:6cb:c5f7:719 with SMTP id 6a1803df08f44-6cde15315bbmr12979876d6.27.1729229595630;
        Thu, 17 Oct 2024 22:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229595; cv=none;
        d=google.com; s=arc-20240605;
        b=bknP4GaKHiFe9rxKiT9+Yox2OIkEBI6fN/Q7MKkVejGgiSTuu2XuUEZzOFBYRFrFmN
         zAMiYv0/hLTdxEn4esgpDR3KSeGhH71wpEE+GmjRMrFnY4zohjOiYuPLuQ0PUFmZIawr
         0MGiO4cyHr9U4XPgDkEsirA+4hRHZoV/TiCfqRc5NBp4pfrNqI/s/hifRukmEALpEEnp
         y0OflTeHz72/9ptoUxv0618/qWPkXJa3CfyiOo+HsuH+uIC+qiy+j2wu+8HpTM/O84Sx
         Kx7x0N2aDsHXDYCTjrOMqEX7u5nawBguyD3n7y+jGaib400HqFifR/8Qi6vI9bibxuIk
         xqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CBir2CRWMoEZ6Bj0A9uNBqzW/Nug/HzuOMLeZPVJt5Y=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=RKV+o7rB4eOMXj91l09WYmTnCFFTMbKJJhRn0AH+2011m9jyHj2q4pP8zl3xd3btr2
         j6+2yL73kwpII80fncLBNL6eyZNPhDClB5fCCABVxdxUEah+XGwYInznYNYgf0Q7103f
         DqmsAtnr6Pg7EagNKXfIwDrAcmpVS/88Prvu0RhA49U+6nwVtdgWdqzsa97F6In1sLJ5
         4jofDSwjxp7HZdhMEdztYf7bgv75IaKLbfuwM8NPXIy2i9KcN32LBjMIRv89uHJNBaRZ
         FC8vpODDa8tHycN4krRE5Hfa3TZTaAJfTQG+34R71w8/BzkLUaG5sPdDvPX0UF3zk4GA
         88jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde13a45a2si9487176d6.497.2024.10.17.22.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t1fap-0000O6-OQ; Fri, 18 Oct 2024 01:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fao-0000K0-31; Fri, 18 Oct 2024 01:32:06 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fam-0008E2-Ku; Fri, 18 Oct 2024 01:32:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:16 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:16 +0800
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
Subject: [PATCH v1 11/16] test/qtest/aspeed_smc-test: Support to test all
 flash models
Date: Fri, 18 Oct 2024 13:31:07 +0800
Message-ID: <20241018053112.1886173-12-jamin_lin@aspeedtech.com>
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
X-TUID: WF/EopEOp0l6

Currently, these test cases used the hardcode offset 0x1400000 (0x14000 * 256)
which was beyond the 16MB flash size for flash page read/write command testing.
However, the default fmc flash model of ast1030-a1 EVB is "w25q80bl" whose size
is 1MB. To test all flash models, introduces a new page_addr member in TestData
structure, so users can set the offset for flash parge read/write command
testing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed_smc-test.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index b8ab20b43d..6db18451d2 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -72,6 +72,7 @@ typedef struct TestData {
     char *tmp_path;
     uint8_t cs;
     const char *node;
+    uint32_t page_addr;
 } TestData;
 
 /*
@@ -256,7 +257,7 @@ static void assert_page_mem(const TestData *data, uint32_t addr,
 static void test_erase_sector(const void *data)
 {
     const TestData *test_data = (const TestData *)data;
-    uint32_t some_page_addr = 0x600 * FLASH_PAGE_SIZE;
+    uint32_t some_page_addr = test_data->page_addr;
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
@@ -308,7 +309,7 @@ static void test_erase_sector(const void *data)
 static void test_erase_all(const void *data)
 {
     const TestData *test_data = (const TestData *)data;
-    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
+    uint32_t some_page_addr = test_data->page_addr;
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
@@ -358,8 +359,8 @@ static void test_erase_all(const void *data)
 static void test_write_page(const void *data)
 {
     const TestData *test_data = (const TestData *)data;
-    uint32_t my_page_addr = 0x14000 * FLASH_PAGE_SIZE; /* beyond 16MB */
-    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
+    uint32_t my_page_addr = test_data->page_addr;
+    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
@@ -395,8 +396,8 @@ static void test_write_page(const void *data)
 static void test_read_page_mem(const void *data)
 {
     const TestData *test_data = (const TestData *)data;
-    uint32_t my_page_addr = 0x14000 * FLASH_PAGE_SIZE; /* beyond 16MB */
-    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
+    uint32_t my_page_addr = test_data->page_addr;
+    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
@@ -438,7 +439,7 @@ static void test_read_page_mem(const void *data)
 static void test_write_page_mem(const void *data)
 {
     const TestData *test_data = (const TestData *)data;
-    uint32_t my_page_addr = 0x15000 * FLASH_PAGE_SIZE;
+    uint32_t my_page_addr = test_data->page_addr;
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
@@ -679,6 +680,8 @@ static void test_palmetto_bmc(TestData *data)
     data->jedec_id = 0x20ba19;
     data->cs = 0;
     data->node = "/machine/soc/fmc/ssi.0/child[0]";
+    /* beyond 16MB */
+    data->page_addr = 0x14000 * FLASH_PAGE_SIZE;
 
     qtest_add_data_func("/ast2400/smc/read_jedec", data, test_read_jedec);
     qtest_add_data_func("/ast2400/smc/erase_sector", data, test_erase_sector);
-- 
2.34.1

