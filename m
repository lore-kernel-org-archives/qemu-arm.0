Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629256lfr;
        Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
X-Received: by 2002:aa7:8d4c:0:b029:21c:104b:f6cb with SMTP id s12-20020aa78d4c0000b029021c104bf6cbmr8684339pfe.26.1618597873725;
        Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597873; cv=none;
        d=google.com; s=arc-20160816;
        b=ErwnVMC47VPfPfuVzFvWFmZxfnL3XDPKlPmsMQLbAhrT0agoEax0tkMfudgAquFghQ
         pk0dTt4Aw6sy3NFuCtHGJAhg1+qEPZfgyH7RfV2QyVyFBM22NHEP3kjgJfToH0vUMDXW
         GjO4iZR0a2cJ+TRQAzvOaVo57LhAxfOwyh4w5QplgvhXKmbJ/q7snEqz1jIQ+YUVkGwX
         J7W2f8a/6Bmto5JE+r+O5Q4qPlMPTAq75LVsunqzpDn/F6+yjZmctnm6HEShOT1SE/zh
         qpG8mO7w7cn2tYUTwm8Z4K4zk/Rd0zs9ZNQ8jkxKwXLKnV9dnDfjzC0mfopuQo4y+onE
         6OLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jFRt3P3JxFEfNixmM1jd3rlc/kjZc519c2mKKQAjRrE=;
        b=MLM7mqrP6mjDOVrbNmrWaFUWSJYXSTRQ8ykxNp0rX7/FdBGETaDaq2CafWup+DRvL6
         5+GRm5iELyOt2i17T9MQDktXIsLdcrde6F8TLT2R9LY22e7gW4nnl4V/xFbNeI0pk+iB
         OTSpydVXxGTMm4VSAzl6OKfIOwMLTxxahu7euSuVGHnRZBsypDSO8QR3syTRm0yWWf4L
         otRU7aPzvXcw63WrfU0Rd+EpjsFgPHi6WZSY8Y4F98VpdwysaMA/TaZKL8OiXHIceAtc
         0MgYgD6yYO7ktNvCPKFnfWlXaJPR+QlIS6CBPb/D0mBzZqvG8dckbhNvFuptj72qOzHu
         3iHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHEiOhUz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u1sor3446606pgc.41.2021.04.16.11.31.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHEiOhUz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jFRt3P3JxFEfNixmM1jd3rlc/kjZc519c2mKKQAjRrE=;
        b=IHEiOhUzD9hbbX2N/96ffojUwWJ3NNZkLiXMZJGSnjTE9aMnspRdS0HBPMB58Mg2o/
         PXNSJIY0afEooi1PYIR/skrVlRlApfP5BDLSgeJ8GG8/jKCl8dWn94wcfWNqHGE3+6C4
         h6eb0dLTofrI/RdY+wvWA7D9CYWEuopQ7SDZgg0wpfRoxl+NcFvEFgZ2Wf++ZvGVXvJS
         IFP6+FoHjFe8Nx9QZHMwsfNsyRE3QuR2qEQiBZn7MKfdMwt6hmP1XUc4j91Wl/HEaqzd
         F9+SZYVyFwrjjy4FOq+IzuDDUGraUrdef33pkeZsWyviSxk0cXzloNB6wPjuxm1kgtnY
         q4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jFRt3P3JxFEfNixmM1jd3rlc/kjZc519c2mKKQAjRrE=;
        b=oHKVt/vSXm1mg7dhDEIzLiPQ3k9azI6XUuaaH8qaJpzsYlLfBeR5z5pKGlKg44sjTg
         xtlg8bkyD38ol/90Aoe0bbKohfWrdqenlGqwrMCAcjeE+VLjCy1AKgC+DREGrBNwHb71
         mNyHJ7KUbUbyAGqF5twMRMBGp9S+gsFZirWXxuV9EBvktmzG2ADZnpUvIegZnjvopjRq
         GLq/2NuHJ0WekXE5k2R8c9LkPfllC1M/MPkUjgiX3CEgcthUg+3c051e5patyM494o68
         uEwE1nFPIWOZKTSMMa3PNFWoErUGFdFh7RLseBJGasOyXiVLOzoMPU+tzu5YhsT9FG8F
         3KGw==
X-Gm-Message-State: AOAM532texzVltxQZuxs8bMusJc5oWdQrKL7D7hbrnKmZHdtNbvd3g7k
	qTgxbYmaRxUEXPDgCyvscqZ3i56Q
X-Google-Smtp-Source: ABdhPJynCoExjwY3evi4LwaMW+5/xjxkwRr3qsHtq3JiknJXb+lQG2/GKZd6WdF2HH0TVoEesyLZKw==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr381897pgg.213.1618597873304;
        Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 5/9] target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
Date: Fri, 16 Apr 2021 11:31:02 -0700
Message-Id: <20210416183106.1516563-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D1ryseGUbmNE

After recent changes, mte_checkN does not use ESIZE,
and mte_check1 never used TSIZE.  We can combine the
two into a single field: SIZEM1.

Choose to pass size - 1 because size == 0 is never used,
our immediate need in mte_probe_int is for the address
of the last byte (ptr + size - 1), and since almost all
operations are powers of 2, this makes the immediate
constant one bit smaller.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     |  4 ++--
 target/arm/mte_helper.c    | 18 ++++++++----------
 target/arm/translate-a64.c |  5 ++---
 target/arm/translate-sve.c |  5 ++---
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f11bd32696..2c77f2d50f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_INTERNALS_H
 
 #include "hw/registerfields.h"
+#include "tcg/tcg-gvec-desc.h"
 #include "syndrome.h"
 
 /* register banks for CPU modes */
@@ -1142,8 +1143,7 @@ FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, ESIZE, 9, 5)
-FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
+FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc,
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8b95f861e8..29f5f4823a 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -692,13 +692,13 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
  * Return positive on success with tbi enabled.
  */
 static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                         uintptr_t ra, uint32_t total, uint64_t *fault)
+                         uintptr_t ra, uint64_t *fault)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
     uint64_t tag_byte_first, tag_byte_last;
-    uint32_t tag_count, tag_size, n, c;
+    uint32_t sizem1, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -718,9 +718,10 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    sizem1 = FIELD_EX32(desc, MTEDESC, SIZEM1);
 
     /* Find the addr of the end of the access, and of the last element. */
-    ptr_last = ptr + total - 1;
+    ptr_last = ptr + sizem1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
@@ -738,7 +739,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
         tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
-        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
             return 1;
@@ -792,8 +793,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, TSIZE);
-    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 
     if (unlikely(ret == 0)) {
         mte_check_fail(env, desc, fault, ra);
@@ -812,8 +812,7 @@ uint64_t mte_check1(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
-    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 
     if (unlikely(ret == 0)) {
         mte_check_fail(env, desc, fault, ra);
@@ -837,8 +836,7 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
-    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
-    int ret = mte_probe_int(env, desc, ptr, 0, total, &fault);
+    int ret = mte_probe_int(env, desc, ptr, 0, &fault);
 
     return ret != 0;
 }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0b42e53500..3af00ae90e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -272,7 +272,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_size);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -306,8 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_esize);
-        desc = FIELD_DP32(desc, MTEDESC, TSIZE, total_size);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0eefb61214..5179c1f836 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4509,8 +4509,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
-        desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
         desc <<= SVE_MTEDESC_SHIFT;
     } else {
         addr = clean_data_tbi(s, addr);
@@ -5189,7 +5188,7 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << msz) - 1);
         desc <<= SVE_MTEDESC_SHIFT;
     }
     desc = simd_desc(vsz, vsz, desc | scale);
-- 
2.25.1
