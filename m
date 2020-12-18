Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2167623lfq;
        Fri, 18 Dec 2020 02:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6680v1dZL0DCzmkEIsS/zEjlgrBoE/WcFeB89neeJO38BTd30mwHT57qkfyGz2Sy9njP1
X-Received: by 2002:a25:c304:: with SMTP id t4mr5640609ybf.40.1608288469508;
        Fri, 18 Dec 2020 02:47:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288469; cv=none;
        d=google.com; s=arc-20160816;
        b=qiZZcHfzSvkLZPadnj4Yl1eO9A6A2GXEPu2UKdRqsB/KZ0w67Dgzl6vvXwEM9OG5Jk
         s2cUm8TYajAfcr01UlNA2pVvoAL1AD/htGxRvNS/jz7Tpr0FNs96FtW6Ag9TBV4Y5xj+
         TeHA4A3KcVoivmxLCavXVZN/fmqAEto8Q4n0FvKILbPxZyItt9kqV2wUA33SMejsbizk
         uEMPZL1sOBZlQ2h8yf2kI/zdwd2hgRC0WfTPWK2EGCH/UsSJ+PI15xpbBiyjrE1Qwjwo
         +fAANyJm+Y8+G0UucRCMBKbeHT216T13KSJFSFz7SqBKnVBCuqaxZZTi/e49cylJ5OQn
         ErWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=PWS0+Dc8vmI9jusHAs8UJDwXdFCkUGP5nUQZkkLcT28=;
        b=EQSRArERSoYLcYdXoL2htxIz4f+cHylBE9nBALT8l/JQVeGleGPHNZJnVawt7am6VC
         IymAhNSMqJN6YfCzjHm/STfVz8Qc+fvMkcbv08GaY7RMkwmI869orK6lpw7fKv7oRuDb
         T+DetlZcTBnaEIeYuqXhHvyxQSy0R5WzMewEIHJR3nA8HNqj8Ypeefy6FEf0ImJey8cP
         p8Y8cgtM2C6aahyYYgZrbU6OqFqiDAK22GRHKoHxW//CWrEvMRw0Hw/uDtNSAQuVXwkL
         MhmSLSkn2gS4GhHdaVONXbQXWPCVw//vPloChZIbgywhWnpHmtypAfJpOVPIHT0+98rt
         fBUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si7178370ybm.329.2020.12.18.02.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:47:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDIa-0000G7-Tc
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9E-0006Bu-23; Fri, 18 Dec 2020 05:38:08 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55294
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9C-0003Kr-6q; Fri, 18 Dec 2020 05:38:07 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 52D60603D7;
 Fri, 18 Dec 2020 11:38:02 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 10/18] target/arm: handle VMID change in secure state
Date: Fri, 18 Dec 2020 12:37:51 +0200
Message-Id: <20201218103759.19929-10-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ad6XiHO56GWt

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The VTTBR write callback so far assumes that the underlying VM lies in
non-secure state. This handles the secure state scenario.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 32469abf92..649c9237ce 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4017,10 +4017,15 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_E10_1 |
-                            ARMMMUIdxBit_E10_1_PAN |
-                            ARMMMUIdxBit_E10_0);
+        uint16_t mask = ARMMMUIdxBit_E10_1 |
+                        ARMMMUIdxBit_E10_1_PAN |
+                        ARMMMUIdxBit_E10_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        tlb_flush_by_mmuidx(cs, mask);
         raw_write(env, ri, value);
     }
 }
-- 
2.29.2

