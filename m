Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691261njb;
        Thu, 15 May 2025 01:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+GEzh3Z2v2IABvD/LoCJoZE8CVppKXP/4K6Si1qDRu9dk3m344fVxuX9oiH/dL3TCMBJK/XNWept3Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+BKMLjMh2gPmY/LmD48nQjz4mv3xbwLfgMjb4zu0o4Q1mb8PxTFRj1xXPNc+vlE6JBs54
X-Received: by 2002:a05:622a:40c6:b0:494:aa40:b0c3 with SMTP id d75a77b69052e-494aa40b1d7mr2202221cf.10.1747296703496;
        Thu, 15 May 2025 01:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296703; cv=none;
        d=google.com; s=arc-20240605;
        b=cKpyX5w+GV9vxsXA1SNQrvlPfoeRsLwKnqsN3eCMBzjTh22X6kZS3Dhwhp6s7Y6q7c
         djh9y7I4XUcOdRvRat1IzeG+eGKw1Rrs9Rnflpxgj4Ops5h0YvxMbgEBli6K9OPU/rXc
         BY/gqaixmeKnv4rNu98oZJwf77vfs1ZpDUY5ghEpfdIffO/JDmwbwQ4MGaZx7zHegIlw
         gXk4Z8a8krKKc7aNZhL1EQRwlEYMNXOIsS0yl1HT2cFNzxeq4KjAzClYaProrzA610K/
         2BF5b5X+NE+OBTbSi2IKC09cDQMxdKJHbi5+fSaM+ZSW6e59KXiAd2dUwtMxnycMIeJz
         VBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OlJEw1u7I+PyR37kwlI3LovEEZq2VG75c3wOLpSwH5I=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=etHYfJSjZxQDzhyhTf9jfqkGXdXmHc6o65GD9TqfajKTMDLwPUlJGOwgPPABRkLe/G
         LWrh9NLsWKEDwpuae7NBbbSbics1TugYCCiAwAJr5lM86yfCX9WA1ZGjmezxdy3SOe2n
         zzu+8yai25FB+eKiO35xPcsZlMfwO0tPJcvqeV6Om6tzc3zcz18Y5MaEEfPMkW+K2hy7
         fS30tKmIIzMumgEZiLEhF/ZMUbMDaRgUeE5cldgp4O91D7NpIx8ycwwXhTfyaXMzhiTr
         utZmCsv4iQ73hl0v1bViOTN8O3SbPzw3h/JgAJNlJlPlPFO/Gz1y7YayuzCS9kbD0Hxs
         pfdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452458be8si160242321cf.9.2025.05.15.01.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFTfx-0003PO-KZ; Thu, 15 May 2025 04:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfm-000331-Kw; Thu, 15 May 2025 04:10:36 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfj-00011Y-Sm; Thu, 15 May 2025 04:10:33 -0400
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
Subject: [PATCH v3 03/28] hw/misc/aspeed_hace: Ensure HASH_IRQ is always set
 to prevent firmware hang
Date: Thu, 15 May 2025 16:09:35 +0800
Message-ID: <20250515081008.583578-4-jamin_lin@aspeedtech.com>
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
X-TUID: 07YY/gZhjqwA

Currently, if the program encounters an unsupported algorithm, it does not set
the HASH_IRQ bit in the status register and send an interrupt to indicate
command completion. As a result, the FW gets stuck waiting for a completion
signal from the HACE module.

Additionally, in do_hash_operation, if an error occurs within the conditional
statement, the HASH_IRQ bit is not set in the status register. This causes the
firmware to continuously send HASH commands, as it is unaware that the HACE
model has completed processing the command.

To fix this, the HASH_IRQ bit in the status register must always be set to
ensure that the firmware receives an interrupt from the HACE module, preventing
it from getting stuck or repeatedly sending HASH commands.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Fixes: c5475b3 ("hw: Model ASPEED's Hash and Crypto Engine")
---
 hw/misc/aspeed_hace.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6be94963bc..1256926d22 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -267,12 +267,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                             iov[iov_idx - 1].iov_len, false,
                             iov[iov_idx - 1].iov_len);
     }
-
-    /*
-     * Set status bits to indicate completion. Testing shows hardware sets
-     * these irrespective of HASH_IRQ_EN.
-     */
-    s->regs[R_STATUS] |= HASH_IRQ;
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
@@ -356,10 +350,16 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_log_mask(LOG_GUEST_ERROR,
                         "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
                         __func__, data & ahc->hash_mask);
-                break;
+        } else {
+            do_hash_operation(s, algo, data & HASH_SG_EN,
+                    ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
         }
-        do_hash_operation(s, algo, data & HASH_SG_EN,
-                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
+
+        /*
+         * Set status bits to indicate completion. Testing shows hardware sets
+         * these irrespective of HASH_IRQ_EN.
+         */
+        s->regs[R_STATUS] |= HASH_IRQ;
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
-- 
2.43.0

