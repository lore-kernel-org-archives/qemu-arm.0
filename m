Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803930lfb;
        Mon, 6 Jun 2022 19:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywo1p4lYR9izGuEBfend2OYqpvBumjwhlBE8mMFadTVv4CfulnGfa/chgKlAwCORdoSnz+
X-Received: by 2002:ae9:eb88:0:b0:6a6:b3e3:4c44 with SMTP id b130-20020ae9eb88000000b006a6b3e34c44mr7324864qkg.83.1654570299584;
        Mon, 06 Jun 2022 19:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570299; cv=none;
        d=google.com; s=arc-20160816;
        b=WiJaIaI1Eg/SOSWzfg2FjhuAu8xOq3Le5GwvYB4Tsb86pw8lP77LhKBs7oXHwEozOE
         q+qPVwC/450oASBrQqkF9CnmllFnVL+/9sYd7wqQ7b+rH5FfflarT2WHSu7BNtePNWGw
         yZ97EJNNQOWIxEPdVCAZeddYw3zlEXgnO3k/E7habYfq6DViyduP9743OpTKxQbVxBz4
         MXDmgT4vcKGnEfJF/UsBK5Gyc0+kylCNPMGYnxgnIAurfJ6dhryLyiND4DMA3o1dEpFZ
         GMloHBGN4QyYDHqb8zPVAurU5cDi0EKTc+o6zaRQoI4XdrivckDpDsQVk6ich315e8P/
         L+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S+xsC7lZ+/OAT5GsLdjM1Piovvny0mMzGC3UEnlB6jo=;
        b=qFbNk/XJvV0weSwee8u/DRErV78YOb/ZCcraZhPQ+K8ZtiQ9J14ri7Tl9MADIFC5fb
         i2Z0QHUhOM8OwXikyJc/tZfioYN1ylnjXV+tnJ/SYbFfnN2b8YPQmCqLjA85eMdbz3dv
         7dWZE0p0OWYPwOde8cIuMhSGOP9UzIve4Au2bGLcC1SHsQeM0QwehjlcimgedDFLStSL
         MY7tOPTkGInDx9lkTPX+/XHaGAj7TNayTBV0dLsfO1KHXr8THOOQRsfESPTNvrswc6oL
         3lc3gNLlMZlZCG0l1ZFiV4TTj8Gf653Mwe98dd0OeBT+zF6DmvJsGi3ez2uXnlD+eQlc
         er8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/ftB78b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a010c00b002f3d41f22d3si9254522qtw.396.2022.06.06.19.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/ftB78b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPJi-0006WZ-RI
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG3-0006zb-My
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFy-0000H7-A0
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso2353079pjk.5
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+xsC7lZ+/OAT5GsLdjM1Piovvny0mMzGC3UEnlB6jo=;
 b=r/ftB78bvqVPGpUaUzTQ/fJll/HNBotA/Z46Lj8tMGRQOmQUUkevBwdkiHY/u5+XMj
 YZDPPmM5blKIvNlE1KIrZOlellwrLyX4vu651dJCdqnmqxovOnX4ObRB96AzO19tCtqf
 H+F9ZQ7gFvtmYrKxP5OSZrXiKn7ogasNyt/zs9L3vjt+qBLmXbAAia5ABLyfPPBHibqn
 +K/T9pukHgTmZfcsxF6DZuGyFtcHdfKwyhiat6hyAh0IrKKvO5UZm6mNrxGeCW+8CCP2
 yVPzXxEcot3wQCxOeH8ShcUXzy2Nd1gNwzt0z7Ls23VEwYbszVm0siAL7m5CmrmOXeE4
 AIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+xsC7lZ+/OAT5GsLdjM1Piovvny0mMzGC3UEnlB6jo=;
 b=j8FTqTZu727D6sRZ8ZHPxy5ChO4P2/MD9DNNSXnn5enY1t2PRt8i5TAmgE6lfoi9MD
 thSC63wGm9P/NN8wDsG8Qiu5Cg91zHdDimCpNcD3If1W/B5j7vI8MBpTXMjoZNU5I+13
 0V8HSM1sfa7nh/Vjj1h5AyST3k5gy3H12su/fqjz7HT1VknO1IBg+DJttDUkZ3XAVtRE
 X4sa/zsp38CxrNc5kgDCf8qQf7YvcH6a2IkxVTnqf21HuYnZ+uvjU+OcdrYgxH/6GN2L
 H3fl21quubK++2AC8d2+SEP4jBA+anefu2kzg7bFma8N9BiomgKggcxu3RTSFgWVQ4fX
 /b5Q==
X-Gm-Message-State: AOAM53365QVytblO04JFW8krczh1BRiY1UlJBiL/POoXTYukhAU9uztd
 cH2EiXxLoDAuzOYolYnuNlBqmbEzyoGUaA==
X-Received: by 2002:a17:90b:1a8f:b0:1e8:7dfe:c4f with SMTP id
 ng15-20020a17090b1a8f00b001e87dfe0c4fmr9693040pjb.17.1654570065487; 
 Mon, 06 Jun 2022 19:47:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 12/25] target/arm: Rename gen_exception_insn to
 gen_exception_insn_el
Date: Mon,  6 Jun 2022 19:47:21 -0700
Message-Id: <20220607024734.541321-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: k2+8vClpejej

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  4 ++--
 target/arm/translate-a64.c    | 30 +++++++++++++--------------
 target/arm/translate-m-nocp.c | 16 +++++++-------
 target/arm/translate-mve.c    |  4 ++--
 target/arm/translate-vfp.c    |  4 ++--
 target/arm/translate.c        | 39 ++++++++++++++++++-----------------
 6 files changed, 49 insertions(+), 48 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 1d6a8c7dca..c54db51d70 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -279,8 +279,8 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el);
+void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+                           uint32_t syn, uint32_t target_el);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3251c69180..cc96535fae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1178,8 +1178,8 @@ bool sve_access_check(DisasContext *s)
         assert(!s->sve_access_checked);
         s->sve_access_checked = true;
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_sve_access_trap(), s->sve_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_sve_access_trap(), s->sve_excp_el);
         return false;
     }
     s->sve_access_checked = true;
@@ -1815,8 +1815,8 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome,
-                       default_exception_el(s));
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syndrome,
+                          default_exception_el(s));
 }
 
 /* MRS - move from system register
@@ -2068,8 +2068,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
-                               syn_aa64_svc(imm16), default_exception_el(s));
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_SWI,
+                                  syn_aa64_svc(imm16), default_exception_el(s));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -2082,8 +2082,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_HVC,
-                               syn_aa64_hvc(imm16), 2);
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
+                                  syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -2093,8 +2093,8 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_set_pc_im(s->pc_curr);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
-                               syn_aa64_smc(imm16), 3);
+            gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
+                                  syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14724,8 +14724,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(s));
         return;
     }
 
@@ -14756,9 +14756,9 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype),
-                                   default_exception_el(s));
+                gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                                      syn_btitrap(s->btype),
+                                      default_exception_el(s));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 27363a7b4e..636bfb1788 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -143,8 +143,8 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return true;
     }
 
@@ -376,7 +376,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
+             * gen_exception_insn_el()'s default to DISAS_NORETURN
              */
             s->base.is_jmp = DISAS_NEXT;
             break;
@@ -532,7 +532,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         if (!vfp_access_check_m(s, true)) {
             /*
              * This was only a conditional exception, so override
-             * gen_exception_insn()'s default to DISAS_NORETURN
+             * gen_exception_insn_el()'s default to DISAS_NORETURN
              */
             s->base.is_jmp = DISAS_NEXT;
             break;
@@ -765,14 +765,14 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), default_exception_el(s));
         return true;
     }
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return true;
     }
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4267d43cc7..5aec2a1555 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,8 +100,8 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         return false;
     }
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2a98387411..f939d64101 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -262,8 +262,8 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
          * the encoding space handled by the patterns in m-nocp.decode,
          * and for them we may need to raise NOCP here.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                              syn_uncategorized(), s->fp_excp_el);
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9cb31663dd..44f462a3a3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1100,8 +1100,8 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el)
+void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+                           uint32_t syn, uint32_t target_el)
 {
     gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
 }
@@ -1117,8 +1117,8 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
+                          default_exception_el(s));
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2869,8 +2869,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                       syn_uncategorized(), exc_target);
+    gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                          syn_uncategorized(), exc_target);
     return false;
 }
 
@@ -5094,7 +5094,8 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(), 3);
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_uncategorized(), 3);
         return;
     }
 
@@ -8479,8 +8480,8 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * Do the check-and-raise-exception by hand.
          */
         if (s->fp_excp_el) {
-            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                               syn_uncategorized(), s->fp_excp_el);
+            gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+                                  syn_uncategorized(), s->fp_excp_el);
             return true;
         }
     }
@@ -8582,8 +8583,8 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         gen_set_label(skipexc);
     }
 
@@ -9053,8 +9054,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(s));
         return;
     }
 
@@ -9063,8 +9064,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(s));
+        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(s));
         return;
     }
 
@@ -9633,8 +9634,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(dc));
+        gen_exception_insn_el(dc, dc->pc_curr, EXCP_UDEF,
+                              syn_illegalstate(), default_exception_el(dc));
         return;
     }
 
@@ -9707,8 +9708,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
-                           default_exception_el(dc));
+        gen_exception_insn_el(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                              default_exception_el(dc));
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1

