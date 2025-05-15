Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691144njb;
        Thu, 15 May 2025 01:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsYg1u5giiUhFYeeKvhjk7j2Tr1k+1rehKLJ/2tQOOMk/uNZrXRN7ua8Scyow1m4wubSkf4z0ICFCWFg==@linaro.org
X-Google-Smtp-Source: AGHT+IFu66YDWVHUnbtwfUMCjPtloxi6+bhqVeIWKyRJWGIou3KJi33/rWtC/jEDOXW7dq5zhyuv
X-Received: by 2002:a05:622a:559a:b0:476:5fd5:4df8 with SMTP id d75a77b69052e-494a33b4668mr29653831cf.45.1747296689053;
        Thu, 15 May 2025 01:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296689; cv=none;
        d=google.com; s=arc-20240605;
        b=hPLj1RlTECFnx/sUKmsR11Ofdre/Hlm/DezomDmcgjmNjhqNwsPemnSiZcAXuxylHy
         6gn6iqJm4zcTRJmCwLNwzosBpsT9rKGacJ0yHQ3+FFhTxqMrbmwTdtJd2Kni1eCy6ENW
         ggsw5l3PvpJqADQeB/T7M2Au4fO5ZtVyHlJ9PvFATGVrTs0xKiNjLxArNXbzXysXX5Xl
         QnMghp1Me66DC3AXz/DxTCTG68yvSuQ1C4kt3Y2HwXGZySOSwQJ1E5ZRwWVFgyZCi37F
         5+45TTVPgkDHr6Q2rkMV0I/y3I4YP0jyz4ln6aFKjUCgaZVtTNvW8tDCsG8WICVBt7wE
         DmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4kPGix99Im5Hg5H8aZ8wIu5iNL/zHTNeuHO/5gWksKU=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=DHrCn7WMbb1KtzYUECHDgscgiMR5t2WP7DTp9BCtz1cvO3lKAT/wMrDFbx9CcQ6f6V
         X/6COBi6OICEdvy71W5e/1Z7zvvTS6pOqVco1gtFJSiWbO+6uIlqlAAkrSHfmxQDPdnS
         5yfh1aWfE8n9uGaAlioQ3EcuR2EgoM2tKtdHMxo8HNKE+Er7G1o4kakHMAcdP0RaiEj9
         FHSfWRDcQHQQefDs8hG0dCLLO4pApGcMP6hQiyiWIcLALtPMAPHsg/iuWwXKh3Z4ZCdd
         /IiZiR8kgJLJIJkQYN2ftIjm+uwYTNsg/YyoaldyQXOY4RDxoKHhzdto5NJa/SrhMfhw
         fLjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525821c1si147038831cf.376.2025.05.15.01.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFTfr-0003GD-Jj; Thu, 15 May 2025 04:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfh-0002uy-Mu; Thu, 15 May 2025 04:10:31 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTff-00010V-Hz; Thu, 15 May 2025 04:10:29 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 02/28] hw/misc/aspeed_hace: Improve readability and
 consistency in variable naming
Date: Thu, 15 May 2025 16:09:34 +0800
Message-ID: <20250515081008.583578-3-jamin_lin@aspeedtech.com>
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
X-TUID: BxoNcyZRpUUY

Currently, users define multiple local variables within different if-statements.
To improve readability and maintain consistency in variable naming, rename the
variables accordingly.
Introduced "sg_addr" to clearly indicate the scatter-gather mode buffer address.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 67 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 9263739ea6..6be94963bc 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -145,15 +145,19 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
+    g_autofree uint8_t *digest_buf = NULL;
     struct iovec iov[ASPEED_HACE_MAX_SG];
+    bool acc_final_request = false;
+    Error *local_err = NULL;
     uint32_t total_msg_len;
-    uint32_t pad_offset;
-    g_autofree uint8_t *digest_buf = NULL;
     size_t digest_len = 0;
-    bool sg_acc_mode_final_request = false;
-    int i;
+    uint32_t sg_addr = 0;
+    uint32_t pad_offset;
+    int iov_idx = 0;
+    uint32_t len = 0;
+    uint32_t src = 0;
     void *haddr;
-    Error *local_err = NULL;
+    hwaddr plen;
 
     if (acc_mode && s->hash_ctx == NULL) {
         s->hash_ctx = qcrypto_hash_new(algo, &local_err);
@@ -166,74 +170,69 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     }
 
     if (sg_mode) {
-        uint32_t len = 0;
-
-        for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
-            uint32_t addr, src;
-            hwaddr plen;
-
-            if (i == ASPEED_HACE_MAX_SG) {
+        for (iov_idx = 0; !(len & SG_LIST_LEN_LAST); iov_idx++) {
+            if (iov_idx == ASPEED_HACE_MAX_SG) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                         "aspeed_hace: guest failed to set end of sg list marker\n");
                 break;
             }
 
-            src = s->regs[R_HASH_SRC] + (i * SG_LIST_ENTRY_SIZE);
+            src = s->regs[R_HASH_SRC] + (iov_idx * SG_LIST_ENTRY_SIZE);
 
             len = address_space_ldl_le(&s->dram_as, src,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 
-            addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
-                                        MEMTXATTRS_UNSPECIFIED, NULL);
-            addr &= SG_LIST_ADDR_MASK;
+            sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+            sg_addr &= SG_LIST_ADDR_MASK;
 
             plen = len & SG_LIST_LEN_MASK;
-            haddr = address_space_map(&s->dram_as, addr, &plen, false,
+            haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
                                       MEMTXATTRS_UNSPECIFIED);
             if (haddr == NULL) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "%s: qcrypto failed\n", __func__);
                 return;
             }
-            iov[i].iov_base = haddr;
+            iov[iov_idx].iov_base = haddr;
             if (acc_mode) {
                 s->total_req_len += plen;
 
-                if (has_padding(s, &iov[i], plen, &total_msg_len,
+                if (has_padding(s, &iov[iov_idx], plen, &total_msg_len,
                                 &pad_offset)) {
                     /* Padding being present indicates the final request */
-                    sg_acc_mode_final_request = true;
-                    iov[i].iov_len = pad_offset;
+                    acc_final_request = true;
+                    iov[iov_idx].iov_len = pad_offset;
                 } else {
-                    iov[i].iov_len = plen;
+                    iov[iov_idx].iov_len = plen;
                 }
             } else {
-                iov[i].iov_len = plen;
+                iov[iov_idx].iov_len = plen;
             }
         }
     } else {
-        hwaddr len = s->regs[R_HASH_SRC_LEN];
+        plen = s->regs[R_HASH_SRC_LEN];
 
         haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
-                                  &len, false, MEMTXATTRS_UNSPECIFIED);
+                                  &plen, false, MEMTXATTRS_UNSPECIFIED);
         if (haddr == NULL) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
             return;
         }
         iov[0].iov_base = haddr;
-        iov[0].iov_len = len;
-        i = 1;
+        iov[0].iov_len = plen;
+        iov_idx = 1;
     }
 
     if (acc_mode) {
-        if (qcrypto_hash_updatev(s->hash_ctx, iov, i, &local_err) < 0) {
+        if (qcrypto_hash_updatev(s->hash_ctx, iov, iov_idx, &local_err) < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash update failed : %s",
                           error_get_pretty(local_err));
             error_free(local_err);
             return;
         }
 
-        if (sg_acc_mode_final_request) {
+        if (acc_final_request) {
             if (qcrypto_hash_finalize_bytes(s->hash_ctx, &digest_buf,
                                             &digest_len, &local_err)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
@@ -248,7 +247,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             s->hash_ctx = NULL;
             s->total_req_len = 0;
         }
-    } else if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf,
+    } else if (qcrypto_hash_bytesv(algo, iov, iov_idx, &digest_buf,
                                    &digest_len, &local_err) < 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash bytesv failed : %s",
                       error_get_pretty(local_err));
@@ -263,10 +262,10 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                       "aspeed_hace: address space write failed\n");
     }
 
-    for (; i > 0; i--) {
-        address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
-                            iov[i - 1].iov_len, false,
-                            iov[i - 1].iov_len);
+    for (; iov_idx > 0; iov_idx--) {
+        address_space_unmap(&s->dram_as, iov[iov_idx - 1].iov_base,
+                            iov[iov_idx - 1].iov_len, false,
+                            iov[iov_idx - 1].iov_len);
     }
 
     /*
-- 
2.43.0

