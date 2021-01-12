Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3453093lfq;
        Tue, 12 Jan 2021 03:13:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvgiLJYj15qBNGJYkB8bGfgSN+d8+mgS1jyRUt9T8NUketkgHXqr40Uy6hqNvItnsItjn9
X-Received: by 2002:a25:7789:: with SMTP id s131mr6004177ybc.212.1610450008470;
        Tue, 12 Jan 2021 03:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450008; cv=none;
        d=google.com; s=arc-20160816;
        b=WPqtrLZ8lxsYZiNGrl7kLPmyop0CWqzwdjqbB3mO8DXMMkPB0F6Vf438otq+RCIn35
         Y1A5TqIm4aESV5MFoWtgGVK1lcJfeQpJitYqdlOfOMed9XePA4nV9wd6XEDYazJFTmON
         9B6niYloAK55uP1/6yXDacCkVvg1ffoWBWCaW8DD2KeLPeY+ATUuzyIFVxA5cmMIdeAL
         OYEoN2Y3C8slDocMDl65wzIokM94o54gXvyLZMhtc1H9BdR/kARscVf9o3v8FMsT+nLl
         2Ds7T4oKavBb0ieJU/brQuVbQXizNxRYtjd8QK0cHDjnc7DXW2JiXIX7MEAfw6fHKQPM
         dk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hQE8wjXROGgZHpURTXXqNUfyAEBSHap1Odc59a4lW/4=;
        b=f0HF6BdSpv0g8qI09RDYsfbXoFS5mrNWdLH1uRjdEWmDE7SqVv/QsmxL/cJ4D7XhMV
         vZv+fXuCNUM7A6XcRWcq3+Mk0/rNiI7Qd/3eMePcwYb3DPhUKkVZ0IPY6BsVA9eVIfUk
         qEpQzPBaysx1PUlA52ALYqLCR1NzhMlbTtZ289CIuBIw3A1i7FhXTI3wLiYT0nxLoQza
         Imtrp31zVs4tOBgxS0PaR6rMXspT6KajeEr8wa+2AUpFBhNsdtofp7CurmzZRYyvVf/m
         Vi1gqJTuK6QbV22owLYAp+T0IxMxOKJC7gIUKudTdAfm0JuYoWaH78Sgs+bLBgGO4ufP
         3mhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z65si2336500ybc.309.2021.01.12.03.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHc7-0008QA-Rl
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHB6-0003db-Au; Tue, 12 Jan 2021 05:45:32 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56722
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHB2-0003Sw-Hc; Tue, 12 Jan 2021 05:45:31 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 1BDC46040D;
 Tue, 12 Jan 2021 11:45:14 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 10/19] target/arm: handle VMID change in secure state
Date: Tue, 12 Jan 2021 12:45:02 +0200
Message-Id: <20210112104511.36576-10-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: BJU1nSfI2q24

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The VTTBR write callback so far assumes that the underlying VM lies in
non-secure state. This handles the secure state scenario.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7f84662dfa..3e6b1c548b 100644
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
2.30.0

