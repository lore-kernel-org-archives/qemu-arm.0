Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2604829lft;
        Mon, 27 Jun 2022 11:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3gZfk9BfH7vvJ8jCgztHGkwpy9X0gf+yBDTsKUZpxdEHpCHwmWq+cdwFp6iFHDLWy4Shc
X-Received: by 2002:ac8:5b44:0:b0:318:291d:8f59 with SMTP id n4-20020ac85b44000000b00318291d8f59mr10148466qtw.22.1656356012299;
        Mon, 27 Jun 2022 11:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656356012; cv=none;
        d=google.com; s=arc-20160816;
        b=JNM/IyIawjpiRtqVyl4/C7ryVKaWVlUgZu4QXKehw3vhIt5m3hUfzIAuJUACRq6CDB
         8LDZs2hudwdaZqHieSyvhnNbVrG+uvQKPd1zna/kX0d3j6Lk51Kts7bXnjM5tfSGSugT
         64h+eWMHK8CXauIJANyFfdECaMpI0xHVur4+kSQGl6VikPHvYirvZ/QxnFB98AKiybc7
         NM+HkGimHzfd6zov9PyD2j4uAzEuXvfgEl0wvrULr8UIuKZhvgExjcji2sL0OCfR5Mxb
         QD80FrGiNYuvgQT/E7Kht/4Z5kffXdjZM8R8dgU3/DvxRpucdqP8MibAiEmVL2gdWR48
         nUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fOdg8UnAn685nAVOgHD+D15AIIRQFhzcWx8eDoER38I=;
        b=0MiFBXRGmW1gMlr7idlizsPIhP1sS/DWwODpnIl2uGG68ddjRFNJF31jhqBXlFYgdl
         92n5vSvIzhxuVSZdKBRdallcOB9UAkwAyX8XBogUfIKjxKayH1jV9HekFt7GkutbQlZL
         8GsWt4TKyPc+tzEWij+zHeeyxR903wYJT28GFaN+SRDXPfVS/D+mvZTa1ftD1cmk8EeV
         HpO9Gn1zNLVxkYjU7zycamRyhr4CazcX3Zc3WP38mQVGkPb77Igqy3qoGWO+R7f0fYwx
         1aTlBgHdcyYf0t2LOrCdr05582RP//fKGwtJM2hM0SLZr+W2sPmnQuETYs0q+ZvG/fjO
         suuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=pynTP6cf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124-20020ae9ed82000000b006a7418ae5e2si5690909qkg.259.2022.06.27.11.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 11:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=pynTP6cf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5trX-0005QL-QI
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 14:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7177cd4fe2=irischenlj@fb.com>)
 id 1o5tr0-0005NJ-Df; Mon, 27 Jun 2022 14:52:58 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:51652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7177cd4fe2=irischenlj@fb.com>)
 id 1o5tqx-00086N-Pq; Mon, 27 Jun 2022 14:52:58 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RIop47022385;
 Mon, 27 Jun 2022 11:52:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=fOdg8UnAn685nAVOgHD+D15AIIRQFhzcWx8eDoER38I=;
 b=pynTP6cfq2i6T11E7Fdo4Ejz6ro8a15dfBBeObA3NeoLehRzNMgubQ9swUiqyJ0lCDXF
 hZYhQGq0W/RlqQ80THiViWQx9s4k7RFOCpsrBm2oplVBNH7rsjxCHoYDUXsrTbognT8T
 M2hfgUTZZBGcZlwYPYUfqvP9+am2eqoo6ew= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gx03yvfx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 11:52:48 -0700
Received: from localhost (2620:10d:c0a8:1b::d) by mail.thefacebook.com
 (2620:10d:c0a8:83::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 11:52:47 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [PATCH 2/2] hw: m25p80: add tests for BP and TB bit write protect
Date: Mon, 27 Jun 2022 11:52:34 -0700
Message-ID: <20220627185234.1911337-3-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627185234.1911337-1-irischenlj@fb.com>
References: <20220627185234.1911337-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::d]
X-Proofpoint-GUID: zi3d0TC1ByA3KT-3i7BdyiYbBgUFE1RK
X-Proofpoint-ORIG-GUID: zi3d0TC1ByA3KT-3i7BdyiYbBgUFE1RK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7177cd4fe2=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: C6EAS5LTxH3E

Signed-off-by: Iris Chen <irischenlj@fb.com>
---
 tests/qtest/aspeed_smc-test.c | 111 ++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 1258687eac..05ce941566 100644
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
2.30.2

