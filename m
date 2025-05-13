Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp321919njb;
        Mon, 12 May 2025 23:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/7ngz7R++nGRvW4/atbVauE9XLHTEmZsfZjEwnGaSDPFu06HUW/y9ONYv2g1XKb1yeQOX0I70t1abfA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlpvrNWbdjBk9wB3+rldQhyD+Q7I+DkTSVtt4VVzjhOCMudCaAUweASHECG5WE11eiLXvh
X-Received: by 2002:a05:620a:4490:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7cd0115008bmr2615827385a.58.1747117796873;
        Mon, 12 May 2025 23:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117796; cv=none;
        d=google.com; s=arc-20240605;
        b=B+eN7qh+J/fe/fkAKh1cCLFPxmYimAbOQ+/SfhY1Np4NJFUJnKUCYG9AXGFwsLt+4p
         VnTK6OjMg+awCin/2YaLQxTRO4oTZh7avRy8536NAn4KO4NAWwBI7tLXsIS9I8iCKavG
         D8XzIwNaEsvrrPH1vp+oVhfyyhktPYlQpN//A65M8tf1JiKCK1A9eouBiNgdCFKybdHU
         u/uCh3+n7kOIF6vCZk7zy1PI+0rBsZxkgX2nmHE95+WBFQVb3/2yZEokOVZgTT6JLeiT
         UqzCFmd/p39gvM5xr0MEHO5kpWTMdYDCu/LKy+iPGIjZ7+puyasrXdaG1ZxJwycW6M+f
         IF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7Zjm+kQUTbB5ZAbooGrzD9Iv37runvOr2Sv/yhiToVA=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=d6MVkGfWySqxv3JWqCDYD0Ps42x6XXPwdRPeE9cZjt4tKtQCHLkg6O5Ws93napKFWZ
         0FfQ4Mb1fAWxo75BBikDIHIz+UEp1e4gWCIUsiK0f6gTqSjo4jcN97SSEWF3w+rzbl/d
         ZAjdG22VlhBAhBadxMu0mUg2K5cVby/w8bP4LllQGCzTaSbl5qwBqkOxEEliVeRPLk9s
         +Zpn638XZjSXscZnlQ5ywOt5Cwah9Mcc2iyEQLTH6U0UqPvpvAZBM7YyPsPHXOYsTCZY
         wQ2sWJoKzBpPO/C/Ekm1iZolp7m7PGilZBCzII7mHeuHBmQMs3tkk31MYMdU/Bp0JRSd
         BddQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd4bc6si1048443485a.235.2025.05.12.23.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEj92-0002G0-ST; Tue, 13 May 2025 02:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj8t-0002E3-Dh; Tue, 13 May 2025 02:29:31 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj8q-0001kC-ER; Tue, 13 May 2025 02:29:31 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 01/25] hw/misc/aspeed_hace: Remove unused code for better
 readability
Date: Tue, 13 May 2025 14:28:31 +0800
Message-ID: <20250513062901.2256865-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: KDt+QU4wFihV

In the previous design of the hash framework, accumulative hashing was not
supported. To work around this limitation, commit 5cd7d85 introduced an
iov_cache array to store all the hash data from firmware.
Once the ASPEED HACE model collected all the data, it passed the iov_cache to
the hash API to calculate the final digest.

However, with commit e3c0752, the hash framework now supports accumulative
hashing. This allows us to refactor the ASPEED HACE model, removing redundant
logic and simplifying the implementation for better readability and
maintainability.

As a result, the iov_count variable is no longer needed—it was previously used
to track how many cached entries were used for hashing.
To maintain VMSTATE compatibility after removing this field, the VMSTATE_VERSION
is bumped to 2

This cleanup follows significant changes in commit 4c1d0af4a28d, making the
model more readable.

- Deleted "iov_cache" and "iov_count" from "AspeedHACEState".
- Removed "reconstruct_iov" function and related logic.
- Simplified "do_hash_operation" by eliminating redundant checks.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  2 --
 hw/misc/aspeed_hace.c         | 39 ++---------------------------------
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 5d4aa19cfe..b69a038d35 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -31,10 +31,8 @@ struct AspeedHACEState {
     MemoryRegion iomem;
     qemu_irq irq;
 
-    struct iovec iov_cache[ASPEED_HACE_MAX_SG];
     uint32_t regs[ASPEED_HACE_NR_REGS];
     uint32_t total_req_len;
-    uint32_t iov_count;
 
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index f4bff32a00..9263739ea6 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -142,25 +142,6 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
     return false;
 }
 
-static int reconstruct_iov(AspeedHACEState *s, struct iovec *iov, int id,
-                           uint32_t *pad_offset)
-{
-    int i, iov_count;
-    if (*pad_offset != 0) {
-        s->iov_cache[s->iov_count].iov_base = iov[id].iov_base;
-        s->iov_cache[s->iov_count].iov_len = *pad_offset;
-        ++s->iov_count;
-    }
-    for (i = 0; i < s->iov_count; i++) {
-        iov[i].iov_base = s->iov_cache[i].iov_base;
-        iov[i].iov_len = s->iov_cache[i].iov_len;
-    }
-    iov_count = s->iov_count;
-    s->iov_count = 0;
-    s->total_req_len = 0;
-    return iov_count;
-}
-
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
@@ -242,19 +223,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         iov[0].iov_base = haddr;
         iov[0].iov_len = len;
         i = 1;
-
-        if (s->iov_count) {
-            /*
-             * In aspeed sdk kernel driver, sg_mode is disabled in hash_final().
-             * Thus if we received a request with sg_mode disabled, it is
-             * required to check whether cache is empty. If no, we should
-             * combine cached iov and the current iov.
-             */
-            s->total_req_len += len;
-            if (has_padding(s, iov, len, &total_msg_len, &pad_offset)) {
-                i = reconstruct_iov(s, iov, 0, &pad_offset);
-            }
-        }
     }
 
     if (acc_mode) {
@@ -278,7 +246,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             qcrypto_hash_free(s->hash_ctx);
 
             s->hash_ctx = NULL;
-            s->iov_count = 0;
             s->total_req_len = 0;
         }
     } else if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf,
@@ -437,7 +404,6 @@ static void aspeed_hace_reset(DeviceState *dev)
     }
 
     memset(s->regs, 0, sizeof(s->regs));
-    s->iov_count = 0;
     s->total_req_len = 0;
 }
 
@@ -469,12 +435,11 @@ static const Property aspeed_hace_properties[] = {
 
 static const VMStateDescription vmstate_aspeed_hace = {
     .name = TYPE_ASPEED_HACE,
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS),
         VMSTATE_UINT32(total_req_len, AspeedHACEState),
-        VMSTATE_UINT32(iov_count, AspeedHACEState),
         VMSTATE_END_OF_LIST(),
     }
 };
-- 
2.43.0

