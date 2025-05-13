Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323479njb;
        Mon, 12 May 2025 23:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXNubBa7WFV3BMJ2HH90J1Kp16Hq+269YlFnQBhCTFvXcPjMevGGbvky6DH73+StC8j5xuszUep3/4Ug==@linaro.org
X-Google-Smtp-Source: AGHT+IEuWohpXWS1kcH8ynd15OhjOwmOYyByV0MF2oqyGrfTt+vGiurSRyc6P6OtZ11UvlX1xlAk
X-Received: by 2002:a05:620a:1993:b0:7c5:d7c4:6e0c with SMTP id af79cd13be357-7cd011189bfmr2494220985a.27.1747118030779;
        Mon, 12 May 2025 23:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118030; cv=none;
        d=google.com; s=arc-20240605;
        b=g58eEnaMKIxtm1DItKIqRBni2NZ5uq04r2LlB9ciUu3AoHpVushSvFNJFWzEKGRI7g
         XC6UIeKFdgid380RX3AtVC/6i4RTI0K3i3js1xD/kNkiR025gZ0Us+fkUJj3StHpZRPf
         zypsqCm25TBd2OP6pWMcHBthbFgI3hlHOZmIWLlkTFIZFVp113FaSlLrbTfiwift7bRk
         HHqJEiFWtYxXJhBJ3xwrOL3jeezhLOEnKmt3DEWmSHfgcdc+1OHlBHmrQMNWCh8YrEux
         gcLMZAKl0RYdpuq1dotc+C35kyhNTn8Xg2a46eSXyGecR74SeWFjOHxMGcd9ggtq+e0G
         sWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TVc5oHSzKLTCtQ/LrmiHMHtyrdBfEcvDjhEI2AkTAW0=;
        fh=HOpiatFOnx6Qe0fRCbmTPNKe4Ajfqa5KxAPfGCatY1Y=;
        b=Oc2RFQ+V4bxOltYLIQlzATn0o4JGJhgFSyZsZTzTu6dYkH9QAjKEquPm8dQVQFEte5
         AQJBf7ydPJM38LxGPsYuy5OpwsNyVaTIRZSeUlkeVqqZNo2FGJY0fjVGVql8I+IWD+sm
         RLImYogcQiYhRtYpCzx2GcVjcPKIrleuPe2UQSx8em84AfOIbspgJ5JP8+z7ixn61RrH
         j841FywkAHlBHPK0zctE+ptfevqGJvYQvnHj3vwdwqEgMP+ghbtjGfh6h9qDT59pPXBi
         1IdxQiB+eRLe4tnQkgSg1Lqp0y/ylQ52fol6R/n6uhEj/c5JE5lMLXtJ/uEjihUZQ9Pl
         RDcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f69b70si1032221985a.174.2025.05.12.23.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjCy-0007iJ-S2; Tue, 13 May 2025 02:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBJ-0005gq-9o; Tue, 13 May 2025 02:32:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBH-00029w-CG; Tue, 13 May 2025 02:32:00 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:09 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:09 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 20/25] test/qtest/hace: Add tests for AST1030
Date: Tue, 13 May 2025 14:28:50 +0800
Message-ID: <20250513062901.2256865-21-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: tTCaN186cF3b

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

