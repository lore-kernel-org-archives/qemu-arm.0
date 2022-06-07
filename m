Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1807820lfb;
        Mon, 6 Jun 2022 20:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzekbjjCyauq5iVOcz2AAJNxgFHjdYO6SA1D+rT1nLu3DLh1otNBYOA8ObcWgP+sWcLBBiY
X-Received: by 2002:a37:f90d:0:b0:6a5:b72e:d2c9 with SMTP id l13-20020a37f90d000000b006a5b72ed2c9mr18142299qkj.490.1654570994684;
        Mon, 06 Jun 2022 20:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570994; cv=none;
        d=google.com; s=arc-20160816;
        b=tQPchjycaV/gmdoYPJGE29tHyOVC6+DzwQZsfz3S2UspTZnTJO4RP5gPAB4inzoqiN
         g3dvvjjZ8b74IvttoOmpfe/N9cgnv4DQn/oY+MlL7OT8xpEpRNgoOLNma4mJ7qNLCCx0
         vKrWQOnuJWhJM7L6NyavLqKgkn2bL4mgcQlZXUrAwPSJ8Q1LLKtM6JOVOx8Bs7JZAQrm
         LXdFC41J3eZTBTeGabehj+jPDpDPfx0gskl0q3DbhziHETwdf+2p99bXKkmbNPag5Vim
         TZ+4+OmO9XnyMqaP3hXuA3IYdnJcJ6qPClgTRkTqFQiAHiBqEKYYvVc/f0nRO8I4O3ek
         BdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SJsPBjgxAIzmv4HQ3HMK84E2HfNlE6G2yY4SYv05x4E=;
        b=iKyuKeFOcqf1XIFrVPw1o4WJxNXk4MaDuT5Uc4mCvN3reYz7tGxAObGVN0YapwY54h
         CU6lbFYuI9djsJNOsQRVXs4xgCWTj9C+PGJVnHPjOykL0DbIGnP2yg1ujK3Zk+AlJ69n
         V3QVP/9+Q2YkvLTwZvmGuIkAu5J6NiYMfMx9BfOFAc9k6xGS/OEulXqzlbxpIKItnTVe
         AppyO8xJw8gaMuO8CWlGw6SL+EJmjwUlVGRkNOMK5Xb6Oq6rMq0IUT8j7zI0LPmYGUXo
         C8w8qAozrBQ7apqytg1sC/snl5hrlmP7EJ8x2aWPKZX7QOOxDz10dIyu4gWSmEwsn9/t
         qB6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b+jR/wV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a05622a03ce00b00304b39e5b9esi8828808qtx.756.2022.06.06.20.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b+jR/wV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPUw-0000ab-5U
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG3-0006z0-EF
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFz-0000LU-Ss
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q123so14546302pgq.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJsPBjgxAIzmv4HQ3HMK84E2HfNlE6G2yY4SYv05x4E=;
 b=b+jR/wV2UICJGjskdupGHqX8deboXE9IGmglenjvTepIYIQ6s3ecfOoTmYZ4z82p6V
 TgPsjRnoY3LmNmA3GPwdL5mqHgmU8WlwzMvKzYdvxGEpzLaljiEm79zKHyePRTn9TX+6
 6vgYM2qxFlcsImrnnN0nOes1RwvQI3n2Az/UwEm6YuZYrOQsSHGL/eF/CuBn6nsGKhAa
 2WP9kxGKyCLHEA4oWr9oFbvv2Toso1CecYh9BbQFnqHIc7GX8RpfJGB4dJUv0srGT0hM
 lnjbjydvdEkS8GMR6uqOz6jBBRRZ2M0b8xnxLHCD0SJL2+lDvnao0nr7LqM1ziYYCD9r
 Vtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJsPBjgxAIzmv4HQ3HMK84E2HfNlE6G2yY4SYv05x4E=;
 b=w/bV+p/nipnVCkDAUssQlZIVQsv2SXuKw5bSAw4lNHILrZIKkt1Iw1M0k5wt1ORRT2
 MpKms9/ncnQ1t7bzu3e+84vDWXh2vj6074gNoWblwk+iKUHIQuO7yYYDH1wUdIciy1mf
 PURCcZoRsH0ot8uMXSFbb+yRGK2oepuqYlDzJsLKTsvHn5HfCzu/prvramRoEaT38nl/
 clnEfACZjtj2rplMRopLh2KPsyCheYOn8+DD6l5EkA7vrOt3+8L7fcw8T+iqi5Pzc5zb
 veQEBAP3oiaOb3Wr9Hs+XF9DdfgAZsOzTadphwNXFxLmmk1kFpMiPsmdV/B+u/lNAZBO
 najg==
X-Gm-Message-State: AOAM533PTY03gOpFd+kE+azwOrgbZ63DkZONTDNkuVJ3tRCPGp9aOL/A
 wCgpF6yoVe10lf/gzx2ToXy+8A==
X-Received: by 2002:a05:6a00:23ce:b0:50d:823f:981 with SMTP id
 g14-20020a056a0023ce00b0050d823f0981mr27587412pfc.10.1654570066498; 
 Mon, 06 Jun 2022 19:47:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/25] target/arm: Introduce gen_exception_insn
Date: Mon,  6 Jun 2022 19:47:22 -0700
Message-Id: <20220607024734.541321-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iDpySVLtJZ02

Create a new wrapper function that passes the default
exception target to gen_exception_insn_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  1 +
 target/arm/translate-a64.c    | 15 ++++++---------
 target/arm/translate-m-nocp.c |  3 +--
 target/arm/translate-mve.c    |  3 +--
 target/arm/translate.c        | 29 +++++++++++++----------------
 5 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c54db51d70..04d45da54e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,6 +281,7 @@ MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
 void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
                            uint32_t syn, uint32_t target_el);
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc96535fae..a5c66ce085 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1815,8 +1815,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syndrome,
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2068,8 +2067,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SWI,
-                                  syn_aa64_svc(imm16), default_exception_el(s));
+            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
+                               syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -14724,8 +14723,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14756,9 +14754,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                                      syn_btitrap(s->btype),
-                                      default_exception_el(s));
+                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                                   syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 636bfb1788..4029d7fdd4 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -765,8 +765,7 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
-                              syn_uncategorized(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5aec2a1555..0cf1b5ea4f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,8 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 44f462a3a3..c7d422b541 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1106,6 +1106,11 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
     gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+{
+    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1117,8 +1122,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                          default_exception_el(s));
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2731,8 +2735,6 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
      * an exception and return false. Otherwise it will return true,
      * and set *tgtmode and *regno appropriately.
      */
-    int exc_target = default_exception_el(s);
-
     /* These instructions are present only in ARMv8, or in ARMv7 with the
      * Virtualization Extensions.
      */
@@ -2869,8 +2871,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                          syn_uncategorized(), exc_target);
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -8583,8 +8584,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9054,8 +9054,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9064,8 +9063,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9634,8 +9632,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_UDEF,
-                              syn_illegalstate(), default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9708,8 +9705,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn_el(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                              default_exception_el(dc));
+        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
+                           syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1

