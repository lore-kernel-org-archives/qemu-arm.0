Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4302976ejc;
        Sun, 26 Feb 2023 21:54:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9BnloeRx31+JeRNwWhAYpEgbQZ5bh+2WLAeW7IP0UQmdAd/mCwv4OhY8br0VcyvExHaNwc
X-Received: by 2002:a05:622a:1486:b0:3b9:e3fc:5689 with SMTP id t6-20020a05622a148600b003b9e3fc5689mr26518092qtx.58.1677477243621;
        Sun, 26 Feb 2023 21:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477243; cv=none;
        d=google.com; s=arc-20160816;
        b=wIQggx27fOmg8AGvvM//xWiFff4hK47PEKLxJ3isq+tGorYvbzb2vuT/w/P1UIqfTG
         KGYLszQQ380Zr8yfWjS4bVCcIBDrgYxI8/d0t92V73TG/wd1Sj9ltChA15UC53NV3nCZ
         VIIXrkZj+XGTDZI0MHkJt7dYojV8XJdzMTpqhN2rRCEldA4UO/K6hwg7QR049ZvNX+9/
         /fRqYPp+sUqm95K+FdfJ3voB1puk0Tpq+H9SoLb+Ik7/EV6KAIn1dOhlrcdArh0aNAez
         uTlK5c3btlwk9mxLQcNxTCa2zLd34tbtiRgOeU0Pl10GunnaXUNGtijY/lvzATmV48DH
         rfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s92vh4bFckyTMyQbiUhADFe9ox2+gImdRExBNoOqH5c=;
        b=e4ck3oWNiroNyKG9tKSGAsQzikAuHmv8ExCcFqY6BD+eoFkK17vwK2mHtn7LsG1le6
         rA2tiXnXrFgeEYS4VTVRIzSqjN17FzeNegZ6Tsb2YaKLQTGg0YcRzA/ZcJIgzFD/LvB0
         qZIB8BL9FQk+TM6gkYIB02ixy+CHPHlznuc7wW7zUnn+QcT/9JMb8+vb6HrcziwEKn9f
         ByHT2e4IWKrQcEdMKge8S3cPSilPVaEWedyRmBBjNSWSU2Q16SZF4hX1GFIcxxfEidSc
         Q6/Zto1/gxrLh9saSc7YvTkF+B7APIlt+0cXxRvKjyRxUTsBRtLQoQTxEqNtKg2ypzVE
         tGuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ay3d++0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a37f916000000b00742a42c7ce9si2537862qkj.443.2023.02.26.21.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:54:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ay3d++0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJB-0006RX-V0; Mon, 27 Feb 2023 00:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIj-0005EI-1o
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:53 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWId-0005CJ-Hg
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:52 -0500
Received: by mail-pf1-x443.google.com with SMTP id n2so2773389pfo.12
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s92vh4bFckyTMyQbiUhADFe9ox2+gImdRExBNoOqH5c=;
 b=Ay3d++0ae+zDfgJMIm6kYkQiRPGlSwoJbdMiTFZj/MzC5DqpBJjdvmY5oRZIqu/Y0c
 43AIQ7ALmYRtWgTxpee7sEpeiMW0pwn28BCJf3W4PAnHFPs4X0Wvx5ei8iQQaIObGzSN
 edeVw3XXzTzfIHmiktdrEqsPRCA6lSHf+shHWRmGRbWJMpJ1pkFDRyrFypMejqUG7+Gf
 vv154xH/LRge/HjUdclQ3e1MnDLHxoIIgRyU3Wu70DvT9YmenWEwPhvnwaqurCxQeVSk
 ZbtVRKaVsS94WWB+/NkCTLDOukq1btvv/TNeZCxHAtJ/EvsCO7HiSiAe1vXkQcRfeR6x
 Lbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s92vh4bFckyTMyQbiUhADFe9ox2+gImdRExBNoOqH5c=;
 b=PXNw5SMvRo+WRY24hWpkryhCU2/gGxVj8mTRYPf9brIIij+XtGHb8Hff4RGVKCFBMG
 /FlY8gaVF0o+eXaYFwB3WEDKED8xAC1WiMa+Vvf/qRenhumch6U42Zhwa/Yd60L+Xdxa
 VcX7ORH40eNM1KUJPzkpvOIa45QSxcMhoAT01p3fBOnNxSAsXNfwmFCaKKQUGcoj5dlr
 xml/YQrGjaDYaJ41NsXm0HcCoSxRng9rKQkipJ1MgRwRdVEAI67Sgxgyi1YJh8vkeUu+
 unYVkVWmK7smovrYvB0ryf9+/QgzxDlsiT0M4ODkczArRyFzgTjKuK7Pq9w2p6MzBh9/
 1IVg==
X-Gm-Message-State: AO0yUKX8sRE16vwRaYEWCnFu3W0aVN8ddyjIaLBuBmcMcBx04CfpTaw8
 5wABkEfv7CD27WXAiusOEkQIrw==
X-Received: by 2002:aa7:96a3:0:b0:5d4:e4c8:23ac with SMTP id
 g3-20020aa796a3000000b005d4e4c823acmr14979027pfk.21.1677476625834; 
 Sun, 26 Feb 2023 21:43:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 23/70] target/i386: Avoid use of tcg_const_* throughout
Date: Sun, 26 Feb 2023 19:41:46 -1000
Message-Id: <20230227054233.390271-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZzWofmzlHcjC

All uses are strictly read-only.  Most of the obviously so,
as direct arguments to gen_helper_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 83 +++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5d1fcc4b15..4d2a3349ec 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -884,7 +884,7 @@ static void gen_compute_eflags(DisasContext *s)
     live = cc_op_live[s->cc_op] & ~USES_CC_SRCT;
     dead = live ^ (USES_CC_DST | USES_CC_SRC | USES_CC_SRC2);
     if (dead) {
-        zero = tcg_const_tl(0);
+        zero = tcg_constant_tl(0);
         if (dead & USES_CC_DST) {
             dst = zero;
         }
@@ -1412,7 +1412,7 @@ static void gen_helper_fp_arith_ST0_FT0(int op)
 /* NOTE the exception in "r" op ordering */
 static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
 {
-    TCGv_i32 tmp = tcg_const_i32(opreg);
+    TCGv_i32 tmp = tcg_constant_i32(opreg);
     switch (op) {
     case 0:
         gen_helper_fadd_STN_ST0(cpu_env, tmp);
@@ -1439,7 +1439,7 @@ static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
-    gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1633,7 +1633,7 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     /* Store the results into the CC variables.  If we know that the
        variable must be dead, store unconditionally.  Otherwise we'll
        need to not disrupt the current contents.  */
-    z_tl = tcg_const_tl(0);
+    z_tl = tcg_constant_tl(0);
     if (cc_op_live[s->cc_op] & USES_CC_DST) {
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_cc_dst, count, z_tl,
                            result, cpu_cc_dst);
@@ -1657,7 +1657,7 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     }
 
     /* Conditionally store the CC_OP value.  */
-    z32 = tcg_const_i32(0);
+    z32 = tcg_constant_i32(0);
     s32 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(s32, count);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, s32, z32, s->tmp2_i32, oldop);
@@ -1813,7 +1813,7 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
        is 0 we keep the CC_OP_EFLAGS setting so that only CC_SRC is live.
        Otherwise reuse CC_OP_ADCOX which have the C and O flags split out
        exactly as we computed above.  */
-    t0 = tcg_const_i32(0);
+    t0 = tcg_constant_i32(0);
     t1 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(t1, s->T1);
     tcg_gen_movi_i32(s->tmp2_i32, CC_OP_ADCOX);
@@ -2497,7 +2497,7 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
         cc.reg = t0;
     }
     if (!cc.use_reg2) {
-        cc.reg2 = tcg_const_tl(cc.imm);
+        cc.reg2 = tcg_constant_tl(cc.imm);
     }
 
     tcg_gen_movcond_tl(cc.cond, s->T0, cc.reg, cc.reg2,
@@ -2525,7 +2525,7 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
 {
     if (PE(s) && !VM86(s)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-        gen_helper_load_seg(cpu_env, tcg_const_i32(seg_reg), s->tmp2_i32);
+        gen_helper_load_seg(cpu_env, tcg_constant_i32(seg_reg), s->tmp2_i32);
         /* abort translation because the addseg value may change or
            because ss32 may change. For R_SS, translation must always
            stop as a special handling must be done to disable hardware
@@ -4344,7 +4344,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_op_mov_v_reg(s, ot, s->T1, reg);
 
         if (shift) {
-            TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
+            TCGv imm = tcg_constant_tl(x86_ldub_code(env, s));
             gen_shiftd_rm_T1(s, ot, opreg, op, imm);
         } else {
             gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
@@ -4503,7 +4503,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x0c: /* fldenv mem */
                     gen_helper_fldenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0d: /* fldcw mem */
@@ -4514,7 +4514,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x0e: /* fnstenv mem */
                     gen_helper_fstenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0f: /* fnstcw mem */
@@ -4532,12 +4532,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x2c: /* frstor mem */
                     gen_helper_frstor(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
+                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2e: /* fnsave mem */
                     gen_helper_fsave(cpu_env, s->A0,
-                                     tcg_const_i32(dflag - 1));
+                                     tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2f: /* fnstsw mem */
@@ -4587,12 +4587,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 case 0x08: /* fld sti */
                     gen_helper_fpush(cpu_env);
                     gen_helper_fmov_ST0_STN(cpu_env,
-                                            tcg_const_i32((opreg + 1) & 7));
+                                            tcg_constant_i32((opreg + 1) & 7));
                     break;
                 case 0x09: /* fxchg sti */
                 case 0x29: /* fxchg4 sti, undocumented op */
                 case 0x39: /* fxchg7 sti, undocumented op */
-                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x0a: /* grp d9/2 */
                     switch (rm) {
@@ -4732,27 +4732,27 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                             }
                         } else {
                             gen_helper_fmov_FT0_STN(cpu_env,
-                                                    tcg_const_i32(opreg));
+                                                    tcg_constant_i32(opreg));
                             gen_helper_fp_arith_ST0_FT0(op1);
                         }
                     }
                     break;
                 case 0x02: /* fcom */
                 case 0x22: /* fcom2, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(cpu_env);
                     break;
                 case 0x03: /* fcomp */
                 case 0x23: /* fcomp3, undocumented op */
                 case 0x32: /* fcomp5, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x15: /* da/5 */
                     switch (rm) {
                     case 1: /* fucompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(1));
                         gen_helper_fucom_ST0_FT0(cpu_env);
                         gen_helper_fpop(cpu_env);
                         gen_helper_fpop(cpu_env);
@@ -4786,7 +4786,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
@@ -4795,36 +4795,36 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x28: /* ffree sti */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_ffree_STN(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2a: /* fst sti */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2b: /* fstp sti */
                 case 0x0b: /* fstp1 sti, undocumented op */
                 case 0x3a: /* fstp8 sti, undocumented op */
                 case 0x3b: /* fstp9 sti, undocumented op */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x2c: /* fucom st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(cpu_env);
                     break;
                 case 0x2d: /* fucomp st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x33: /* de/3 */
                     switch (rm) {
                     case 1: /* fcompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(1));
                         gen_helper_fcom_ST0_FT0(cpu_env);
                         gen_helper_fpop(cpu_env);
                         gen_helper_fpop(cpu_env);
@@ -4834,7 +4834,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     }
                     break;
                 case 0x38: /* ffreep sti, undocumented op */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_ffree_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(cpu_env);
                     break;
                 case 0x3c: /* df/4 */
@@ -4853,7 +4853,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
@@ -4863,7 +4863,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
                     set_cc_op(s, CC_OP_EFLAGS);
@@ -4886,7 +4886,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                         op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
                         l1 = gen_new_label();
                         gen_jcc1_noeob(s, op1, l1);
-                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                        gen_helper_fmov_ST0_STN(cpu_env,
+                                                tcg_constant_i32(opreg));
                         gen_set_label(l1);
                     }
                     break;
@@ -5092,8 +5093,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(val));
+            gen_helper_lret_protected(cpu_env, tcg_constant_i32(dflag - 1),
+                                      tcg_constant_i32(val));
         } else {
             gen_stack_A0(s);
             /* pop offset */
@@ -5120,7 +5121,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_vm86_iopl(s)) {
                 break;
             }
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_iret_real(cpu_env, tcg_constant_i32(dflag - 1));
         } else {
             gen_helper_iret_protected(cpu_env, tcg_constant_i32(dflag - 1),
                                       eip_next_i32(s));
@@ -5509,7 +5510,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (val == 0) {
             gen_exception(s, EXCP00_DIVZ);
         } else {
-            gen_helper_aam(cpu_env, tcg_const_i32(val));
+            gen_helper_aam(cpu_env, tcg_constant_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
         }
         break;
@@ -5517,7 +5518,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         val = x86_ldub_code(env, s);
-        gen_helper_aad(cpu_env, tcg_const_i32(val));
+        gen_helper_aad(cpu_env, tcg_constant_i32(val));
         set_cc_op(s, CC_OP_LOGICB);
         break;
         /************************/
@@ -5698,7 +5699,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
-            gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysexit(cpu_env, tcg_constant_i32(dflag - 1));
             s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
@@ -5717,7 +5718,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
-            gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
+            gen_helper_sysret(cpu_env, tcg_constant_i32(dflag - 1));
             /* condition codes are modified only in long mode */
             if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -5923,7 +5924,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
+            gen_helper_vmrun(cpu_env, tcg_constant_i32(s->aflag - 1),
                              cur_insn_len_i32(s));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
@@ -5947,7 +5948,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
+            gen_helper_vmload(cpu_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdb: /* VMSAVE */
@@ -5959,7 +5960,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
+            gen_helper_vmsave(cpu_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdc: /* STGI */
-- 
2.34.1

