Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp993132ejc;
        Mon, 22 Aug 2022 08:55:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Kia68lqeaKFpqjVG/rXt+dArk7jtoowNna2pn7ggb2p9SISnLNuQ5VluxkYNSoT31noMC
X-Received: by 2002:ad4:5946:0:b0:477:42fd:6492 with SMTP id eo6-20020ad45946000000b0047742fd6492mr16311345qvb.88.1661183737249;
        Mon, 22 Aug 2022 08:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661183737; cv=none;
        d=google.com; s=arc-20160816;
        b=LPo0jbPo9Vu3wTmdGhmphCUf1hzzc4F/tC7DfGFBJacCAOmJYMXm9xOaOqb4Zgx8dS
         xqbuYSNMznt3yLjKr0QkY0Hq30MJqGJB3R86J6603DJI3Ly7mL6zMgQ+tOrtA1kzra6E
         fIY/sk3YQIPlQgbM47vt8kF+ihAw0Lry/+4yQ9sjhkuQwxA1ETBH5DsZRHyUYw8IkOVK
         6QVq7DAoNKSA2ZHHkSycf9sw75nAArbMdXWOvKrLH32uFNunzo7J7FROW7emBVagQgKs
         bJik3L0MgKtvHPrYnkD5kCXU6LJCU1eySVqn9Y0KFBqkaICdQ9H2F6IAF4k+DJGU5Nh1
         fPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HtO4LZZP477l4fezaKu9Yh3w9XE4HiCdIKoUptn6t1w=;
        b=N/bDGo4apvHh5Fx7rlT4uU3D241TuXcveEwfdIdI0fOzWSC/uWYyWho3jUkSU2rmQO
         tOSjSTA9BAxxNc4vgdxL86vEMMJjFYpAT83++siMKsjXfYGA4HJk4Dhp5HkGFy40zP78
         84KyMqL3m5j6nbiPLUyOF0Kq7jjRV/AkMcW0aselPL0yEJ+CSGBfYlr1g/nlTM4XCYwd
         QIER3TTtUIUWSn0RN6V8aDQlgcFlFCZJfMpcLQkShmtFyCvCTQ4pR7AnnspZlfZ5t+MP
         Fstt9urIx4GHGlKIp6xB4jidC6qooOimxJKU4vmLvVoLW7Aei78Et+JHScjnMCeeL+1n
         EQSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/XqIg3i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac8550f000000b0031ee630050dsi4281916qtq.234.2022.08.22.08.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 08:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v/XqIg3i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ9m4-0003bb-Lb
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 11:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ls-0000YN-UU
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LT-0000it-LW
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:32 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11693974pjl.0
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HtO4LZZP477l4fezaKu9Yh3w9XE4HiCdIKoUptn6t1w=;
 b=v/XqIg3iMI28YOFRjxKs0QoUJ7dJgPOk2cpUbZ/ivo6a6h3EW/2PPQgwQCjex1uWJI
 azxr1CUrYakkECCOCCiHTt+UZ1m8qzES97qGoCTtpTkMwtMmsHE4bxufuSlYxS7Wlmz4
 nzkZM5no2/dNEsykoa2t3oLwfkpB3oyxFRWKA0LJyiKxC9APVcNdUTxZHp3aZYJnPCYe
 zVHuccDt1Ffvlu2H/mdgQJd4AhdeVMPmOYL3iKMGBNTE79i28456JgjclL+t4hoipTHu
 z2JB4nXGRDkJ69q8MJJ8XZnKuFp0oHPzWAbJOb+OXvMxuTV67cKej9MnuY3RUKSYc0h/
 Gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HtO4LZZP477l4fezaKu9Yh3w9XE4HiCdIKoUptn6t1w=;
 b=jZyeg0virwKCJaKR05JcY5QYmqrxxeJk70Wk9IMDYN92z4tMFeoFahb944+QQpRFp8
 MSVB50XW6Qx3FbSCyBi3SCVgj8ONonv+pDWPQmyyGPiWxBtYoiRu0UK/5G9BIVrNeO9F
 YQOnw022B94nXNduV7BDMO6DgTG7KnmDUljgyxdTPfd4j17mkbWOJQDe99Cld/4lrW9W
 EVXSm3taA2WLraSH4HlQ1Swo/sAxmIGtPgqjXSF1OhuRP/XhoYqyJOOrGevhXNaba8G/
 At4TtlnB3pcNq8j7iLz1uuz3bpbkzzu+NAUGGdyPHKTjW7V6MuerOJeMua11kF8orL5t
 MhAA==
X-Gm-Message-State: ACgBeo1zUtlXnPIw3y9uJFwXtIJcb+L+E4d6FoH6J3PlHJUd4LuMQz6V
 2b7HitNHxwKboNmVvEhlWOhZkZcdeuLqiQ==
X-Received: by 2002:a17:90b:3b41:b0:1fb:5376:fb06 with SMTP id
 ot1-20020a17090b3b4100b001fb5376fb06mr1590279pjb.240.1661182086809; 
 Mon, 22 Aug 2022 08:28:06 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 30/66] target/arm: Hoist read of *is_secure in
 S1_ptw_translate
Date: Mon, 22 Aug 2022 08:27:05 -0700
Message-Id: <20220822152741.1617527-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PJk6oZW7xncx

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7c0a4316a3..dbe5852af6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,26 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
+    bool is_secure = *is_secure_ptr;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
+                                         : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +239,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1

