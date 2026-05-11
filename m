Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCB6CD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:02:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRD2-0004CY-HN; Mon, 11 May 2026 10:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCL-0003xZ-TZ
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:35 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCI-00065O-Vh
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:29 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6967fd0416bso2332647eaf.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508081; x=1779112881; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bur84z7/tp7wbJqDIDIhrS9GGOeBSlZHYRFrNaLDFcE=;
 b=WBDZHUlLUqW8SIZPuf/ZEZrJ+iK+EhdlNQo7krTS5nCpgBiNR+SX08J8bbR8Vxpz1m
 1NCNu3vbPbQOh0heNeskZ237vJYpAknWMjrVXS6AENduR3TwR68abVuRslZOQIHmk07T
 z1zwKQWLMj1dbXsELkd+MKgoLbrMwl4+khHH45hBTH6MzzD/BLFMmDAHnlNUZxVPM0G7
 hXTHd+PzFgWFfI9JM9hxaRrdgtFbZmh/ub+qG8NKMI7Ah3tHIVR5vMumQ0xyIMAnqW2Z
 ma3NrqzybrkNtYYNtq7pJei9fz2Rvb90kbE7ojPzDLdzOgKyklcOp9FegqAxHL3xWMf+
 2iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508081; x=1779112881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bur84z7/tp7wbJqDIDIhrS9GGOeBSlZHYRFrNaLDFcE=;
 b=BBVJULg9rN+ci08MC7sOO+Y77NnAi/xE9bPfNF5yflTLJgOV/h7D/gu/r++HmIbdB/
 ASEbviY7Fe4o8iWuiqTNHqVWpweplV4CrHXgFceplvZRkrjKUgSxPWvzV0PfZOWSoI4P
 wAiSUADfJM2jnvZrys6TGsGcq2VU/Yoj1fBTPKrC+swHGVLmPr1ZZDHe/xPM0VDlFVfi
 bPGQV80L9dC+NE9omWvgRzbCobbOIXmQIWxPZnQhkwQdvoT4ZwwHBRA/1Od8CStaR/fi
 stknLteWaaxcV941D+c84Ndt46jAxpgKgsTtXlJMwGmTwwcU+PkMfyEvQ+kjGNIHq6Nf
 0dfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+whXtj8ISW2EmPKSRIc6epTZodx+EeYM4H0W8LK7rsPhgy5S5bhAQGD9Fi4h/VtU+DBEjwovR2QA==@nongnu.org
X-Gm-Message-State: AOJu0YyKyYBj7npQWsZTPN5+dwLNYDsDo+At41HvCHLkuczPiANBxhUh
 iczGHEDfOet23IZxGq85fzVSvrNrGRlT12qnYbgAJBgT0RRK2Ym1OJiP
X-Gm-Gg: Acq92OE0tIvWcwxEMqgrY1Gh4ksgqyhPUUOrZKGEiaDGm2i817azzaGE5ctpNBxuMLV
 s7RLLBpcOdWMUjyPNeRrVBDIZZ/XYvrVu5zVkneoYTtkkkHfc5o7zFmDJaOPV4K5OFTlRqIylGq
 Dl0rOkVUkB6QoIeMBnRzqtBLu59A9iUN5+SeGPW3Pp2I9DfS08puKKvGNzQhGPiQxT2Y6kPe7Tv
 sYG7cClF5pHtXxw7aULThfJ/iKiXf3MCvD7C3TbUNJRiZI8vYGnA4N+oU8qd23JUobiU+vJCrDU
 dWlb5pE/krh8TUcWb0iaoJJCpc4ZPjkwlbrvBwJM9SdLEAqAKowJ47c5BJla6iSxzNGcZAZytrU
 fNyqTtGXcFkiWvYytjLILNGmWgjF4bQAk9pubVOqXbJ+5D/HJfNd+O3lEzP6E2GnBHrN1EZ6487
 hB8xiiKM/K8lXd1YLhol+blHGSyD/TDrws2cCxSBxs
X-Received: by 2002:a4a:e915:0:b0:694:a4a6:7273 with SMTP id
 006d021491bc7-69998cfe645mr12929348eaf.29.1778508080356; 
 Mon, 11 May 2026 07:01:20 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:19 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:08 -0400
Subject: [PATCH v6 10/15] target/arm: fault on tag store to canonical tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-10-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=11322;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=ZeBIvrKYLUBiPohNnNtsMiXiIaGfMVpInN54LafeNVg=;
 b=tvEsZDk6/klp6Pwtc5hQpPxi0S7SSIWF6HwwNxIjL1wLDVY2YhSHNVxXy8Hus9LLmLwlOEvlG
 7FyIhUk9kPKBRIEsnkJ2vUt4HLqk58zut0W+9jy4CHHh2KdLRX7jUbB
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

According to ARM ARM, section "Memory region tagging types", tag-store
instructions targeting canonically tagged regions cause a stage 1
permission fault with MTX enabled.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64-defs.h | 12 ++++-----
 target/arm/tcg/mte_helper.c      | 55 +++++++++++++++++++++++++++++++---------
 target/arm/tcg/translate-a64.c   | 26 +++++++++++--------
 3 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index c08c8c3991..136d246a68 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -103,15 +103,15 @@ DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_4(ldg, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_3(stg, TCG_CALL_NO_WG, void, env, i64, i64)
-DEF_HELPER_FLAGS_3(stg_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_4(stg, TCG_CALL_NO_WG, void, env, i64, i64, i32)
+DEF_HELPER_FLAGS_4(stg_parallel, TCG_CALL_NO_WG, void, env, i64, i64, i32)
 DEF_HELPER_FLAGS_2(stg_stub, TCG_CALL_NO_WG, void, env, i64)
-DEF_HELPER_FLAGS_3(st2g, TCG_CALL_NO_WG, void, env, i64, i64)
-DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_4(st2g, TCG_CALL_NO_WG, void, env, i64, i64, i32)
+DEF_HELPER_FLAGS_4(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64, i32)
 DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_3(ldgm, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
-DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_4(stgm, TCG_CALL_NO_WG, void, env, i64, i64, i32)
+DEF_HELPER_FLAGS_4(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64, i32)
 
 DEF_HELPER_FLAGS_4(unaligned_access, TCG_CALL_NO_WG,
                    noreturn, env, i64, i32, i32)
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index c382f0149f..dca4ef5a94 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -231,6 +231,19 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
 #endif
 }
 
+static G_NORETURN void canonical_tag_write_fail(CPUARMState *env,
+                                     uint64_t dirty_ptr, uintptr_t ra)
+{
+    uint64_t syn;
+
+    env->exception.vaddress = dirty_ptr;
+
+    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, 1, 0);
+    syn |= BIT_ULL(42); /* TnD is bit 42 */
+
+    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
+}
+
 static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    uint64_t ptr, MMUAccessType ptr_access,
                                    int ptr_size, MMUAccessType tag_access,
@@ -360,7 +373,7 @@ static void store_tag1_parallel(uint64_t ptr, uint8_t *mem, int tag)
 typedef void stg_store1(uint64_t, uint8_t *, int);
 
 static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
-                          uintptr_t ra, stg_store1 store1)
+                          uint32_t mtx, uintptr_t ra, stg_store1 store1)
 {
     int mmu_idx = arm_env_mmu_index(env);
     uint8_t *mem;
@@ -374,17 +387,20 @@ static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
     /* Store if page supports tags. */
     if (mem) {
         store1(ptr, mem, allocation_tag_from_addr(xt));
+    } else if (mtx) {
+        canonical_tag_write_fail(env, ptr, ra);
     }
 }
 
-void HELPER(stg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+void HELPER(stg)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
 {
-    do_stg(env, ptr, xt, GETPC(), store_tag1);
+    do_stg(env, ptr, xt, mtx, GETPC(), store_tag1);
 }
 
-void HELPER(stg_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+void HELPER(stg_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt,
+                          uint32_t mtx)
 {
-    do_stg(env, ptr, xt, GETPC(), store_tag1_parallel);
+    do_stg(env, ptr, xt, mtx, GETPC(), store_tag1_parallel);
 }
 
 void HELPER(stg_stub)(CPUARMState *env, uint64_t ptr)
@@ -397,7 +413,7 @@ void HELPER(stg_stub)(CPUARMState *env, uint64_t ptr)
 }
 
 static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
-                           uintptr_t ra, stg_store1 store1)
+                           uint32_t mtx, uintptr_t ra, stg_store1 store1)
 {
     int mmu_idx = arm_env_mmu_index(env);
     int tag = allocation_tag_from_addr(xt);
@@ -420,9 +436,13 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
         /* Store if page(s) support tags. */
         if (mem1) {
             store1(TAG_GRANULE, mem1, tag);
+        } else if (mtx) {
+            canonical_tag_write_fail(env, ptr, ra);
         }
         if (mem2) {
             store1(0, mem2, tag);
+        } else if (mtx) {
+            canonical_tag_write_fail(env, ptr + TAG_GRANULE, ra);
         }
     } else {
         /* Two stores aligned mod TAG_GRANULE*2 -- modify one byte. */
@@ -431,18 +451,22 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
         if (mem1) {
             tag |= tag << 4;
             qatomic_set(mem1, tag);
+        } else if (mtx) {
+            /* Writing tags to canonically tagged memory region: faults */
+            canonical_tag_write_fail(env, ptr, ra);
         }
     }
 }
 
-void HELPER(st2g)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+void HELPER(st2g)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
 {
-    do_st2g(env, ptr, xt, GETPC(), store_tag1);
+    do_st2g(env, ptr, xt, mtx, GETPC(), store_tag1);
 }
 
-void HELPER(st2g_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt)
+void HELPER(st2g_parallel)(CPUARMState *env, uint64_t ptr, uint64_t xt,
+                           uint32_t mtx)
 {
-    do_st2g(env, ptr, xt, GETPC(), store_tag1_parallel);
+    do_st2g(env, ptr, xt, mtx, GETPC(), store_tag1_parallel);
 }
 
 void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
@@ -528,7 +552,7 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr, uint32_t mtx)
     return ret << shift;
 }
 
-void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
+void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val, uint32_t mtx)
 {
     int mmu_idx = arm_env_mmu_index(env);
     uintptr_t ra = GETPC();
@@ -548,6 +572,10 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
      * and if the OS has enabled access to the tags.
      */
     if (!tag_mem) {
+        /* Storing tags to canonically tagged region: fault. */
+        if (mtx) {
+            canonical_tag_write_fail(env, ptr, ra);
+        }
         return;
     }
 
@@ -577,7 +605,8 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
     }
 }
 
-void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
+void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val,
+                        uint32_t mtx)
 {
     uintptr_t ra = GETPC();
     int mmu_idx = arm_env_mmu_index(env);
@@ -601,6 +630,8 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
     if (mem) {
         int tag_pair = (val & 0xf) * 0x11;
         memset(mem, tag_pair, tag_bytes);
+    } else if (mtx) {
+        canonical_tag_write_fail(env, ptr, ra);
     }
 }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fbc54de4b..68f476621a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3031,7 +3031,8 @@ static void handle_sys(DisasContext *s, bool isread,
                 /* Extract the tag from the register to match STZGM.  */
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
-                gen_helper_stzgm_tags(tcg_env, clean_addr, tag);
+                gen_helper_stzgm_tags(tcg_env, clean_addr, tag,
+                                      tcg_constant_i32(s->mtx));
             }
         }
         return;
@@ -3048,7 +3049,8 @@ static void handle_sys(DisasContext *s, bool isread,
                 /* Extract the tag from the register to match STZGM.  */
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
-                gen_helper_stzgm_tags(tcg_env, clean_addr, tag);
+                gen_helper_stzgm_tags(tcg_env, clean_addr, tag,
+                                      tcg_constant_i32(s->mtx));
             }
         }
         return;
@@ -3865,9 +3867,11 @@ static bool trans_STGP(DisasContext *s, arg_ldstpair *a)
     /* Perform the tag store, if tag access enabled. */
     if (s->ata[0]) {
         if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-            gen_helper_stg_parallel(tcg_env, dirty_addr, dirty_addr);
+            gen_helper_stg_parallel(tcg_env, dirty_addr, dirty_addr,
+                                    tcg_constant_i32(s->mtx));
         } else {
-            gen_helper_stg(tcg_env, dirty_addr, dirty_addr);
+            gen_helper_stg(tcg_env, dirty_addr, dirty_addr,
+                           tcg_constant_i32(s->mtx));
         }
     }
 
@@ -4647,7 +4651,7 @@ static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
     tcg_rt = cpu_reg(s, a->rt);
 
     if (s->ata[0]) {
-        gen_helper_stzgm_tags(tcg_env, addr, tcg_rt);
+        gen_helper_stzgm_tags(tcg_env, addr, tcg_rt, tcg_constant_i32(s->mtx));
     }
     /*
      * The non-tags portion of STZGM is mostly like DC_ZVA,
@@ -4679,7 +4683,7 @@ static bool trans_STGM(DisasContext *s, arg_ldst_tag *a)
     tcg_rt = cpu_reg(s, a->rt);
 
     if (s->ata[0]) {
-        gen_helper_stgm(tcg_env, addr, tcg_rt);
+        gen_helper_stgm(tcg_env, addr, tcg_rt, tcg_constant_i32(s->mtx));
     } else {
         MMUAccessType acc = MMU_DATA_STORE;
         int size = 4 << s->gm_blocksize;
@@ -4795,15 +4799,17 @@ static bool do_STG(DisasContext *s, arg_ldst_tag *a, bool is_zero, bool is_pair)
         }
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (is_pair) {
-            gen_helper_st2g_parallel(tcg_env, addr, tcg_rt);
+            gen_helper_st2g_parallel(tcg_env, addr, tcg_rt,
+                                     tcg_constant_i32(s->mtx));
         } else {
-            gen_helper_stg_parallel(tcg_env, addr, tcg_rt);
+            gen_helper_stg_parallel(tcg_env, addr, tcg_rt,
+                                    tcg_constant_i32(s->mtx));
         }
     } else {
         if (is_pair) {
-            gen_helper_st2g(tcg_env, addr, tcg_rt);
+            gen_helper_st2g(tcg_env, addr, tcg_rt, tcg_constant_i32(s->mtx));
         } else {
-            gen_helper_stg(tcg_env, addr, tcg_rt);
+            gen_helper_stg(tcg_env, addr, tcg_rt, tcg_constant_i32(s->mtx));
         }
     }
 

-- 
2.54.0


