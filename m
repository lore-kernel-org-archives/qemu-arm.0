Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp2338091lfb;
        Tue, 21 Dec 2021 18:23:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXXofZtavycuAE93aNyJP4hv24NUNjG4wQl7d1MgzYxG1K2GJssOn//HgwsFD0se2zkXWd
X-Received: by 2002:a25:b3c1:: with SMTP id x1mr1594550ybf.647.1640139809796;
        Tue, 21 Dec 2021 18:23:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640139809; cv=none;
        d=google.com; s=arc-20160816;
        b=WOs/5Xsyo+8wcrWt100+rXahYwejgG33Z2hlgouz+kO37XWG+Tz3f9FEs73ss27aDH
         5uCQsTcdmT+6vO8xFthUdnzl3u6YdEcZfAuFPOYygLTdiE1lpAPE1uOTUd1ornfq89ib
         t0auQJCX9bVM+8j5ZcUudTgYFmBWYql/AyCm3ZwG2H7YK5tkb/3sTSAClgGWYOMkATFd
         UcwVWeCUp37WOFbjbeDry5yDsM4MvWwjaPQHTB/Hcfi1fX9G4UiypvKEDz2MBCt0JIUw
         eg7VK7y8EK65htOrKGDQfFBj+LNbsSjVkzkEIZN0bbVKzzx0hBZSaaB7I3Jtqf9Qtjn7
         LDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=imzaw7xOao6sNq9HFZ2Aou8tby/pATWygd+GR/n8EJs=;
        b=lzp+8z8YvFg9n/IwLo0KA37krWbdX7fiBf0eoxLUeAeojlu5t6rhD9tRQRrceGXMmQ
         KkfCV85uDQ/Hfy63mUh7u7lHtjKZwFbAf06tUDdEWPbsyFJFIJYNWzkkGBZHHmJrzJgn
         /O9AH2FlE8ctIuXs9Lqii6NdL0ZN2iOqBD/Rb9kCQHknWe+g7SH/xK+f3BVh1ZUQ+19n
         cEgUfVHksOCu+SnaV2yFkDQKkdeMq43D18q8qZ0Yqs/B0rgl6y0aj0r/yXHNPw2tm3Bv
         62z0yrTKJHZk1hbYEBMs2DO7WMNOOU6WxRlYVkEJj6RFBLM+MITjANOpTg8OY0q2BqFg
         kZFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v62si633851ybv.206.2021.12.21.18.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Dec 2021 18:23:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mzrHt-00063Y-6y
	for alex.bennee@linaro.org; Tue, 21 Dec 2021 21:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mzrHj-00063M-Cv; Tue, 21 Dec 2021 21:23:19 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1mzrHg-0002RH-CI; Tue, 21 Dec 2021 21:23:19 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM2H9MM045051;
 Wed, 22 Dec 2021 10:17:09 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 10:22:34 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] Supporting AST2600 HACE engine accumulative mode
Date: Wed, 22 Dec 2021 10:22:31 +0800
Message-ID: <20211222022231.231575-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM2H9MM045051
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F354kle8uNUP

Accumulative mode will supply a initial state and append padding bit at
the end of hash stream.  However, the crypto library will padding those
bit automatically, so ripped it off from iov array.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/misc/aspeed_hace.c         | 30 ++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_hace.h |  1 +
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..7c1794d6d0 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -27,6 +27,7 @@
 
 #define R_HASH_SRC      (0x20 / 4)
 #define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
 
 #define R_HASH_CMD      (0x30 / 4)
@@ -94,7 +95,10 @@ static int hash_algo_lookup(uint32_t reg)
     return -1;
 }
 
-static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
+static void do_hash_operation(AspeedHACEState *s,
+                              int algo,
+                              bool sg_mode,
+                              bool acc_mode)
 {
     struct iovec iov[ASPEED_HACE_MAX_SG];
     g_autofree uint8_t *digest_buf;
@@ -103,6 +107,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
 
     if (sg_mode) {
         uint32_t len = 0;
+        uint32_t total_len = 0;
 
         for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
             uint32_t addr, src;
@@ -127,6 +132,21 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
             plen = iov[i].iov_len;
             iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
                                                 MEMTXATTRS_UNSPECIFIED);
+
+            total_len += plen;
+            if (acc_mode && len & SG_LIST_LEN_LAST) {
+                /*
+                 * Read the message length in bit from last 64/128 bits
+                 * and tear the padding bits from iov
+                 */
+                uint64_t stream_len;
+
+                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_len - 8, 8);
+                stream_len = __bswap_64(stream_len) / 8;
+
+                if (total_len > stream_len)
+                    iov[i].iov_len -= total_len - stream_len;
+            }
         }
     } else {
         hwaddr len = s->regs[R_HASH_SRC_LEN];
@@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_HASH_DEST:
         data &= ahc->dest_mask;
         break;
+    case R_HASH_KEY_BUFF:
+        data &= ahc->key_mask;
+        break;
     case R_HASH_SRC_LEN:
         data &= 0x0FFFFFFF;
         break;
@@ -234,7 +257,7 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                         __func__, data & ahc->hash_mask);
                 break;
         }
-        do_hash_operation(s, algo, data & HASH_SG_EN);
+        do_hash_operation(s, algo, data & HASH_SG_EN, data & HASH_DIGEST_ACCUM);
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
@@ -333,6 +356,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
+    ahc->key_mask = 0x0FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -351,6 +375,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
+    ahc->key_mask = 0x3FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -369,6 +394,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
     ahc->hash_mask = 0x00147FFF;
 }
 
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 94d5ada95f..2242945eb4 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -37,6 +37,7 @@ struct AspeedHACEClass {
 
     uint32_t src_mask;
     uint32_t dest_mask;
+    uint32_t key_mask;
     uint32_t hash_mask;
 };
 
-- 
2.25.1

