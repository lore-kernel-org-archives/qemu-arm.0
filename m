Received: by 10.223.197.9 with SMTP id q9csp2470357wrf;
        Mon, 9 Oct 2017 06:49:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDeIRz71YSCZyhQWxSl+IOdMumwcXl8YiZHA4V+gUqd/ubQkQMFlVVRSChPJViCV2nntcRz
X-Received: by 10.200.8.53 with SMTP id u50mr14945794qth.260.1507556955180;
        Mon, 09 Oct 2017 06:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507556955; cv=none;
        d=google.com; s=arc-20160816;
        b=eQPN23ANZgeYeOWxXC9cRULtLfhlDg0uToCKXT6kmvqyJu9sU0CGTSXoe3XRbbBs90
         h0D+egZ5EXn4+c8WnSHfasOo4kcuJmOqz64usaKV5fi4Z6ZojpuojlJUzZU5Tubp7BaH
         TdH4zvXycrjiP3ZhQQgQrD1VC8m9+6VSchcd0K2Ie/Z4w4ldX//3eavFgkANmSr7nDlG
         EC92tAePQaLSWhatcFWgdl1pDvoZiZKu9uUaLcSuS8Z7m06GozZftesEF1obIt/VX/kd
         LI77GE4VvaHwXcGOc7p5Lbu0T5GIVhn7/lk5icWyXZTcFvQ9tV8MhWEo38ryIs25bp7l
         2zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vkZ/5cqPi88upaUh4IdVsehnid4e3jomyHY/bFZ9SJw=;
        b=0VJebwfv14GP2bGgKt3fOh9P3dWxAjg6zslTLPu49fGMBUZsgti/4WcDP1Prm4owSg
         Gh560QgA03qyAgoxLeLjvMH1e6jT7+BMsooHxNO4/OX+Aa81ejsCPmd1yDjNPxuxsUJT
         XBrN0kOm25dULjRj2WwuRV8CTgUZCAY7krtnZ6LYMye4Ys1ZnUhCu9LKKSHCCDr5/ing
         ONSWUXtoTPmCr5JrDdxlLJ0gRwun+BfnG/G5hzUNQTEgo18VaH3Mp+4ZVOjNrxdpH9jH
         vcHv+dWSYF+TnBGWCR2QasQUn6wwn7L9fw9zOPekrNff+FgJINKNjb0TPQiDg+wRQL7t
         8KIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si3166755qtc.514.2017.10.09.06.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YQk-0001Qb-Hp
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQM-0001H2-KZ
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQL-00044z-2c
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:50 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQK-0003zX-Ob; Mon, 09 Oct 2017 09:48:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQE-0004Z0-6G; Mon, 09 Oct 2017 14:48:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:36 +0100
Message-Id: <1507556919-24992-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/9] target/arm: Pull Thumb insn word loads up to
 top level
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3anSDVLBerBA

Refactor the Thumb decode to do the loads of the instruction words at
the top level rather than only loading the second half of a 32-bit
Thumb insn in the middle of the decode.

This is simple apart from the awkward case of Thumb1, where the
BL/BLX prefix and suffix instructions live in what in Thumb2 is the
32-bit insn space.  To handle these we decode enough to identify
whether we're looking at a prefix/suffix that we handle as a 16 bit
insn, or a prefix that we're going to merge with the following suffix
to consider as a 32 bit insn.  The translation of the 16 bit cases
then moves from disas_thumb2_insn() to disas_thumb_insn().

The refactoring has the benefit that we don't need to pass the
CPUARMState* down into the decoder code any more, but the major
reason for doing this is that some Thumb instructions must be always
unconditional regardless of the IT state bits, so we need to know the
whole insn before we emit the "skip this insn if the IT bits and cond
state tell us to" code.  (The always unconditional insns are BKPT,
HLT and SG; the last of these is 32 bits.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 178 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 108 insertions(+), 70 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5ca87f..8d3203e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9623,6 +9623,44 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     }
 }
 
+static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
+{
+    /* Return true if this is a 16 bit instruction. We must be precise
+     * about this (matching the decode).  We assume that s->pc still
+     * points to the first 16 bits of the insn.
+     */
+    if ((insn >> 11) < 0x1d) {
+        /* Definitely a 16-bit instruction */
+        return true;
+    }
+
+    /* Top five bits 0b11101 / 0b11110 / 0b11111 : this is the
+     * first half of a 32-bit Thumb insn. Thumb-1 cores might
+     * end up actually treating this as two 16-bit insns, though,
+     * if it's half of a bl/blx pair that might span a page boundary.
+     */
+    if (arm_dc_feature(s, ARM_FEATURE_THUMB2)) {
+        /* Thumb2 cores (including all M profile ones) always treat
+         * 32-bit insns as 32-bit.
+         */
+        return false;
+    }
+
+    if ((insn >> 11) == 0x1e && (s->pc < s->next_page_start - 3)) {
+        /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
+         * is not on the next page; we merge this into a 32-bit
+         * insn.
+         */
+        return false;
+    }
+    /* 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF);
+     * 0b1111_1xxx_xxxx_xxxx : BL suffix;
+     * 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix on the end of a page
+     *  -- handle as single 16 bit insn
+     */
+    return true;
+}
+
 /* Return true if this is a Thumb-2 logical op.  */
 static int
 thumb2_logic_op(int op)
@@ -9708,9 +9746,9 @@ gen_thumb2_data_op(DisasContext *s, int op, int conds, uint32_t shifter_out,
 
 /* Translate a 32-bit thumb instruction.  Returns nonzero if the instruction
    is not legal.  */
-static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw1)
+static int disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t insn, imm, shift, offset;
+    uint32_t imm, shift, offset;
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -9722,51 +9760,9 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
     int conds;
     int logic_cc;
 
-    if (!arm_dc_feature(s, ARM_FEATURE_THUMB2)) {
-        /* Thumb-1 cores may need to treat bl and blx as a pair of
-           16-bit instructions to get correct prefetch abort behavior.  */
-        insn = insn_hw1;
-        if ((insn & (1 << 12)) == 0) {
-            ARCH(5);
-            /* Second half of blx.  */
-            offset = ((insn & 0x7ff) << 1);
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-            tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->pc | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            return 0;
-        }
-        if (insn & (1 << 11)) {
-            /* Second half of bl.  */
-            offset = ((insn & 0x7ff) << 1) | 1;
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->pc | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            return 0;
-        }
-        if ((s->pc & ~TARGET_PAGE_MASK) == 0) {
-            /* Instruction spans a page boundary.  Implement it as two
-               16-bit instructions in case the second half causes an
-               prefetch abort.  */
-            offset = ((int32_t)insn << 21) >> 9;
-            tcg_gen_movi_i32(cpu_R[14], s->pc + 2 + offset);
-            return 0;
-        }
-        /* Fall through to 32-bit decode.  */
-    }
-
-    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
-    s->pc += 2;
-    insn |= (uint32_t)insn_hw1 << 16;
-
+    /* The only 32 bit insn that's allowed for Thumb1 is the combined
+     * BL/BLX prefix and suffix.
+     */
     if ((insn & 0xf800e800) != 0xf000e800) {
         ARCH(6T2);
     }
@@ -11081,27 +11077,15 @@ illegal_op:
     return 1;
 }
 
-static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
+static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, insn, op, rm, rn, rd, shift, cond;
+    uint32_t val, op, rm, rn, rd, shift, cond;
     int32_t offset;
     int i;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
 
-    if (s->condexec_mask) {
-        cond = s->condexec_cond;
-        if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
-          s->condlabel = gen_new_label();
-          arm_gen_test_cc(cond ^ 1, s->condlabel);
-          s->condjmp = 1;
-        }
-    }
-
-    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
-    s->pc += 2;
-
     switch (insn >> 12) {
     case 0: case 1:
 
@@ -11832,8 +11816,21 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
 
     case 14:
         if (insn & (1 << 11)) {
-            if (disas_thumb2_insn(env, s, insn))
-              goto undef32;
+            /* thumb_insn_is_16bit() ensures we can't get here for
+             * a Thumb2 CPU, so this must be a thumb1 split BL/BLX:
+             * 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF)
+             */
+            assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+            ARCH(5);
+            offset = ((insn & 0x7ff) << 1);
+            tmp = load_reg(s, 14);
+            tcg_gen_addi_i32(tmp, tmp, offset);
+            tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
+
+            tmp2 = tcg_temp_new_i32();
+            tcg_gen_movi_i32(tmp2, s->pc | 1);
+            store_reg(s, 14, tmp2);
+            gen_bx(s, tmp);
             break;
         }
         /* unconditional branch */
@@ -11844,15 +11841,30 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         break;
 
     case 15:
-        if (disas_thumb2_insn(env, s, insn))
-            goto undef32;
+        /* thumb_insn_is_16bit() ensures we can't get here for
+         * a Thumb2 CPU, so this must be a thumb1 split BL/BLX.
+         */
+        assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+
+        if (insn & (1 << 11)) {
+            /* 0b1111_1xxx_xxxx_xxxx : BL suffix */
+            offset = ((insn & 0x7ff) << 1) | 1;
+            tmp = load_reg(s, 14);
+            tcg_gen_addi_i32(tmp, tmp, offset);
+
+            tmp2 = tcg_temp_new_i32();
+            tcg_gen_movi_i32(tmp2, s->pc | 1);
+            store_reg(s, 14, tmp2);
+            gen_bx(s, tmp);
+        } else {
+            /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix */
+            uint32_t uoffset = ((int32_t)insn << 21) >> 9;
+
+            tcg_gen_movi_i32(cpu_R[14], s->pc + 2 + uoffset);
+        }
         break;
     }
     return;
-undef32:
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
-    return;
 illegal_op:
 undef:
     gen_exception_insn(s, 2, EXCP_UDEF, syn_uncategorized(),
@@ -12122,12 +12134,38 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t insn;
+    bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
         return;
     }
 
-    disas_thumb_insn(env, dc);
+    insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
+    is_16bit = thumb_insn_is_16bit(dc, insn);
+    dc->pc += 2;
+    if (!is_16bit) {
+        uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
+
+        insn = insn << 16 | insn2;
+        dc->pc += 2;
+    }
+
+    if (dc->condexec_mask) {
+        uint32_t cond = dc->condexec_cond;
+
+        if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
+            dc->condlabel = gen_new_label();
+            arm_gen_test_cc(cond ^ 1, dc->condlabel);
+            dc->condjmp = 1;
+        }
+    }
+
+    if (is_16bit) {
+        disas_thumb_insn(dc, insn);
+    } else {
+        disas_thumb2_insn(dc, insn);
+    }
 
     /* Advance the Thumb condexec condition.  */
     if (dc->condexec_mask) {
-- 
2.7.4

