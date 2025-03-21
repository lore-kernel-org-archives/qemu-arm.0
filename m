Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp177981njc;
        Fri, 21 Mar 2025 02:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq6Qf/p1DooUuqPAKaqHjDa8t3qVEIap1/Jkos0m2x7MAmRMqhZoLGNOWLM2XXws6LxPIYD/WAmD9sQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5LNvYH5T2kkxg7hhuloGE/hdFyRU7Ud8AKTs23wcfw2V98S0TpSYA5/CHQ/nJYQBQhjha
X-Received: by 2002:a05:620a:2441:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c5ba1ea6d9mr280290685a.38.1742549215437;
        Fri, 21 Mar 2025 02:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549215; cv=none;
        d=google.com; s=arc-20240605;
        b=jXTCl+Jn9x7kUVMrI31Edux1UDU5QLBTKL7iLPyq7j9hbJ/1TgHotawJMWNfWGuVPt
         c9VIpgwpfERfEHt3EZL7PDcf/DhZB1L47pn2bv5gwbu87pVXxdShd0Ph+QdXQXHlIVnr
         54EPKN1Pq2blByzmBzkyoiro/wbuqw2jvr/Bv5hjLjA2HCX2j37z9tnuOiIWKLrO4FlB
         rJ9N1BDmQtBUddJuWxBqSXUA9E5lIm08AEsjMmWbeNrJK/0veQ+F/FO5/2oUvfaM1KlH
         DpqHnHHz3kBkDpuuIFQSOsutleH2ZtfYsgnAk9ZukCBoLUyB/LlV0ZKBU/xzW63VQ/09
         iYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=1TpNJYBcRLkN193LTkREhVc4u5EDV2mxw0Hk041GZDo=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=Tt+3gMv262+d+G4l5yLfNFVlwvc0o+drcRvh3tph518+l5OBmw90NmjXR3sRZ0pt13
         5nTp0sGCqrheVBwekijNvZDq9SYqUuLFSuQXGAYS5VRxsQMd0I7o3qvmxT80BOKDkukN
         Ljw7UPtueULKMwRHcfOrxPBno7ldQH3mD6gUgAG3CqjZ4D8eP1xlu+P9vwcdW8W9r3iW
         /Jfs+wZ7MRh8O/n/xnv16SlHSxWWu+YXbufkIU9jKlaJTjeluSOHjMrripujz8e9H4MJ
         xXDt1eZLZX/5PS7zuXJ5LYzm9sdLfv5ENoDiliYrL+9m51LcCnO2tQEMLLvI2CNGrSmx
         rJaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9362857si153887385a.505.2025.03.21.02.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeN-0006NG-RR; Fri, 21 Mar 2025 05:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeG-0006EC-3I; Fri, 21 Mar 2025 05:26:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeE-00056m-93; Fri, 21 Mar 2025 05:26:39 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:24 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 01/22] hw/misc/aspeed_hace: Remove unused code for better
 readability
Date: Fri, 21 Mar 2025 17:25:57 +0800
Message-ID: <20250321092623.2097234-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
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
X-TUID: CvgEDktjMa5b

This cleanup follows significant changes in commit 4c1d0af4a28d, making the
model more readable.

- Deleted "iov_cache" and "iov_count" from "AspeedHACEState".
- Removed "reconstruct_iov" function and related logic.
- Simplified "do_hash_operation" by eliminating redundant checks.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  2 --
 hw/misc/aspeed_hace.c         | 35 -----------------------------------
 2 files changed, 37 deletions(-)

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
index 32a5dbded3..8e7e8113a5 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -137,25 +137,6 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
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
@@ -237,19 +218,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
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
@@ -273,7 +241,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             qcrypto_hash_free(s->hash_ctx);
 
             s->hash_ctx = NULL;
-            s->iov_count = 0;
             s->total_req_len = 0;
         }
     } else if (qcrypto_hash_bytesv(algo, iov, i, &digest_buf,
@@ -432,7 +399,6 @@ static void aspeed_hace_reset(DeviceState *dev)
     }
 
     memset(s->regs, 0, sizeof(s->regs));
-    s->iov_count = 0;
     s->total_req_len = 0;
 }
 
@@ -469,7 +435,6 @@ static const VMStateDescription vmstate_aspeed_hace = {
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedHACEState, ASPEED_HACE_NR_REGS),
         VMSTATE_UINT32(total_req_len, AspeedHACEState),
-        VMSTATE_UINT32(iov_count, AspeedHACEState),
         VMSTATE_END_OF_LIST(),
     }
 };
-- 
2.43.0

