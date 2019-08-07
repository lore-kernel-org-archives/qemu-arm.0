Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6074410wrv;
        Tue, 6 Aug 2019 21:57:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxefx+7vmPj0US6aXSffseqcSZFE0j/rtAHNoetIwUYATZsIEmoW8QxVP3dmBiNkAPWrDFV
X-Received: by 2002:a50:883b:: with SMTP id b56mr7608352edb.178.1565153840317;
        Tue, 06 Aug 2019 21:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153840; cv=none;
        d=google.com; s=arc-20160816;
        b=V2zbiURqdV37R0z16Jm9lmGlH/7gnVY6njXuvD/ee6iIdyGRdWXVWooz6IgphKlNwm
         ncQ315xgRHvgwCL0uh7RzWU7f03zQOQVuv1/0Q5p7yAi0BU40JyTcq+eNIg8cbOKFWMM
         9qUU9uMzcyEcXp7O/qPDo1a+ooT+RtghjVQp+CekWJeGkycM+nuv0KM0u0hizOg2XSqp
         Pn3zNTH0XryH+9WPogy0MNvp6jVf1TLilbAFcx5jD1RES2xTg+EyJlrg9ElWhkmQmCnU
         iBAqhDICDN3XzjUqu4f5P1Br72oJxT1txCNFOOPYnJW4wXIqeCufA3XcBH8iR9+inDDI
         dGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=KqRxLQ5NjEif5jD98C5/dVAXZSJ+KGuz1k72NllRGYo=;
        b=CK12wsrxzr1tnhJxToctlf7eIapXBl5n64/Qcf/p3XT5q4FRDUM7rZRxQEJbwpGA/5
         DL3OtjDypBxjzndq4x6WhTfHOYHndlK+lGWkJPg9D4Xij+BzSaXEag1bwvI+OUgbXtsI
         eg1k1wslMZybXfzoBCdxZobw3FIRCNieCv95/DYxy/pgLgjrX2ST5UsIa3FY9rn6qAnj
         QcBoU8MH0K6QUOroc72qw1yulwuxvgeH+vvRdDTLnwd23xd4GxiOXfk6hwOTjegYLcPi
         fVXvKydRZcP24G2k02NOTifq1QSrH/Z1Q+EWRcsd1lgx7EuTKSqgS1yV5quFORZZFWGh
         gHGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDW+qddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w27si28429899eje.261.2019.08.06.21.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDW+qddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvE0k-0000EX-Rk
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxT-0001LI-6q
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxR-0004ry-Dh
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:55 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxR-0004rT-58
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:53 -0400
Received: by mail-pf1-x444.google.com with SMTP id y15so42777549pfn.5
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KqRxLQ5NjEif5jD98C5/dVAXZSJ+KGuz1k72NllRGYo=;
 b=kDW+qddNeql4fOnYl+XcPcJeqQUA8a6dFAUNCj3MCpzbKv6WbVh8MhT5+8/0ZghZdz
 Zonm+OYekOBi3c6YipJSBFiLaJ3K5QV8aj8MMyzaXXZVWBtTLoFDDaUXmh734Ac6kJeh
 m4GpWqb7mXVCNEmbwKx7QaX0fjlbmhG66tQapMup9LFISi2Xr4F34JutdiYK/PKf29Mf
 wNzmJy20IePh3F+y55YLVXKdcsPn5GIidFyqsHF3kFCtsTCvF7IcEkizDce7UAQ7NRLz
 NzqQ698edfgnABx1r5fWVXrsDv6gn8Y5n39Wf0oRHPr/1rwRH1WgzOm5YL+ywEWGT5aa
 Iv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KqRxLQ5NjEif5jD98C5/dVAXZSJ+KGuz1k72NllRGYo=;
 b=WYcvmf8helB2q4SKjZti8OOOhvdsoJLbBdnULmPLUj951cuer1WezoAT/eSE8tRist
 yWwgz1lyEMEE/fMeyuDEgOebd17c9JSJBU2oEOXmHajBiiQp0mbyI/kAW2P+svdNeiGd
 RBU3AE9kevInqOf4abTunVj3atiqi8KJwVmNUHTGX+BeQAoWNQbDyOB0pKTa4ig58Jwm
 tUDwJg/amp/+HJcCa5MDTAiiX62w0+fm4xVfTsRyTbW70lH0OZGcnFuFrr6dw1N2WgBJ
 UsyTs9oCYLLxAmm8WauKDXhyO3UNUf6L80/i71rbbeqbNhBK7kpIQq6Z62D37WrK9+ZF
 TZRA==
X-Gm-Message-State: APjAAAWMst3HQvP2quHdjl8UV87Rwv7nzSaWhR+xuvdTZyLFxXSM5oHH
 M0qIQ/BPd40yuA6xM3Kks7qS9ZPMWHM=
X-Received: by 2002:aa7:84d1:: with SMTP id x17mr7434373pfn.188.1565153632249; 
 Tue, 06 Aug 2019 21:53:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:31 -0700
Message-Id: <20190807045335.1361-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH 07/11] target/arm: Replace offset with pc in
 gen_exception_insn
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
X-TUID: N16jBNUvjpRF

The offset is variable depending on the instruction set, whereas
we have stored values for the current pc and the next pc.  Passing
in the actual value is clearer in intent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c     | 25 ++++++++++++++-----------
 target/arm/translate-vfp.inc.c |  6 +++---
 target/arm/translate.c         | 31 ++++++++++++++++---------------
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e640e116b0..92aa6db12e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -273,10 +273,10 @@ static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, int offset, int excp,
+static void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
                                uint32_t syndrome, uint32_t target_el)
 {
-    gen_a64_set_pc_im(s->base.pc_next - offset);
+    gen_a64_set_pc_im(pc);
     gen_exception(excp, syndrome, target_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -356,7 +356,7 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
@@ -1128,8 +1128,8 @@ static inline bool fp_access_check(DisasContext *s)
         return true;
     }
 
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_fp_access_trap(1, 0xe, false),
-                       s->fp_excp_el);
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                       syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
     return false;
 }
 
@@ -1139,7 +1139,7 @@ static inline bool fp_access_check(DisasContext *s)
 bool sve_access_check(DisasContext *s)
 {
     if (s->sve_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_sve_access_trap(),
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_sve_access_trap(),
                            s->sve_excp_el);
         return false;
     }
@@ -1873,8 +1873,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, 0, EXCP_SWI, syn_aa64_svc(imm16),
-                               default_exception_el(s));
+            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
+                               syn_aa64_svc(imm16), default_exception_el(s));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -1887,7 +1887,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn(s, 0, EXCP_HVC, syn_aa64_hvc(imm16), 2);
+            gen_exception_insn(s, s->base.pc_next, EXCP_HVC,
+                               syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -1899,7 +1900,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_helper_pre_smc(cpu_env, tmp);
             tcg_temp_free_i32(tmp);
             gen_ss_advance(s);
-            gen_exception_insn(s, 0, EXCP_SMC, syn_aa64_smc(imm16), 3);
+            gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
+                               syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14078,7 +14080,8 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, 4, EXCP_UDEF, syn_btitrap(s->btype),
+                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                                   syn_btitrap(s->btype),
                                    default_exception_el(s));
                 return;
             }
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 262d4177e5..5065d4524c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -96,10 +96,10 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized(),
                                s->fp_excp_el);
         } else {
-            gen_exception_insn(s, 4, EXCP_UDEF,
+            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                                syn_fp_access_trap(1, 0xe, false),
                                s->fp_excp_el);
         }
@@ -108,7 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
     if (!s->vfp_enabled && !ignore_vfp_enabled) {
         assert(!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                            default_exception_el(s));
         return false;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dfbaa592ab..7a05ecae87 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1264,11 +1264,11 @@ static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, int offset, int excp,
+static void gen_exception_insn(DisasContext *s, uint32_t pc, int excp,
                                int syn, uint32_t target_el)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->base.pc_next - offset);
+    gen_set_pc_im(s, pc);
     gen_exception(excp, syn, target_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1315,7 +1315,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         return;
     }
 
-    gen_exception_insn(s, s->thumb ? 2 : 4, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
@@ -3192,7 +3192,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), exc_target);
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                       syn_uncategorized(), exc_target);
     return false;
 }
 
@@ -3586,7 +3587,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -4857,7 +4858,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -6985,7 +6986,7 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     }
 
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -7108,7 +7109,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
         off_rm = vfp_reg_offset(0, rm);
     }
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -7601,7 +7602,7 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
 
@@ -7637,7 +7638,7 @@ static void gen_srs(DisasContext *s,
     }
 
     if (undef) {
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                            default_exception_el(s));
         return;
     }
@@ -7728,7 +7729,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, 4, EXCP_INVSTATE, syn_uncategorized(),
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
                            default_exception_el(s));
         return;
     }
@@ -9265,7 +9266,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         default:
         illegal_op:
-            gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+            gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                                default_exception_el(s));
             break;
         }
@@ -10290,7 +10291,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
 
             /* All other insns: NOCP */
-            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized(),
                                default_exception_el(s));
             break;
         }
@@ -10954,7 +10955,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
@@ -11778,7 +11779,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     return;
 illegal_op:
 undef:
-    gen_exception_insn(s, 2, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
-- 
2.17.1

