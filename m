Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691534njb;
        Thu, 15 May 2025 01:12:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS/TP8LQd9EsEOnZH03SdSojfBAuCYjwKzEUPeERfIvUQyBmaxpBcHyV95NgcW+kcXgMg8CCZyfBYnUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFpkmGKfFyS85N2wyQY+RhLyQ/SIy+JQTq99XE1sJx+IBxrwWQbEj4QOBAGz1fy4fVA6E4M
X-Received: by 2002:a05:6214:2466:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f8a4ac8e6cmr29694966d6.0.1747296744302;
        Thu, 15 May 2025 01:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296744; cv=none;
        d=google.com; s=arc-20240605;
        b=aco6yjpEVm7n0NHtlmmFWoshyY2lU5WSx20ZRfDMgtZg97TWiB0XYbvnE63VIS0WAV
         19gR0YIP7zzv42rhuFNTd0FzhDt/a2BE7xrdBYN1fHe4Rsp8TayVSyxL2nHOcPjUm2j0
         HV/OH8BsJz3wPoDK0hscvOJqBK3olavjH+v1AJsHpvNJS9EiGHfJxKYvZKgha/06ydCc
         N1uE7ZAIXxbLHjzmRp3gSzZHuY6Y8LgOByFXrs4UNsx9MESTVcjMS0ybIm8HoClvW7l9
         dkIsyEsOU1lTCK/GZ7tAEYlj/Smg8lpIBsHo0QBoluanZXtPD++Z3oyPwYnQVsuYXfYU
         4Now==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3XpFWB2b+Mh3RgOr5oTujpolWTXpJL1GKBChKqgZ/T8=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=grHbb5NuCYciu59YsbOn8F5J5kcA+hqMC8ZJZ4h4u5mLWKY91CYBUXrKsRn5qzwNMT
         mUitxqiZE4iyjNQczRaLE0kff1tfkXv5zs1d00BMkRZ/O7vJkUwYJvyjyuD8CPi9J5lA
         x16rwWeu2l/9AJM5emo08lrAAO88LEZ3FHwijAofWhdbT/iE0i+xfMLpKJeTL/CRdLyJ
         SF7UZBZ9YEBXRLN/LTQDfRpIFUij3PDW8iz+oONv/tBo1Lohx4Q9lNBjNUkuDCkFE1Iw
         kBx97mUS5tAEjzv6R9/2NRAXEE3H++RLe6sAemgrPNWPOEhoje4MuQPJZ+8nKypv8mfi
         mYPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7f4esi158636176d6.156.2025.05.15.01.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFThA-0007Q6-Nr; Thu, 15 May 2025 04:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfp-0003BQ-Hz; Thu, 15 May 2025 04:10:37 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfn-00010V-N8; Thu, 15 May 2025 04:10:37 -0400
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
Subject: [PATCH v3 06/28] hw/misc/aspeed_hace: Extract digest write and iov
 unmap into helper function
Date: Thu, 15 May 2025 16:09:38 +0800
Message-ID: <20250515081008.583578-7-jamin_lin@aspeedtech.com>
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
X-TUID: FYEJKX1AAmBu

To improve code readability and maintainability of do_hash_operation(), this
commit introduces a new helper function: hash_write_digest_and_unmap_iov().

The helper consolidates the final digest writeback and subsequent unmapping of
the I/O vectors into a single routine.

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 22eea62693..7da781f864 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -228,6 +228,26 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
     return iov_idx;
 }
 
+static void hash_write_digest_and_unmap_iov(AspeedHACEState *s,
+                                            struct iovec *iov,
+                                            int iov_idx,
+                                            uint8_t *digest_buf,
+                                            size_t digest_len)
+{
+    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
+                            MEMTXATTRS_UNSPECIFIED, digest_buf, digest_len)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to write digest to 0x%x\n",
+                      __func__, s->regs[R_HASH_DEST]);
+    }
+
+    for (; iov_idx > 0; iov_idx--) {
+        address_space_unmap(&s->dram_as, iov[iov_idx - 1].iov_base,
+                            iov[iov_idx - 1].iov_len, false,
+                            iov[iov_idx - 1].iov_len);
+    }
+}
+
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
@@ -292,18 +312,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         return;
     }
 
-    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
-                            MEMTXATTRS_UNSPECIFIED,
-                            digest_buf, digest_len)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "aspeed_hace: address space write failed\n");
-    }
-
-    for (; iov_idx > 0; iov_idx--) {
-        address_space_unmap(&s->dram_as, iov[iov_idx - 1].iov_base,
-                            iov[iov_idx - 1].iov_len, false,
-                            iov[iov_idx - 1].iov_len);
-    }
+    hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
-- 
2.43.0

