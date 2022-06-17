Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp424339lfb;
        Fri, 17 Jun 2022 15:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uS3k7VJLfwrfCZZeJMfKBnpwouokJ+isenaPSRYmFv9KFrcqsWMCYha0VEqD0DVS3K4XPd
X-Received: by 2002:a05:620a:2403:b0:6a7:65f4:211c with SMTP id d3-20020a05620a240300b006a765f4211cmr8824709qkn.462.1655503659335;
        Fri, 17 Jun 2022 15:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655503659; cv=none;
        d=google.com; s=arc-20160816;
        b=MBKbw6hUYkcb1aCPZPrKrN9vDEgmx4v47VyB3hOQDHW/SsruWdfUU+icUI/uPuS9id
         Fy29TvhiFIknAjfgA3wAbAKjebJ/vRmbFM413vlwPxwuoyLkLOz4dl43N71UoLaHLbpc
         a3lzEM1p67eHjk6ftBGhQUpxXrLOtvpqUoYIWxOUWUhKptd/YcEjzkYprToHjpOrDDhs
         E+1+SQejngLajUpoK5bA3wsf8lKezlEDMCsCrulChvKjbtqveCGUsM1eXKTuHRc9Pt7z
         j3MTTVE7n5nFA+H0/2kScZ0a4fBul2hWm6RrWsqWykqfrpnMrbT+LKIfzdeXeU6WzDMz
         wgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CY10vKQoNtbI+tg5/2yxceaa+AiwwfQGjkyELCgKtB0=;
        b=apE1Mgmsq29BAr6axmh0XwF7cXbmwdKlR9MY0Ma2nwC/lGO25wU/Hwz4SPdcIJZ1Ai
         R4rANI6sD2C1k0skn/XR8IFnW48+BdwkPY7fufBGVSZG7HnZ0d5C7MYzf69asgZJ+TPG
         SWuc2r2TvU02LaOEsp5qIt8EuZxzzs6RnBinRL+3koWcnOMzkiCXNav7EHqBs6FvQWql
         H3qkCfF8taUda7Ah+2pzmxmdfv1Vcf2hVsWfolB6i+XXcDuiwC4QCUp5wW4PMv4sfku+
         wNNX9SVEk0wrU8IzW/nK9Qm87KkXqv9w2UPC21JO1uXoAtY9EXym+yk7LTJENJY2trmi
         gP3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=LL8POsDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05620a29c100b006a75beccccfsi4459559qkp.587.2022.06.17.15.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jun 2022 15:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=LL8POsDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2K7u-00021L-NT
	for alex.bennee@linaro.org; Fri, 17 Jun 2022 18:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2K7H-0001oP-59; Fri, 17 Jun 2022 18:06:59 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:21604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71671d6567=irischenlj@fb.com>)
 id 1o2K7F-0003AB-91; Fri, 17 Jun 2022 18:06:58 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HLj0gE009158;
 Fri, 17 Jun 2022 15:06:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=CY10vKQoNtbI+tg5/2yxceaa+AiwwfQGjkyELCgKtB0=;
 b=LL8POsDwUwRzZU9FhT2Ub++CAucu6yaCGIhrJdO9ksvnc3y6lrtR0euf/mebhSjHmtXu
 R1hB3+tZbCXIcEHsgXZiMQod3OZinXIGZcKlQtuOgAHr6ddJocQhzM/dTJGolQvYihLJ
 wBiGZynNBMOCmiC7Y/2MESpCMAGj0C9BOeI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3grf2g64hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jun 2022 15:06:49 -0700
Received: from localhost (2620:10d:c085:108::8) by mail.thefacebook.com
 (2620:10d:c085:21d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 17 Jun
 2022 15:06:47 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [PATCH v3 2/2] hw: m25p80: add tests for write protect (WP# and SRWD
 bit)
Date: Fri, 17 Jun 2022 15:06:42 -0700
Message-ID: <20220617220642.2301951-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:108::8]
X-Proofpoint-GUID: c0QlYxtpPJQzTmkIoNHv8PaX7L3ojA6h
X-Proofpoint-ORIG-GUID: c0QlYxtpPJQzTmkIoNHv8PaX7L3ojA6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_14,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71671d6567=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: m1k2Rp3eS/Zl

---
Fixing suggestions to move testing related code to a different commit.

 tests/qtest/aspeed_smc-test.c | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index ec233315e6..7786addfb8 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -56,7 +56,9 @@ enum {
     BULK_ERASE = 0xc7,
     READ = 0x03,
     PP = 0x02,
+    WRSR = 0x1,
     WREN = 0x6,
+    SRWD = 0x80,
     RESET_ENABLE = 0x66,
     RESET_MEMORY = 0x99,
     EN_4BYTE_ADDR = 0xB7,
@@ -390,6 +392,64 @@ static void test_read_status_reg(void)
     flash_reset();
 }
 
+static void test_status_reg_write_protection(void)
+{
+    uint8_t r;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    /* default case: WP# is high and SRWD is low -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* WP# high and SRWD high -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, 0);
+
+    /* WP# low and SRWD low -> status register writable */
+    qtest_set_irq_in(global_qtest,
+                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 0);
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* WP# low and SRWD high -> status register NOT writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    /* write is not successful */
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    qtest_set_irq_in(global_qtest,
+                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 1);
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -416,6 +476,8 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
+    qtest_add_func("/ast2400/smc/status_reg_write_protection",
+                   test_status_reg_write_protection);
 
     ret = g_test_run();
 
-- 
2.30.2

