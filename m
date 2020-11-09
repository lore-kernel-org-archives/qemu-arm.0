Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3671977lfb;
        Mon, 9 Nov 2020 06:22:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyplNWSqH8p+rjg/LFPx9guyzxQQY/utJVjuXzkUUTGSXpjChWC/U4sQn+0dGGL/nvjVgd1
X-Received: by 2002:a05:6902:685:: with SMTP id i5mr4599779ybt.434.1604931760690;
        Mon, 09 Nov 2020 06:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931760; cv=none;
        d=google.com; s=arc-20160816;
        b=tQDWWyIO6COxZ6weK1BuiyD9FawgBtBTJU7nfE8sHzXp+Q/J489KPAGtar6T+6YUCx
         imYUBClEMs/cH8S+98koO8ny/steXJi0+En/IUmPwjx7Uu0qiizyapFcq3decgjn/Ira
         LyREJxOfDVjZaTDe/df9dHi76GQF3hDISeVFp7E3JTxxFBmxiCySBKm61/zBDSRjC0YN
         ZDUQVbga0Ov/Paue7tt9dAViBjtkGu36wHwT2Iw0/7zbI2Lc3hbBjoIaLuCj2tWW9Rej
         tpve+lyxF0H7t9jsudFy7pjvlsI5dUM8j3g3VRzryuaFFCh8aMEKbwKdOkzywT7RNpiY
         Tvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fPPqyOjV793xg3idkrEeq2m07IP1AsYGAg7apxJbQaA=;
        b=kExwktpMw+C3I9XSBcFG7ZHyVSAyRAVO3El0N/TDDV5ALZH78GbO1Ul1whXobXTah1
         8rUxYmf2KcDKyNEvaacL25HqqXmUaWCDuvkgzQfITmp+6nx6fH4yJs+nwrdJd9+OEb0W
         g1pG/UwVUiXU8RIfg6enpk/EPK4Z6ER4pFqSjfdCvaJ2CUOBDBg5su/zVgJklBdk0bHg
         OtdnTWy6jOnYetY96Y+P7milt2fVo9r3Ks99l1iibXanZYDptj1PTTI0k22Kwnq5GqFE
         jVgz/8ghGxtgYtTIYiALy4jDJLyzGlCxSwtbaWzd7n5ZMXhu5JpRdfFZJKm9CfnsJgMp
         muUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si8645558ybk.191.2020.11.09.06.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc847-0000kx-K2
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sk-0003R2-C9; Mon, 09 Nov 2020 09:10:54 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60200
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sh-0002rs-2q; Mon, 09 Nov 2020 09:10:54 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 1A22A6064B;
 Mon,  9 Nov 2020 15:10:25 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 17/17] target/arm: refactor vae1_tlbmask()
Date: Mon,  9 Nov 2020 16:10:20 +0200
Message-Id: <20201109141020.27234-17-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pSQ3IgA0TEBU

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f3edbca709..35540d7a2c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4468,26 +4468,23 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
-        return mask;
-    } else if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
     } else {
-        return ARMMMUIdxBit_E10_1 |
+        mask = ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mask >>= ARM_MMU_IDX_A_NS;
+    }
+
+    return mask;
 }
 
 /* Return 56 if TBI is enabled, 64 otherwise. */
-- 
2.29.2

