Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp641125njb;
        Wed, 27 Nov 2024 01:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXh69uh7wjjogWW1b4W2uxReoLpBUg9eY0KMhT+w1NrpplZIZNRQIXTSxnwFKDSYxDBbBoTOqg7GV+iuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvetS3Rx60rsX8NPXqoRd3CL/pHdrvq6bVEEbPyos7NfQmUb0l/vRTHv8BkRsFwKpKwkV6
X-Received: by 2002:a05:6102:32c4:b0:4ac:fe47:1bcf with SMTP id ada2fe7eead31-4af44a66ef3mr2851006137.24.1732699002846;
        Wed, 27 Nov 2024 01:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732699002; cv=none;
        d=google.com; s=arc-20240605;
        b=RNW3mLjuRbZ+/jiDNMaZLe5tCx0zYckpTcTclBDpu29ZcyrUCrxolIF1N262uLWA0S
         wPrsVCn9jLb8plRVcpexaXuGiGcUsnxgpf1Aj9gIv8xSY2XcnvDAi8YCHuw8IhvziFi5
         WMHRu98jsKmcBDEorXRonXR06k7+JDu4RMF3+GMuIHdJjS/jC4uBnjr/jhYPDh6gRxLL
         mXHb63h8d0CwCeqeVSBDNbA7D1i3VGgp4bYknVgl6PjVzn4ENTwEs9iF0sIx7P4I1qIj
         HCMByBq4yyDNC+GW7Bi4XDJ3rc0Mf0M+ErkosgFFrNXR3rtf8zszzFlb4Evr3uQ1uHs3
         Fm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=i2P82rFAkYd4giUpr2qQ9JV4tIOqTxqTmCjkA+qF49E=;
        fh=YxB9KrK/apG3GPSS9N0BU3U6VgGYnn8GG91b26MqXlY=;
        b=EU1Z5Rs7vTNM/SBtyRITZkAGtar5wsKpvg2oSx+tkFuID78fH/VY0A0WC0wFStVFUH
         C0sXUl4d3AA1HExp7eUyJPKLr256dijgraGFWEXP8TVWDbCiGknhVv657mYVf8c7ho5q
         d+7ZKi1PecfT0mJx4A5aqPZ9bqdXMo+Btt3v1caEeibfMak4lBtCU9k0oYYTn0+GnZNZ
         WI/YCt1Am+Mgqem7HzoD0Qg0OFYsB/CZK4sFkdRg97Hp4bxSGLd8oozayv+Dc563RtN8
         JSfZfEjMAVGYGrdJplAN2pr5SVTocYTFHMnZ9qM+BMQt5rjLrBMCPPZn2zWvELnxQOmB
         NP6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6681e1ed7si812993285a.280.2024.11.27.01.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tGE9k-0002Gw-P4; Wed, 27 Nov 2024 04:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9d-0002AB-P1; Wed, 27 Nov 2024 04:16:13 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9Z-0004K2-KY; Wed, 27 Nov 2024 04:16:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 27 Nov
 2024 17:15:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 27 Nov 2024 17:15:45 +0800
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
Subject: [PATCH v3 04/10] test/qtest/aspeed_smc-test: Introducing a
 "page_addr" data field
Date: Wed, 27 Nov 2024 17:15:37 +0800
Message-ID: <20241127091543.1243114-5-jamin_lin@aspeedtech.com>
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
X-TUID: NpBVG6PK/8/L

Currently, these test cases used the hardcode offset 0x1400000 (0x14000 * 256)
which was beyond the 16MB flash size for flash page read/write command testing.
However, the default fmc flash model of ast1030-a1 EVB is "w25q80bl" whose size
is 1MB. To test SoC flash models, introduces a new page_addr member in TestData
structure, so users can set the offset for flash page read/write command
testing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

