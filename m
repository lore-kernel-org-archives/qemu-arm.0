Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1746088lfg;
        Fri, 2 Apr 2021 14:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo1Or/AIL5HRMIBxXUH6UPBOK0v/VqILLLSj3TB0mxXTVTtlig867WUNM7cJ8VfBiQj8q7
X-Received: by 2002:a25:dbd0:: with SMTP id g199mr12442898ybf.508.1617399847669;
        Fri, 02 Apr 2021 14:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399847; cv=none;
        d=google.com; s=arc-20160816;
        b=yBbQwIAAtB1xZ6RscDIru1ZaCzrdMgbigbOTKGL2dWDdJnImauALapIHnPvCbG4uyr
         svotsmUEaqZthFGAq6O2QVdeVFEvFntU6vw/iY2zOqldprbZo0+1E3im0KL+TRTqubrd
         x+Q8Dwk1PJT6ruezX/auFhfvReV1VqELGm9+54CaTrR8mRSjoVvIH+OeyQgFO/Me0AY0
         foOrk4p19LeLBS6tszyrsaw3eU01EdhMASR5EVQX1ff+eS3FXqAiew1b1EWB9imwI2Le
         bzMHidmYBXcawTrq+HCeHD7RshXkmR8PVSHUs4Uu3duKJxzpkmazR2QNj/nyk92ZPptV
         dOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nVjL89dPa0iSuNtGwDs8E92oNbPSDkirfGGdEubmG2Y=;
        b=rupxAvDrqa8E2dsnodB15U2Be86IxQroJ4TijpmSdwQNExUktQ5FN2ZG8zISA2XNkA
         P7LPhO6+e58OJsXmRvs+4nRT+6ify5bqSiErJpACHmZQs22STFJng/fm78mbGDJtMvpQ
         wxDuCGj3rQzdkrK3ZHxX97DjtZqDOc4LCfUU+kVCRtd9CFRm4HaqJ6Om1KiIYb+g6MlI
         80AP9+szB/X7qe8YEcoD037OvdopmUa+rmBVYq8cvfJfqJUs8Km026I9OVedBb8tMxsQ
         tRzC2XEL/Cvuda2qr4mKs6gNDywOt6B4sI1NjrnXQnzdgwjTB4JrtR5PmhgWjIlDVAV7
         fUVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXmvy+x1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si10166401ybe.45.2021.04.02.14.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXmvy+x1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRaH-0002sp-RE
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYn-0000VY-3l
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:33 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYk-0007jl-U0
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:32 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso5122280pji.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVjL89dPa0iSuNtGwDs8E92oNbPSDkirfGGdEubmG2Y=;
 b=wXmvy+x1T9i9pZirx8EIghu0dfr29KmAZZRZvu4LKkryaWLFiwQYYwe5goIbdIJVo3
 Am+COM5g045c1YEGiqPZPJH4R10O0uVdZSzzVfpIEazHSVnGy8wq52PDwaDj3DKeH1TJ
 QTnLk3oScIioHcVFDlfxHFMi4/6+DpqgigbXWpWJWrQdrB85O5dmBkGNNQ+vvAkMwUBr
 TVKP52phuPVw403Wr23XpY9p6WlY/ug3VIhrrXKhDKx9Ww0lOiOX3fvbOwZTuLt7zygg
 Hia9pOEJq+wuQZ43vfIFUMc2yM2NZ/c6de2elMqux9puWWs/o5sTFq+TMjAmM9BTueHv
 j97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVjL89dPa0iSuNtGwDs8E92oNbPSDkirfGGdEubmG2Y=;
 b=Ng1dtAWELX+PiXln4i13iV5IdiPEdB3yT1EA1+uG18H7WvAFDw8y1govZJxGoPOgvB
 r5paYY+k+nBeV7c5Pb0omFAZrJLO7iyKBVbA4flDNBqiVu326y25XMOgJ6YJ9TAIQR+0
 /Ev2z3LIC4wIayLm6kQ7GEe08GRgSQKXS76PhqvDaUbPpqrt1GWdMN4W6ryiKlqMg1Hz
 TmngSWIV5B1EwBtCsQQ00nlvl5qbbV9q3A9xhV2+Z2JbcL7yiQSFaGhagadsPOll0nff
 mR7+79+kNluM8oMDhJXwDig6Q3lyEhdUb0LwesAX19HMdrpZkSts1NIwwOwmJ26q4efM
 xONw==
X-Gm-Message-State: AOAM530hEUdba5bY8+9UcLIQy2WUr4UI6t8n66vG4MQ17CSLhSotJxY5
 sYrHvqngO94F/PYTrF1Ts4LjC8iMwR/VTw==
X-Received: by 2002:a17:90a:540c:: with SMTP id
 z12mr15117844pjh.163.1617399749620; 
 Fri, 02 Apr 2021 14:42:29 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/11] target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
Date: Fri,  2 Apr 2021 14:42:13 -0700
Message-Id: <20210402214217.422585-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: 7ubkG3+fqK8c

After recent changes, mte_checkN does not use ESIZE,
and mte_check1 never used TSIZE.  We can combine the
two into a single field: SIZEM1.

Choose to pass size - 1 because size == 0 is never used,
our immediate need in mte_probe_int is for the address
of the last byte (ptr + size - 1), and since almost all
operations are powers of 2, this makes the immediate
constant one bit smaller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     |  3 +--
 target/arm/mte_helper.c    | 18 ++++++++----------
 target/arm/translate-a64.c |  5 ++---
 target/arm/translate-sve.c |  5 ++---
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f11bd32696..ced46ddf46 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1142,8 +1142,7 @@ FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, ESIZE, 9, 5)
-FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
+FIELD(MTEDESC, SIZEM1, 12, 10)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc,
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 6fcfaf5c9e..064ce23505 100644
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
     uint64_t tag_first, tag_end;
     uint64_t tag_byte_first, tag_byte_end;
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
     if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
         tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
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

