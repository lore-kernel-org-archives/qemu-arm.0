Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp197725lfm;
        Tue, 21 Apr 2020 21:41:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypKPr3kFBP6d2XK2sQZf1o5aXYtpWZ3FkYskGxfQRpYOWTaBZHC6TXT8nY/7R2Y2km1gWUGE
X-Received: by 2002:a37:aacc:: with SMTP id t195mr24780723qke.464.1587530488516;
        Tue, 21 Apr 2020 21:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530488; cv=none;
        d=google.com; s=arc-20160816;
        b=OmHhuQzhaITJgP0Uo2ajPYJeUIamWAS2xAJQq6eJLQeu4vcYgayKwRpui/n5I1o4HK
         SqHZ2S2EgR0bJ35EpR1KyIY1+Ml/eqHmtRMuvr3zcXXlODmM/vFIL/Gxfc7PlzYDVBqY
         dzCKdYpCZ+DU3syDye+rDJkCWW8p+dn3iqF6Prx9FptMjwgUgZHwDkWDPluz8Jkii8Qq
         BXwNKmM3uyZREAH51BW1DsiuMKCNooCah0w8oWMDYTtG1+K8v/+kB4g7+lC+U2pJt+It
         yOTtneZj5HF5PtODF1cXQO3qZshZuJ5LqACy1/YT8VEewZxE8fNZeB73RWp/uz6jS/zB
         HbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kAjJuC8E6QocqpgcZFzGlZ3iBSLxUs4KOHUk+pvyTWc=;
        b=lb4C+0JIN3nLuh09JK+lQkylK5JOeaV99SKBtBhpF1phXFONdlmxHyT7DMbhgjmiF2
         GGY1TmQx+9ORssJEnWnVKmTSI8XYghKJLFScIN9K8Yv3+/qIpqgnHHSu7v2QdXIknUTy
         IMry0TH34czGL3JBWFYnsThf7xOwylfL2cThc5tiXyGO3ytjGdxB0Lh3J3ZZp3IpYAmm
         g5zy2DgqedxS20iHP3m3pklV1CoJYDa/2ecZNn5E6HAVx20PfttSdDAV4Fk7KPBD4VNv
         lgG/wH4clClm/ZAjoXBz4luP94JWfp5Q28gFS76IJiGhhtlCRiic9XGEQA2sLtsnojXT
         ZEFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPea3epQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 97si2589394qtc.64.2020.04.21.21.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPea3epQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR7CR-0005ct-Pv
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74u-0001Ag-SU
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74r-0006I8-0N
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:40 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74q-0006CI-Hu
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:36 -0400
Received: by mail-pj1-x1043.google.com with SMTP id a22so368529pjk.5
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAjJuC8E6QocqpgcZFzGlZ3iBSLxUs4KOHUk+pvyTWc=;
 b=mPea3epQd8fn6acRviE37rsYywYW8IdPLb5a2WnFJSrPd/POhHRq3OnVP4kFXelPdq
 kIhpiuAbJXRUAo00TPNNQVnBQDKvB+fFMcF3FpvW5rpE5orWST6aPx8APTmANdrrRAxo
 6BQPUjJa+mHrN87y4ShMQGq4mCOu4kJ7iQLqyOFGOgvqSJxGDrPXkJBsRpKIiQ8xZi/i
 8rrpUEDClG9VNZc5spxmH7/4YgauFGur5ndvanGvszDNp+NiiQMT76Rr3bNOyCQ0lDJ5
 nwStRZChUjUzrYC0gS3zLwI7uhdN3WeYnSNAQ9mfu9wf3xLeOaMCMSn6spiakzvSCWJw
 Sepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAjJuC8E6QocqpgcZFzGlZ3iBSLxUs4KOHUk+pvyTWc=;
 b=Xdo02JCXSeEGNZfGp1u+vQSlP+pXTKdBWRUawypRVCs9rIBwhgA3bcJVPhMbEz7gCT
 RAbl4oxqcS13HGhik7NrEiH2WhWFNgfWDpJUbnPuvXl+SM33zxtCO3VkkCOOoBr4gC51
 XM95JFvCb9Mug7LnSyIz3zPgDWYZs+UF/cQeg0UDLlJF/9cma5QDUQ849nRo+Bjvhj1B
 uXgaC6cWNgr7KLVaC7GZu26YC/MzP7fCehQbydzJqB1GRpry2YQ+dxMQnDuW9ZeM6iMK
 fnr7u+5k3loCRYouyWdeZ+X3/PSiyTvjsaEM0DFYH8dsVWdBoKIsBnePfL7RSOUQr9v+
 c8fQ==
X-Gm-Message-State: AGi0PubZgGf4yYH7cBPL0pcJ50EKdlyoQM65GAm4JQ98cQ4nCVzs0f3k
 k6isk/13AkvD7Bnywp9IvvrVZw==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr9347810pjb.155.1587530015239; 
 Tue, 21 Apr 2020 21:33:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/18] target/arm: Remove sve_memopidx
Date: Tue, 21 Apr 2020 21:33:09 -0700
Message-Id: <20200422043309.18430-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBUvIwxRgW6J

None of the sve helpers use TCGMemOpIdx any longer, so we can
stop passing it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     |  5 -----
 target/arm/sve_helper.c    | 14 +++++++-------
 target/arm/translate-sve.c | 17 +++--------------
 3 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e633aff36e..a833e3941d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -979,11 +979,6 @@ static inline int arm_num_ctx_cmps(ARMCPU *cpu)
     }
 }
 
-/* Note make_memop_idx reserves 4 bits for mmu_idx, and MO_BSWAP is bit 3.
- * Thus a TCGMemOpIdx, without any MO_ALIGN bits, fits in 8 bits.
- */
-#define MEMOPIDX_SHIFT  8
-
 /**
  * v7m_using_psp: Return true if using process stack pointer
  * Return true if the CPU is currently using the process stack
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fffde4b6ec..f482fdd285 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4440,7 +4440,7 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
+    const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off, reg_last, mem_off;
     SVEContLdSt info;
@@ -4696,7 +4696,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                    sve_ldst1_host_fn *host_fn,
                    sve_ldst1_tlb_fn *tlb_fn)
 {
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
+    const unsigned rd = simd_data(desc);
     void *vd = &env->vfp.zregs[rd];
     const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off, mem_off, reg_last;
@@ -4921,7 +4921,7 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr, uint32_t desc,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
+    const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off, reg_last, mem_off;
     SVEContLdSt info;
@@ -5127,9 +5127,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     const int mmu_idx = cpu_mmu_index(env, false);
     const intptr_t reg_max = simd_oprsz(desc);
+    const int scale = simd_data(desc);
     ARMVectorReg scratch;
     intptr_t reg_off;
     SVEHostPage info, info2;
@@ -5272,10 +5272,10 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                  sve_ldst1_tlb_fn *tlb_fn)
 {
     const int mmu_idx = cpu_mmu_index(env, false);
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
+    const intptr_t reg_max = simd_oprsz(desc);
+    const int scale = simd_data(desc);
     const int esize = 1 << esz;
     const int msize = 1 << msz;
-    const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off;
     SVEHostPage info;
     target_ulong addr, in_page;
@@ -5426,9 +5426,9 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
-    const int scale = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 2);
     const int mmu_idx = cpu_mmu_index(env, false);
     const intptr_t reg_max = simd_oprsz(desc);
+    const int scale = simd_data(desc);
     void *host[ARM_MAX_VQ * 4];
     intptr_t reg_off, i;
     SVEHostPage info, info2;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b35bad245e..7bd7de80e6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4584,11 +4584,6 @@ static const uint8_t dtype_esz[16] = {
     3, 2, 1, 3
 };
 
-static TCGMemOpIdx sve_memopidx(DisasContext *s, int dtype)
-{
-    return make_memop_idx(s->be_data | dtype_mop[dtype], get_mem_index(s));
-}
-
 static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
                        int dtype, gen_helper_gvec_mem *fn)
 {
@@ -4601,9 +4596,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
      */
-    desc = sve_memopidx(s, dtype);
-    desc |= zt << MEMOPIDX_SHIFT;
-    desc = simd_desc(vsz, vsz, desc);
+    desc = simd_desc(vsz, vsz, zt);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
 
@@ -4835,9 +4828,7 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     int desc, poff;
 
     /* Load the first quadword using the normal predicated load helpers.  */
-    desc = sve_memopidx(s, msz_dtype(s, msz));
-    desc |= zt << MEMOPIDX_SHIFT;
-    desc = simd_desc(16, 16, desc);
+    desc = simd_desc(16, 16, zt);
     t_desc = tcg_const_i32(desc);
 
     poff = pred_full_reg_offset(s, pg);
@@ -5066,9 +5057,7 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     TCGv_i32 t_desc;
     int desc;
 
-    desc = sve_memopidx(s, msz_dtype(s, msz));
-    desc |= scale << MEMOPIDX_SHIFT;
-    desc = simd_desc(vsz, vsz, desc);
+    desc = simd_desc(vsz, vsz, scale);
     t_desc = tcg_const_i32(desc);
 
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-- 
2.20.1

