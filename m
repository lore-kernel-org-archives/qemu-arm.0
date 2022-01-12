Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2272695lfj;
        Wed, 12 Jan 2022 00:56:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq2lUKgeDbi66e+pMQPvBdNtU9yn0unjpJMDea6X0MySe1pN+TtMrwrjsFqAP6ubQ0WjXE
X-Received: by 2002:a05:6214:2269:: with SMTP id gs9mr7222994qvb.40.1641977795497;
        Wed, 12 Jan 2022 00:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641977795; cv=none;
        d=google.com; s=arc-20160816;
        b=DzBPuy/ry6cxeONgbsvoBy0E7Ui0OVz4XCoWdb6nVctYvGFx7qPsSiYwAHmMrf+c2P
         ExK6e1TGIW2HFY7cckf6FnQ+XomAlcQ9QpJl1AkAopbS3seek7qXdnL1+zXItSMo5VdA
         g3q7SqvBmhlwogiykm1NdMzTq3UQos0/TvRzr4dQ1ZASaIMrVRmMaiznryLewncpqOay
         Iezlky3HTA490jfhcCqfyLFG3EFeDAP9m9RclGmvMerUy6nEfumHuwUSrrG9cRGJpBCY
         +5TUp41sIPMm7hp5pIstOSRf9VDtnHLJfQOkc63+S7rkobZ8P19uVh2FeamAsVrVRq3z
         mctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Wb9ci1Zs1ptczAgzTWRYkbCotXJ7vQbsjuEP5uzNmI0=;
        b=GOZw5i2Z+a6gmzJvRhGUtHZj8Xw4H05TD/AQ8mswAMkbPWwHOMRhWsuJRuroLAGwXQ
         JXHyHHidJUKi4AipeyWVfJpmwECGPaSiMbf2hIxgea2/HPN+2in8M6CTSBSi7xIihoWn
         2268tUOwTp4zgtCmGseSybBHIFCo4IWYW8MWTk3nXrvNPWMnbzFKR6MSf5D18wVIn+Ex
         7qrdpCbtBgqvUuCme5sUMF9LSbWVC+gd55x21dj48/A3G6IV8aXH+hKqiy3Jzs9L1Xaz
         anPvYu6TKpl2FlCSfbjL/b/C8TwTlfEhq+1NYxa4TpuVp7FNDKn9etrzUDYfntg5n98+
         OaPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo14si811344qvb.254.2022.01.12.00.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 00:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7ZQo-0007OG-7f
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 03:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z93-00009L-LT; Wed, 12 Jan 2022 03:38:13 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:61395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z91-0003VF-FR; Wed, 12 Jan 2022 03:38:13 -0500
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 20C85Bp4000779;
 Wed, 12 Jan 2022 16:05:11 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20C8332N099909;
 Wed, 12 Jan 2022 16:03:03 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jan
 2022 16:09:40 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/2] hw/misc: Supporting AST2600 HACE accumulative mode
Date: Wed, 12 Jan 2022 16:09:36 +0800
Message-ID: <20220112080937.366835-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112080937.366835-1-troy_lee@aspeedtech.com>
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20C8332N099909
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
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SoMzAyEAkW+K

Accumulative mode will supply a initial state and append padding bit at
the end of hash stream.  However, the crypto library will padding those
bit automatically, so ripped it off from iov array.

The aspeed ast2600 acculumative mode is described in datasheet
ast2600v10.pdf section 25.6.4:
 1. Allocationg and initiating accumulative hash digest write buffer
    with initial state.
    * Since QEMU crypto/hash api doesn't provide the API to set initial
      state of hash library, and the initial state is already setted by
      crypto library (gcrypt/glib/...), so skip this step.
 2. Calculating accumulative hash digest.
    (a) When receiving the last accumulative data, software need to add
        padding message at the end of the accumulative data. Padding
        message described in specific of MD5, SHA-1, SHA224, SHA256,
        SHA512, SHA512/224, SHA512/256.
        * Since the crypto library (gcrypt/glib) already pad the
          padding message internally.
        * This patch is to remove the padding message which fed byguest
          machine driver.

Changes in v2:
- Coding style
- Add accumulative mode description in comment

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/misc/aspeed_hace.c         | 43 ++++++++++++++++++++++++++++-------
 include/hw/misc/aspeed_hace.h |  1 +
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..0710f44621 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "qemu/bswap.h"
 #include "hw/misc/aspeed_hace.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
@@ -27,6 +28,7 @@
 
 #define R_HASH_SRC      (0x20 / 4)
 #define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
 
 #define R_HASH_CMD      (0x30 / 4)
@@ -94,7 +96,8 @@ static int hash_algo_lookup(uint32_t reg)
     return -1;
 }
 
-static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
+static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
+                              bool acc_mode)
 {
     struct iovec iov[ASPEED_HACE_MAX_SG];
     g_autofree uint8_t *digest_buf;
@@ -103,6 +106,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
 
     if (sg_mode) {
         uint32_t len = 0;
+        uint32_t total_len = 0;
 
         for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
             uint32_t addr, src;
@@ -123,10 +127,26 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
                                         MEMTXATTRS_UNSPECIFIED, NULL);
             addr &= SG_LIST_ADDR_MASK;
 
-            iov[i].iov_len = len & SG_LIST_LEN_MASK;
-            plen = iov[i].iov_len;
+            plen = len & SG_LIST_LEN_MASK;
             iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
                                                 MEMTXATTRS_UNSPECIFIED);
+
+            if (acc_mode) {
+                total_len += plen;
+
+                if (len & SG_LIST_LEN_LAST) {
+                    /*
+                     * In the padding message, the last 64/128 bit represents
+                     * the total length of bitstream in big endian.
+                     * SHA-224, SHA-256 are 64 bit
+                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
+                     * However, we would not process such a huge bit stream.
+                     */
+                    plen -= total_len - (ldq_be_p(iov[i].iov_base + plen - 8) / 8);
+                }
+            }
+
+            iov[i].iov_len = plen;
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
@@ -229,12 +252,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
         }
         algo = hash_algo_lookup(data);
         if (algo < 0) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
-                        __func__, data & ahc->hash_mask);
-                break;
+            qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
+                    __func__, data & ahc->hash_mask);
+            break;
         }
-        do_hash_operation(s, algo, data & HASH_SG_EN);
+        do_hash_operation(s, algo, data & HASH_SG_EN,
+                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
@@ -333,6 +357,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
+    ahc->key_mask = 0x0FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -351,6 +376,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
+    ahc->key_mask = 0x3FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -369,6 +395,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
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

