Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2272111lfj;
        Wed, 12 Jan 2022 00:55:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxcY1mhEOzzpAaz0MW99UymkPz+YF/hLMiGAlDFSdbEP0YQQy6jcyBqEisIEZ8oFDdHbSt
X-Received: by 2002:ac8:5809:: with SMTP id g9mr6953639qtg.20.1641977720068;
        Wed, 12 Jan 2022 00:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641977720; cv=none;
        d=google.com; s=arc-20160816;
        b=WK1FyGl3HAvWGmXaex8+6FA/8YXUrgsydJ3TDJ2GStbXDZWWcbt1IIc8J/5caKGbIi
         o2VsquaI4iHJcRiuXz6T/l5ZnOvTm6bwGSZbvt2iAQdOM+JxUwYy1BgH2QfcOAcLbVvp
         sZmSraDROQ+5C3FK5J/ksaXmAHQ9ze4n9eTmlsNvHkRJZzyrcr1N7yfmGqL0GbtA96z8
         StOw1FkGVbCA5k/gKPlItzzVhdd9Cel/2n+RMb7cL7rzu8D2iCfuwYc/0HpGdLh3kUsO
         WQ1pCn6KBZBu9nhdq/x7vX7we+tnOFqOPK+gsqj5Y6sIB2K++dCnIU2xU7xygmVuaiG9
         VFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=FDWznFcUW57fzqKqymmTZs2fKGDfBQsVjn2xiW2l1vg=;
        b=GRK+d9qiGBP01MEgn4xvDPh19ZDrg+Qffm80HvhVUnhTYOWF4kDghbi8RrbquU/Ixx
         15DxjvA6x7buWPZm1eGQQQaMwlji6cR7Nbpsi0VWPuZPb0fegGKoyAwsJE+TRfpj6X7u
         YgR/xzfb84xmw9scgO7TbgQywRILAPNwBIi+AWV8N8odbzsLW5OdqZ+1FD9x5HeVuOJO
         9LCBsAtXXekOQFsLF7yCHLUKUhnvPKrz3TlzbArwNiwhuk0YUT45KBsQhYMmWxHsDzTL
         oPXGE1If6uj7k4qgZ3zZyZKtl5kLiN5Q37sn7UmorZrdhynk2hHLe7yg/G1BVh9XzIQv
         E1dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si4410583qti.388.2022.01.12.00.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 00:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7ZPb-0005Xn-HF
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 03:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z8y-0008Th-Cc; Wed, 12 Jan 2022 03:38:09 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z8w-0003Uv-8Z; Wed, 12 Jan 2022 03:38:08 -0500
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 20C85AEa000778;
 Wed, 12 Jan 2022 16:05:10 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20C833Hw099910;
 Wed, 12 Jan 2022 16:03:03 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jan
 2022 16:09:40 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] tests/qtest: Add test for Aspeed HACE accumulative mode
Date: Wed, 12 Jan 2022 16:09:37 +0800
Message-ID: <20220112080937.366835-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112080937.366835-1-troy_lee@aspeedtech.com>
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20C833Hw099910
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IVMhtFFvbbU7

This add two addition test cases for accumulative mode under sg enabled.

The input vector was manually craft with "abc" + bit 1 + padding zeros + L.
The padding length depends on algorithm, i.e. SHA512 (1024 bit),
SHA256 (512 bit).

The result was calculated by command line sha512sum/sha256sum utilities
without padding, i.e. only "abc" ascii text.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 09ee31545e..6a2f404b93 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -21,6 +21,7 @@
 #define  HACE_ALGO_SHA512        (BIT(5) | BIT(6))
 #define  HACE_ALGO_SHA384        (BIT(5) | BIT(6) | BIT(10))
 #define  HACE_SG_EN              BIT(18)
+#define  HACE_ACCUM_EN           BIT(8)
 
 #define HACE_STS                 0x1c
 #define  HACE_RSA_ISR            BIT(13)
@@ -96,6 +97,57 @@ static const uint8_t test_result_sg_sha256[] = {
     0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0xf3,
     0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
 
+/*
+ * The accumulative mode requires firmware to provide internal initial state
+ * and message padding (including length L at the end of padding).
+ *
+ * This test vector is a ascii text "abc" with padding message.
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abc' | dd of=/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ */
+static const uint8_t test_vector_accum_512[] = {
+    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
+
+static const uint8_t test_vector_accum_256[] = {
+    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
+
+static const uint8_t test_result_accum_sha512[] = {
+    0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
+    0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
+    0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
+    0x27, 0x4f, 0xc1, 0xa8, 0x36, 0xba, 0x3c, 0x23, 0xa3, 0xfe, 0xeb, 0xbd,
+    0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
+    0xa5, 0x4c, 0xa4, 0x9f};
+
+static const uint8_t test_result_accum_sha256[] = {
+    0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
+    0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
+    0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
 
 static void write_regs(QTestState *s, uint32_t base, uint32_t src,
                        uint32_t length, uint32_t out, uint32_t method)
@@ -308,6 +360,86 @@ static void test_sha512_sg(const char *machine, const uint32_t base,
     qtest_quit(s);
 }
 
+static void test_sha256_accum(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t buffer_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[32] = {0};
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_accum_256) | SG_LIST_LEN_LAST),
+           cpu_to_le32(buffer_addr) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, buffer_addr, test_vector_accum_256, sizeof(test_vector_accum_256));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr, sizeof(test_vector_accum_256),
+               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN | HACE_ACCUM_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_accum_sha256, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha512_accum(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s = qtest_init(machine);
+
+    const uint32_t buffer_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x4000000;
+    uint8_t digest[64] = {0};
+    struct AspeedSgList array[] = {
+        {  cpu_to_le32(sizeof(test_vector_accum_512) | SG_LIST_LEN_LAST),
+           cpu_to_le32(buffer_addr) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, buffer_addr, test_vector_accum_512, sizeof(test_vector_accum_512));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr, sizeof(test_vector_accum_512),
+               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN | HACE_ACCUM_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_accum_sha512, sizeof(digest));
+
+    qtest_quit(s);
+}
+
 struct masks {
     uint32_t src;
     uint32_t dest;
@@ -396,6 +528,16 @@ static void test_sha512_sg_ast2600(void)
     test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha256_accum_ast2600(void)
+{
+    test_sha256_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_accum_ast2600(void)
+{
+    test_sha512_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_addresses_ast2600(void)
 {
     test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
@@ -455,6 +597,9 @@ int main(int argc, char **argv)
     qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
     qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
 
+    qtest_add_func("ast2600/hace/sha512_accum", test_sha512_accum_ast2600);
+    qtest_add_func("ast2600/hace/sha256_accum", test_sha256_accum_ast2600);
+
     qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
     qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
     qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
-- 
2.25.1

