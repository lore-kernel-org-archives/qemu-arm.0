Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322205njb;
        Mon, 12 May 2025 23:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz70B5IuGT0fPqHgP/NTInvr9RVGlIVEracTkciMmaILMCgycvQ4XaPakI7MehVzIeUDGW3imiPuOnPw==@linaro.org
X-Google-Smtp-Source: AGHT+IGBFDkb1846HPSQttnzEGXWFekqItZNwk8HsRnHl2mUHkzPYTXzAEiNsMcEDAtLaVFs7Uhb
X-Received: by 2002:a05:620a:88f:b0:7cd:147:8839 with SMTP id af79cd13be357-7cd014788c5mr1939751785a.27.1747117836386;
        Mon, 12 May 2025 23:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117836; cv=none;
        d=google.com; s=arc-20240605;
        b=V5nx9hZxwo/QEWeDBHjq/pwhOpTtamaf2iSI4WMlQ8Xjdk03amUwbWFS0rTTXf9Xdh
         V8S3J/+0kbVHeFWya6ctc6nWBktfIB5CzOuBIGfxaOT6Bzzg/jW7hXgeQUYDaHJtco6o
         MGdUanLmwm2GYjEa64HvDRxWwvfaxIHJxe3jTEijj/Dtnvp8e1F3karkolhj3SwAFlVM
         cjNEoBdRX0i5jnYk52mMdQAmhMRq/jIAmV+yC9CA5RYZUIEJH6Pf17uhph2bDkIVc0Yw
         cDxkMfNQqWrMzPtgZ5W7VyAOShRiy2SSOFwXCV+nlSSZoP2Uk1lbIw3opKn39xclIwbH
         iGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CFg1lY5UmgzSfDhHpCIrqkRb/0g/8tb+bSiMXdtO//U=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=Rm0bgwq/DCw/Y9RRjaokmBTuxUYWbc0WRcd9I7KgyIVWGWx/kTnPfaCzjOrCFy176D
         2FAhd/WXWc4iLfKYdH4CvhEhDWu6byHzxZxZO7ZyqsPyWM+DxVWQMn2l82Wr0ETqH3fD
         px/rluxJExttWO1UHCE1fFstx43VepeW27GZ5ciNzWqI8Yv+FUbaNKlZ6h2JjxSydwNn
         LQbNFYfgnORNh/L/OqxM3GTYQaaouVSd2LdpqAda7W4+RMtp0Lx7XGfqf2nVeYhjs5Vf
         zMXyU2AC5SSHtGNYkyV062GXaULoHrelIfFcrEMsB63GiabHke70ULCkmZx8HrpuvOop
         xq+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fee7e5si1041156585a.538.2025.05.12.23.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEj9H-0002yK-U7; Tue, 13 May 2025 02:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9G-0002vS-9B; Tue, 13 May 2025 02:29:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9E-0001me-Bt; Tue, 13 May 2025 02:29:53 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:03 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:03 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 04/25] hw/misc/aspeed_hace: Refactor hash buffer setup into
 helper functions for clarity
Date: Tue, 13 May 2025 14:28:34 +0800
Message-ID: <20250513062901.2256865-5-jamin_lin@aspeedtech.com>
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
X-TUID: dCHZ07JSOvNd

To improve code readability and maintainability, this commit refactors the hash
buffer preparation logic from "do_hash_operation()" into two helper functions:

- "hash_prepare_direct_iov()": handles non-scatter-gather (direct) mode.
- "hash_prepare_sg_iov()": handles scatter-gather mode with accumulation
  and padding detection support

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 153 ++++++++++++++++++++++++++----------------
 1 file changed, 95 insertions(+), 58 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 1256926d22..22eea62693 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -142,6 +142,92 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
     return false;
 }
 
+static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
+{
+    uint32_t src;
+    void *haddr;
+    hwaddr plen;
+    int iov_idx;
+
+    plen = s->regs[R_HASH_SRC_LEN];
+    src = s->regs[R_HASH_SRC];
+    haddr = address_space_map(&s->dram_as, src, &plen, false,
+                              MEMTXATTRS_UNSPECIFIED);
+    if (haddr == NULL) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Unable to map address, addr=0x%x, "
+                      "plen=0x%" HWADDR_PRIx "\n",
+                      __func__, src, plen);
+        return -1;
+    }
+
+    iov[0].iov_base = haddr;
+    iov[0].iov_len = plen;
+    iov_idx = 1;
+
+    return iov_idx;
+}
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
@@ -149,15 +235,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
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
@@ -169,59 +248,17 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         }
     }
 
+    /* Prepares the iov for hashing operations based on the selected mode */
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
-        plen = s->regs[R_HASH_SRC_LEN];
+        iov_idx = hash_prepare_direct_iov(s, iov);
+    }
 
-        haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
-                                  &plen, false, MEMTXATTRS_UNSPECIFIED);
-        if (haddr == NULL) {
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
-            return;
-        }
-        iov[0].iov_base = haddr;
-        iov[0].iov_len = plen;
-        iov_idx = 1;
+    if (iov_idx <= 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to prepare iov\n", __func__);
+         return;
     }
 
     if (acc_mode) {
-- 
2.43.0

