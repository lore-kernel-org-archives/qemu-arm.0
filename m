Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3663293lfb;
        Mon, 9 Nov 2020 06:12:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx47oPCXoVS1oRstPtCGB2t/GBpuMqPe0LMkTlaLPSEB34bWWxZzKWLACz9vs1VSzJZk+vo
X-Received: by 2002:a25:d98f:: with SMTP id q137mr19958497ybg.128.1604931153865;
        Mon, 09 Nov 2020 06:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931153; cv=none;
        d=google.com; s=arc-20160816;
        b=Zxg9NSMZWga0tGED4fECRhX1isPrzdt0/rUUyCXYX0ZLzvOf0nVUKm0s4auI3AoB1Y
         Ok2Gf3MqvnKawTKyu7c3/w2GBwHAYNcgPGPcspJDAj6r+/gd3DNU0PYi03yXoOiA9ujA
         93U9LXCPqnVrbsmgG6wSLw9ifl11XCm5jSEKYieNwjv67+VSZ+Gcu+azlJiwSx2EmYgC
         s6yAdjqtovLcYTIW6LXMjqbE2lGJ0o0feQt9grnZ8o16W6RyAE5RP7QELPfJSzlmZ1y1
         /st8GaS8+XSeZkmuhVqlTMGI52gq3EMQCPRtOtnBaEDV3czugF2hyhG2AeXw42BopEqS
         aQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yPsJt9745BhhZ/ooLYOWnPNWERAWrKfcj0qaGcDOHYQ=;
        b=jfAisuP2cYsFNRktIHS6s1aVoAyO6guG1h8Zy6ivepj3pDdzNx3vrX8u2DU2tyKjvj
         Uv3K7NOQT/k4wvGDWO6c1feadg6A0qwJNXMmcCCmc1sQZvJoIM4newawMXpibkG7LtS/
         J1xw1WF/2mi8bBKbzfT4LLbFA/m0tzPGwLG7HxA28t0sebYUk2nSHnnUyoo9UFd+PxPz
         mQAZ8t2A/zcxPuvtwWvTB+wNMHjcwJ+fqORYab656Yqdb0HXSkBDlXLTjUNaCK0YWeVv
         v4v5Kfiw2Kg2AklDs8SiFhvAEkok6gTQHfhawTizcJWdeuwdMq7qi7zjLq6IVrtfSl2F
         MDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si1696424yba.459.2020.11.09.06.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc7uL-0004g0-85
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sN-00036L-Kc; Mon, 09 Nov 2020 09:10:31 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60190
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sL-0002qC-AZ; Mon, 09 Nov 2020 09:10:31 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 9CB246038F;
 Mon,  9 Nov 2020 15:10:23 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 11/17] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Mon,  9 Nov 2020 16:10:14 +0200
Message-Id: <20201109141020.27234-11-remi.denis.courmont@huawei.com>
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
X-TUID: 6pzJAqw/52uA

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
bits can invert the secure flag for pagetable walks. This patchset
allows S1_ptw_translate() to change the non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2263715ba4..90967771b6 100644
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
@@ -10441,9 +10444,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -10470,9 +10473,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
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

