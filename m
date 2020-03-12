Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088000lfc;
        Thu, 12 Mar 2020 12:43:05 -0700 (PDT)
X-Received: by 2002:a17:902:9a48:: with SMTP id x8mr9899058plv.14.1584042184842;
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042184; cv=none;
        d=google.com; s=arc-20160816;
        b=ryi3mMCRn94aGfvcE8xHsV5OpHyP9YJKqz0fKEaOTfRgxNNSBFBuXNqAeXTpAYOl18
         vhw8IuDLtNzBZd1RhTn4VV20DhchiGXd/U3VrVLciRi8UzdphkLGbUSLUI3E27sxMNuj
         411wwV4Sv5id1shEYookc94VFRQoP1Ha8eEhcEdAWNcHEeSb28NjsU3CTKQynprgjuKm
         1H8yq+9z1iPgHUz4MeSKhgzro4AxW3W5Wq3N8iEQbK/aTrwCbJ6k8cGOe7Xsr6RJaD+6
         9N3B7+cb/x09KNoRRKoB4Iehb2jX6tJPU2wCTsK5mkTDXsBXDGQoPSvg1N9/EgoEjJYZ
         Jf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8T6BAPTYerDhEKgrzNZE4db0OCIj9s9aznenJNc+c5c=;
        b=k0S85Cd+v/L5vayr3+0+SchgdIblIX8EotLT3I6TYQDFb/mlaw/r/6dCmTsY3//X9/
         o5gb9cQ8LQCsFp3p5JB4XoQ4UEe6+BNSivYl5rIhtlMhUYjIPG2Uar8V+le7zCbIrzoS
         1rC3a1ob+2Gbo6y7qeBztqo6bhvdeh3qb08M9bDTZvuOnoV72ndATZdb4+ZpOQFiY6cw
         GYgvGVwI9kuOO51+XyvQWcO94GtHAjKHuXJFT52+DwDKo6VQLddyxLdsPhn7IYM+u8yi
         ahUsNALvxsjvmqQTrdpXUQPnrCD8RJYeZyf0dO7thAyqYYCLaOVVekIheJUj3RGU+XiX
         76bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6k0qLR7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id lj15sor6940013pjb.23.2020.03.12.12.43.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6k0qLR7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8T6BAPTYerDhEKgrzNZE4db0OCIj9s9aznenJNc+c5c=;
        b=M6k0qLR7ObhqR3X80b34xjeqDYhTFxcxpVUXOVaxXXgokUIEGz8Y4hbJM4sJRrH/Ia
         yQCEdAcLmSWE5OSaeoCLZ8NXHZEK4kCENFXnBS5w+H4H2o3qyr/sHBCw2x72khAuJc8D
         Rvoajx8QhI1w+3MTfKHUdyCDzTG7zXGPlKBGmqa+9GPYCIMW6kl6CvobBbTCky4ngTEE
         UatQtjZ32pv9id5Kt/c96H2er1NQp45Cwj3BW/63mJmMdryTCyQSKRoeg1S2ZJ9nX5AV
         4ZCkYUyLjkjc86mRke43MUG8FriCQj+RaP9MXnARhEaqizHUTvQEq4/gU3+pLIIWy41v
         PD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8T6BAPTYerDhEKgrzNZE4db0OCIj9s9aznenJNc+c5c=;
        b=AitgOPpzPBNYcEwrDd+YGCUS4VJ7YCsFZ+h2QHBqlsa2/9S1tKuG/roqQjja1+2CKW
         nhEzNT2V6WVSrefTxQMHgEIB96DPdIM3IAcMaNr89DzRE5DBTpAJgxJUGH6NC1F4wQGf
         S224g1/eLYYNuICm9Enawpa3CKF4fhZrkx25Qcqp1KM6oF1JKSWCNJT7lHFJUs3ctuAP
         fnHxgP/46qg3iPq+NFayHlV9ok8fkcwGoJ7wLuPqHLBJzDLUAIqM9xiHJtC6c13z3f7H
         qdE80pG4qU1FyRd+EIh5hn37fJS+PAyDHi7965Nc5Bz5E4QN55QFz72LFVJQ7pj02RSy
         Yzsw==
X-Gm-Message-State: ANhLgQ0LwAwxKZEIic/i27RLM5GUamXBthrY68FakokKKxzZ7OaCijje
	1I3b4wP5erTZoOuuUoVCno61dkcV
X-Google-Smtp-Source: ADFU+vt5g/LpGkpVG/ZS9ofwyQosx12VGoEpkdvmjYxOzmScmRceEYC5uwIffARpy0mVHsLXC1OzYQ==
X-Received: by 2002:a17:90b:2390:: with SMTP id mr16mr5788196pjb.149.1584042184205;
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 32/42] target/arm: Add mte helpers for sve scalar + int stores
Date: Thu, 12 Mar 2020 12:42:09 -0700
Message-Id: <20200312194219.24406-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JFUEMLwphiJ+

Because the elements are sequential, we can eliminate many tests all
at once when the tag hits TCMA, or if the page(s) are not Tagged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  47 +++++++++++
 target/arm/sve_helper.c    |  95 ++++++++++++++++------
 target/arm/translate-sve.c | 162 ++++++++++++++++++++++++-------------
 3 files changed, 226 insertions(+), 78 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index af1c6967a6..e81d06b27c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1351,6 +1351,53 @@ DEF_HELPER_FLAGS_4(sve_st1hd_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_st1sd_le_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_st1sd_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve_st1bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st2dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st3dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st4dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1bh_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1bs_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1bd_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1hs_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1hd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1hs_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1hd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_st1sd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_st1sd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_ldbsu_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_ldhsu_le_zsu, TCG_CALL_NO_WG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0fbf331742..0b8522ff01 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5187,11 +5187,12 @@ DO_LDFF1_LDNF1_2(dd,  MO_64, MO_64)
  */
 
 static inline QEMU_ALWAYS_INLINE
-void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr, uint32_t desc,
-               const uintptr_t retaddr, const int esz,
-               const int msz, const int N,
+void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
+               uint32_t desc, const uintptr_t retaddr,
+               const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn)
+               sve_ldst1_tlb_fn *tlb_fn,
+               sve_cont_ldst_mte_check_fn *mte_check_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -5213,7 +5214,14 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr, uint32_t desc,
     sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
                               BP_MEM_WRITE, retaddr);
 
-    /* TODO: MTE check. */
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mte_check_fn && mtedesc) {
+        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
+                     mtedesc, retaddr);
+    }
 
     flags = info.page[0].flags | info.page[1].flags;
     if (unlikely(flags != 0)) {
@@ -5307,26 +5315,67 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr, uint32_t desc,
     }
 }
 
-#define DO_STN_1(N, NAME, ESZ) \
-void HELPER(sve_st##N##NAME##_r)(CPUARMState *env, void *vg,        \
-                                 target_ulong addr, uint32_t desc)  \
-{                                                                   \
-    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, N,           \
-              sve_st1##NAME##_host, sve_st1##NAME##_tlb);           \
+static inline QEMU_ALWAYS_INLINE
+void sve_stN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
+                   uint32_t desc, const uintptr_t ra,
+                   const int esz, const int msz, const int N,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sve_stN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
+              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
 }
 
-#define DO_STN_2(N, NAME, ESZ, MSZ) \
-void HELPER(sve_st##N##NAME##_le_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,              \
-              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb);       \
-}                                                                     \
-void HELPER(sve_st##N##NAME##_be_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,              \
-              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb);       \
+#define DO_STN_1(N, NAME, ESZ)                                          \
+void HELPER(sve_st##N##NAME##_r)(CPUARMState *env, void *vg,            \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, N, 0,            \
+              sve_st1##NAME##_host, sve_st1##NAME##_tlb, NULL);         \
+}                                                                       \
+void HELPER(sve_st##N##NAME##_r_mte)(CPUARMState *env, void *vg,        \
+                                     target_ulong addr, uint32_t desc)  \
+{                                                                       \
+    sve_stN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MO_8, N,           \
+                  sve_st1##NAME##_host, sve_st1##NAME##_tlb);           \
+}
+
+#define DO_STN_2(N, NAME, ESZ, MSZ)                                     \
+void HELPER(sve_st##N##NAME##_le_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
+              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_st##N##NAME##_be_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
+              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_st##N##NAME##_le_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_stN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,            \
+                  sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb);     \
+}                                                                       \
+void HELPER(sve_st##N##NAME##_be_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_stN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, N,            \
+                  sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb);     \
 }
 
 DO_STN_1(1, bb, MO_8)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e8b9873a4c..8d2a93e7d9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4983,73 +4983,125 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                       int msz, int esz, int nreg)
 {
-    static gen_helper_gvec_mem * const fn_single[2][4][4] = {
-        { { gen_helper_sve_st1bb_r,
-            gen_helper_sve_st1bh_r,
-            gen_helper_sve_st1bs_r,
-            gen_helper_sve_st1bd_r },
-          { NULL,
-            gen_helper_sve_st1hh_le_r,
-            gen_helper_sve_st1hs_le_r,
-            gen_helper_sve_st1hd_le_r },
-          { NULL, NULL,
-            gen_helper_sve_st1ss_le_r,
-            gen_helper_sve_st1sd_le_r },
-          { NULL, NULL, NULL,
-            gen_helper_sve_st1dd_le_r } },
-        { { gen_helper_sve_st1bb_r,
-            gen_helper_sve_st1bh_r,
-            gen_helper_sve_st1bs_r,
-            gen_helper_sve_st1bd_r },
-          { NULL,
-            gen_helper_sve_st1hh_be_r,
-            gen_helper_sve_st1hs_be_r,
-            gen_helper_sve_st1hd_be_r },
-          { NULL, NULL,
-            gen_helper_sve_st1ss_be_r,
-            gen_helper_sve_st1sd_be_r },
-          { NULL, NULL, NULL,
-            gen_helper_sve_st1dd_be_r } },
+    static gen_helper_gvec_mem * const fn_single[2][2][4][4] = {
+        { { { gen_helper_sve_st1bb_r,
+              gen_helper_sve_st1bh_r,
+              gen_helper_sve_st1bs_r,
+              gen_helper_sve_st1bd_r },
+            { NULL,
+              gen_helper_sve_st1hh_le_r,
+              gen_helper_sve_st1hs_le_r,
+              gen_helper_sve_st1hd_le_r },
+            { NULL, NULL,
+              gen_helper_sve_st1ss_le_r,
+              gen_helper_sve_st1sd_le_r },
+            { NULL, NULL, NULL,
+              gen_helper_sve_st1dd_le_r } },
+          { { gen_helper_sve_st1bb_r,
+              gen_helper_sve_st1bh_r,
+              gen_helper_sve_st1bs_r,
+              gen_helper_sve_st1bd_r },
+            { NULL,
+              gen_helper_sve_st1hh_be_r,
+              gen_helper_sve_st1hs_be_r,
+              gen_helper_sve_st1hd_be_r },
+            { NULL, NULL,
+              gen_helper_sve_st1ss_be_r,
+              gen_helper_sve_st1sd_be_r },
+            { NULL, NULL, NULL,
+              gen_helper_sve_st1dd_be_r } } },
+
+        { { { gen_helper_sve_st1bb_r_mte,
+              gen_helper_sve_st1bh_r_mte,
+              gen_helper_sve_st1bs_r_mte,
+              gen_helper_sve_st1bd_r_mte },
+            { NULL,
+              gen_helper_sve_st1hh_le_r_mte,
+              gen_helper_sve_st1hs_le_r_mte,
+              gen_helper_sve_st1hd_le_r_mte },
+            { NULL, NULL,
+              gen_helper_sve_st1ss_le_r_mte,
+              gen_helper_sve_st1sd_le_r_mte },
+            { NULL, NULL, NULL,
+              gen_helper_sve_st1dd_le_r_mte } },
+          { { gen_helper_sve_st1bb_r_mte,
+              gen_helper_sve_st1bh_r_mte,
+              gen_helper_sve_st1bs_r_mte,
+              gen_helper_sve_st1bd_r_mte },
+            { NULL,
+              gen_helper_sve_st1hh_be_r_mte,
+              gen_helper_sve_st1hs_be_r_mte,
+              gen_helper_sve_st1hd_be_r_mte },
+            { NULL, NULL,
+              gen_helper_sve_st1ss_be_r_mte,
+              gen_helper_sve_st1sd_be_r_mte },
+            { NULL, NULL, NULL,
+              gen_helper_sve_st1dd_be_r_mte } } },
     };
-    static gen_helper_gvec_mem * const fn_multiple[2][3][4] = {
-        { { gen_helper_sve_st2bb_r,
-            gen_helper_sve_st2hh_le_r,
-            gen_helper_sve_st2ss_le_r,
-            gen_helper_sve_st2dd_le_r },
-          { gen_helper_sve_st3bb_r,
-            gen_helper_sve_st3hh_le_r,
-            gen_helper_sve_st3ss_le_r,
-            gen_helper_sve_st3dd_le_r },
-          { gen_helper_sve_st4bb_r,
-            gen_helper_sve_st4hh_le_r,
-            gen_helper_sve_st4ss_le_r,
-            gen_helper_sve_st4dd_le_r } },
-        { { gen_helper_sve_st2bb_r,
-            gen_helper_sve_st2hh_be_r,
-            gen_helper_sve_st2ss_be_r,
-            gen_helper_sve_st2dd_be_r },
-          { gen_helper_sve_st3bb_r,
-            gen_helper_sve_st3hh_be_r,
-            gen_helper_sve_st3ss_be_r,
-            gen_helper_sve_st3dd_be_r },
-          { gen_helper_sve_st4bb_r,
-            gen_helper_sve_st4hh_be_r,
-            gen_helper_sve_st4ss_be_r,
-            gen_helper_sve_st4dd_be_r } },
+    static gen_helper_gvec_mem * const fn_multiple[2][2][3][4] = {
+        { { { gen_helper_sve_st2bb_r,
+              gen_helper_sve_st2hh_le_r,
+              gen_helper_sve_st2ss_le_r,
+              gen_helper_sve_st2dd_le_r },
+            { gen_helper_sve_st3bb_r,
+              gen_helper_sve_st3hh_le_r,
+              gen_helper_sve_st3ss_le_r,
+              gen_helper_sve_st3dd_le_r },
+            { gen_helper_sve_st4bb_r,
+              gen_helper_sve_st4hh_le_r,
+              gen_helper_sve_st4ss_le_r,
+              gen_helper_sve_st4dd_le_r } },
+          { { gen_helper_sve_st2bb_r,
+              gen_helper_sve_st2hh_be_r,
+              gen_helper_sve_st2ss_be_r,
+              gen_helper_sve_st2dd_be_r },
+            { gen_helper_sve_st3bb_r,
+              gen_helper_sve_st3hh_be_r,
+              gen_helper_sve_st3ss_be_r,
+              gen_helper_sve_st3dd_be_r },
+            { gen_helper_sve_st4bb_r,
+              gen_helper_sve_st4hh_be_r,
+              gen_helper_sve_st4ss_be_r,
+              gen_helper_sve_st4dd_be_r } } },
+        { { { gen_helper_sve_st2bb_r_mte,
+              gen_helper_sve_st2hh_le_r_mte,
+              gen_helper_sve_st2ss_le_r_mte,
+              gen_helper_sve_st2dd_le_r_mte },
+            { gen_helper_sve_st3bb_r_mte,
+              gen_helper_sve_st3hh_le_r_mte,
+              gen_helper_sve_st3ss_le_r_mte,
+              gen_helper_sve_st3dd_le_r_mte },
+            { gen_helper_sve_st4bb_r_mte,
+              gen_helper_sve_st4hh_le_r_mte,
+              gen_helper_sve_st4ss_le_r_mte,
+              gen_helper_sve_st4dd_le_r_mte } },
+          { { gen_helper_sve_st2bb_r_mte,
+              gen_helper_sve_st2hh_be_r_mte,
+              gen_helper_sve_st2ss_be_r_mte,
+              gen_helper_sve_st2dd_be_r_mte },
+            { gen_helper_sve_st3bb_r_mte,
+              gen_helper_sve_st3hh_be_r_mte,
+              gen_helper_sve_st3ss_be_r_mte,
+              gen_helper_sve_st3dd_be_r_mte },
+            { gen_helper_sve_st4bb_r_mte,
+              gen_helper_sve_st4hh_be_r_mte,
+              gen_helper_sve_st4ss_be_r_mte,
+              gen_helper_sve_st4dd_be_r_mte } } },
     };
     gen_helper_gvec_mem *fn;
     int be = s->be_data == MO_BE;
 
     if (nreg == 0) {
         /* ST1 */
-        fn = fn_single[be][msz][esz];
+        fn = fn_single[s->mte_active[0]][be][msz][esz];
+        nreg = 1;
     } else {
         /* ST2, ST3, ST4 -- msz == esz, enforced by encoding */
         assert(msz == esz);
-        fn = fn_multiple[be][nreg - 1][msz];
+        fn = fn_multiple[s->mte_active[0]][be][nreg - 1][msz];
     }
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), 0, true, fn);
+    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), nreg, true, fn);
 }
 
 static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
-- 
2.20.1
