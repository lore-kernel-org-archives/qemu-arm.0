Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691399njb;
        Thu, 15 May 2025 01:12:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUroh45vDrNGz4VKF8ndZLQoyl0fXWkLXski+/z1QeTNykJUDsfUK6gjcRaIpbNbxdJTAwCyJ4C0RkyAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFWYBoC6WBt2wqAQRCdVuv8FD7Oreszq915Uow7PYrLTJdKW/bgmcC6e8VOoTRyQQewXzSs
X-Received: by 2002:a05:620a:27d6:b0:7c5:3e89:c6df with SMTP id af79cd13be357-7cd3c65231fmr211533085a.12.1747296724099;
        Thu, 15 May 2025 01:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296724; cv=none;
        d=google.com; s=arc-20240605;
        b=giGbJ7aYJ6tX53iinlPQOpTl7DjHGyP2nfPXNP2dzT0/Qh6y2smqec5tQyZ8vPgRKz
         yq56YLkbNnRL+Q+ccUFWD5lHodf087raLPBFl3UI9ZTsYPu+y1tXoXCQL9fYBpjvTWXB
         U4eofTZGY97g62LDzIHx8p2icOI++IFBX3fElp6Dsaw+kwsH5Ot1Wj2orZgItqZ3coOK
         2SVzfobg/cfRkbmk2smZww+zQzn/eIvy/fzJd04qArPOeRX1DD8wA5QNctvC2tZPBFix
         x7OAyiz8fZd+UV8kDmkQyBQhNfbPs6nCi9fD5UJuTUnd8xfmCxRogiAyMBjeL2MeYiA8
         l9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=RK38aP0QKn4boTXt1w/5obRe+Q47fxGbv+JMpFFkRlY=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=VMKol6xegr0S6l+nGdXqp4+UsOQFxZCoghelbeomyGDEIqhhG6vpjz5WsnRkddZrTg
         +ICx0Zxszu6OPV00WtEMjshZR4xaste66h3riHk1ZJIpJrjcZpBY4wCzicKCEyrjYhZr
         /oFeeqyxvYp0thi1lrNku60YqZ2XaRiu2cF40SG164xnmedbKAEtt9zZqOvkoRbrGkff
         5PhaNSUF/ocuHh5VXMTE5C11aol1rUDR6MHVmPFfYbTgi46amhr79uAbaXKkmPw0xofm
         zBYe96qctbEQ4iZySQPAMNh/n9nsSA9oJuYYYpgoTacDC9xtsYkv7rRF+2rUY0HRm/xt
         8QKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f69c38si1500444885a.189.2025.05.15.01.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFTgg-0005GJ-1z; Thu, 15 May 2025 04:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfp-0003Bs-ND; Thu, 15 May 2025 04:10:37 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfn-00011Y-N3; Thu, 15 May 2025 04:10:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:09 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:09 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 05/28] hw/misc/aspeed_hace: Extract SG-mode hash buffer
 setup into helper function
Date: Thu, 15 May 2025 16:09:37 +0800
Message-ID: <20250515081008.583578-6-jamin_lin@aspeedtech.com>
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
X-TUID: 2zlEU8B9pMvn

To improve code readability and maintainability of do_hash_operation(), this
commit introduces a new helper function: hash_prepare_sg_iov().

This function handles scatter-gather (SG) mode setup, including SG list
parsing, address mapping, and optional accumulation mode support with
padding detection.

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 111 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 42c6f29f82..22eea62693 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -167,6 +167,67 @@ static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
 
     return iov_idx;
 }
+
+static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
+                               bool acc_mode, bool *acc_final_request)
+{
+    uint32_t total_msg_len;
+    uint32_t pad_offset;
+    uint32_t len = 0;
+    uint32_t sg_addr;
+    uint32_t src;
+    int iov_idx;
+    hwaddr plen;
+    void *haddr;
+
+    for (iov_idx = 0; !(len & SG_LIST_LEN_LAST); iov_idx++) {
+        if (iov_idx == ASPEED_HACE_MAX_SG) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Failed to set end of sg list marker\n",
+                          __func__);
+            return -1;
+        }
+
+        src = s->regs[R_HASH_SRC] + (iov_idx * SG_LIST_ENTRY_SIZE);
+
+        len = address_space_ldl_le(&s->dram_as, src,
+                                   MEMTXATTRS_UNSPECIFIED, NULL);
+        sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
+                                       MEMTXATTRS_UNSPECIFIED, NULL);
+        sg_addr &= SG_LIST_ADDR_MASK;
+
+        plen = len & SG_LIST_LEN_MASK;
+        haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
+                                  MEMTXATTRS_UNSPECIFIED);
+
+        if (haddr == NULL) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Unable to map address, sg_addr=0x%x, "
+                          "plen=0x%" HWADDR_PRIx "\n",
+                          __func__, sg_addr, plen);
+            return -1;
+        }
+
+        iov[iov_idx].iov_base = haddr;
+        if (acc_mode) {
+            s->total_req_len += plen;
+
+            if (has_padding(s, &iov[iov_idx], plen, &total_msg_len,
+                            &pad_offset)) {
+                /* Padding being present indicates the final request */
+                *acc_final_request = true;
+                iov[iov_idx].iov_len = pad_offset;
+            } else {
+                iov[iov_idx].iov_len = plen;
+            }
+        } else {
+            iov[iov_idx].iov_len = plen;
+        }
+    }
+
+    return iov_idx;
+}
+
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
@@ -174,15 +235,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     struct iovec iov[ASPEED_HACE_MAX_SG];
     bool acc_final_request = false;
     Error *local_err = NULL;
-    uint32_t total_msg_len;
     size_t digest_len = 0;
-    uint32_t sg_addr = 0;
-    uint32_t pad_offset;
-    int iov_idx = 0;
-    uint32_t len = 0;
-    uint32_t src = 0;
-    void *haddr;
-    hwaddr plen;
+    int iov_idx = -1;
 
     if (acc_mode && s->hash_ctx == NULL) {
         s->hash_ctx = qcrypto_hash_new(algo, &local_err);
@@ -196,46 +250,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
 
     /* Prepares the iov for hashing operations based on the selected mode */
     if (sg_mode) {
-        for (iov_idx = 0; !(len & SG_LIST_LEN_LAST); iov_idx++) {
-            if (iov_idx == ASPEED_HACE_MAX_SG) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                        "aspeed_hace: guest failed to set end of sg list marker\n");
-                break;
-            }
-
-            src = s->regs[R_HASH_SRC] + (iov_idx * SG_LIST_ENTRY_SIZE);
-
-            len = address_space_ldl_le(&s->dram_as, src,
-                                       MEMTXATTRS_UNSPECIFIED, NULL);
-
-            sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
-                                           MEMTXATTRS_UNSPECIFIED, NULL);
-            sg_addr &= SG_LIST_ADDR_MASK;
-
-            plen = len & SG_LIST_LEN_MASK;
-            haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
-                                      MEMTXATTRS_UNSPECIFIED);
-            if (haddr == NULL) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "%s: qcrypto failed\n", __func__);
-                return;
-            }
-            iov[iov_idx].iov_base = haddr;
-            if (acc_mode) {
-                s->total_req_len += plen;
-
-                if (has_padding(s, &iov[iov_idx], plen, &total_msg_len,
-                                &pad_offset)) {
-                    /* Padding being present indicates the final request */
-                    acc_final_request = true;
-                    iov[iov_idx].iov_len = pad_offset;
-                } else {
-                    iov[iov_idx].iov_len = plen;
-                }
-            } else {
-                iov[iov_idx].iov_len = plen;
-            }
-        }
+        iov_idx = hash_prepare_sg_iov(s, iov, acc_mode, &acc_final_request);
     } else {
         iov_idx = hash_prepare_direct_iov(s, iov);
     }
-- 
2.43.0

