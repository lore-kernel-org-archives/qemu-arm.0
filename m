Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1692342njb;
        Thu, 15 May 2025 01:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1t3e51/6tsUe7mDRo3WpFJUoB7/zPdWY5vw2Av+vXrUZ4OMam7rYt3B708Y5HNIBm3IqtJbGSjVmUsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGGPfUVJalxgTz511D73iv5OWzsws7UDooEVC0G2wC7OmYH0PuC2eUEk4/UgYakL5DD+9ay
X-Received: by 2002:a05:6214:da5:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6f8a4b842bbmr26735126d6.8.1747296866035;
        Thu, 15 May 2025 01:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296866; cv=none;
        d=google.com; s=arc-20240605;
        b=ICUDwx5byLQ8DC5XbudTAdvW3gFIIxFHx22EPDZFQG6WVyeFTAe952ikQUemJizeI5
         M2ScAxwdprn7Xb9FjplK9AJzukHtR8mLj/FSj3F15v/Pnm+5ri5RtFbhiNcxYm/nDBN7
         M9BlLR0SOTppsVEGeN/jv8vC/9i/rED5yy/ds6mLAr3wn2nLWR4m8VoNC6sdIZ6LeB9q
         XZSIZA2Tbq7htHzxnz5TNwJUNbiKX8Msu3R1Dq+AiZNdDmHA2Hm7OUouoSV4PO4MLv2f
         JlrtFPfRdp6Qtlwtdl6wZ7+Dn11XM2k/7TEfqxNH8dWQE6mwFAZKfK7KkOXCY3MshZU5
         2QQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=QHrvzQaJMy/BoR2zBPOSAEQXBKAGEDHzfe82lQK3yH4=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=PRLmHePXDxocejcp7x5QvKJOZ7FwijfuzoR7JlBsqbW1meA/Ql4OkaVmJx4uj8uOwM
         q1sIlpannlFThlxX8YGt4T317bu9GZ9Q6/FxwBNTAEZGwOMdNXrWYjA7mZ48FE2pME6g
         /IRo96cWDx2GkcE2BAgzECI8MElwaRrrKv7F1VWofCVK08MbvHYkSiZyaKpCd2wkgEld
         8jqG/MwwCiIAV25JTvt5pZ665sncNP89wMHquoGtws5EaR08gbaHvKOo9ZeUMeTQUL+L
         C+SkePh33zoTexXpGjx5XgF+pi290X2lvbp92NkfJ7Nd4ZSE+qubP5fI6/rgngOpfeRK
         vLOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e72casi158858816d6.67.2025.05.15.01.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFThZ-00018Z-UL; Thu, 15 May 2025 04:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFThE-0007uR-68; Thu, 15 May 2025 04:12:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTh6-00018W-W5; Thu, 15 May 2025 04:12:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:15 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:15 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 20/28] test/qtest/hace: Adjust test address range for
 AST1030 due to SRAM limitations
Date: Thu, 15 May 2025 16:09:52 +0800
Message-ID: <20250515081008.583578-21-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
References: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
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
X-TUID: CBZV+oq9BoaO

The digest_addr is set to "src_addr + 0x1000000", where src_addr is the DRAM
base address. However, the value 0x1000000 (16MB) is too large because the
AST1030 does not support DRAM, and its SRAM size is only 768KB.

A range size of 0x10000 (64KB) is sufficient for HACE test cases, as the test
vector size does not exceed 64KB.

Updates:
1. Direct Access Mode
Update digest_addr to "src_addr + 0x10000" in the following functions:
aspeed_test_md5
aspeed_test_sha256
aspeed_test_sha512

2. Scatter-Gather (SG) Mode
Update source address for different SG buffer addresses in the following
functions:
src_addr1 = src_addr + 0x10000
src_addr2 = src_addr + 0x20000
src_addr3 = src_addr + 0x30000
digest_addr = src_addr + 0x40000

aspeed_test_sha256_sg
aspeed_test_sha512_sg

3. ACC Mode Update
Update the SG List start address: src_addr + 0x10000
Update the SG List buffer size to 0x30000 (192KB).

buffer_addr = src_addr + 0x10000
digest_addr = src_addr + 0x40000

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
index 777fa5b986..539d06e4f8 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -132,7 +132,7 @@ void aspeed_test_md5(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    uint32_t digest_addr = src_addr + 0x01000000;
+    uint32_t digest_addr = src_addr + 0x010000;
     uint8_t digest[16] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -166,7 +166,7 @@ void aspeed_test_sha256(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t digest_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x10000;
     uint8_t digest[32] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -200,7 +200,7 @@ void aspeed_test_sha512(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t digest_addr = src_addr + 0x1000000;
+    const uint32_t digest_addr = src_addr + 0x10000;
     uint8_t digest[64] = {0};
 
     /* Check engine is idle, no busy or irq bits set */
@@ -234,10 +234,10 @@ void aspeed_test_sha256_sg(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t src_addr_1 = src_addr + 0x1000000;
-    const uint32_t src_addr_2 = src_addr + 0x2000000;
-    const uint32_t src_addr_3 = src_addr + 0x3000000;
-    const uint32_t digest_addr = src_addr + 0x4000000;
+    const uint32_t src_addr_1 = src_addr + 0x10000;
+    const uint32_t src_addr_2 = src_addr + 0x20000;
+    const uint32_t src_addr_3 = src_addr + 0x30000;
+    const uint32_t digest_addr = src_addr + 0x40000;
     uint8_t digest[32] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
@@ -285,10 +285,10 @@ void aspeed_test_sha512_sg(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t src_addr_1 = src_addr + 0x1000000;
-    const uint32_t src_addr_2 = src_addr + 0x2000000;
-    const uint32_t src_addr_3 = src_addr + 0x3000000;
-    const uint32_t digest_addr = src_addr + 0x4000000;
+    const uint32_t src_addr_1 = src_addr + 0x10000;
+    const uint32_t src_addr_2 = src_addr + 0x20000;
+    const uint32_t src_addr_3 = src_addr + 0x30000;
+    const uint32_t digest_addr = src_addr + 0x40000;
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
@@ -336,8 +336,8 @@ void aspeed_test_sha256_accum(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t buffer_addr = src_addr + 0x1000000;
-    const uint32_t digest_addr = src_addr + 0x4000000;
+    const uint32_t buffer_addr = src_addr + 0x10000;
+    const uint32_t digest_addr = src_addr + 0x40000;
     uint8_t digest[32] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_256) | SG_LIST_LEN_LAST),
@@ -377,8 +377,8 @@ void aspeed_test_sha512_accum(const char *machine, const uint32_t base,
 {
     QTestState *s = qtest_init(machine);
 
-    const uint32_t buffer_addr = src_addr + 0x1000000;
-    const uint32_t digest_addr = src_addr + 0x4000000;
+    const uint32_t buffer_addr = src_addr + 0x10000;
+    const uint32_t digest_addr = src_addr + 0x40000;
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_512) | SG_LIST_LEN_LAST),
-- 
2.43.0

