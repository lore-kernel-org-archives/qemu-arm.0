Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691538njb;
        Thu, 15 May 2025 01:12:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZBGQo3xB9mcBoRfLr3bckw8JlNChLblaIhOVAc+RiO1QF18kfGmlFjgOcamAOTCc4nZsm0+DR1rwtLg==@linaro.org
X-Google-Smtp-Source: AGHT+IE905+zluFZvHL2Vuf0UUk/EQpAh9K/lPGOVx0Co8rfpN4Fh/OfWIv0+HMr377jaYkpa4fi
X-Received: by 2002:a05:622a:1dc7:b0:476:91d8:230e with SMTP id d75a77b69052e-49495d2dc6bmr118426711cf.52.1747296745661;
        Thu, 15 May 2025 01:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296745; cv=none;
        d=google.com; s=arc-20240605;
        b=HoKQLPsPIxcNj198X+ZlGOUo9ScQREDt/BoYEYyQUo7tZnhLo+fW1cVzt11CxDiMkA
         pa7+gyWDB6U/LsgdL1OrYLOzWbl84+KWXAwk5Af5o4ylax31Cugsgdvt+emPCbRb7NCj
         75NPiPubkLJ4khbqiFf8Yin4DwsxGjaz1JTTA9RzJAKdr0KH2RgtPnsf6d9eTzu08+oU
         bHSkKwgdkw5fxc5FLOQ4HWu7wJ6jsZXdcqx4qXu85c3SFMKIBn6t8Tp25QT6qWTzB///
         noIjodBhbfJquCN0mX30eijXBqXoi0pbeVdNm/kJr3TZPw7bJttfzQGiGd8G1ijX/QmB
         K4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=esg4z80x2orh0prua18tDovhEZSZ9yAAWe7BXFxdANI=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=Bo2/KnIjfxE/HPge3KKKx/tjyEtj80wXdM8LL/XHODQ9s+ONNFpmS3BzQrHamGBP6E
         UZ+A5Pi1ABvucvsE3Io9P31IxH0XMPi/xqBW7UYo4j8lNliUYcpeVAY1FGWdk9xk/rH2
         1UfnT6JBId3QUTMoN0Tl1MKjgjBNe3Sud4uzkOtbWiGJEAt9jzUNUkn+uep3+TlxoWN8
         hXlQO8P82QZeel9E0PhgX9s/J6e5c0h65cYN7TJQUQyeCgkoBjdydCH7aMX5X6v1kcss
         rywaFS7mlDDa6s7gde3tK1BjzP0sedfqvnwMtGz9MiiEuouEOXKCAEvaxDL4V3hHaQGt
         bLLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945257f65dsi159291091cf.370.2025.05.15.01.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFThO-0000CK-IN; Thu, 15 May 2025 04:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfw-0003PZ-C4; Thu, 15 May 2025 04:10:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfu-00011Y-2m; Thu, 15 May 2025 04:10:43 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 10/28] hw/misc/aspeed_hace: Rename R_HASH_DEST to
 R_HASH_DIGEST and introduce 64-bit hash digest address helper
Date: Thu, 15 May 2025 16:09:42 +0800
Message-ID: <20250515081008.583578-11-jamin_lin@aspeedtech.com>
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
X-TUID: ctbQjzk096dj

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
index b3c3af51fa..62649b5b27 100644
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

