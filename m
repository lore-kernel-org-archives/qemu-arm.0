Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5267979wrt;
        Tue, 2 Oct 2018 09:39:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62lmlUnqWLrRodlmDHhYBgl0IREcbHXO9zIuMIC4f2ESkrhEDhOi+ZiZmT23DQoyfyBwWy/
X-Received: by 2002:a37:5e43:: with SMTP id s64-v6mr9237046qkb.39.1538498369534;
        Tue, 02 Oct 2018 09:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498369; cv=none;
        d=google.com; s=arc-20160816;
        b=cAKTlz/VFzbLtHyV5g6wyCQGNRYwFRrJ4txXyHkrhI+Tthuj+bqCV2P42Ise58Hy1b
         ToiTxR8wh49X0lzP0pJRStztXpLRSgMts7qJDg2gvbAaW+wyxz1pGc5tgOn2bbBFee3m
         8AblXMylMX8KK95aWYtnh7yqZbZ+DSCdvSjvHSIMtUTvUl6+9aRwnYvR1Gulwpae1OrQ
         /uMhphkQkSubAWMGLiV4aINu4N4kPDOmt3kbmktHkuk0BbEHp1UStZy1vFjxEyyyghZt
         GLY4UcObxjX2BGtCMg3Gtju/ganmOny019yvLrBhM6crTrVg6VN7dqgPbQEnZzUfPUIs
         fBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bK9kN07g9bCCmcAYVxo2Spx7XqWOSdOI4jVPunBxoCE=;
        b=UTXfcARFq0FAKZSefXRpFjUKelXhizYpSr6BFzL4xRORHIkXUTEwhmt1B8O9mlsjYV
         MwD+dd+qVIj2nnFoWgtTgQZeDCTzLYt1h0sFq9t5vGz73gMV471dsFzVG0aMOboRKFjv
         gptAlYlHBQLVlhVGYTNbziJEw3VfwPa3CzUtn2UF/3WTjVEv5Y6aQbxZRKO42y8q//QP
         z5RpaC9Jw/PdRNVfx8dzbX9AKNtrFRjxa4xkE+DnbhsMtZjikz4HyZjHsMlNB3T5BdC3
         0+GbE37mwAbkEqs0qwgcomc7ScwGf8ot+rwWiPH0FqZ0n8P53Z7kLqvL7k2TZdlj2yVs
         XqaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z32-v6si2424153qtz.6.2018.10.02.09.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Nho-0001Ga-Ve
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nea-0006bq-BM
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7NeY-00052N-V7
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7NeY-0004yW-DF; Tue, 02 Oct 2018 12:36:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7NeU-0007HH-RJ; Tue, 02 Oct 2018 17:36:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:47 +0100
Message-Id: <20181002163556.10279-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/13] target/arm: Add v8M stack checks on
 ADD/SUB/MOV of SP
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w131FX5I7qEI

Add code to insert calls to a helper function to do the stack
limit checking when we handle these forms of instruction
that write to SP:
 * ADD (SP plus immediate)
 * ADD (SP plus register)
 * SUB (SP minus immediate)
 * SUB (SP minus register)
 * MOV (register)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |  2 ++
 target/arm/internals.h | 14 ++++++++
 target/arm/op_helper.c | 19 ++++++++++
 target/arm/translate.c | 80 +++++++++++++++++++++++++++++++++++++-----
 4 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 59e8c3bd1b9..8c9590091b0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_2(v7m_blxns, void, env, i32)
 
 DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
 
+DEF_HELPER_2(v8m_stackcheck, void, env, i32)
+
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index bc4c01ccd92..966a8131623 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -811,4 +811,18 @@ static inline bool v7m_using_psp(CPUARMState *env)
     return !arm_v7m_is_handler_mode(env) &&
         env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
 }
+
+/**
+ * v7m_sp_limit: Return SP limit for current CPU state
+ * Return the SP limit value for the current CPU security state
+ * and stack pointer.
+ */
+static inline uint32_t v7m_sp_limit(CPUARMState *env)
+{
+    if (v7m_using_psp(env)) {
+        return env->v7m.psplim[env->v7m.secure];
+    } else {
+        return env->v7m.msplim[env->v7m.secure];
+    }
+}
 #endif
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 952b8d122b7..38f885b290f 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -238,6 +238,25 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
 #endif /* !defined(CONFIG_USER_ONLY) */
 
+void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
+{
+    /*
+     * Perform the v8M stack limit check for SP updates from translated code,
+     * raising an exception if the limit is breached.
+     */
+    if (newvalue < v7m_sp_limit(env)) {
+        CPUState *cs = CPU(arm_env_get_cpu(env));
+
+        /*
+         * Stack limit exceptions are a rare case, so rather than syncing
+         * PC/condbits before the call, we use cpu_restore_state() to
+         * get them right before raising the exception.
+         */
+        cpu_restore_state(cs, GETPC(), true);
+        raise_exception(env, EXCP_STKOF, 0, 1);
+    }
+}
+
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 751d5811cee..25a8fe672f5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -239,6 +239,23 @@ static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
     tcg_temp_free_i32(var);
 }
 
+/*
+ * Variant of store_reg which applies v8M stack-limit checks before updating
+ * SP. If the check fails this will result in an exception being taken.
+ * We disable the stack checks for CONFIG_USER_ONLY because we have
+ * no idea what the stack limits should be in that case.
+ * If stack checking is not being done this just acts like store_reg().
+ */
+static void store_sp_checked(DisasContext *s, TCGv_i32 var)
+{
+#ifndef CONFIG_USER_ONLY
+    if (s->v8m_stackcheck) {
+        gen_helper_v8m_stackcheck(cpu_env, var);
+    }
+#endif
+    store_reg(s, 13, var);
+}
+
 /* Value extensions.  */
 #define gen_uxtb(var) tcg_gen_ext8u_i32(var, var)
 #define gen_uxth(var) tcg_gen_ext16u_i32(var, var)
@@ -10583,7 +10600,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             if (gen_thumb2_data_op(s, op, conds, 0, tmp, tmp2))
                 goto illegal_op;
             tcg_temp_free_i32(tmp2);
-            if (rd != 15) {
+            if (rd == 13 &&
+                ((op == 2 && rn == 15) ||
+                 (op == 8 && rn == 13) ||
+                 (op == 13 && rn == 13))) {
+                /* MOV SP, ... or ADD SP, SP, ... or SUB SP, SP, ... */
+                store_sp_checked(s, tmp);
+            } else if (rd != 15) {
                 store_reg(s, rd, tmp);
             } else {
                 tcg_temp_free_i32(tmp);
@@ -11267,8 +11290,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 gen_jmp(s, s->pc + offset);
             }
         } else {
-            /* Data processing immediate.  */
+            /*
+             * 0b1111_0xxx_xxxx_0xxx_xxxx_xxxx
+             *  - Data-processing (modified immediate, plain binary immediate)
+             */
             if (insn & (1 << 25)) {
+                /*
+                 * 0b1111_0x1x_xxxx_0xxx_xxxx_xxxx
+                 *  - Data-processing (plain binary immediate)
+                 */
                 if (insn & (1 << 24)) {
                     if (insn & (1 << 20))
                         goto illegal_op;
@@ -11364,6 +11394,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             tmp = tcg_temp_new_i32();
                             tcg_gen_movi_i32(tmp, imm);
                         }
+                        store_reg(s, rd, tmp);
                     } else {
                         /* Add/sub 12-bit immediate.  */
                         if (rn == 15) {
@@ -11374,17 +11405,27 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                                 offset += imm;
                             tmp = tcg_temp_new_i32();
                             tcg_gen_movi_i32(tmp, offset);
+                            store_reg(s, rd, tmp);
                         } else {
                             tmp = load_reg(s, rn);
                             if (insn & (1 << 23))
                                 tcg_gen_subi_i32(tmp, tmp, imm);
                             else
                                 tcg_gen_addi_i32(tmp, tmp, imm);
+                            if (rn == 13 && rd == 13) {
+                                /* ADD SP, SP, imm or SUB SP, SP, imm */
+                                store_sp_checked(s, tmp);
+                            } else {
+                                store_reg(s, rd, tmp);
+                            }
                         }
                     }
-                    store_reg(s, rd, tmp);
                 }
             } else {
+                /*
+                 * 0b1111_0x0x_xxxx_0xxx_xxxx_xxxx
+                 *  - Data-processing (modified immediate)
+                 */
                 int shifter_out = 0;
                 /* modified 12-bit immediate.  */
                 shift = ((insn & 0x04000000) >> 23) | ((insn & 0x7000) >> 12);
@@ -11426,7 +11467,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     goto illegal_op;
                 tcg_temp_free_i32(tmp2);
                 rd = (insn >> 8) & 0xf;
-                if (rd != 15) {
+                if (rd == 13 && rn == 13
+                    && (op == 8 || op == 13)) {
+                    /* ADD(S) SP, SP, imm or SUB(S) SP, SP, imm */
+                    store_sp_checked(s, tmp);
+                } else if (rd != 15) {
                     store_reg(s, rd, tmp);
                 } else {
                     tcg_temp_free_i32(tmp);
@@ -11732,7 +11777,12 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 tmp2 = load_reg(s, rm);
                 tcg_gen_add_i32(tmp, tmp, tmp2);
                 tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
+                if (rd == 13) {
+                    /* ADD SP, SP, reg */
+                    store_sp_checked(s, tmp);
+                } else {
+                    store_reg(s, rd, tmp);
+                }
                 break;
             case 1: /* cmp */
                 tmp = load_reg(s, rd);
@@ -11743,7 +11793,12 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 break;
             case 2: /* mov/cpy */
                 tmp = load_reg(s, rm);
-                store_reg(s, rd, tmp);
+                if (rd == 13) {
+                    /* MOV SP, reg */
+                    store_sp_checked(s, tmp);
+                } else {
+                    store_reg(s, rd, tmp);
+                }
                 break;
             case 3:
             {
@@ -12071,7 +12126,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         break;
 
     case 10:
-        /* add to high reg */
+        /*
+         * 0b1010_xxxx_xxxx_xxxx
+         *  - Add PC/SP (immediate)
+         */
         rd = (insn >> 8) & 7;
         if (insn & (1 << 11)) {
             /* SP */
@@ -12091,13 +12149,17 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         op = (insn >> 8) & 0xf;
         switch (op) {
         case 0:
-            /* adjust stack pointer */
+            /*
+             * 0b1011_0000_xxxx_xxxx
+             *  - ADD (SP plus immediate)
+             *  - SUB (SP minus immediate)
+             */
             tmp = load_reg(s, 13);
             val = (insn & 0x7f) * 4;
             if (insn & (1 << 7))
                 val = -(int32_t)val;
             tcg_gen_addi_i32(tmp, tmp, val);
-            store_reg(s, 13, tmp);
+            store_sp_checked(s, tmp);
             break;
 
         case 2: /* sign/zero extend.  */
-- 
2.19.0

