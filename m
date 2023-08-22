Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp290913ejb;
        Tue, 22 Aug 2023 17:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpzCII+z6EMeVXONcEC0+4hKSSlMGgTcM1I3mii/f07kFwGBKF9Mnd95JuUdBA+9O8rms3
X-Received: by 2002:a05:6214:e81:b0:630:1b99:5c53 with SMTP id hf1-20020a0562140e8100b006301b995c53mr14808438qvb.9.1692751368799;
        Tue, 22 Aug 2023 17:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692751368; cv=none;
        d=google.com; s=arc-20160816;
        b=lwSF584V0my3P9JuNw5Yfs6qkpC/fDGEptWllL5E1yuxa2ZyltaVbM3Xe9Hh78okLb
         n5VpW0MPx0q+zIL9A33hZehCJ+FZ2DcTC7mz4j2Ubpbjmo+7v/hBJwO0ERd2KL+s57fE
         cNUPH55H3e0QxpxXcTxCTjSsiZg31ftF/MuXSE84rzycbO8jd6RM5y3jGkYsmhgNC18d
         /zpzlmUvbyOXdmnSwYFXjQ6VMBh2/E06bY9Ox0f/LWBRejo/7CDxsJzPd/fuDq8NiuTr
         1mOLA0B/4KmeP5mg9mpYXUKyyHBVlolh9CQS8WnMqw/dfpTHZQaqj2vReDo+bij01UJU
         33dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nHZncDhWFspyyeL0N/xG42/s4zc5JzxVERn3GfM9rko=;
        fh=+i3cUxBp7jMD+VOtlqJ4/36FxCKNCRswt+KNfALgx74=;
        b=bq3oLWQ8IwwMbWrjR4w6S0MmpDUcqtrgwm5OeHL9OJAD7JC4BdXrpV6Vc40/8+k/MP
         3eP7Lhtq6vN/JcPbeLjhI4ePrEX1tmY3c4loSOfGvRVcgqoJAH4ToihT434mKH0oMQfD
         r70gfFb8L4o/YfM6W3q3SigNBIgDTec63OpCIrXuPNbmSam+xNTM0AHsLmIYEz+3R11L
         mNslUa8+ZmYIvuwCFeacK8gNxgeW8dVusXYfFW3XxhjjoaFmc5LAkATXkMZ0on4nAFdG
         gzx+eau+b/Wk5xiR5RyM55dNgomLVXtbZtRXwqhg6PFjg8/PRP4AXI4ELQ7ihqLXiF6d
         ElKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fau.de header.s=fau-2021 header.b=Ukysc5rv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a05620a098500b0076cc12a2303si1962283qkx.207.2023.08.22.17.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 17:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fau.de header.s=fau-2021 header.b=Ukysc5rv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYbwj-0005Oq-Gh; Tue, 22 Aug 2023 20:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matti.schulze@fau.de>)
 id 1qYU5H-0006SX-PP; Tue, 22 Aug 2023 12:18:24 -0400
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matti.schulze@fau.de>)
 id 1qYU5E-0000mo-QQ; Tue, 22 Aug 2023 12:18:23 -0400
Received: from mx-exchlnx-2.rrze.uni-erlangen.de
 (mx-exchlnx-2.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::38])
 by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTP id 4RVZJc6xbGzPkgY;
 Tue, 22 Aug 2023 18:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
 t=1692721088; bh=nHZncDhWFspyyeL0N/xG42/s4zc5JzxVERn3GfM9rko=;
 h=From:To:CC:Subject:Date:From:To:CC:Subject;
 b=Ukysc5rvmxMqkXZIzeNZUaidV3iW9QS204kMpvfv9G5tzy3UhqxlzRo6eMmmiIqnh
 Bi1QIgPEm2LWKAYCT31JBtSgQ/jY6cPIkCQ6PFrc464TQPNznWAQX5T0v5VvF+AyyA
 D+k2+YFFtfNoXZf1zIkFNV8HXZSZmSouuy7ST+owBw/qimoqJNm2sl+4rRhiBsOwPL
 b0funS/G4ZrEwbfj9YF190ccoQrVf5tSfW2cVQDuriBDJ9YWa/HuNIMYjz0vspoI6W
 afOxtPNnVjLqloEdJ8tB7TURW+eu4TJb8P3APR308LrIR8Xbu1Y2OZ3O/jJbtt07GP
 1DgHz/535PV7g==
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
Received: from mbx5.exch.uni-erlangen.de (mbx5.exch.uni-erlangen.de
 [10.15.8.47])
 by mx-exchlnx-2.rrze.uni-erlangen.de (Postfix) with ESMTP id 4RVZJZ08RzzPjml; 
 Tue, 22 Aug 2023 18:18:06 +0200 (CEST)
Received: from matti-21ah00hxge.pool.uni-erlangen.de (10.20.39.215) by
 mbx5.exch.uni-erlangen.de (10.15.8.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.23; Tue, 22 Aug 2023 18:18:05 +0200
From: Matti Schulze <matti.schulze@fau.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Matti Schulze
 <matti.schulze@fau.de>
Subject: [PATCH] target/arm: Fix bug in memory translation for executable
 Realm memory pages
Date: Tue, 22 Aug 2023 18:17:55 +0200
Message-ID: <20230822161755.1225779-1-matti.schulze@fau.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.20.39.215]
X-ClientProxiedBy: mbx3.exch.uni-erlangen.de (10.15.8.45) To
 mbx5.exch.uni-erlangen.de (10.15.8.47)
Received-SPF: pass client-ip=131.188.11.21; envelope-from=matti.schulze@fau.de;
 helo=mx-rz-2.rrze.uni-erlangen.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Aug 2023 20:42:04 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o9V9uT0HWzPy

This patch fixes a bug in the memory translation for target/arm.
If in realm space, e.g., R-EL2 executing code from an executable 
memory page currently results in a level 3 permission fault. 
As we cannot access secure memory from an insecure space, 
QEMU checks on each memory translation if the in_space is secure va 
!ptw->in_secure. 
If this is the case we always set the NS bit in the memory attributes
to prevent ever reading secure memory from an insecure space.
This collides with FEAT_RME, since if the system is in realm space,
!ptw->in_secure also applies, and thus QEMU sets the NS bit, 
meaning that the memory will be translated into insecure space.
Fetching the instruction from this memory space leads to a fault, 
as you cannot execute NS instructions from a realm context.
To fix this we introduce the ptw->in_realm variable mirroring the
behavior for in_secure and only set the NS bit if both do not apply.

Signed-off-by: Matti Schulze <matti.schulze@fau.de>
---
 target/arm/cpu.h |  6 ++++++
 target/arm/ptw.c | 17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 88e5accda6..ff7f8f511d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2436,6 +2436,12 @@ static inline bool arm_space_is_secure(ARMSecuritySpace space)
     return space == ARMSS_Secure || space == ARMSS_Root;
 }
 
+/* Return true if @space is Realm space */
+static inline bool arm_space_is_realm(ARMSecuritySpace space)
+{
+    return space == ARMSS_Realm;
+}
+
 /* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
 static inline ARMSecuritySpace arm_secure_to_space(bool secure)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f94100c61..db1b5a7fbd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -58,6 +58,13 @@ typedef struct S1Translate {
      * this field is updated accordingly.
      */
     bool in_secure;
+    /*
+     * in_realm: whether the translation regime is Realm
+     * This is always requal to arm_space_in_realm(in_space).
+     * If a Realm ptw is "downgraded" to a NonSecure by an NSTable bit
+     * this field is updated accordingly.
+     */
+    bool in_realm;
     /*
      * in_debug: is this a QEMU debug access (gdbstub, etc)? Debug
      * accesses will not update the guest page table access flags
@@ -535,6 +542,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             .in_mmu_idx = s2_mmu_idx,
             .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
             .in_secure = arm_space_is_secure(s2_space),
+            .in_realm = arm_space_is_realm(s2_space),
             .in_space = s2_space,
             .in_debug = true,
         };
@@ -724,7 +732,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
             fi->s2addr = ptw->out_virt;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !ptw->in_secure;
+            fi->s1ns = !ptw->in_secure && !ptw->in_realm;
             return 0;
         }
 
@@ -1767,6 +1775,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
         ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
+        ptw->in_realm = false;
         ptw->in_space = ARMSS_NonSecure;
     }
 
@@ -1872,7 +1881,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= !ptw->in_secure << 5; /* NS */
+        attrs |= (!ptw->in_secure && !ptw->in_realm) << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
@@ -3139,6 +3148,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ptw->in_mmu_idx = ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_secure = ipa_secure;
     ptw->in_space = ipa_space;
+    ptw->in_realm = arm_space_is_realm(ipa_space);
     ptw->in_ptw_idx = ptw_idx_for_stage_2(env, ptw->in_mmu_idx);
 
     /*
@@ -3371,6 +3381,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_secure = is_secure,
+        .in_realm = false,
         .in_space = arm_secure_to_space(is_secure),
     };
     return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
@@ -3443,6 +3454,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     ptw.in_space = ss;
     ptw.in_secure = arm_space_is_secure(ss);
+    ptw.in_realm = arm_space_is_realm(ss);
     return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
@@ -3457,6 +3469,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = ss,
         .in_secure = arm_space_is_secure(ss),
+        .in_realm = arm_space_is_realm(ss),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.41.0

