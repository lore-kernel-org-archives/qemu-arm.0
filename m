Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3846422njb;
        Tue, 10 Dec 2024 22:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrAA8EmsUkiOsvDyHvh8FgnFhmzvoVZVphlB99wHtV9XvXdIcehAisM9o/9Aa27G9KRc5RNDuyFC6Gmg==@linaro.org
X-Google-Smtp-Source: AGHT+IFNYr1/w0ojJFW2NtFIrgAmK5IR/gA/zfGDem5yjE2kqmtWfLzAQNTVJT7Z9kepPoF8eHbs
X-Received: by 2002:a05:622a:558a:b0:461:59d5:e5a8 with SMTP id d75a77b69052e-467892db554mr31979201cf.28.1733898969490;
        Tue, 10 Dec 2024 22:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898969; cv=none;
        d=google.com; s=arc-20240605;
        b=AmA0NF9PdMugBpRLqHrZsOlbhsV8GiEgiphXfNG3ekeAIsPTvojyfBqKpzFhNBsh3Q
         sn7qX+sybOkhcWfVFenQRh8D61E/Lo5Ys2KVIO6RTa40kPYZsR0AJvm3R2lY35DLt3cc
         AqcqMiFCC0FSfwX9XzPIAp2L11NmVBtOZfdFKManbj3XS7yB7VMgPTEIanNY1IwhZfay
         Jpc1FurtsWR3+avIleVHcOAIsHVw3dP9Sylv305c1/W4MG9AaAlgb756ILHE8V1kP6JQ
         gTTSPIr0UrdEeVQuyp1Ux/ZHNwKboer+bKmJxOcl9a59zbJpZdKaar5AZqIilODd54kX
         LR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7TnSr1EgmoEN8LHIUbnmhjvWcBok3ymvRYxdLd6k9ME=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=RfjzGPC2LvBZcLx7Uqw75R8kn6/0XcgpIEEC7t1W3n2NlqAK+H27Sjbf6YC46u8Z56
         OFIS1npdES3eUVpBkoYqP9n7x7HJJx1+3deSKHUz3FHtsCVS1DngRdcvA2i9y7aLLqQp
         OPj8LcG1RX9wlVTs03CGbgA1YTOfdtMY8x5lRWhk3E760iMNFmnjWQJZWDx0QopPXQHZ
         Z16HuwLdzPWlGV+2DlYjUP6iHwdJkdGlOMfMIJLa1hlgnRtNUifmwsUs9MAQAV+R41k0
         Fbgfn34CgSdROStfs00BWpgrqkuC1gTw+lDas09GIv2XcnBtxyqGLzQ4myFlvXjFdBIu
         ik1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dGFQAFwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4672986887bsi182616111cf.685.2024.12.10.22.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dGFQAFwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLGHG-0006vD-3J; Wed, 11 Dec 2024 01:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGV-0005Ac-3E
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGS-00007M-15
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TnSr1EgmoEN8LHIUbnmhjvWcBok3ymvRYxdLd6k9ME=;
 b=dGFQAFwAAjCc3wXHcB0j5DPHwpVqqeeaucSVhWqP0KtWigFubzZW9goiek7yps2f5ed4EF
 qOVc1kEyHGiwDx7Hf3juDXRBbMKsgxkZUJpMexa4LNm+ksRGObV+u2OplqBB/S5zs7XLoC
 ucyHn2OlNYHh9kKiGYpmeqBgEnlwzCg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-az0D3SWfMD2dyIdotnITQA-1; Wed,
 11 Dec 2024 01:31:52 -0500
X-MC-Unique: az0D3SWfMD2dyIdotnITQA-1
X-Mimecast-MFC-AGG-ID: az0D3SWfMD2dyIdotnITQA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D5EE119560AB; Wed, 11 Dec 2024 06:31:51 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 565E11956054; Wed, 11 Dec 2024 06:31:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 22/24] test/qtest/aspeed_smc-test: Support write page command
 with QPI mode
Date: Wed, 11 Dec 2024 07:30:56 +0100
Message-ID: <20241211063058.1222038-23-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oYET1WBsxMOk

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add a new testcase for write page command with QPI mode testing.
Currently, only run this testcase for AST2500, AST2600 and AST1030.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241127091543.1243114-9-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index c5c38e23c5b2..59f3876cdc36 100644
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
2.47.1

