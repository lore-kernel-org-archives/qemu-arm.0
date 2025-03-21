Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178610njc;
        Fri, 21 Mar 2025 02:28:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP96f+rYs2Ira2hoP45rEINTMknZPWH7xA37uOxI/DrxbwrSfRQl19sFp0MUpawAsj3l+tn+tRREYXoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGDApUaVw98z5YzDuwSCEEvS7fYv4aHZ+48oxzD8uPwzjPWrkwa1/nTBT00nA4z5O84M/lx
X-Received: by 2002:a05:6214:19e7:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6eb3f1b849fmr42667506d6.0.1742549317938;
        Fri, 21 Mar 2025 02:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549317; cv=none;
        d=google.com; s=arc-20240605;
        b=ApKaT3x5TvTRsBAKTPFupXGFIMBNf8QTdEKC3xvFbwGvoWiuwo7jQv/MtjKTE1nQ97
         Vocf3UeUmI3JA8fk+zAMvy7oKXb4T56HcXim+XOmuDXpcKlTeqBXi/wE1V0RCBKbjrGI
         qpcrfnIkLKFqvhIiubPohcBscSRTTICqXPIZs3/naCi3NcWd9L7eNkZFHO1Rl6QVtoqL
         7SXxCOAaWLhPadSjA+gyOg/e7B8VcOqajBTYDhXyrg5eFJUdO3FHBXOLM0Ai8A8Q9ub7
         aePJyy+vdwxfPaENBOMlb8x4rH7sKP68JygRCUv0aE56BZGU0YxcY+hEVwKSN3A08Lu2
         6rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=FFrOkw/JxpbPMuMNHvckMeBuhOwl7yW5ViVEV437CTs=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=RQRvD7H1NwlEuEo5fdqBPZgZ9Js3Xl2dhWeYFyDSJtSM9EoylJ7SkDjqdy2V7ZsQCX
         mHNYscTFwdcd77pk0esZyp1WnvCtUJ9doBNPeF8IaVMLC+o7odIjw3XDMqrpCj5T5pUv
         UBc8uuFMosSGO5HiCMoNOXZesUFaTFPSrgdKlaxDd0toh+pKgBc6PYdCBVV+rd/fi92Q
         l3m7xlflTrmRzl1Heo76OkyWpVrfErdTWVWIf5mdZVR3L00y+ayAbwltrweQ2P21z9NQ
         Ad4jQLSCaKXPhyiF3njRui9CB/VKp9s2wXdG9q3tZczpcTLIaq8eBdsKKZcO+NwD57ni
         NNxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01a4edsi15207546d6.284.2025.03.21.02.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYg1-0001sj-BV; Fri, 21 Mar 2025 05:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfn-0001Uk-Il; Fri, 21 Mar 2025 05:28:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfl-0005jH-Tx; Fri, 21 Mar 2025 05:28:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:31 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:31 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 21/22] test/qtest/hace: Support to validate 64-bit hmac key
 buffer addresses
Date: Fri, 21 Mar 2025 17:26:17 +0800
Message-ID: <20250321092623.2097234-22-jamin_lin@aspeedtech.com>
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
X-TUID: ov3UBOo6UeZe

Added "key" and "key_hi" fields to "AspeedMasks" for 64-bit addresses test.
Updated "aspeed_test_addresses" to validate "HACE_HASH_KEY_BUFF" and
"HACE_HASH_KEY_BUFF_HI".
Ensured correct masking of 64-bit addresses by checking both lower and upper
32-bit registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.h |  2 ++
 tests/qtest/aspeed-hace-utils.c | 14 ++++++++++++++
 tests/qtest/aspeed_hace-test.c  |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/tests/qtest/aspeed-hace-utils.h b/tests/qtest/aspeed-hace-utils.h
index de8055a1db..c8b2ec45af 100644
--- a/tests/qtest/aspeed-hace-utils.h
+++ b/tests/qtest/aspeed-hace-utils.h
@@ -50,9 +50,11 @@ struct AspeedSgList {
 struct AspeedMasks {
     uint32_t src;
     uint32_t dest;
+    uint32_t key;
     uint32_t len;
     uint32_t src_hi;
     uint32_t dest_hi;
+    uint32_t key_hi;
 };
 
 void aspeed_test_md5(const char *machine, const uint32_t base,
diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
index fc209353f3..a5ece614ed 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -591,6 +591,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC_HI), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
 
     /* Check that the address masking is correct */
@@ -609,6 +611,14 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==,
                     expected->dest_hi);
 
+    qtest_writel(s, base + HACE_HASH_KEY_BUFF, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==,
+                    expected->key);
+
+    qtest_writel(s, base + HACE_HASH_KEY_BUFF_HI, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==,
+                    expected->key_hi);
+
     qtest_writel(s, base + HACE_HASH_DATA_LEN, 0xffffffff);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==,
                     expected->len);
@@ -618,6 +628,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
     qtest_writel(s, base + HACE_HASH_SRC_HI, 0);
     qtest_writel(s, base + HACE_HASH_DIGEST, 0);
     qtest_writel(s, base + HACE_HASH_DIGEST_HI, 0);
+    qtest_writel(s, base + HACE_HASH_KEY_BUFF, 0);
+    qtest_writel(s, base + HACE_HASH_KEY_BUFF_HI, 0);
     qtest_writel(s, base + HACE_HASH_DATA_LEN, 0);
 
     /* Check that all bits are now zero */
@@ -625,6 +637,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC_HI), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==, 0);
     g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
 
     qtest_quit(s);
diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 31890d574e..38777020ca 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -13,24 +13,28 @@
 static const struct AspeedMasks ast1030_masks = {
     .src  = 0x7fffffff,
     .dest = 0x7ffffff8,
+    .key = 0x7ffffff8,
     .len  = 0x0fffffff,
 };
 
 static const struct AspeedMasks ast2600_masks = {
     .src  = 0x7fffffff,
     .dest = 0x7ffffff8,
+    .key = 0x7ffffff8,
     .len  = 0x0fffffff,
 };
 
 static const struct AspeedMasks ast2500_masks = {
     .src  = 0x3fffffff,
     .dest = 0x3ffffff8,
+    .key = 0x3fffffc0,
     .len  = 0x0fffffff,
 };
 
 static const struct AspeedMasks ast2400_masks = {
     .src  = 0x0fffffff,
     .dest = 0x0ffffff8,
+    .key = 0x0fffffc0,
     .len  = 0x0fffffff,
 };
 
-- 
2.43.0

