Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp179486njc;
        Fri, 21 Mar 2025 02:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFi1kZZcDyhIqdLvyL7zTms91wz0DatJoggjHDXgRvml7cG8ktPJL8SfhMOvmhEk1NXak3J9zDPVQHuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGeI9lXminw4vBxgZ++eKmJddMjiZKdoaj0zzu+bDqwrON6AI8hGMUq/EfaMRXlozQNNP/P
X-Received: by 2002:a05:620a:44ca:b0:7c5:4ac6:79de with SMTP id af79cd13be357-7c5ba15ef85mr271522885a.24.1742549444286;
        Fri, 21 Mar 2025 02:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549444; cv=none;
        d=google.com; s=arc-20240605;
        b=NDOwBKNF7FQOLRKH/RH2GZps0Edfl1/1FnNAnbdNdAtwrvdi+hmCA/MXIBUixRAdFl
         t84I3M8//ocOLWKrcdnpBZiT1jtWjm1aEjtAy6Uvbw9Od13+OaOhPBZ84fN88ABoyOgP
         orZ82dz7YSvL8+5MX9HcAwWpRycAuO9SZDP0iQuMmlR8k3BPLR5a5s8WWlNLDQGOPGUo
         1+FC/GjMUUhzZQfvQCkheNexPifXll1GLQG6fb6rTlp2YqjztvhOIFsjce6wHP8lS3YB
         c+QZPmiesXWbLDUJ7fZvMmKo0J6Qi49irWM/F9Y2u3Ug6VILfOnFBC2fhJ6vI+3drcTh
         7hEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ue5BEwpzBa6QOnWJbqXrv2dCki1jrKRmbOGKO/ey/2Y=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=bc9skiMK0p2j0hfkkmH/2J6JxDEwtEAZ8C2nO8uop/FNrUUguZVzhjy6RAKas1apGi
         WrlPFJBbpicxMuNAY+UfbkIf18gMaDBkHclcVm2erQWAKVZMp+WMrU8BuU4oiqA2o0pk
         TDyQszw6Bua6b16ehnLe2Ow4I82OnfGOtRe5TRRyV+zeRiyyVxxe8WQKAfqQUw4auJQK
         vLKA4k4QicNVCNarYYllOTdaaYivPqwxlT5+T5q/S3qtZK8Dwu4hg/94JVhwAarBZvX4
         GIWp+u5WGCJShzdHGgFpV8lvHMKpEDMqplISPGnyifnEuKEp7SbtGxBHI/WmH71dz3v8
         lsEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9356b1fsi154462485a.372.2025.03.21.02.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYfc-0000p5-7B; Fri, 21 Mar 2025 05:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfa-0000gl-KN; Fri, 21 Mar 2025 05:28:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfY-0005EC-Hd; Fri, 21 Mar 2025 05:28:02 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:30 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 18/22] test/qtest/hace: Update source data and digest data
 type to 64-bit
Date: Fri, 21 Mar 2025 17:26:14 +0800
Message-ID: <20250321092623.2097234-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
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
X-TUID: dGa/EjHRV5bc

Currently, the hash data source and digest result buffer addresses are set to
32-bit. However, the AST2700 CPU is a 64-bit Cortex-A35 architecture, and its
DRAM base address is also 64-bit.

To support AST2700, update the hash data source address and digest result buffer
address to use 64-bit addressing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.h | 20 +++----
 tests/qtest/aspeed-hace-utils.c | 96 ++++++++++++++++-----------------
 2 files changed, 58 insertions(+), 58 deletions(-)

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
index d3146898c2..f39bb8ea48 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -153,22 +153,22 @@ static const uint8_t test_result_accum_sha256[] = {
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
     uint8_t digest[32] = {0};
 
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
@@ -300,22 +300,22 @@ void aspeed_test_sha512(const char *machine, const uint32_t base,
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
-           cpu_to_le32(src_addr_1) },
+           cpu_to_le64(src_addr_1) },
         {  cpu_to_le32(sizeof(test_vector_sg2)),
-           cpu_to_le32(src_addr_2) },
+           cpu_to_le64(src_addr_2) },
         {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
-           cpu_to_le32(src_addr_3) },
+           cpu_to_le64(src_addr_3) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
@@ -351,22 +351,22 @@ void aspeed_test_sha256_sg(const char *machine, const uint32_t base,
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
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_sg1)),
-           cpu_to_le32(src_addr_1) },
+           cpu_to_le64(src_addr_1) },
         {  cpu_to_le32(sizeof(test_vector_sg2)),
-           cpu_to_le32(src_addr_2) },
+           cpu_to_le64(src_addr_2) },
         {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
-           cpu_to_le32(src_addr_3) },
+           cpu_to_le64(src_addr_3) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
@@ -402,22 +402,22 @@ void aspeed_test_sha384_sg(const char *machine, const uint32_t base,
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
-           cpu_to_le32(src_addr_1) },
+           cpu_to_le64(src_addr_1) },
         {  cpu_to_le32(sizeof(test_vector_sg2)),
-           cpu_to_le32(src_addr_2) },
+           cpu_to_le64(src_addr_2) },
         {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
-           cpu_to_le32(src_addr_3) },
+           cpu_to_le64(src_addr_3) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
@@ -453,16 +453,16 @@ void aspeed_test_sha512_sg(const char *machine, const uint32_t base,
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
-           cpu_to_le32(buffer_addr) },
+           cpu_to_le64(buffer_addr) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
@@ -494,16 +494,16 @@ void aspeed_test_sha256_accum(const char *machine, const uint32_t base,
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
     uint8_t digest[64] = {0};
     struct AspeedSgList array[] = {
         {  cpu_to_le32(sizeof(test_vector_accum_384) | SG_LIST_LEN_LAST),
-           cpu_to_le32(buffer_addr) },
+           cpu_to_le64(buffer_addr) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
@@ -535,16 +535,16 @@ void aspeed_test_sha384_accum(const char *machine, const uint32_t base,
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
-           cpu_to_le32(buffer_addr) },
+           cpu_to_le64(buffer_addr) },
     };
 
     /* Check engine is idle, no busy or irq bits set */
-- 
2.43.0

