Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1747348lfg;
        Fri, 2 Apr 2021 14:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysMGxUzAmp3VlojmwfYqpKm3m6XQDmyXpINn6krSLPQ2nqS8b8huBCeykBeq+4WUdmN+vN
X-Received: by 2002:a25:cc54:: with SMTP id l81mr7554999ybf.281.1617399998861;
        Fri, 02 Apr 2021 14:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399998; cv=none;
        d=google.com; s=arc-20160816;
        b=T7aR4Eqs5xCayM6d3smlqfbnZMbgM23bi9Bga6qot5URKsTKoGn47m9yPHdxvV7WrT
         70MqHPHkhfhNpr6sG2Ue/TIfv76NL3W7mA9FnX3NSgTXdyPHGlVtCggZ2L2aWmD5JWqd
         JdM5glqW6MZIigYrgIbVSDdgWCPxL3z2/xLD6n+O/c6oedmWo0ojBF66/zfHNXdr9GMZ
         IikDReCj9S8kCwa8rVbNpogSe/cLGJvJbDin0guSez9XNmh5gbF8waH2v5Jhl0P1i+i2
         ZS5sdeUPaDIpmKU5NIa+v+GRYkkE/LDAyTJWTM32ErwmeeNMO5kTW2E9UMihQs+voQmu
         nvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ve/jJl7jj6QG6l0SMQqnlWm9FxHtZv4aWQa/SinIhEw=;
        b=imuQD8sU9/+heYDxV5/kHRnBanrxh6sdCP2J9snYTVL+sgJpp2WoQc3T1iPWKunzhz
         EHfeOgOgbOABgWyPs6sntWP2mE8iafsAaUoC1zE/pzqXu58LXQlMAUFZJaiN7UOe+KnB
         rhBFZ7iUpQ3gko9nmhhkpNrzCxgDreUOIoe5yk9YVrKPHBOGQunjbNb0wLTMmOADi4Z7
         4XxVJxb/6EwjCggXhtPhY6KQa+2Z8Hv4BUykx/Bcp5BEb6DxU3b/GOpIj3v0gNFtB+KP
         sKKGfPiaSIVVvl0Q7OXIAS+2yk7Wz/1tuST9UdjWKKKpY1+M/jZxXCo9xRHDP1hm4s5B
         a92g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQWWX0Ra;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n185si6338330ybf.216.2021.04.02.14.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQWWX0Ra;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRck-0006Jc-4Y
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYo-0000YI-4g
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:34 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYm-0007kO-3j
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l76so4268571pga.6
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ve/jJl7jj6QG6l0SMQqnlWm9FxHtZv4aWQa/SinIhEw=;
 b=wQWWX0Raz4FXws7qgHHRyYYFX4VbDFnPgctFeaZPR1OVT1/42nGTDE2AN6O6iWyWXZ
 2w7tgBXZ521X2P3wzCqEd/wMDoyW8sHOaczvNiIM/Sj2uiMM73m1/Fh+oOqA8ULjdepa
 vlIfpyozd4BDWx8u8x5X9gUx95EQnnTuEfAVlJKGHxzsWimck8sehZ1VhGmbbJ54YhSS
 5mq3kjaPzSHHZdpOPcoICV9KQHR4gqPHzd99EDrFyax7YXn5twzJ3zrF81F/9PWMBU7b
 1+o7+CTiDVkWsqOiG54VqjfI85DoEBtpq5Qu0WQILkJM/gkwYoh7b0slJbo1wwWkLlOs
 Dlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ve/jJl7jj6QG6l0SMQqnlWm9FxHtZv4aWQa/SinIhEw=;
 b=JrsrpUSy6rIdffRAsCcIEKIuceH5f3KfVz4nZXqhNVRpJNIC0B0rDozRH+i1ws8ek5
 0osq39wGCnzDWK8SXXKbyci7Sg9Gfg3rUnVSOdUq7OgySgbD7wNEbhZO6vZeb2LtmusS
 nJ2ygi2tjbYUWQ1T+mdg3HDNoQ334V915qQTYIAMOklDTKPToIKyzGSMsAlUGzMGsxM9
 IRIYVHFc/vyEFl6niw5ZxHs1gaRSCfwEfMxvPkWRqk08ftM6VY2BQ4DxvBxoLzjY6uda
 sWHHDoSBDR2IF8nqz+usKK8vZHV0TmWvZKdzA88EMv/fxkayuz5RcO5589ohdzox9vdS
 584A==
X-Gm-Message-State: AOAM533X31OioljGazTdanA8DKbIssiAW+VJCvdfFvn2hzr9CNN5aumS
 cN1UHFR9WGlIvRDm1Cmyav8Ibk6VVJhEwA==
X-Received: by 2002:a63:707:: with SMTP id 7mr13094084pgh.319.1617399750680;
 Fri, 02 Apr 2021 14:42:30 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/11] target/arm: Merge mte_check1, mte_checkN
Date: Fri,  2 Apr 2021 14:42:14 -0700
Message-Id: <20210402214217.422585-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAVx3GrFeImV

The mte_check1 and mte_checkN functions are now identical.
Drop mte_check1 and rename mte_checkN to mte_check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  3 +--
 target/arm/internals.h     |  5 +----
 target/arm/mte_helper.c    | 26 +++-----------------------
 target/arm/sve_helper.c    | 14 +++++++-------
 target/arm/translate-a64.c |  4 ++--
 5 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c139fa81f9..7b706571bb 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,8 +104,7 @@ DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
-DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
-DEF_HELPER_FLAGS_3(mte_checkN, TCG_CALL_NO_WG, i64, env, i32, i64)
+DEF_HELPER_FLAGS_3(mte_check, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index ced46ddf46..34df5acda1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,10 +1145,7 @@ FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 12, 10)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 064ce23505..41e0e57e1a 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -789,8 +789,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     return 0;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, ra, &fault);
@@ -803,28 +802,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
     return useronly_clean_ptr(ptr);
 }
 
-uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
-    return mte_checkN(env, desc, ptr, GETPC());
-}
-
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
-{
-    uint64_t fault;
-    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
-
-    if (unlikely(ret == 0)) {
-        mte_check_fail(env, desc, fault, ra);
-    } else if (ret < 0) {
-        return ptr;
-    }
-    return useronly_clean_ptr(ptr);
-}
-
-uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    return mte_check1(env, desc, ptr, GETPC());
+    return mte_check(env, desc, ptr, GETPC());
 }
 
 /*
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fd6c58f96a..b63ddfc7f9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4442,7 +4442,7 @@ static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
                                      uintptr_t ra)
 {
     sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check1);
+                                mtedesc, ra, mte_check);
 }
 
 static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
@@ -4451,7 +4451,7 @@ static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
                                      uintptr_t ra)
 {
     sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_checkN);
+                                mtedesc, ra, mte_check);
 }
 
 
@@ -4826,7 +4826,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (fault == FAULT_FIRST) {
         /* Trapping mte check for the first-fault element.  */
         if (mtedesc) {
-            mte_check1(env, mtedesc, addr + mem_off, retaddr);
+            mte_check(env, mtedesc, addr + mem_off, retaddr);
         }
 
         /*
@@ -5373,7 +5373,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                        mte_check1(env, mtedesc, addr, retaddr);
+                        mte_check(env, mtedesc, addr, retaddr);
                     }
                     host_fn(&scratch, reg_off, info.host);
                 } else {
@@ -5386,7 +5386,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              BP_MEM_READ, retaddr);
                     }
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                        mte_check1(env, mtedesc, addr, retaddr);
+                        mte_check(env, mtedesc, addr, retaddr);
                     }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
                 }
@@ -5552,7 +5552,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
      */
     addr = base + (off_fn(vm, reg_off) << scale);
     if (mtedesc) {
-        mte_check1(env, mtedesc, addr, retaddr);
+        mte_check(env, mtedesc, addr, retaddr);
     }
     tlb_fn(env, vd, reg_off, addr, retaddr);
 
@@ -5773,7 +5773,7 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 }
 
                 if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                    mte_check1(env, mtedesc, addr, retaddr);
+                    mte_check(env, mtedesc, addr, retaddr);
                 }
             }
             i += 1;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3af00ae90e..a68d5dd5d1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -276,7 +276,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check1(ret, cpu_env, tcg_desc, addr);
+        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
         tcg_temp_free_i32(tcg_desc);
 
         return ret;
@@ -310,7 +310,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_checkN(ret, cpu_env, tcg_desc, addr);
+        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
         tcg_temp_free_i32(tcg_desc);
 
         return ret;
-- 
2.25.1

