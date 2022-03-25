Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3771789lfb;
        Thu, 24 Mar 2022 21:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/9k5N40aUS8JzZ8T2KSv1n9O2w4q6SG3DctQje0otSDVS16Sd/6q8vMObw8ZI5kKaOdX+
X-Received: by 2002:a37:409:0:b0:67c:ab0f:8340 with SMTP id 9-20020a370409000000b0067cab0f8340mr5458450qke.69.1648180810884;
        Thu, 24 Mar 2022 21:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648180810; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6TWj00b6/ZzOEm7GYF8gVyfFl07t+l+kKGoUyzuXlv8B+xtECMCYlIc9pU9KjEUPm
         jP3wlIxdYRtJiAc74y4t2mK1GuCs8IJ9CKNrsGRbredwuHk+2fLOSf0SaFVviSgQv6rh
         XlT7mqZX+G2F68QzS2k8COOEoKehvxYufziG/KbnYLwrrr7k15PelZe6JGp0mkpUuzww
         uWXf3u/6DHz2gsLiiA/aEiJxbhBqXMrBpt+lST3ioFvKVzDQ0RQ311R/VD2XmNf9//WH
         NG7jIsfdKzWqPAB8PCtBfpEXgtQo6BoL6/amaQev4ji1IRjxIQXtr8D35Ki687DbGi9y
         2OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=SL7JD4nfxdNO9x3Q3ALocl+vhIS0wHAgWGf50+ncP8M=;
        b=rOhyEkRiQ3whhp+FhBohrKpl+z6bbRmISgc9A8TQbOIFmcS5SUllDEzE5E57ZKm1aW
         jHyR/uAikkhj24W25m9EJPDNVGl113ThiTdFhfVFiFEXnn4UEnIfBnHXUwaEpVO/Yecu
         hZqq3cgXfee7ZkNvY2u6s4Mi+0taMxDCl0PAPuoRXP3fuYwBb4qi4eLEKTA+TSDT5W0T
         YxVHXkNadrIdS1BIyHMw31AJkvT9/GAx1gW6lTODqGQrn8ZecVRWl567P8wzl1QQN6qV
         erKJLfIaVftjLrCSCYNzp/zjbuSiq1nXinszrGf+1Ns/luI3SE+SRIO7tp/etKd6k+Gn
         VSqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64-20020a379e43000000b0067e4be23a54si701315qke.665.2022.03.24.21.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 21:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXb7S-00028n-AI
	for alex.bennee@linaro.org; Fri, 25 Mar 2022 00:00:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nXb6b-00027I-Ms; Thu, 24 Mar 2022 23:59:18 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:52913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nXb6Z-0007mA-CY; Thu, 24 Mar 2022 23:59:17 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22P3lZ9V033702;
 Fri, 25 Mar 2022 11:47:35 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Mar
 2022 11:58:12 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] aspeed/hace: Support AST2600 HACE
Date: Fri, 25 Mar 2022 11:58:09 +0800
Message-ID: <20220325035810.21420-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325035810.21420-1-steven_lee@aspeedtech.com>
References: <20220325035810.21420-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22P3lZ9V033702
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nq/Kaxvd3ZHG

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

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/misc/aspeed_hace.c         | 113 +++++++++++++++++++++++++++++++---
 include/hw/misc/aspeed_hace.h |   1 +
 2 files changed, 105 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..a883625e92 100644
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
@@ -94,12 +96,17 @@ static int hash_algo_lookup(uint32_t reg)
     return -1;
 }
 
-static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
+static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
+                              bool acc_mode)
 {
     struct iovec iov[ASPEED_HACE_MAX_SG];
     g_autofree uint8_t *digest_buf;
     size_t digest_len = 0;
-    int i;
+    int i, j;
+    static struct iovec iov_cache[ASPEED_HACE_MAX_SG];
+    static int cnt;
+    static bool has_cache;
+    static uint32_t total_len;
 
     if (sg_mode) {
         uint32_t len = 0;
@@ -123,12 +130,93 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
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
+                    uint8_t *padding = iov[i].iov_base;
+                    uint32_t llen = (uint32_t)(ldq_be_p(iov[i].iov_base + plen - 8) / 8);
+                    uint32_t pad_start_off = 0;
+
+                    if (llen <= total_len) {
+                        uint32_t padding_size = total_len - llen;
+                        pad_start_off = plen - padding_size;
+                    }
+
+                    /*
+                     * FIXME:
+                     * length with sg_last_bit doesn't mean the message
+                     * contains padding.
+                     * Need to find a better way to check whether the current payload
+                     * contains padding message.
+                     * Current solution is to check:
+                     * - padding start byte is 0x80
+                     * - message length should less than total length(msg + padding)
+                     */
+                    if (llen > total_len || padding[pad_start_off] != 0x80) {
+                        has_cache = true;
+                        iov_cache[cnt].iov_base = iov[i].iov_base;
+                        iov_cache[cnt].iov_len = plen;
+                        cnt++;
+                    } else {
+                        if (has_cache) {
+                            has_cache = false;
+                            if (pad_start_off != 0) {
+                                iov_cache[cnt].iov_base = iov[i].iov_base;
+                                iov_cache[cnt].iov_len = pad_start_off;
+                                cnt++;
+                            }
+                            for (j = 0; j < cnt; j++) {
+                                iov[j].iov_base = iov_cache[j].iov_base;
+                                iov[j].iov_len = iov_cache[j].iov_len;
+                            }
+                            /*
+                             * This should be the last message as it contains
+                             * padding message.
+                             * store cnt(count of iov), clear cache and break
+                             * the loop.
+                             */
+                            i = cnt;
+                            cnt = 0;
+                            total_len = 0;
+                            break;
+                        }
+                        plen -= total_len - llen;
+                        cnt = 0;
+                        total_len = 0;
+                    }
+                }
+            }
+            iov[i].iov_len = plen;
         }
     } else {
+        /*
+         * FIXME:
+         * Driver sends hash_update() and hash_final() with
+         * sg_mode enable in aspeed ast2600 u-boot and ast1030 zephyr sdk.
+         * Clear cache if driver trigger hash_update() with sg_mode enable
+         * but trigger hash_final() without sg mode for preventing iov_cache
+         * overflow.
+         */
+        if (cnt || total_len) {
+            cnt = 0;
+            total_len = 0;
+            qemu_log_mask(LOG_UNIMP,
+                          "hash update with sg_mode and hash_final() without"
+                          "sg mode is not yet implemented\n");
+        }
+
         hwaddr len = s->regs[R_HASH_SRC_LEN];
 
         iov[0].iov_len = len;
@@ -210,6 +298,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_HASH_DEST:
         data &= ahc->dest_mask;
         break;
+    case R_HASH_KEY_BUFF:
+        data &= ahc->key_mask;
+        break;
     case R_HASH_SRC_LEN:
         data &= 0x0FFFFFFF;
         break;
@@ -229,12 +320,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
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
@@ -333,6 +425,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
+    ahc->key_mask = 0x0FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -351,6 +444,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
+    ahc->key_mask = 0x3FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -369,6 +463,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
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
2.17.1

