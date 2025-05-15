Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1692376njb;
        Thu, 15 May 2025 01:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeDbat/roJa7Zs4WHc5JMCF+bLGctNFNm+KqY+D72AYRYU8YBqIoVD/xvZhxkfH+pNqJZDCPCq0JjsJA==@linaro.org
X-Google-Smtp-Source: AGHT+IEldN5qDjpH5bMYLP3I2KjwP/W/tlgHgtZbhC48EFF4QAB5EMMh5Yaea+nLNLgZtxPGb2TK
X-Received: by 2002:a05:6214:2684:b0:6ed:1637:442f with SMTP id 6a1803df08f44-6f8a3210cedmr38513006d6.17.1747296869992;
        Thu, 15 May 2025 01:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296869; cv=none;
        d=google.com; s=arc-20240605;
        b=gFDXklE51Xgmh/vZcSxEcIIy6W7epfbXCUMaXNweiX072aJeVqtx23yjenvyM3AmqF
         BmAypNIaACXLCQbPXIcq1lEHCyLYye0gApwd1E3cGHLMRTHu6Wiy+fmzcM+m4pUavWbo
         QWLC0/MhlgHB+tuU64viI0iuZpBM1+vgAU3COtx7KRrbeecFkNvPtr0+vxWm6foU1/FJ
         XVdNrRm2fF91h6edkGO9UpP7Psv3l5Xm9s+MfBkSXD3drM08mGO9cT+e9QqfU7hPXyUN
         2Z2unDd/XmewJskFThu4c3heFSqP7fqjKnvmOZ25+naZCedUVA2StRlylOmuJL/HD+3e
         GNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TVc5oHSzKLTCtQ/LrmiHMHtyrdBfEcvDjhEI2AkTAW0=;
        fh=HOpiatFOnx6Qe0fRCbmTPNKe4Ajfqa5KxAPfGCatY1Y=;
        b=Y3DcbjIfNU+Eax6k9CVsEDoETkmDS6hdU9P3rp5sVneXjM7k6UyQ9uM3pSLt+iIj/r
         RCAyMQYnMUwnFG8Vt56N0+TBmq6j5t1GEKoKdiUa2jMn4sqf2t2Ba6yM4Bx39Tiw9gDM
         O0VfhClYHp28hQKG4wqyv9eXTs7ljVHTaH1puB6lAKMKph3ctgEuIoRgBRwP9hzBa4vi
         HtCwoz/XOGeocY+bjPomo5kIQQT36YkWMvukfRQaNJRUTaYuCMfuRFR9pK/uPUXSRbX7
         7TCMUTNh/wR6+iMTiDnGMu5dMyEjSUWRcmX86RQqCBOxo9s9gPmM14gcJ5EgXxoI7jg0
         JmHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4ba48si169193186d6.305.2025.05.15.01.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFThy-0002Gu-3K; Thu, 15 May 2025 04:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFThS-0000Xv-1y; Thu, 15 May 2025 04:12:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFThM-00018W-V8; Thu, 15 May 2025 04:12:17 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:16 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 23/28] test/qtest/hace: Add tests for AST1030
Date: Thu, 15 May 2025 16:09:55 +0800
Message-ID: <20250515081008.583578-24-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
References: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: e+sCyoZbXUPk

The HACE model in AST2600 and AST1030 is identical. Referencing the AST2600
test cases, new tests have been created for AST1030.

Implemented test functions for SHA-256, SHA-384, SHA-512, and MD5.
Added scatter-gather and accumulation test variants.
For AST1030, the HACE controller base address starts at "0x7e6d0000", and the
SDRAM start address is "0x0".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_hace-test.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index ab0c98330e..31890d574e 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -10,6 +10,12 @@
 #include "qemu/bitops.h"
 #include "aspeed-hace-utils.h"
 
+static const struct AspeedMasks ast1030_masks = {
+    .src  = 0x7fffffff,
+    .dest = 0x7ffffff8,
+    .len  = 0x0fffffff,
+};
+
 static const struct AspeedMasks ast2600_masks = {
     .src  = 0x7fffffff,
     .dest = 0x7ffffff8,
@@ -28,6 +34,62 @@ static const struct AspeedMasks ast2400_masks = {
     .len  = 0x0fffffff,
 };
 
+/* ast1030 */
+static void test_md5_ast1030(void)
+{
+    aspeed_test_md5("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha256_ast1030(void)
+{
+    aspeed_test_sha256("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha256_sg_ast1030(void)
+{
+    aspeed_test_sha256_sg("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha384_ast1030(void)
+{
+    aspeed_test_sha384("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha384_sg_ast1030(void)
+{
+    aspeed_test_sha384_sg("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha512_ast1030(void)
+{
+    aspeed_test_sha512("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha512_sg_ast1030(void)
+{
+    aspeed_test_sha512_sg("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha256_accum_ast1030(void)
+{
+    aspeed_test_sha256_accum("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha384_accum_ast1030(void)
+{
+    aspeed_test_sha384_accum("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_sha512_accum_ast1030(void)
+{
+    aspeed_test_sha512_accum("-machine ast1030-evb", 0x7e6d0000, 0x00000000);
+}
+
+static void test_addresses_ast1030(void)
+{
+    aspeed_test_addresses("-machine ast1030-evb", 0x7e6d0000, &ast1030_masks);
+}
+
 /* ast2600 */
 static void test_md5_ast2600(void)
 {
@@ -130,6 +192,20 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+    qtest_add_func("ast1030/hace/addresses", test_addresses_ast1030);
+    qtest_add_func("ast1030/hace/sha512", test_sha512_ast1030);
+    qtest_add_func("ast1030/hace/sha384", test_sha384_ast1030);
+    qtest_add_func("ast1030/hace/sha256", test_sha256_ast1030);
+    qtest_add_func("ast1030/hace/md5", test_md5_ast1030);
+
+    qtest_add_func("ast1030/hace/sha512_sg", test_sha512_sg_ast1030);
+    qtest_add_func("ast1030/hace/sha384_sg", test_sha384_sg_ast1030);
+    qtest_add_func("ast1030/hace/sha256_sg", test_sha256_sg_ast1030);
+
+    qtest_add_func("ast1030/hace/sha512_accum", test_sha512_accum_ast1030);
+    qtest_add_func("ast1030/hace/sha384_accum", test_sha384_accum_ast1030);
+    qtest_add_func("ast1030/hace/sha256_accum", test_sha256_accum_ast1030);
+
     qtest_add_func("ast2600/hace/addresses", test_addresses_ast2600);
     qtest_add_func("ast2600/hace/sha512", test_sha512_ast2600);
     qtest_add_func("ast2600/hace/sha384", test_sha384_ast2600);
-- 
2.43.0

