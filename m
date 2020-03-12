Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087980lfc;
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
X-Received: by 2002:a17:90a:34c6:: with SMTP id m6mr5939088pjf.13.1584042184012;
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042184; cv=none;
        d=google.com; s=arc-20160816;
        b=t2RSi4GB12hZGWaqaYXDhqMZHw+ptPRDJN1Qnrsg/7XWU85jL5svQEf+Y87wNgHKmL
         LZ4EPuG8kTwDiNmaIzrGTLAjKSeA4o3v9+cidPems87ZUUKT9qJD3KbbeJZizjbLViry
         FasbqahiB9A2Zzed2SqdCbm55/t1j27wX+7VgHewOqrQ8qPHZ7WudoS2Nlc3ImersqAR
         IBpO/BPQy32UiK0UJJWL1HeQXl4OjX7nKKeQ7K8VlSNYxRfWUUAIVLj9OamA83U9tlEW
         uAkAgqAxnykvlCDoD97J05497bQD+3+w3gg6u8NhpvAouMlRac29Dc8j6P1qbZnqGDPY
         OXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L/kHDW8s6OEcTFqJBz2HJGYWzHDZSrxMHdftey2a0dc=;
        b=ehCOs+PoKTajt9afKVd4RmEkgxcZIVc2uEI+xdDhmoPQJpNuR5IUTm3UshwrI0zoJ2
         mCLNb2k46wun17HpFUXJOtIQKQkz4rx2FL3L06pw+c2RxqbrDYxTqyC5UufY5G65kQy1
         3PPPJirBqyJLKOh46yJGk9j4zRnZL8DBha/y96BVkeRUVmdENzLzPtWvgJUHhO52hThr
         K0U+IAljXgnxzZRrxSui7+CCP1EH/CrSH7Ggj6jkzswjtiMxImsEqnCvkJ8Nc2jpQJ7N
         Pkixh9y/ChbUqKLwW6WCq1FqmKmMxNSOtlrYv4esanseES7WEErIigPNeWFzkCwOZwFs
         FiQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgnV4UP9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id lj15sor6940000pjb.23.2020.03.12.12.43.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sgnV4UP9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/kHDW8s6OEcTFqJBz2HJGYWzHDZSrxMHdftey2a0dc=;
        b=sgnV4UP9yLxVRuxU9/Orj9WnkXATH/FG/neMCKk8rxOD6DHg1AnkjttXCHiXZXwjJ3
         uz6rPIjUxazGmPSmXwdmcRRiLVWVKelbu2AE9YyxrHBJ8jHWmtKuIu+U7ACY/oC261nk
         lnv5OAFTENou3/jdWioLWe5rwOSgGZvHOyEkzFJFa426hD5XrDZA2jidD0937OH7S5HI
         +xWA61DHfOcsFRW28cjvaxRvJKiyYnf37Mv/XYk/iNCcdPcKp5jyIdxuo0nJkNg27o3L
         yCVOJIDZZkS0l0mUUtuDWtr4TVTyX7YyTMBbJj9i8gFZeToORxucXrvA+9QZWSy4Yqvb
         yzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/kHDW8s6OEcTFqJBz2HJGYWzHDZSrxMHdftey2a0dc=;
        b=rgy1ZteXrvEmXE7+50sRa8Ekx4icEJwhXeNM/4LeuNnMvIk0Ey3dQni85uF95uHuiD
         rOMfIxMjzOW6wW9aM/qqKoEWeoG6IIXu/h5R0jnEitdcsOX6udOKPysIoArIFVIPT0V3
         fy9MDpXtUxCkxpZ87tmqeR44qVzQHpy5a5GEku/wmgmSOXhyWVcJBD0159fj+1t4fjBi
         OlT8wYa7JqANuQsTeLGtYY2JaGtY2qmTaslALiLqwg7mSw+5jOfCWc7/QRyCvSNQhlM2
         NOhxw7T0K0mAKlOu9Sn0qNCDPRfDfzmMm5kypBzThGW288AsmAJjgHOpKWA+KqNw45OL
         sPdw==
X-Gm-Message-State: ANhLgQ0t9QVJIE2TBlKZk5buTShYxo+CavMrlZ32Q89efUqn229wrTkf
	hgLsFEYqP8ifRadouhXcnFyMTIS2
X-Google-Smtp-Source: ADFU+vudCT+rTdDpr2F4MqTdfjCrQrFT254wpR6CtPmMFg6uk6y19uXFkGQ21Dt7yrKIXzeWJyQUcg==
X-Received: by 2002:a17:90b:4014:: with SMTP id ie20mr5320890pjb.184.1584042183055;
        Thu, 12 Mar 2020 12:43:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 31/42] target/arm: Add mte helpers for sve scalar + int loads
Date: Thu, 12 Mar 2020 12:42:08 -0700
Message-Id: <20200312194219.24406-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QdyKKcI0nIoD

Because the elements are sequential, we can eliminate many tests all
at once when the tag hits TCMA, or if the page(s) are not Tagged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  58 ++++++++++
 target/arm/internals.h     |   6 +
 target/arm/sve_helper.c    | 218 ++++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c | 186 ++++++++++++++++++++++---------
 4 files changed, 377 insertions(+), 91 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4e71501838..af1c6967a6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1184,6 +1184,64 @@ DEF_HELPER_FLAGS_4(sve_ld1sds_le_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld1sdu_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld1sds_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve_ld1bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1bhu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bsu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bdu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bhs_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bss_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bds_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hsu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hdu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hds_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hsu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hdu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hds_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1sdu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1sds_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1sdu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1sds_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve_ldff1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1bhu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1bsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 04f0b619b7..94b8f07e93 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1306,6 +1306,12 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/*
+ * The SVE simd_data field, for memory ops, contains either
+ * rd (5 bits) or a shift count (2 bits).
+ */
+#define SVE_MTEDESC_SHIFT 5
+
 /* Bits within a descriptor passed to the helper_mte_check* functions. */
 FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2396737420..0fbf331742 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4564,15 +4564,89 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
 #endif
 }
 
+typedef uint64_t mte_check_fn(CPUARMState *, uint32_t, uint64_t, uintptr_t);
+
+static inline QEMU_ALWAYS_INLINE
+void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
+                                 uint64_t *vg, target_ulong addr, int esize,
+                                 int msize, uint32_t mtedesc, uintptr_t ra,
+                                 mte_check_fn *check)
+{
+    intptr_t mem_off, reg_off, reg_last;
+
+    /* Process the page only if MemAttr == Tagged. */
+    if (info->page[0].attrs.target_tlb_bit1) {
+        mem_off = info->mem_off_first[0];
+        reg_off = info->reg_off_first[0];
+        reg_last = info->reg_off_split;
+        if (reg_last < 0) {
+            reg_last = info->reg_off_last[0];
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    check(env, mtedesc, addr, ra);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off <= reg_last && (reg_off & 63));
+        } while (reg_off <= reg_last);
+    }
+
+    mem_off = info->mem_off_first[1];
+    if (mem_off >= 0 && info->page[1].attrs.target_tlb_bit1) {
+        reg_off = info->reg_off_first[1];
+        reg_last = info->reg_off_last[1];
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    check(env, mtedesc, addr, ra);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+typedef void sve_cont_ldst_mte_check_fn(SVEContLdSt *info, CPUARMState *env,
+                                        uint64_t *vg, target_ulong addr,
+                                        int esize, int msize, uint32_t mtedesc,
+                                        uintptr_t ra);
+
+static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
+                                     uint64_t *vg, target_ulong addr,
+                                     int esize, int msize, uint32_t mtedesc,
+                                     uintptr_t ra)
+{
+    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
+                                mtedesc, ra, mte_check1);
+}
+
+static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
+                                     uint64_t *vg, target_ulong addr,
+                                     int esize, int msize, uint32_t mtedesc,
+                                     uintptr_t ra)
+{
+    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
+                                mtedesc, ra, mte_checkN);
+}
+
+
 /*
  * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
 static inline QEMU_ALWAYS_INLINE
 void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
-               const int esz, const int msz, const int N,
+               const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn)
+               sve_ldst1_tlb_fn *tlb_fn,
+               sve_cont_ldst_mte_check_fn *mte_check_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -4597,7 +4671,14 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
                               BP_MEM_READ, retaddr);
 
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
@@ -4703,26 +4784,67 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     }
 }
 
-#define DO_LD1_1(NAME, ESZ) \
-void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
-                            target_ulong addr, uint32_t desc)  \
-{                                                              \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,      \
-              sve_##NAME##_host, sve_##NAME##_tlb);            \
+static inline QEMU_ALWAYS_INLINE
+void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
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
+    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
+              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
 }
 
-#define DO_LD1_2(NAME, ESZ, MSZ) \
-void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,        \
-                               target_ulong addr, uint32_t desc)  \
-{                                                                 \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
-              sve_##NAME##_le_host, sve_##NAME##_le_tlb);         \
-}                                                                 \
-void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,        \
-                               target_ulong addr, uint32_t desc)  \
-{                                                                 \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
-              sve_##NAME##_be_host, sve_##NAME##_be_tlb);         \
+#define DO_LD1_1(NAME, ESZ)                                             \
+void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,                 \
+                            target_ulong addr, uint32_t desc)           \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1, 0,            \
+              sve_##NAME##_host, sve_##NAME##_tlb, NULL);               \
+}                                                                       \
+void HELPER(sve_##NAME##_r_mte)(CPUARMState *env, void *vg,             \
+                                target_ulong addr, uint32_t desc)       \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,           \
+                  sve_##NAME##_host, sve_##NAME##_tlb);                 \
+}
+
+#define DO_LD1_2(NAME, ESZ, MSZ)                                        \
+void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,              \
+                               target_ulong addr, uint32_t desc)        \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
+              sve_##NAME##_le_host, sve_##NAME##_le_tlb, NULL);         \
+}                                                                       \
+void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,              \
+                               target_ulong addr, uint32_t desc)        \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
+              sve_##NAME##_be_host, sve_##NAME##_be_tlb, NULL);         \
+}                                                                       \
+void HELPER(sve_##NAME##_le_r_mte)(CPUARMState *env, void *vg,          \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
+                  sve_##NAME##_le_host, sve_##NAME##_le_tlb);           \
+}                                                                       \
+void HELPER(sve_##NAME##_be_r_mte)(CPUARMState *env, void *vg,          \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
+                  sve_##NAME##_be_host, sve_##NAME##_be_tlb);           \
 }
 
 DO_LD1_1(ld1bb,  MO_8)
@@ -4748,26 +4870,44 @@ DO_LD1_2(ld1dd,  MO_64, MO_64)
 #undef DO_LD1_1
 #undef DO_LD1_2
 
-#define DO_LDN_1(N) \
-void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,        \
-                             target_ulong addr, uint32_t desc)  \
-{                                                               \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,      \
-              sve_ld1bb_host, sve_ld1bb_tlb);                   \
+#define DO_LDN_1(N)                                                     \
+void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,                \
+                             target_ulong addr, uint32_t desc)          \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N, 0,           \
+              sve_ld1bb_host, sve_ld1bb_tlb, NULL);                     \
+}                                                                       \
+void HELPER(sve_ld##N##bb_r_mte)(CPUARMState *env, void *vg,            \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,          \
+                  sve_ld1bb_host, sve_ld1bb_tlb);                       \
 }
 
-#define DO_LDN_2(N, SUFF, ESZ) \
-void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
-              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);       \
-}                                                                     \
-void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
-              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);       \
+#define DO_LDN_2(N, SUFF, ESZ)                                          \
+void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_le_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,            \
+                  sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);     \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_be_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,            \
+                  sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);     \
 }
 
 DO_LDN_1(2)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e5d12edd55..e8b9873a4c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4542,18 +4542,32 @@ static const uint8_t dtype_esz[16] = {
 };
 
 static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
-                       int dtype, gen_helper_gvec_mem *fn)
+                       int dtype, uint32_t mte_n, bool is_write,
+                       gen_helper_gvec_mem *fn)
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     TCGv_i32 t_desc;
-    int desc;
+    int desc = 0;
 
-    /* For e.g. LD4, there are not enough arguments to pass all 4
+    /*
+     * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
+     * TODO: mte_n check here while callers are updated.
      */
-    desc = simd_desc(vsz, vsz, zt);
+    if (mte_n && s->mte_active[0]) {
+        int msz = dtype_msz(dtype);
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
+        desc <<= SVE_MTEDESC_SHIFT;
+    }
+    desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
 
@@ -4567,64 +4581,132 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 static void do_ld_zpa(DisasContext *s, int zt, int pg,
                       TCGv_i64 addr, int dtype, int nreg)
 {
-    static gen_helper_gvec_mem * const fns[2][16][4] = {
-        /* Little-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+    static gen_helper_gvec_mem * const fns[2][2][16][4] = {
+        { /* mte inactive, little-endian */
+          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
             gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
-            gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
-          { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
+              gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
+            { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
-            gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
-          { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
+              gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
+            { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
-            gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
+            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
+              gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
 
-        /* Big-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+          /* mte inactive, big-endian */
+          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+              gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
-            gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
-          { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
+              gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
+            { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
-            gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
-          { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
+              gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
+            { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
-            gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } }
+            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
+              gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
+
+        { /* mte active, little-endian */
+          { { gen_helper_sve_ld1bb_r_mte,
+              gen_helper_sve_ld2bb_r_mte,
+              gen_helper_sve_ld3bb_r_mte,
+              gen_helper_sve_ld4bb_r_mte },
+            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_le_r_mte,
+              gen_helper_sve_ld2hh_le_r_mte,
+              gen_helper_sve_ld3hh_le_r_mte,
+              gen_helper_sve_ld4hh_le_r_mte },
+            { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_le_r_mte,
+              gen_helper_sve_ld2ss_le_r_mte,
+              gen_helper_sve_ld3ss_le_r_mte,
+              gen_helper_sve_ld4ss_le_r_mte },
+            { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_le_r_mte,
+              gen_helper_sve_ld2dd_le_r_mte,
+              gen_helper_sve_ld3dd_le_r_mte,
+              gen_helper_sve_ld4dd_le_r_mte } },
+
+          /* mte active, big-endian */
+          { { gen_helper_sve_ld1bb_r_mte,
+              gen_helper_sve_ld2bb_r_mte,
+              gen_helper_sve_ld3bb_r_mte,
+              gen_helper_sve_ld4bb_r_mte },
+            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_be_r_mte,
+              gen_helper_sve_ld2hh_be_r_mte,
+              gen_helper_sve_ld3hh_be_r_mte,
+              gen_helper_sve_ld4hh_be_r_mte },
+            { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_be_r_mte,
+              gen_helper_sve_ld2ss_be_r_mte,
+              gen_helper_sve_ld3ss_be_r_mte,
+              gen_helper_sve_ld4ss_be_r_mte },
+            { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_be_r_mte,
+              gen_helper_sve_ld2dd_be_r_mte,
+              gen_helper_sve_ld3dd_be_r_mte,
+              gen_helper_sve_ld4dd_be_r_mte } } },
     };
-    gen_helper_gvec_mem *fn = fns[s->be_data == MO_BE][dtype][nreg];
+    gen_helper_gvec_mem *fn
+        = fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
 
-    /* While there are holes in the table, they are not
+    /*
+     * While there are holes in the table, they are not
      * accessible via the instruction encoding.
      */
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, dtype, fn);
+    do_mem_zpa(s, zt, pg, addr, dtype, nreg, false, fn);
 }
 
 static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
@@ -4706,7 +4788,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype,
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
                    fns[s->be_data == MO_BE][a->dtype]);
     }
     return true;
@@ -4765,7 +4847,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype,
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
                    fns[s->be_data == MO_BE][a->dtype]);
     }
     return true;
@@ -4967,7 +5049,7 @@ static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         fn = fn_multiple[be][nreg - 1][msz];
     }
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), fn);
+    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), 0, true, fn);
 }
 
 static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
-- 
2.20.1
