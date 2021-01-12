Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3466157lfq;
        Tue, 12 Jan 2021 03:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQBlpGoS0wmJpFG4cfzGQ5v0v+XWSQsU+/cv7JrLoaWgqCue4PMegJdsxNctR+j1pfaxX2
X-Received: by 2002:a25:748a:: with SMTP id p132mr5879246ybc.268.1610451117601;
        Tue, 12 Jan 2021 03:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610451117; cv=none;
        d=google.com; s=arc-20160816;
        b=R7RItb7YEm5chA+W2sgDc/kKesRI03cxSPvtgQXnDC4/Unr+3fMWVK08S0ocTcMBzK
         KZWixmn+h10cl7cWUN17LAn6O1ltTPnzMlP26Wsu/9yRLeGi8aongf/wIRq19UaqlJom
         UNAI8YDoRSz/z0xYOL7zF+Mf+37O6fu3PWa+XLwgVz45QDpkCbueq0hOCXFOv3B1kffq
         pnYFsQ4NKaEbujAJGWFk6pV1zFBS1ksR9JOQLEjozLvLsNM9FiQP0NfoqnSlAmEl2nrp
         CD0WvSnCyQANtffv6+p8OLCeCqW6ifUoLp8WaKOkGrWPZ0VHbj5TohZRx4BvQWqEpA6n
         q5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lmUFJCYwhnVNi8Ia7pl3m6Mrr8xIN8fLTZkUiXODtQU=;
        b=Egmz1YDQ88HVrH65MDvR+hOsUKllNdt8Wu7Zcx0IFNIWxDtOdyr8yq94cJnyKreTqq
         1uDDUcVI0GNhPqoa6n8ODXvYj41A583ZS8ClYueLDnBkfOAw3se614D7neaBeTOJ419R
         w7aCdgEsSddD1Ybi7svYdxE0N+AkfCD5YC+KfVlU+tSEQ9RhNo+lI7nIn6d9cJ22YCgi
         QinNwQiQoQzdCxCPTTHaKnc16jnKeHM3js62ybX4Yiegq6iWSegoUNgcfVPLEnrMAJIf
         3RbsgsHPHRoqfRucTgDwrfSWPwNy0tD7BVOBRLSXTvQmWXK9zTx7rxISxflJ/Ign37Bt
         TDxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si2351442ybe.71.2021.01.12.03.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:31:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHu0-0005tH-Ut
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHB6-0003e6-Ft; Tue, 12 Jan 2021 05:45:34 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56724
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHB2-0003T1-NS; Tue, 12 Jan 2021 05:45:32 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 58F9360413;
 Tue, 12 Jan 2021 11:45:14 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 11/19] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Tue, 12 Jan 2021 12:45:03 +0200
Message-Id: <20210112104511.36576-11-remi.denis.courmont@huawei.com>
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
X-TUID: tnNx/eojWjqU

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
index 3e6b1c548b..7d96897f9a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10392,7 +10392,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, MemTxAttrs txattrs,
+                               hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
@@ -10402,6 +10402,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int s2prot;
         int ret;
         ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        assert(!*is_secure); /* TODO: S-EL2 */
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
                                  false,
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
2.30.0

