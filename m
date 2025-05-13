Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322254njb;
        Mon, 12 May 2025 23:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUc0xo2kVgkpPSBVG3/xFFrovjNvdR87/QxAB+PFqtrzZvK4vh4dTgI9DLXak9f3VvUxs/oPLmWJZq3MA==@linaro.org
X-Google-Smtp-Source: AGHT+IFESSMmyuqAAdqzrP/y4I2G6NuW3/5j7pl+UMdwOwFpygPbndrTqwPUiD41le8uh6jH3p9R
X-Received: by 2002:a05:620a:2585:b0:7cc:9245:9ec3 with SMTP id af79cd13be357-7cd010d0093mr2855769285a.8.1747117842700;
        Mon, 12 May 2025 23:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117842; cv=none;
        d=google.com; s=arc-20240605;
        b=ChzEIv4t9mZ5ccuGcQywYpCxN9Wf2JnMb88jYdEqoNmKkP9rv7QKg7rRL5VPg3NG8E
         250MbilVhSEWCV/GHUMUeTPUsNS1B5cFOCQQLuEB+xBa6vZ1c8LB6gM85ZupfJ9aZiPo
         9qQ2t8/7Re7Sbj7SPxsXRXOyK2GRWXZ3C6mFognuYPN0WA2yprEJjH19soEQPkJkYUMQ
         rWsJJzCbVLz5C+RA53E0Xgb1LksRwcniSWuREMSOYxvBSeQhEk+83RsL7vWTrwQXWydh
         8vsmZvl9xeij/ASR1nVwJ8VKyvVjOBO9vvplEiIcQIEMx/9QSZ1Md5EifRbOvvBgx0gx
         pXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vYLWE9sB8TopoBDv1CK6mj1ypsGfZ+GZt74X2LZfCAc=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=GgaPK45SUV6eA4zMh/tvL3xXAwPgfNSt+WRqznw3dL7PCvcGhuTltesmjlUF8DKyUh
         VGR592gY0ggYPPSpBT+Y5YztaQWhWqDsJE7/dhlLRLXF4bWobd6FQ0sFb7VWW8paXrht
         JKZ/jqzj6aPcay+wndAXefI81ElWSzjJ6adb5N9WT9SpSwbqQaloHmHBScmzKOEmUify
         N4PA/Fy+3JCCzFA374lU1FiqL2rIzcEXdQVKKLLvgd2CfWrov/ep8j/YpKEepC12ZsP1
         vJk0COZKZlFMmqR2QYLq4uPkKtG41/ZY8gSHt6WEIqFN+UnPnan958fcdvdmGGpKp8dZ
         VU3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe3d54si1112054685a.436.2025.05.12.23.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEj9x-0004CG-TN; Tue, 13 May 2025 02:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9t-0003xY-Ck; Tue, 13 May 2025 02:30:33 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9q-00022O-Lh; Tue, 13 May 2025 02:30:33 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:04 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 07/25] hw/misc/aspeed_hace: Rename R_HASH_DEST to
 R_HASH_DIGEST and introduce 64-bit hash digest address helper
Date: Tue, 13 May 2025 14:28:37 +0800
Message-ID: <20250513062901.2256865-8-jamin_lin@aspeedtech.com>
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
X-TUID: WRY25TNoBAAk

Renaming R_HASH_DEST to R_HASH_DIGEST for better semantic clarity.

The AST2700 CPU, based on the Cortex-A35, features a 64-bit DRAM address space.
To prepare for future AST2700 support, this change introduces a new helper
function hash_get_digest_addr() to encapsulate digest address extraction logic
and improve code readability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 5f3c8190ef..c5ddc1c99a 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -27,7 +27,7 @@
 #define TAG_IRQ         BIT(15)
 
 #define R_HASH_SRC      (0x20 / 4)
-#define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_DIGEST   (0x24 / 4)
 #define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
 
@@ -238,17 +238,30 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
     return iov_idx;
 }
 
+static uint64_t hash_get_digest_addr(AspeedHACEState *s)
+{
+    uint64_t digest_addr = 0;
+
+    digest_addr = deposit64(digest_addr, 0, 32, s->regs[R_HASH_DIGEST]);
+
+    return digest_addr;
+}
+
 static void hash_write_digest_and_unmap_iov(AspeedHACEState *s,
                                             struct iovec *iov,
                                             int iov_idx,
                                             uint8_t *digest_buf,
                                             size_t digest_len)
 {
-    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
-                            MEMTXATTRS_UNSPECIFIED, digest_buf, digest_len)) {
+    uint64_t digest_addr = 0;
+
+    digest_addr = hash_get_digest_addr(s);
+    if (address_space_write(&s->dram_as, digest_addr,
+                            MEMTXATTRS_UNSPECIFIED,
+                            digest_buf, digest_len)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Failed to write digest to 0x%x\n",
-                      __func__, s->regs[R_HASH_DEST]);
+                      "%s: Failed to write digest to 0x%" HWADDR_PRIx "\n",
+                      __func__, digest_addr);
     }
 
     for (; iov_idx > 0; iov_idx--) {
@@ -402,7 +415,7 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_HASH_SRC:
         data &= ahc->src_mask;
         break;
-    case R_HASH_DEST:
+    case R_HASH_DIGEST:
         data &= ahc->dest_mask;
         break;
     case R_HASH_KEY_BUFF:
-- 
2.43.0

