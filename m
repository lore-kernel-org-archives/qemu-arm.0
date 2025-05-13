Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp324055njb;
        Mon, 12 May 2025 23:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfgqkVpTXUVH1FLNaQmczsKOiqXu7KDZS99dlVmofPoCiWoNwYMtiM2b1SsK1c2rX34/ysNHc8D953hA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/dzpiUDSMQIRo3TeDiL7w1bzUo9UO0ZIxY9TBgcWO6mFtFRGEWjcYlgOvZMLvda+sxb9B
X-Received: by 2002:a05:620a:1788:b0:7c7:97ff:ca42 with SMTP id af79cd13be357-7cd0115039dmr2013264485a.41.1747118134650;
        Mon, 12 May 2025 23:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118134; cv=none;
        d=google.com; s=arc-20240605;
        b=QX1MdhQE10Bzv1lxOUiqIZg2bCmVCuD4thPiqqtiAub1nIaExYOK61NcumJQ6lM9SO
         AxY8s+HtzJUcc4EyXYI2jPc8uls6tUFkyU4pQivD5uo8ubyxbeIAV4qTBrkgXHh6RIFL
         RMqb1g5NEuAZ5skbN9cwVFUEGojdSEjDcU/sYhZVYl8oUA6lilNqCXbzFJhC+zWHg03a
         JFIyBaQNzSohTNUB4om/Ji842pHjcODyiX9vSykjar+Nxas8Ns/Og+9Ap04eSYFcOSXO
         xXIb39oHVbwAVocaF8NSIwPBVY/Qq2Fm/EvSOdC1+ERYh63yntbSichjqHPTQqSoCGI3
         twWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=0LIupLKkwr6LGbDe/jSTvQVyvgv/LKgNCYRBFPmWkoI=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=NHHeS/Qnr6FzfVweQEU8xH6keojXECU44zEl/CvJy6MX7erXWL5N//CTOljCc1nvYR
         ABCM5rxrvBE1hn1kvCXp924DTxvleCZLKf2q12ezzWfhZTripzr9p/IPrQd1b5g85DS6
         pSE+APSxzSd9MccNhz+k8piPrKX3Gd+E2ErPCtk7EjoZuaOqyOTIuNs0kxFsb9ZprV/S
         +IKyclFH3q40FD4fc7jg2C5wXOy8PqX8/dqpB5srDRy/MmP9xK71JyR1mYsTkdja0KKO
         BgJZbm7KwOKvPkVeKjjMP8rmrrgorJrioPk1dKQFw740Nx23Lk4CEzNZas6cym1rqVBh
         qd3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e70aasi103007036d6.64.2025.05.12.23.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEjE2-0001C5-IO; Tue, 13 May 2025 02:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBO-0005lW-4D; Tue, 13 May 2025 02:32:12 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBL-00029w-CH; Tue, 13 May 2025 02:32:05 -0400
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
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 21/25] test/qtest/hace: Update source data and digest data
 type to 64-bit
Date: Tue, 13 May 2025 14:28:51 +0800
Message-ID: <20250513062901.2256865-22-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 7cAS5WACBDvK

Currently, the hash data source and digest result buffer addresses are set to
32-bit. However, the AST2700 CPU is a 64-bit Cortex-A35 architecture, and its
DRAM base address is also 64-bit.

To support AST2700, update the hash data source address and digest result buffer
address to use 64-bit addressing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.h | 20 ++++-----
 tests/qtest/aspeed-hace-utils.c | 72 ++++++++++++++++-----------------
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/tests/qtest/aspeed-hace-utils.h b/tests/qtest/aspeed-hace-utils.h
index f4440561de..0382570fa2 100644
--- a/tests/qtest/aspeed-hace-utils.h
+++ b/tests/qtest/aspeed-hace-utils.h
@@ -51,25 +51,25 @@ struct AspeedMasks {
 };
 
 void aspeed_test_md5(const char *machine, const uint32_t base,
-                     const uint32_t src_addr);
+                     const uint64_t src_addr);
 void aspeed_test_sha256(const char *machine, const uint32_t base,
-                        const uint32_t src_addr);
+                        const uint64_t src_addr);
 void aspeed_test_sha384(const char *machine, const uint32_t base,
-                        const uint32_t src_addr);
+                        const uint64_t src_addr);
 void aspeed_test_sha512(const char *machine, const uint32_t base,
-                        const uint32_t src_addr);
+                        const uint64_t src_addr);
 void aspeed_test_sha256_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr);
+                           const uint64_t src_addr);
 void aspeed_test_sha384_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr);
+                           const uint64_t src_addr);
 void aspeed_test_sha512_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr);
+                           const uint64_t src_addr);
 void aspeed_test_sha256_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr);
+                              const uint64_t src_addr);
 void aspeed_test_sha384_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr);
+                              const uint64_t src_addr);
 void aspeed_test_sha512_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr);
+                              const uint64_t src_addr);
 void aspeed_test_addresses(const char *machine, const uint32_t base,
                            const struct AspeedMasks *expected);
 
diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
index dad90ee81c..1b54870dd4 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -153,22 +153,22 @@ static const uint8_t test_result_accum_sha256[32] = {
     0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
     0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
 
-static void write_regs(QTestState *s, uint32_t base, uint32_t src,
-                       uint32_t length, uint32_t out, uint32_t method)
+static void write_regs(QTestState *s, uint32_t base, uint64_t src,
+                       uint32_t length, uint64_t out, uint32_t method)
 {
-        qtest_writel(s, base + HACE_HASH_SRC, src);
-        qtest_writel(s, base + HACE_HASH_DIGEST, out);
+        qtest_writel(s, base + HACE_HASH_SRC, extract64(src, 0, 32));
+        qtest_writel(s, base + HACE_HASH_DIGEST, extract64(out, 0, 32));
         qtest_writel(s, base + HACE_HASH_DATA_LEN, length);
         qtest_writel(s, base + HACE_HASH_CMD, HACE_SHA_BE_EN | method);
 }
 
 void aspeed_test_md5(const char *machine, const uint32_t base,
-                     const uint32_t src_addr)
+                     const uint64_t src_addr)
 
 {
     QTestState *s = qtest_init(machine);
 
-    uint32_t digest_addr = src_addr + 0x010000;
+    uint64_t digest_addr = src_addr + 0x010000;
     uint8_t digest[16] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -198,11 +198,11 @@ void aspeed_test_md5(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha256(const char *machine, const uint32_t base,
-                        const uint32_t src_addr)
+                        const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t digest_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x10000;
     uint8_t digest[32] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -232,11 +232,11 @@ void aspeed_test_sha256(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha384(const char *machine, const uint32_t base,
-                        const uint32_t src_addr)
+                        const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t digest_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x10000;
     uint8_t digest[48] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -266,11 +266,11 @@ void aspeed_test_sha384(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha512(const char *machine, const uint32_t base,
-                        const uint32_t src_addr)
+                        const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t digest_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x10000;
     uint8_t digest[64] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -300,14 +300,14 @@ void aspeed_test_sha512(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha256_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr)
+                           const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t src_addr_1 = src_addr + 0x10000;
-    const uint32_t src_addr_2 = src_addr + 0x20000;
-    const uint32_t src_addr_3 = src_addr + 0x30000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t src_addr_1 = src_addr + 0x10000;
+    const uint64_t src_addr_2 = src_addr + 0x20000;
+    const uint64_t src_addr_3 = src_addr + 0x30000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[32] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
@@ -351,14 +351,14 @@ void aspeed_test_sha256_sg(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha384_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr)
+                           const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t src_addr_1 = src_addr + 0x10000;
-    const uint32_t src_addr_2 = src_addr + 0x20000;
-    const uint32_t src_addr_3 = src_addr + 0x30000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t src_addr_1 = src_addr + 0x10000;
+    const uint64_t src_addr_2 = src_addr + 0x20000;
+    const uint64_t src_addr_3 = src_addr + 0x30000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[48] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
@@ -402,14 +402,14 @@ void aspeed_test_sha384_sg(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha512_sg(const char *machine, const uint32_t base,
-                           const uint32_t src_addr)
+                           const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t src_addr_1 = src_addr + 0x10000;
-    const uint32_t src_addr_2 = src_addr + 0x20000;
-    const uint32_t src_addr_3 = src_addr + 0x30000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t src_addr_1 = src_addr + 0x10000;
+    const uint64_t src_addr_2 = src_addr + 0x20000;
+    const uint64_t src_addr_3 = src_addr + 0x30000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
@@ -453,12 +453,12 @@ void aspeed_test_sha512_sg(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha256_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr)
+                              const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t buffer_addr = src_addr + 0x10000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t buffer_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[32] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_256) | SG_LIST_LEN_LAST),
@@ -494,12 +494,12 @@ void aspeed_test_sha256_accum(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha384_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr)
+                              const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t buffer_addr = src_addr + 0x10000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t buffer_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[48] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_384) | SG_LIST_LEN_LAST),
@@ -535,12 +535,12 @@ void aspeed_test_sha384_accum(const char *machine, const uint32_t base,
 }
 
 void aspeed_test_sha512_accum(const char *machine, const uint32_t base,
-                              const uint32_t src_addr)
+                              const uint64_t src_addr)
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t buffer_addr = src_addr + 0x10000;
-    const uint32_t digest_addr = src_addr + 0x40000;
+    const uint64_t buffer_addr = src_addr + 0x10000;
+    const uint64_t digest_addr = src_addr + 0x40000;
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_512) | SG_LIST_LEN_LAST),
-- 
2.43.0

