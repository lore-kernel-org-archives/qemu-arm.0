Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323940njb;
        Mon, 12 May 2025 23:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRZOt1Lzux008TrDD3j+niGQoHwTg/2n94NFumU1ISYEZVXq8vc1pWywhQgAoBFDQsKrWdXXJhVEarPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIUWft3DjXusQJ9RdjX/2e6dzZ7Y96did0FPrcR+vEvI9NAB3wMik8plaX9+wzBK4ROCNs
X-Received: by 2002:a05:622a:1c15:b0:494:74d9:a8e3 with SMTP id d75a77b69052e-49474d9ae6amr121223901cf.28.1747118106700;
        Mon, 12 May 2025 23:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118106; cv=none;
        d=google.com; s=arc-20240605;
        b=buCC0FF4CRNxOglkXxb9DIjfPLXWzX11UlCVbvzllr/oFTkqWuGPCMRKA/JzON/+Iv
         jOaeeARbTBALW9k4npxMwNzaX74do3fiyl8j1QB700iTgIZBeueuQiXfCaMEx3aGxtTv
         x0pItwzXo5ecwF4Lg55noi+nEfk6YbYqxP7yKj4yCAkd8e67IKidvu93PmkdpRad1fbK
         WBC8hQaVZMnwCm4FOfzjhseR+SyIZpugDqYyeEp4M0sdKQJsM8ZrWDJWfmapy61Ei8cO
         PwPPp0V3UoJWnixlIW285WqSAxFfsQxWcCbEbN8QzuOn3hlj44amurA2EvRwDFOvsCva
         s9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=QHrvzQaJMy/BoR2zBPOSAEQXBKAGEDHzfe82lQK3yH4=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=S85uY2NA5MRcdDgzno35s3wYnyiUa3gWn7oRWPw77c9l2CxGNq9eYPiHVZzdyK3ctg
         kVactdhnxqD9Mf7+IoRAVQd1MLe6o8JzXM0ifO1DviEkOtqCP+QT7Wha21m7r9hFzBzu
         4waRLvAAlet2hLJtkrnLdyYVfKeNOBe3m8IiGYhv3klfs4i1xAHPCF2TTzPxaThEzwSf
         hBHmjnAW+pGzg9RmmbgjnAXslzN51SugHtJK8tjHwZZeZNrxjr5XOdom0yK7W2eFP/6Y
         NeafMMJDAph/CCcBxbyRUhQ7Qh+dIKJCBOXl7k6fItow+HBSUGUYL74lfMGfzhxnzcSQ
         7DtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452556cf8si105603421cf.254.2025.05.12.23.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjE8-0001hZ-4s; Tue, 13 May 2025 02:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjB5-0005YF-BS; Tue, 13 May 2025 02:31:52 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjB2-00026a-1p; Tue, 13 May 2025 02:31:45 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 17/25] test/qtest/hace: Adjust test address range for
 AST1030 due to SRAM limitations
Date: Tue, 13 May 2025 14:28:47 +0800
Message-ID: <20250513062901.2256865-18-jamin_lin@aspeedtech.com>
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
X-TUID: sp4EJv39Lvcq

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

