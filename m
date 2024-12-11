Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3847339njb;
        Tue, 10 Dec 2024 22:38:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3THRKcJcc3wy/iK0U9obKp+mQpQNkwAk0q9sK9PjhbHplSrpBR4pFB0PvtoxTg6nl5gcElc1fcJT22Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGj75fUJx13/UsgqKPVkOKMi9u9SNp4au7fPzOdJPYkZWpAJp4Dnw+ED2jaQekB2T3NOLya
X-Received: by 2002:a05:620a:4809:b0:7b6:d28b:42b5 with SMTP id af79cd13be357-7b6eb45fd8fmr356664085a.24.1733899112089;
        Tue, 10 Dec 2024 22:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733899112; cv=none;
        d=google.com; s=arc-20240605;
        b=YSAUWcffLGgsSA3NN/X7pVSgbrhqlKyCvZybB2lb6OiNpcCAwLdNY3VR0Yw8qrDSnE
         6scqmrUXqycVhABdnXtXYTOEBS63ztqlG+BhWHBNRCZWpw9if4TW+Tgh5uhjuqhHOEA0
         LQ79be6oSj6dBGa9BfPNVuJPIFJWdPUV4pm2rUC7AKnkvzodOaxmhmEgm/8rNq9+Zhua
         kk0G+EdegeDaJ7UWLzhlvw7z0e+WQsMjMdZpNENFnAxDoBM1EUWcY4sTSKQ6++9vC4HL
         HQcqTDABdnvw+eP9x9skMXNr6/GqL2EMQInC7O4Trncm+9dnd6uEKSQMsIGsjlxFWCit
         L3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O2XhBc2VtQr6z+faalkva3eCqyCYy5k4FoYYEh57YXA=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=jD2/QHwbksylGsw4dV0tGLKiHWE1Uuxl2lfc+OasfN0FrpM0mFoVynOV4bNZ7Chiw0
         Bz/vmHCp5jp15tJsrX4QtNSV/ZGGcAAhD90jsGeIUV3qg7GbyT5R5gpsdV7AaSzmlxFq
         66Jxr4UJ3e+j85ZYfzrM2eF9QQNhU1yEA2mUQRXSHl7BrUU9jCinWpDztu6iLOLQDcUl
         zY0UbzwQQCnwXQ7tA3+yj5oX7mgqf8K7dXzVhA5Xg98SWgGE0/kUnpj4g7b+f6tWbkAm
         lrfus6uzuckB0hQYOghBSMl+SdVAht1trgg8C7WXTg6bbGFX8dtXn47/n0D1RXXu5ci1
         NqsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLRam1fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d7b31e73si683349185a.625.2024.12.10.22.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:38:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLRam1fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLGHE-0006sU-C4; Wed, 11 Dec 2024 01:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGS-000577-87
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGE-00005P-AM
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2XhBc2VtQr6z+faalkva3eCqyCYy5k4FoYYEh57YXA=;
 b=VLRam1fRA8zURdHiy+xo0JGjIr7FFkBvPIEpNxTsyc4skXfz8+rsfFdOTtRtq39C8OjV9z
 jxA8aV7iryVNQbmMWDxHFQio5vtj+LsYt3CDQRW/xfyukTMwA48yhVsYZCdFPfWDkGm75s
 USUxonzRpEx6ge8U5iyWUuBo1IkGXwQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-eefoL0uMNMiT9dz_PuCJsQ-1; Wed,
 11 Dec 2024 01:31:47 -0500
X-MC-Unique: eefoL0uMNMiT9dz_PuCJsQ-1
X-Mimecast-MFC-AGG-ID: eefoL0uMNMiT9dz_PuCJsQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 641B31956046; Wed, 11 Dec 2024 06:31:44 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 043E9195605A; Wed, 11 Dec 2024 06:31:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 18/24] test/qtest/aspeed_smc-test: Introducing a "page_addr"
 data field
Date: Wed, 11 Dec 2024 07:30:52 +0100
Message-ID: <20241211063058.1222038-19-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6kRazHemVzer

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, these test cases used the hardcode offset 0x1400000 (0x14000 * 256)
which was beyond the 16MB flash size for flash page read/write command testing.
However, the default fmc flash model of ast1030-a1 EVB is "w25q80bl" whose size
is 1MB. To test SoC flash models, introduces a new page_addr member in TestData
structure, so users can set the offset for flash page read/write command
testing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241127091543.1243114-5-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index b8ab20b43dd6..6db18451d245 100644
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
2.47.1

