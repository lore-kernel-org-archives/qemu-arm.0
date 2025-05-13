Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322546njb;
        Mon, 12 May 2025 23:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtnh/vKDRWPU5uiqLWZm6lGd//MvBTgFAS5cMTP/b+bflvDp6e9MwlHAqAywTGkkJ5Gd2BpYw5AWPk+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEaavkMPhiJBBfSDyM69lNbHoCg4qXKUQw2yP77ujiykJESpOzwJgMpmzWbDmAcsNtYoltN
X-Received: by 2002:a05:620a:1a14:b0:7ca:cc88:bcef with SMTP id af79cd13be357-7cd01103cf7mr2376453085a.15.1747117882584;
        Mon, 12 May 2025 23:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117882; cv=none;
        d=google.com; s=arc-20240605;
        b=HgtTZCLvabUtxymNNnPw2izN/YoODotRNCIocwJ2UBQO+HCtSvL0cubA3sPDy6aL1g
         PkL1PrdXNnOCX9oXHgVTEfsJdzf1GZe0BFi/5Wnk5dA0Bh0+Wn7tCSzZ8FCjeYnEKFld
         YW0d6G6bG9PEIKMnLOM7ofXkTYiXW9PGjyUdTNWc1toPGYsZMyXs9vWZlbmVYhw29Vgh
         RPHZObvlS5ggcSc4MpADRi4MoqzQuvL/m+LiukIMSVIj1v+am9Wmaga4l7iB1MD/qK1F
         4jpekKLlPKXFb9suBtuMv4VotbSkguGHXRxWnqcTkhEMezZbY9xyeHNdnDvVOpT+W+B+
         i2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=r3bBVys3KjVG0dBVZN5JlepSlRWwzRfTyrV+yr+mcqU=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=LqXylqFMhmITjzvk3ZfgfxsYmxrMhqAXNopHuaIctlb2qs7uuDzuxQePYlRXh1W4Ct
         WSlFVn341yFiLTKjdFXfw5myN2OUo+o7Pn8DtOLwm1WWYjYkdUbUudq9EiHSTFTG/YmJ
         PTolZyzNHHm5yMRgXAxa0v83IZkPkhUemrK5+nWV3lGtjSnGdzYSLmbk+sAlGATRUv82
         HWAeTgyeAai7kX5cfUEZQUKxROI8sJ7WjbheS7nvMMgbnYoiO3eTmIue+YfdonsOJ9EW
         i9F3hTyPdrqXo/+u+fOtz5RRgtFXeIiFXYRZ1J9T5PEvp3Pqz2uYmFs9tZDrKSmUndDr
         8B3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd45a2si1050002185a.313.2025.05.12.23.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjAK-0004qJ-KG; Tue, 13 May 2025 02:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjA9-0004VV-1t; Tue, 13 May 2025 02:30:49 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjA6-00023Q-Og; Tue, 13 May 2025 02:30:48 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 08/25] hw/misc/aspeed_hace: Support accumulative mode for
 direct access mode
Date: Tue, 13 May 2025 14:28:38 +0800
Message-ID: <20250513062901.2256865-9-jamin_lin@aspeedtech.com>
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
X-TUID: auDE0RXWjvXI

Enable accumulative mode for direct access mode operations. In direct access
mode, only a single source buffer is used, so the "iovec" count is set to 1.
If "acc_mode" is enabled:
1. Accumulate "total_req_len" with the current request length ("plen").
2. Check for padding and determine whether this is the final request.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index c5ddc1c99a..ef777bb594 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -151,8 +151,11 @@ static uint64_t hash_get_source_addr(AspeedHACEState *s)
     return src_addr;
 }
 
-static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
+static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov,
+                                   bool acc_mode, bool *acc_final_request)
 {
+    uint32_t total_msg_len;
+    uint32_t pad_offset;
     uint64_t src;
     void *haddr;
     hwaddr plen;
@@ -171,9 +174,23 @@ static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
     }
 
     iov[0].iov_base = haddr;
-    iov[0].iov_len = plen;
     iov_idx = 1;
 
+    if (acc_mode) {
+        s->total_req_len += plen;
+
+        if (has_padding(s, &iov[0], plen, &total_msg_len,
+                        &pad_offset)) {
+            /* Padding being present indicates the final request */
+            *acc_final_request = true;
+            iov[0].iov_len = pad_offset;
+        } else {
+            iov[0].iov_len = plen;
+        }
+    } else {
+        iov[0].iov_len = plen;
+    }
+
     return iov_idx;
 }
 
@@ -345,7 +362,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     if (sg_mode) {
         iov_idx = hash_prepare_sg_iov(s, iov, acc_mode, &acc_final_request);
     } else {
-        iov_idx = hash_prepare_direct_iov(s, iov);
+        iov_idx = hash_prepare_direct_iov(s, iov, acc_mode,
+                                          &acc_final_request);
     }
 
     if (iov_idx <= 0) {
-- 
2.43.0

