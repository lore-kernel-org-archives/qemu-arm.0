Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp179034njc;
        Fri, 21 Mar 2025 02:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx5PCjW9k344oPcbdQk0Fq0hetKa/CcQiZrgkeYmL18O3U10TXAiRPl32lIp0IM9igXfQP8h1fOMPWfA==@linaro.org
X-Google-Smtp-Source: AGHT+IEAZlz40p6NNwxXm9OmFH+BjlArV6jbDx4fn9ZEHyLrrtrt2kICU3g22+uja8rfGSMitM5h
X-Received: by 2002:a05:6214:d4e:b0:6e8:f9a9:397b with SMTP id 6a1803df08f44-6eb3f28f50cmr40728006d6.15.1742549385753;
        Fri, 21 Mar 2025 02:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549385; cv=none;
        d=google.com; s=arc-20240605;
        b=XjdjWoT5BEQ3JVKqNVyf938eHrufFlnpQtQUF4nWaXgUJxLHXsRq0U3LmKnbZxlOob
         Vj6msfQoBOliOK1w4v88J0eDONUMCTdDdMQzJyeBRghIEKJ+lLRWLmsLFPGrTUpI8awQ
         RbU9s+/DdnKRf2gkl4KzNVc4dS4sSRMwqGrExLMSqRaswW09mUx55RfxGcOZFnyYypqc
         vT87MuXR/tBI4WbkOUWeExbWeGSneYswzgLbdD71qucYVJxTxw0m5znwAD0woCoF1qee
         kg090QL4pt/Csr819yKh1S/QOKn3MWn8bCWFixkS8B+fWfkS2THfWZnVYXFmEZJcvfDB
         X9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=mmD/hTDTVJl2Hr2T1lzXVYz+zCt4j+rrSoLPK7sKlzU=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=FXY6P/FcaL75Q0CtljAXKctF8cc+s0Vjo8TzBy51p/9pv5sCgTkWZ28FWoXxe4pmie
         /e/cWygk2Hv/7FsRu11RTh38pL2Y1aYOB34T1cuk3yJUoR2dYp4twnTLQb30UCfDlE8v
         rL0FbhFSc6V70AxmU9ThsGiUDAoBmNhkd1FqXoV+Yti0YQuGuhhwWmb7tc4fUmn+p0Qz
         q5zdTL3TCZZYcw62NDMs0rkdDka/SeLEzOu4ZqILl2sY4j5pKa692/mThCIj+1GOop1d
         mMpWzDE03bDAeJtOg7aJ30RNqzkJWjhqPPdfZXrwxsixBRs5oIfZhYMWdcXzmttdkiA6
         P4aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f03d811si14465996d6.373.2025.03.21.02.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeb-0006aH-NL; Fri, 21 Mar 2025 05:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeR-0006T7-Sf; Fri, 21 Mar 2025 05:26:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeP-00056F-Ed; Fri, 21 Mar 2025 05:26:51 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:26 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 09/22] hw/misc/aspeed_hace: Ensure HASH_IRQ is always set
 to prevent firmware hang
Date: Fri, 21 Mar 2025 17:26:05 +0800
Message-ID: <20250321092623.2097234-10-jamin_lin@aspeedtech.com>
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
X-TUID: k3dU5Mjnudgp

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
---
 hw/misc/aspeed_hace.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 8f333fc97e..d4f653670e 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -311,12 +311,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                             iov[i - 1].iov_len, false,
                             iov[i - 1].iov_len);
     }
-
-    /*
-     * Set status bits to indicate completion. Testing shows hardware sets
-     * these irrespective of HASH_IRQ_EN.
-     */
-    s->regs[R_STATUS] |= HASH_IRQ;
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
@@ -400,10 +394,16 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
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

