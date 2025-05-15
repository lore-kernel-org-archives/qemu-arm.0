Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691706njb;
        Thu, 15 May 2025 01:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMWLeq8nU8n9q2Nf2+Ju5Nnl2H0qzI9zUgcTAuZXvOoxmr9BY63qKwhRhvSIuv131DsgSUIok0t0nFmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFhAKrDscaJb2CJz/u1LNqB2MohBDXlaa8lhjgBR0zob9ohqK8Q419FBjMNJsOHvt/fCxO
X-Received: by 2002:a05:622a:588f:b0:494:6b24:64d0 with SMTP id d75a77b69052e-494a333894amr30079891cf.2.1747296771904;
        Thu, 15 May 2025 01:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296771; cv=none;
        d=google.com; s=arc-20240605;
        b=hdSWWX79jlzaZDGy9NuBZaooXq/K4aAsRodxJW1srwAMOduHqV4Cf8t2F+MUiZzs8V
         +JxBoIaXAzuCOulnlfEZtZTACnL1vZDRc0ZUOuBPd7wQ7kuB4lghkAvVZYa62Ao4/XnT
         SQdApPEme08Sn7nD+XOACKkW4dSJt4PYnUL17jv5/ikvFv6D5eq4iaKXh8qrt0UioPWy
         se1hsq58TJZ4K+JCn1Iz1VL+ghoA6W8fqyxkgVrWSNeeTzwGfnR+AgQrJVqISj059mF+
         +eUCN81dAYezLL4pM/AMuJnYiwqk4oLtl3B0p4Tr740k2qM/ymLQ0kSpEEnRvWO/SVE/
         rouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=C7caD7LBnVsw82rCj0GrNTWJMPpsLrqRY+o6ts4c7fc=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=WRRBmryNXi0dgJCD617UIza36LJiQ+9Tb3FaejKuyksA0O9W9RNvc0P4wvKMaqux/l
         TyUAidA782GKX9B2Dan0+jTFxQfrdFxy73oyeSUhqXhkXE7BnCmb8ZUmzka1ySgzd8hP
         VCEOksaahY09FB2CWG965PTByohZj0sqyEfSsivVvcT+PJiNl+hanffjyyX3btc8ieSN
         He7hszoOeNZKHYQztW0Z02+xNOjMKDsA2Hu705rrSh4ngkc89R+mUUDjkvFjoIbNofFC
         wKtMyKRFwn9yCNRuW524NjUFqAYoy/6ah7UJ3C2ZKuqzdxku3IDftQJyL3kqsDYMf5dI
         1LuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259b304si155161561cf.544.2025.05.15.01.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFThI-0007y9-3D; Thu, 15 May 2025 04:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTft-0003Ia-2N; Thu, 15 May 2025 04:10:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfq-00011Y-Sj; Thu, 15 May 2025 04:10:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 08/28] hw/misc/aspeed_hace: Extract accumulation-mode hash
 execution into helper function
Date: Thu, 15 May 2025 16:09:40 +0800
Message-ID: <20250515081008.583578-9-jamin_lin@aspeedtech.com>
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
X-TUID: Vq5myPHX/Fa/

To improve code readability and maintainability of do_hash_operation(), this
commit introduces a new helper function: hash_execute_acc_mode().

This function encapsulates the full flow for accumulation mode, including
context initialization, update, conditional finalization, and digest writeback
with I/O vector unmapping.

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 74 ++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index c50e228cdf..33e13974fe 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -267,26 +267,57 @@ static void hash_execute_non_acc_mode(AspeedHACEState *s, int algo,
     hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
 }
 
-static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
-                              bool acc_mode)
+static void hash_execute_acc_mode(AspeedHACEState *s, int algo,
+                                  struct iovec *iov, int iov_idx,
+                                  bool final_request)
 {
     g_autofree uint8_t *digest_buf = NULL;
-    struct iovec iov[ASPEED_HACE_MAX_SG];
-    bool acc_final_request = false;
     Error *local_err = NULL;
     size_t digest_len = 0;
-    int iov_idx = -1;
 
-    if (acc_mode && s->hash_ctx == NULL) {
+    if (s->hash_ctx == NULL) {
         s->hash_ctx = qcrypto_hash_new(algo, &local_err);
         if (s->hash_ctx == NULL) {
-            qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash failed : %s",
-                          error_get_pretty(local_err));
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto hash new failed : %s",
+                          __func__, error_get_pretty(local_err));
             error_free(local_err);
             return;
         }
     }
 
+    if (qcrypto_hash_updatev(s->hash_ctx, iov, iov_idx, &local_err) < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto hash updatev failed : %s",
+                      __func__, error_get_pretty(local_err));
+        error_free(local_err);
+        return;
+    }
+
+    if (final_request) {
+        if (qcrypto_hash_finalize_bytes(s->hash_ctx, &digest_buf,
+                                        &digest_len, &local_err)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: qcrypto hash finalize bytes failed : %s",
+                          __func__, error_get_pretty(local_err));
+            error_free(local_err);
+            local_err = NULL;
+        }
+
+        qcrypto_hash_free(s->hash_ctx);
+
+        s->hash_ctx = NULL;
+        s->total_req_len = 0;
+    }
+
+    hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
+}
+
+static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
+                              bool acc_mode)
+{
+    struct iovec iov[ASPEED_HACE_MAX_SG];
+    bool acc_final_request = false;
+    int iov_idx = -1;
+
     /* Prepares the iov for hashing operations based on the selected mode */
     if (sg_mode) {
         iov_idx = hash_prepare_sg_iov(s, iov, acc_mode, &acc_final_request);
@@ -300,32 +331,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
          return;
     }
 
+    /* Executes the hash operation */
     if (acc_mode) {
-        if (qcrypto_hash_updatev(s->hash_ctx, iov, iov_idx, &local_err) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash update failed : %s",
-                          error_get_pretty(local_err));
-            error_free(local_err);
-            return;
-        }
-
-        if (acc_final_request) {
-            if (qcrypto_hash_finalize_bytes(s->hash_ctx, &digest_buf,
-                                            &digest_len, &local_err)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "qcrypto hash finalize failed : %s",
-                              error_get_pretty(local_err));
-                error_free(local_err);
-                local_err = NULL;
-            }
-
-            qcrypto_hash_free(s->hash_ctx);
-
-            s->hash_ctx = NULL;
-            s->total_req_len = 0;
-        }
-
-        hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf,
-                                        digest_len);
+        hash_execute_acc_mode(s, algo, iov, iov_idx, acc_final_request);
     } else {
         hash_execute_non_acc_mode(s, algo, iov, iov_idx);
     }
-- 
2.43.0

