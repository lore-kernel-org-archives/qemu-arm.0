Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3387627lfb;
        Mon, 23 Nov 2020 00:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLcyA3u0ZU133pKFCMneAOJ9XuB805paI+tIpExL+Qyan+Kpn03vAi0UcHnMqQ4R8aStEY
X-Received: by 2002:a25:d68d:: with SMTP id n135mr31324620ybg.463.1606118660928;
        Mon, 23 Nov 2020 00:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118660; cv=none;
        d=google.com; s=arc-20160816;
        b=g26QsNVHsTVpFQME/V9/oWqY9x8HcnU4mb3K6g4U/dDDfYDUlkGAmpgHugvoEO+0Z/
         td3623V4uGu/L2ZVMPXE/N+OcHOKrHSOp+DNBVzef+GH+e/u7agiUaCPjJd01FFBRDbD
         qP+aD1nAZ6tgPkI8YmojsXHPGiZgBPutq1WEoHMyQZUELoJolWkabQ6M8GjPylSCnzCT
         g6suIuTujryZfioyrqpALgaB/pw2nF9eLcTTLlG5VZ9PXFLXPJC63yaYV1pSWxgjjNNq
         xv2FykLUNLLBPTmxzG95XLwuv85KP7v5X/flT2WcCFOppKrPVAM4swDmoe2uPFC7qEVy
         BKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GQG3PEPw3RtFIMc+KDXdPGKdcgzWMgA6TzlADn4z1C0=;
        b=PcLDgn5sSWR5fe3/BsyoAD05c409KwnwiAm0NDpvULa+71O0TplwbIvQ3ayQJSM0Xw
         8cm1Xs3yaSvfNrTaK5AzRAUZXn3kDU/aI/U2/7n351o7xiTitVnuP2kWgv1ptVSlCiAq
         s453P38VM56njSsorEl5KH358MRBDFojNbPXOVW8+J8AhSF5vUQsjemm3S7/cYHYDJ0L
         7/XxCTGCPceHqrKZo8Nor+dh3tTi5ySQyhmOQ6vUIejU2KVEdwfyusbJjWKNG42VQT1m
         VadhhafXPO77hGjAqbRyLuZUsEVPXmfi7phAYdbSf9p2fd5C5gDv/+pug37GXJZoKCLN
         Il8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si12142949ybn.452.2020.11.23.00.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6pg-0006t6-B5
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6oR-0006J4-VK; Mon, 23 Nov 2020 03:03:03 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54638
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6oQ-0004fe-H8; Mon, 23 Nov 2020 03:03:03 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D527A604F8;
 Mon, 23 Nov 2020 09:02:39 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 11/17] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Mon, 23 Nov 2020 10:02:31 +0200
Message-Id: <20201123080237.18465-11-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
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
X-TUID: qgH+jniGy18d

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
bits can invert the secure flag for pagetable walks. This patchset
allows S1_ptw_translate() to change the non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9683f5aadc..e4681b1397 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10391,7 +10391,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, MemTxAttrs txattrs,
+                               hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s2_mmu_idx;
@@ -10403,6 +10403,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int s2prot;
         int ret;
         ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        assert(!*is_secure); /* TODO: S-EL2 */
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
@@ -10442,9 +10445,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -10471,9 +10474,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
-- 
2.29.2

