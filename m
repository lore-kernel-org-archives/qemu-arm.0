Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3826908lfa;
        Mon, 2 Nov 2020 03:05:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMxXcHGJwiviovtoWM0v10xeagw3cSpnhoQdtL91Y80tUW0oueAfpOOa+AMR6pathhdkKN
X-Received: by 2002:a02:cc3c:: with SMTP id o28mr10926852jap.107.1604315148188;
        Mon, 02 Nov 2020 03:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315148; cv=none;
        d=google.com; s=arc-20160816;
        b=rbfH5iF+hSTiQrMSpJ63Ty8GAXQFQXvUSTAruic+01o9ff2KK5gQqUh6Tc5RpWHJiW
         frtdvTJ8hZ8NC3KHe0QyLhE/0urpGUkTJTb8oZLwVXlQeFT3YsvQ/4+BwGjtrYm5IUQo
         pYtwJY8gIIn4vFC4saEeNEbvuzjphXgwnk8pFhTG2ebnLEzCXrxRVtTAPRg/oilD2FHx
         DRkxlrHta+z63LVtCQG2KOdvXyYZbjLwdAy1UV5Wq8hsQ7MtGBVPyJMHWnQ41/4PZTCW
         0Trk0nr1a0lbLmeXZqOTFvfCfsc7hKurM7i/syALfgIE2qhl4/zMHgDjHaD6joUl5t2A
         8qww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8nlDOBwbbM1tpcq/kq0RY333/L9lLsCjEJFwwIkDWoQ=;
        b=l+IbZy8SasPzhKxFoCScuyNjCnOciptNi/bok7zGtDq3xV4WLzJFDwELegwM7LhhsC
         IvJLj2OtCdPywv7nboQtSatAtPxKuQp72wWtb4Wzbl4sid2vjL4pb0H0V/8Fn/cyAOOm
         MtUiMS+CH3BD+us+BrnuTOxzr0PCLBoj5io1VDer8BBv5D2qN5Vr/auxB5FO1dUKb1Jv
         zJSyOSkCq6uHwl7nZXU8mMNhLvH2BdStnYFoGJssA+2yvm+DLQbMLXoI1+2hXM7b39wY
         x+8AejPJyk2WfyNbt9IDIfzqk3DkFPNNwM/ZBKHABM4NQJjHXmNMXjztV1nAbu+sBzdg
         I2zw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si9687150ilh.87.2020.11.02.03.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:05:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXel-0001Xe-F3
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXl-0008QO-FJ; Mon, 02 Nov 2020 05:58:33 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39566
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXj-0006mt-NI; Mon, 02 Nov 2020 05:58:33 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id B88756038D;
 Mon,  2 Nov 2020 11:58:04 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 10/14] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Mon,  2 Nov 2020 12:57:58 +0200
Message-Id: <20201102105802.39332-10-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
X-TUID: qdozftu3Z4Ms

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
bits can invert the secure flag for pagetable walks. This patchset
allows S1_ptw_translate() to change the non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4c86e4f57c..7c70460e65 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10403,7 +10403,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, MemTxAttrs txattrs,
+                               hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s2_mmu_idx;
@@ -10415,6 +10415,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int s2prot;
         int ret;
         ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        assert(!*is_secure); /* TODO: S-EL2 */
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
@@ -10453,9 +10456,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -10482,9 +10485,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
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
2.29.1

