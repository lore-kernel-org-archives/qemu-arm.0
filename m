Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322719njb;
        Mon, 12 May 2025 23:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyTkdU3Qm3BzqsFnVvcVTqmSoQ69H28XFM20a+ml/l40D2lHrXFKTqTvvDCqemNv8+XKuJivW814I8AA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBIOCZd/kM2LW2cUmE35RYion0A4VRpA+X8bkWqmWsSYZx8cD1ti5cFqbLVd7slFAskxXY
X-Received: by 2002:a05:620a:4588:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7cd011188d9mr2019812185a.28.1747117909503;
        Mon, 12 May 2025 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117909; cv=none;
        d=google.com; s=arc-20240605;
        b=bJlxMTVV4VOZl+BGinw/o9JChojkHwt1Lu7SPg2VrKzxSKhagc0yzCZXx7PtI83OnL
         Vul8rFAH+QA2pWlLDznRsc5ieROusZMvbjVfJbBXVLBwU6xDGcdCgbm1X4xsw63Sy6MB
         QYbzapEC0aM2Ey82M6nvBVYODOdDBg69OgIR/8qs+kifHsCSr/LciPI1Mm+memXRESz4
         E7Dkabmg44JFBNUmA2WU2IgrFzqorhVkdXuLSHW0N0urWn6XkVRsBZg83VAvu8LGZ0tC
         y8gwanGbbZxyk3VtpF/5wEScIQOGfV46uKBo5bPWnJd6fv7c/OamvEUhT/9C6RtUC0w6
         TQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=zmoo5LT15sNlU06Q/xiUbE3juWp1BOggyogv3w3tLDE=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=guYrJAApuRloYrF03V5qGUoQxZMgq6xuXKvR3j26hF/ZzqAbupIAIyfTYHRPazt4yq
         b+mqkf75o8xMGduk0yflX6WL5TGKIFjPTFZ5TTKwz5zQ1sAP/ULODaoYVUPkhRiPzUGs
         uuZhxduISJ4dqbEdNj1qqOnrfN66bBpvh3M/AKP0NvyJf3nS1sLYFqSVlDgQyenrvHw6
         KTnyGsBmAL5gB7M1F+I5eYp3PCEWNZW0EcGhAClVY6HsnnCySqE3414z+nVrljCLXSGW
         zJo6avAfmnEod/3pMDUMNcuBeaWzRsNzF98pBsBlB6313+HTfq0/FzVs9Q1qZsamTJfr
         qZxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f51c9dsi1022972285a.106.2025.05.12.23.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEj9s-0003sl-4e; Tue, 13 May 2025 02:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9d-0003Zr-D4; Tue, 13 May 2025 02:30:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj9Y-0001oe-Vf; Tue, 13 May 2025 02:30:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:04 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 06/25] hw/misc/aspeed_hace: Introduce 64-bit hash source
 address helper function
Date: Tue, 13 May 2025 14:28:36 +0800
Message-ID: <20250513062901.2256865-7-jamin_lin@aspeedtech.com>
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
X-TUID: TKJJlAwOQEZo

The AST2700 CPU, based on the Cortex-A35, is a 64-bit processor, and its DRAM
address space is also 64-bit. To support future AST2700 updates, the source
hash buffer address data type is being updated to 64-bit.

Introduces the "hash_get_source_addr()" helper function to extract the source hash
buffer address.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index eb513ba00f..5f3c8190ef 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -142,21 +142,30 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
     return false;
 }
 
+static uint64_t hash_get_source_addr(AspeedHACEState *s)
+{
+    uint64_t src_addr = 0;
+
+    src_addr = deposit64(src_addr, 0, 32, s->regs[R_HASH_SRC]);
+
+    return src_addr;
+}
+
 static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
 {
-    uint32_t src;
+    uint64_t src;
     void *haddr;
     hwaddr plen;
     int iov_idx;
 
     plen = s->regs[R_HASH_SRC_LEN];
-    src = s->regs[R_HASH_SRC];
+    src = hash_get_source_addr(s);
     haddr = address_space_map(&s->dram_as, src, &plen, false,
                               MEMTXATTRS_UNSPECIFIED);
     if (haddr == NULL) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Unable to map address, addr=0x%x, "
-                      "plen=0x%" HWADDR_PRIx "\n",
+                      "%s: Unable to map address, addr=0x%" HWADDR_PRIx
+                      " ,plen=0x%" HWADDR_PRIx "\n",
                       __func__, src, plen);
         return -1;
     }
@@ -175,11 +184,12 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
     uint32_t pad_offset;
     uint32_t len = 0;
     uint32_t sg_addr;
-    uint32_t src;
+    uint64_t src;
     int iov_idx;
     hwaddr plen;
     void *haddr;
 
+    src = hash_get_source_addr(s);
     for (iov_idx = 0; !(len & SG_LIST_LEN_LAST); iov_idx++) {
         if (iov_idx == ASPEED_HACE_MAX_SG) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -188,8 +198,6 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
             return -1;
         }
 
-        src = s->regs[R_HASH_SRC] + (iov_idx * SG_LIST_ENTRY_SIZE);
-
         len = address_space_ldl_le(&s->dram_as, src,
                                    MEMTXATTRS_UNSPECIFIED, NULL);
         sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
@@ -208,6 +216,8 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
             return -1;
         }
 
+        src += SG_LIST_ENTRY_SIZE;
+
         iov[iov_idx].iov_base = haddr;
         if (acc_mode) {
             s->total_req_len += plen;
-- 
2.43.0

