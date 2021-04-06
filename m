Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1694402lfr;
        Tue, 6 Apr 2021 10:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkLhr806kqSYOoHc8WhGeiI15BjAKNg0wd+z2ZITHCxJaUmbizHtupdPtouydieW3y6i3m
X-Received: by 2002:a92:6810:: with SMTP id d16mr26239616ilc.88.1617731478576;
        Tue, 06 Apr 2021 10:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731478; cv=none;
        d=google.com; s=arc-20160816;
        b=DW0CBQHkMhI3ziRm76d8fjhNxmnV4qlc9z6OAR2xygj1HJHA2oukNUqFsxL+5B9CcW
         WZI2ir31EtmaAeaozR0CFrWBnQMTZoqBm1OLMdIu2EFWnKnS3F42uWOF2ahDRT2VSwsz
         ixB94e7C6bsDZP6cXL+suS7jul4TaqAJdoEbsiinCbzZS7tHDQN/aBy1keHqwPLUsHih
         tEgJZB2rqnLWdYEh5uusLIEUZRtnYcPPxQ9zZSmjFTLTVSF70hjolYXuyINTKSoaIrds
         JMM5AclNTVi5U1dZeW0e1CizakLtmvVEbInq18lzhOZ8MOLPfz5t1+3rPWOLEQy3kdUD
         tQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LL8587X7Os3xdf3l0BqHuyEB+e25QF1YaQmXQfCxQ2k=;
        b=lf4/y9GBSZ46jDabyN2raD72uAMvrDDx28hkfzJqs0It3/E34DKvxFGnIs5VkqctiP
         RomvOHd5tbLD4pL1MN98m9Xni+53fycI9NNj4AudjWZf2zB3ICpRY3iJ8L5NotMS+29E
         uiIaqU2CgdQ2v5oIM/xSMYjt+aKjkhedhLY34go4f+qgAuVGQ0THnCYbnnGFZN/uDtqG
         6H6KokD5hebkcD4Vzz7eZL0HpbBJ6uzR44vcgsF94yA1AXiQ1s5fT0/xlCHeQhfjhjr7
         aQbJsRDk1tfsPtI6RDrlG4lKDGitxIx25Jaq91Jzx2fLqDeH60JpUvdL6eqAddzhxGF7
         utZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R47hCUDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si18679773jat.62.2021.04.06.10.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R47hCUDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTprB-0005t5-QJ
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph0-0001px-DU
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:46 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgw-0006Nf-EM
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:45 -0400
Received: by mail-pl1-x631.google.com with SMTP id p10so2776395pld.0
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL8587X7Os3xdf3l0BqHuyEB+e25QF1YaQmXQfCxQ2k=;
 b=R47hCUDikZpySXSqs07cj4Vj/zq0/6ho/o0Tx3UZC+US8Qv5kQhiALz7ZTrK1uSX7N
 LL7/jo4fFcsH9EyppyW1uwic23TAOC34/NowW53f7n1rK1di7ch+/xrtXPtxFfb+lb6X
 gJdG6CsHiLyaFoDqTjuDXBlzYgfK4usilnB2c5pamFYNyqnQ+MoBAh+Jp2e+d2fYY9ar
 AxYN4OQgWzziiFlXJfelDXWvlU6TsvhSwrPhwtGhIq6yRydvzXT3w5ePcyVhsygHadg/
 vkfXsfmolEgz2X7QpmkNJwkVvQeX7jmSF+9O27UA2nLeqPf9NdzMjoEOcf1McvG5dShU
 Gh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL8587X7Os3xdf3l0BqHuyEB+e25QF1YaQmXQfCxQ2k=;
 b=odEWWA57Rg/BeMSVWPNzIm102ZODbB3BOhqmhTWiA3wCkldEtAJyOWgp8hUvQA19Bq
 7RgNW5/Nst6R6xnqYH4lNfCaJz8cWbjzrLVZu7DC0a5J2VtF5LNKTPjC5nldA4rP8ECK
 Lt3GEq09wal2DknF6lmp9QeKvugvjjKWAmRimgBFQ8vsVKFYVsGF1cro/L/nCw/aSUDZ
 /YH4fPrpiqP+UifRC1dQPkDaJc4e0HjGLKT4+/qztPENLMvMcko5K48BcdP7TGyf1TcE
 yJdgtclqXkcem6btRs5oHh8tP3KZhTtYvRxKn/pvqKqWUOGnPC8XOIlRPWqXd20jcNky
 C6BQ==
X-Gm-Message-State: AOAM533xy0S//f78La1c/dKG3nIPqckSGZ3KxskEvsyYfi8+nc9RDD2C
 5FK4E2HpHWwW0NUY3dR7HMv/TA==
X-Received: by 2002:a17:902:8482:b029:e6:325b:5542 with SMTP id
 c2-20020a1709028482b02900e6325b5542mr29793314plo.70.1617730841090; 
 Tue, 06 Apr 2021 10:40:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] target/arm: Merge mte_check1, mte_checkN
Date: Tue,  6 Apr 2021 10:40:27 -0700
Message-Id: <20210406174031.64299-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltLarwhmrGA+

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
index 2c77f2d50f..af1db2cd9c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1146,10 +1146,7 @@ FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 9dfbb14358..04479f33a1 100644
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

