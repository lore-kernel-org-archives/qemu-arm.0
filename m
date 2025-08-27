Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0526DCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:24:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4iI-00024E-LP; Tue, 26 Aug 2025 21:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hf-0001XH-PI
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:58 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hY-0000Eu-GQ
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-770d7dafacdso3341467b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257105; x=1756861905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inxKoS3ZIgpEPKYL20PKMMMA4qeo4BWrUDyfXfGTfr0=;
 b=iXXf38lqcG29WWPXKrxIHdFEFYFjsbieyfkKG0/pZP6/SwYSDgss/0HNJlpb3zIarH
 yyjRYkxi3rOoAH1fBy1ulZhNphsL3LwE6ruOKNt911wAYfE0iD+WLkWVb/gebFRsUG0E
 3eo1MSWkxO4oItiD1J50uMsOYnkl2sKBQ1Ex+bjLh/47hw4vB97pEMtntJOuvmSo1hMN
 6BDTV9QxhkeVnjQw+D6Vw2zPwbqkQrXvQoCAS483ba6KCJzR7a3wC19L7wuLxQyVV8JK
 P7Ul++tuYA9GzQtbtqkDlBCFKfra+NPrS25V2y4mmA5xBGYm/39WEucVjl7pc7JpcPwQ
 eZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257105; x=1756861905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inxKoS3ZIgpEPKYL20PKMMMA4qeo4BWrUDyfXfGTfr0=;
 b=Cc6jap3kTvaGY6VpFAMhx4aYbJ/ed1slVnVUX8lJqbl2gULoUXzgqw8WSTKRZ3sQTL
 xdqtqWenxlDdCXN4jic/SysqqmkLK4uneAhZ9vzm9UeCq/G62X2BTuiQmbcpeyJqeW0K
 xtmWgFgtistXG96UYjMuXHTGTCi8pblHYrng/vx09yM5RJrkhuP2kL7hbN4Bd2PH4Cvw
 viPBPFrHvJUjpNsXwNSg2zc4Y3/tDrDOBqSB78iKMrUadxkMcVsowJ/CqV16IB5NvkZr
 n2bHnkAKLQmpzpUTwsCzimVB7N0RLNN6hj9eTFlklt5evvrH8TIVs0EA2he4Sq6DfRFS
 U+hQ==
X-Gm-Message-State: AOJu0YxdRtyyGh0W0Kyvc2VVv9+Jd9eHfQhGmI+juJbeL689LcwKC0Fa
 qDVXiL0Hzd+91org1ybwQERm0ahsq1JIWlPikBCjyKZvYxYZfXb4lNzZf56ZnlX+AMc=
X-Gm-Gg: ASbGncteEI/LxgEqxrGPdEx8WarkuUwpxU+7drvqHQsVTqsCcd3e3YdQWW+wCorpH69
 3TlRi3x+3lVowZPh2os16Um/nq35pAAeGFVr3+SJs3Dpoptw8X2fBL5FrVEiOtZrms1MuRyikdb
 capip7v8SSkYLVXQPVHdcH8m+cH5qWyZSKKJ5ApRGMSXLuBd37jOttCT5r7f2YyLxSCsthrZ0x1
 ArpLCtf0UY1i4jFKk5bR+HHrbA2r43hN46ef7zoI10SIPLXzJgkby3APBbVjzZ0nPAZj4blHE3N
 1HEABUVF6iEjKk13nLzbZN85S3AzpDuVAn+Mc8dB0stPrKnBzSiKdD55auDL4qOFfN/8FL+cZ2T
 cnWSSIfLup6OVubmE/VPk2wf2Qw==
X-Google-Smtp-Source: AGHT+IGU5dhhcwFxPJSWENllRprjdgPpDHUWy/Me0PmRiGYKG2F5bH+lvzOM7BqzbhkAcBsCaIn3xw==
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr13477213b3a.6.1756257105125; 
 Tue, 26 Aug 2025 18:11:45 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/61] target/arm: Implement MRRS, MSRR, SYSP
Date: Wed, 27 Aug 2025 11:04:42 +1000
Message-ID: <20250827010453.4059782-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 162 +++++++++++++++++++++++++--------
 target/arm/tcg/a64.decode      |  12 ++-
 2 files changed, 132 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7de8717056..2ec088b641 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2470,17 +2470,23 @@ redirect_cpreg(DisasContext *s, uint32_t key, bool isread)
 
 /* MRS - move from system register
  * MSR (register) - move to system register
+ * MRRS
+ * MSRR
  * SYS
  * SYSL
+ * SYSP
  * These are all essentially the same insn in 'read' and 'write'
  * versions, with varying op0 fields.
+ *
+ * RT2 is non-zero if and only if this is a 128-bit access.
  */
 static void handle_sys(DisasContext *s, bool isread,
                        unsigned int op0, unsigned int op1, unsigned int op2,
-                       unsigned int crn, unsigned int crm, unsigned int rt)
+                       unsigned int crn, unsigned int crm, unsigned int rt,
+                       unsigned int rt2)
 {
     uint32_t key = ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2);
-    const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    const ARMCPRegInfo *ri;
     bool need_exit_tb = false;
     bool nv_trap_to_el2 = false;
     bool nv_redirect_reg = false;
@@ -2488,7 +2494,16 @@ static void handle_sys(DisasContext *s, bool isread,
     bool nv2_mem_redirect = false;
     TCGv_ptr tcg_ri = NULL;
     TCGv_i64 tcg_rt;
-    uint32_t syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
+    uint32_t syndrome;
+    bool is128 = rt2 != 0;
+
+    if (is128) {
+        key |= CP_REG_AA64_128BIT_MASK;
+        syndrome = syn_aa64_sysreg128trap(op0, op1, op2, crn, crm, rt, isread);
+    } else {
+        syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
+    }
+    ri = get_arm_cp_reginfo(s->cp_regs, key);
 
     if (crn == 11 || crn == 15) {
         /*
@@ -2508,12 +2523,14 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!ri) {
-        /* Unknown register; this might be a guest error or a QEMU
-         * unimplemented feature.
+        /*
+         * Unknown register, or 128-bit access to a 64-bit register.
+         * This might be a guest error or a QEMU unimplemented feature.
          */
-        qemu_log_mask(LOG_UNIMP, "%s access to unsupported AArch64 "
+        qemu_log_mask(LOG_UNIMP, "%s%s access to unsupported AArch64 "
                       "system register op0:%d op1:%d crn:%d crm:%d op2:%d\n",
-                      isread ? "read" : "write", op0, op1, crn, crm, op2);
+                      isread ? "read" : "write", is128 ? "128" : "",
+                      op0, op1, crn, crm, op2);
         gen_sysreg_undef(s, isread, op0, op1, op2, crn, crm, rt);
         return;
     }
@@ -2636,7 +2653,7 @@ static void handle_sys(DisasContext *s, bool isread,
          * We don't use the EL1 register's access function, and
          * fine-grained-traps on EL1 also do not apply here.
          */
-        key = ENCODE_AA64_CP_REG(op0, 0, crn, crm, op2);
+        key &= ~CP_REG_ARM64_SYSREG_OP1_MASK;
         ri = redirect_cpreg(s, key, isread);
         /*
          * We might not have done an update_pc earlier, so check we don't
@@ -2651,32 +2668,44 @@ static void handle_sys(DisasContext *s, bool isread,
          * This means it is not an IO operation, doesn't change hflags,
          * and need not end the TB, because it has no side effects.
          *
-         * The access is 64-bit single copy atomic, guaranteed aligned because
-         * of the definition of VCNR_EL2. Its endianness depends on
-         * SCTLR_EL2.EE, not on the data endianness of EL1.
-         * It is done under either the EL2 translation regime or the EL2&0
-         * translation regime, depending on HCR_EL2.E2H. It behaves as if
-         * PSTATE.PAN is 0.
+         * The access is 64-bit (R_VFMQB) or 128-bit (R_BSBZP) single copy
+         * atomic, guaranteed aligned because of the definition of VCNR_EL2.
+         * Its endianness depends on SCTLR_EL2.EE, not on the data endianness
+         * of EL1. It is done under either the EL2 translation regime or
+         * the EL2&0 translation regime, depending on HCR_EL2.E2H.
+         * It behaves as if PSTATE.PAN is 0.
          */
         TCGv_i64 ptr = tcg_temp_new_i64();
-        MemOp mop = MO_64 | MO_ALIGN | MO_ATOM_IFALIGN;
+        MemOp mop = MO_ALIGN | MO_ATOM_IFALIGN;
         ARMMMUIdx armmemidx = s->nv2_mem_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
         int memidx = arm_to_core_mmu_idx(armmemidx);
-        uint32_t syn;
 
         mop |= (s->nv2_mem_be ? MO_BE : MO_LE);
+        disas_set_insn_syndrome(s, syn_data_abort_vncr(0, !isread, 0));
 
         tcg_gen_ld_i64(ptr, tcg_env, offsetof(CPUARMState, cp15.vncr_el2));
         tcg_gen_addi_i64(ptr, ptr,
                          (ri->nv2_redirect_offset & ~NV2_REDIR_FLAG_MASK));
-        tcg_rt = cpu_reg(s, rt);
 
-        syn = syn_data_abort_vncr(0, !isread, 0);
-        disas_set_insn_syndrome(s, syn);
-        if (isread) {
-            tcg_gen_qemu_ld_i64(tcg_rt, ptr, memidx, mop);
+        if (is128) {
+            TCGv_i128 t128 = tcg_temp_new_i128();
+
+            mop |= MO_128;
+            if (isread) {
+                tcg_gen_qemu_ld_i128(t128, ptr, memidx, mop);
+                tcg_gen_extr_i128_i64(cpu_reg(s, rt), cpu_reg(s, rt2), t128);
+            } else {
+                tcg_gen_concat_i64_i128(t128, cpu_reg(s, rt), cpu_reg(s, rt2));
+                tcg_gen_qemu_st_i128(t128, ptr, memidx, mop);
+            }
         } else {
-            tcg_gen_qemu_st_i64(tcg_rt, ptr, memidx, mop);
+            mop |= MO_64;
+            tcg_rt = cpu_reg(s, rt);
+            if (isread) {
+                tcg_gen_qemu_ld_i64(tcg_rt, ptr, memidx, mop);
+            } else {
+                tcg_gen_qemu_st_i64(tcg_rt, ptr, memidx, mop);
+            }
         }
         return;
     }
@@ -2772,28 +2801,56 @@ static void handle_sys(DisasContext *s, bool isread,
 
     tcg_rt = cpu_reg(s, rt);
 
-    if (isread) {
-        if (ri->type & ARM_CP_CONST) {
-            tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
-        } else if (ri->readfn) {
-            if (!tcg_ri) {
-                tcg_ri = gen_lookup_cp_reg(key);
+    if (is128) {
+        TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
+        TCGv_i128 t128 = tcg_temp_new_i128();
+
+        assert(!(ri->type & ARM_CP_CONST));
+        if (isread) {
+            if (ri->read128fn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_get_cp_reg128(t128, tcg_env, tcg_ri);
+            } else {
+                tcg_gen_ld_i128(t128, tcg_env, ri->fieldoffset);
             }
-            gen_helper_get_cp_reg64(tcg_rt, tcg_env, tcg_ri);
+            tcg_gen_extr_i128_i64(tcg_rt, tcg_rt2, t128);
         } else {
-            tcg_gen_ld_i64(tcg_rt, tcg_env, ri->fieldoffset);
+            tcg_gen_concat_i64_i128(t128, tcg_rt, tcg_rt2);
+            if (ri->write128fn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_set_cp_reg128(tcg_env, tcg_ri, t128);
+            } else {
+                tcg_gen_st_i128(t128, tcg_env, ri->fieldoffset);
+            }
         }
     } else {
-        if (ri->type & ARM_CP_CONST) {
-            /* If not forbidden by access permissions, treat as WI */
-            return;
-        } else if (ri->writefn) {
-            if (!tcg_ri) {
-                tcg_ri = gen_lookup_cp_reg(key);
+        if (isread) {
+            if (ri->type & ARM_CP_CONST) {
+                tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
+            } else if (ri->readfn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_get_cp_reg64(tcg_rt, tcg_env, tcg_ri);
+            } else {
+                tcg_gen_ld_i64(tcg_rt, tcg_env, ri->fieldoffset);
             }
-            gen_helper_set_cp_reg64(tcg_env, tcg_ri, tcg_rt);
         } else {
-            tcg_gen_st_i64(tcg_rt, tcg_env, ri->fieldoffset);
+            if (ri->type & ARM_CP_CONST) {
+                /* If not forbidden by access permissions, treat as WI */
+                return;
+            } else if (ri->writefn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_set_cp_reg64(tcg_env, tcg_ri, tcg_rt);
+            } else {
+                tcg_gen_st_i64(tcg_rt, tcg_env, ri->fieldoffset);
+            }
         }
     }
 
@@ -2817,7 +2874,34 @@ static void handle_sys(DisasContext *s, bool isread,
 
 static bool trans_SYS(DisasContext *s, arg_SYS *a)
 {
-    handle_sys(s, a->l, a->op0, a->op1, a->op2, a->crn, a->crm, a->rt);
+    handle_sys(s, a->l, a->op0, a->op1, a->op2, a->crn, a->crm, a->rt, 0);
+    return true;
+}
+
+static bool trans_SYS128(DisasContext *s, arg_sys *a)
+{
+    if (!dc_isar_feature(aa64_sysreg128, s) || (a->rt & 1)) {
+        return false;
+    }
+    handle_sys(s, a->l, a->op0, a->op1, a->op2, a->crn, a->crm,
+               a->rt, a->rt + 1);
+    return true;
+}
+
+static bool trans_SYSP(DisasContext *s, arg_sys *a)
+{
+    int rt2;
+    if (!dc_isar_feature(aa64_sysinstr128, s)) {
+        return false;
+    }
+    if (a->rt == 31) {
+        rt2 = 31;
+    } else if (a->rt & 1) {
+        return false;
+    } else {
+        rt2 = a->rt + 1;
+    }
+    handle_sys(s, a->l, a->op0, a->op1, a->op2, a->crn, a->crm, a->rt, rt2);
     return true;
 }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8c798cde2b..ef9086b6fe 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -290,9 +290,15 @@ MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
 # same instruction as far as QEMU is concerned.
 # NB: op0 is bits [20:19], but op0=0b00 is other insns, so we have
 # to hand-decode it.
-SYS             1101 0101 00 l:1 01 op1:3 crn:4 crm:4 op2:3 rt:5 op0=1
-SYS             1101 0101 00 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 op0=2
-SYS             1101 0101 00 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 op0=3
+&sys            l op0 op1 op2 crn crm rt
+SYS             1101 0101 00 l:1 01 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=1
+SYS             1101 0101 00 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=2
+SYS             1101 0101 00 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=3
+
+# MRRS, MSRR
+SYS128          1101 0101 01 l:1 10 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=2
+SYS128          1101 0101 01 l:1 11 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=3
+SYSP            1101 0101 01 0   01 op1:3 crn:4 crm:4 op2:3 rt:5 &sys op0=1 l=0
 
 # Exception generation
 
-- 
2.43.0


