Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD96FF46C66
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:26:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oen-0007Va-D8; Mon, 06 Apr 2026 14:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oel-0007Td-Qg
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeh-0002Pm-R3
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82ce0a9b41aso1529621b3a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499993; x=1776104793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwdNd4FHCrq25/1aSpiuowhEqZjmmXC6pqpEfiyTzXI=;
 b=ikJ1piPV+tZYPjhgm2oMQkaIQTzcUdN1UJPD5eXeoTeg0yuM8GVqP/AtZ+BV6cVt3K
 0iSwUaNoTERx7Idyv8XX6ShMw2h5/iREb3mQSA/NAi7PU1B9MceWlFHmBSdW8V4InAuX
 KGj5XIilzliirZ9tKQpJgnIiisFAYdQjE39EnARy7FBQDvCWt4eoNMJuw795/AXeRmDu
 xGxnXIlBDxqHm/WhfE5jYYF9o22P/emuESfzZas64cdOAeZ20gi8ALghVFs//4Z7TQra
 hOluddARnnZIMZL111vdDzI6IeLrT+g962XVZpBFHm3qquP/e0RW6OttLK8zOcfB6ThI
 mrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499993; x=1776104793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MwdNd4FHCrq25/1aSpiuowhEqZjmmXC6pqpEfiyTzXI=;
 b=jR6qJDb08l1xxflKLck4ZxaJ67z+fv3a6TvofBw+tSm5sE9lcVTYAKNRygbWHIHoBE
 sYwRDDgdvOA94ck5vg8oHpyd8bLE/AUW5WCi1xJ1cAGAolH1CzJCh/2i7GKYJQNcR7pa
 0TM7JFyZLdAtV+fn2QT8ZEwlR0D4wZ6jFzfBbIy4AyPJ6j6BRXW94reY4s4u82yOHqrc
 AjNYcE6d0O1Y3rN/OzhfQyuLX7//f15h5jbDL87Z7IZEOFgvwT4PHH+Kn3Zadl+rfvNv
 ElOhtj1agbEUdZtuvswt7VW5YMVB5ljKtzBNTBt3Qglna9wuH5IiuK/08+X91zM45935
 ghCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQiWFV3WPuL+zL9L42rRiQeQwxlzkMMpGwLFIfDcoMemVhttWLYtvYDRf9C7Gd35S7Rid3gtvzEg==@nongnu.org
X-Gm-Message-State: AOJu0YxLA48NuSnCoqnxVwmfchRoZtPmUIwJ75TUSE+E8dM/mxLitVD2
 6BdiN3lrZ651mauFa8hZZQCe54s3c6eshY3gapZvy07eUsD/wJ4pFuNQp3Q1U8V5X48=
X-Gm-Gg: AeBDietHDUkngBRh9S2LA7XhVR4MW9D7KQQy1D4uWX8VWoOoj5jcEFJJP41ot1jiV8h
 eeCaQkEk5K7JqRhLOupsqv4zXdkWUMH5vU96YFBo3vJpqGxSSch4RPrPid0X2KERxTFYLSQX9ZY
 MKsGjcyGwUbe/JFhEl2c2EUK+cwYds3WnUwF7/kd8bau4rmAVqRsA8OKXCFy0+2T3z45RBaotjq
 7BRtVoPM+w+o+iBNmYTnNwS8oEZVL3netHwbQKAyaQCUs65ykbeEc+fr93W7lRv1YfCYypMK0Qc
 llmOXCFz8q8slHv8eUkbpQPhTmK6Y6sCeWnGQM9Xa3WptaK+mt/lEgSMPNewfK1zV1Qzj2bwqyY
 Ek68Elh3ez7uuW4ykeaNC53+4xQVe3CfuY4q7R8WFWTWsvQcMMnzQHpqEhtmLDN4C45oDlWBf4U
 9IMMyjrMWQpJLot6wRoAx7SvQ1CVHhwTcRJ6HX2TKunCGsQAxA1DT+b+ott/2A2ImBVt0otHjmS
 Fb9Mqn3W/PC7gA=
X-Received: by 2002:a05:6a20:430b:b0:39b:e789:7d10 with SMTP id
 adf61e73a8af0-39f2f20dfc7mr13998709637.57.1775499993169; 
 Mon, 06 Apr 2026 11:26:33 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 14/20] target/arm/tcg/translate.c: replace TCGv with TCGv_va
Date: Mon,  6 Apr 2026 11:26:03 -0700
Message-ID: <20260406182609.193886-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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

We know this file is for 32-bit runtime target, so we can set
TCG_ADDRESS_BITS and pass the correct addr_type to translator_loop.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ebcf68aea97..6ea48efbac2 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -22,7 +22,8 @@
 
 #include "translate.h"
 #include "translate-a32.h"
-#include "tcg/tcg-op.h"
+#define TCG_ADDRESS_BITS 32
+#include "tcg/tcg-op-mem.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
@@ -909,14 +910,14 @@ MemOp pow2_align(unsigned i)
  * that the address argument is TCGv_i32 rather than TCGv.
  */
 
-static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
+static TCGv_va gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 {
-    TCGv addr = tcg_temp_new();
-    tcg_gen_extu_i32_tl(addr, a32);
+    TCGv_va addr = tcgv_va_temp_new();
+    tcg_gen_mov_i32(addr, a32);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
     if (!IS_USER_ONLY && s->sctlr_b && (op & MO_SIZE) < MO_32) {
-        tcg_gen_xori_tl(addr, addr, 4 - (1 << (op & MO_SIZE)));
+        tcg_gen_xori_i32(addr, addr, 4 - (1 << (op & MO_SIZE)));
     }
     return addr;
 }
@@ -928,21 +929,21 @@ static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
                               TCGv_i32 a32, int index, MemOp opc)
 {
-    TCGv addr = gen_aa32_addr(s, a32, opc);
+    TCGv_va addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i32(val, addr, index, opc);
 }
 
 void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
                               TCGv_i32 a32, int index, MemOp opc)
 {
-    TCGv addr = gen_aa32_addr(s, a32, opc);
+    TCGv_va addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_st_i32(val, addr, index, opc);
 }
 
 void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
                               TCGv_i32 a32, int index, MemOp opc)
 {
-    TCGv addr = gen_aa32_addr(s, a32, opc);
+    TCGv_va addr = gen_aa32_addr(s, a32, opc);
 
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
@@ -955,7 +956,7 @@ void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
 void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
                               TCGv_i32 a32, int index, MemOp opc)
 {
-    TCGv addr = gen_aa32_addr(s, a32, opc);
+    TCGv_va addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
     if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
@@ -2035,7 +2036,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
          * architecturally 64-bit access, but instead do a 64-bit access
          * using MO_BE if appropriate and then split the two halves.
          */
-        TCGv taddr = gen_aa32_addr(s, addr, opc);
+        TCGv_va taddr = gen_aa32_addr(s, addr, opc);
 
         tcg_gen_qemu_ld_i64(t64, taddr, get_mem_index(s), opc);
         tcg_gen_mov_i64(cpu_exclusive_val, t64);
@@ -2064,7 +2065,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 {
     TCGv_i32 t0, t1, t2;
     TCGv_i64 extaddr;
-    TCGv taddr;
+    TCGv_va taddr;
     TCGLabel *done_label;
     TCGLabel *fail_label;
     MemOp opc = size | MO_ALIGN | s->be_data;
@@ -3791,7 +3792,7 @@ static void do_ldrd_load(DisasContext *s, TCGv_i32 addr, int rt, int rt2)
      */
     int mem_idx = get_mem_index(s);
     MemOp opc = MO_64 | MO_ALIGN_4 | MO_ATOM_SUBALIGN | s->be_data;
-    TCGv taddr = gen_aa32_addr(s, addr, opc);
+    TCGv_va taddr = gen_aa32_addr(s, addr, opc);
     TCGv_i64 t64 = tcg_temp_new_i64();
     TCGv_i32 tmp = tcg_temp_new_i32();
     TCGv_i32 tmp2 = tcg_temp_new_i32();
@@ -3846,7 +3847,7 @@ static void do_strd_store(DisasContext *s, TCGv_i32 addr, int rt, int rt2)
      */
     int mem_idx = get_mem_index(s);
     MemOp opc = MO_64 | MO_ALIGN_4 | MO_ATOM_SUBALIGN | s->be_data;
-    TCGv taddr = gen_aa32_addr(s, addr, opc);
+    TCGv_va taddr = gen_aa32_addr(s, addr, opc);
     TCGv_i32 t1 = load_reg(s, rt);
     TCGv_i32 t2 = load_reg(s, rt2);
     TCGv_i64 t64 = tcg_temp_new_i64();
@@ -4067,7 +4068,7 @@ DO_LDST(STRH, store, MO_UW)
 static bool op_swp(DisasContext *s, arg_SWP *a, MemOp opc)
 {
     TCGv_i32 addr, tmp;
-    TCGv taddr;
+    TCGv_va taddr;
 
     opc |= s->be_data;
     addr = load_reg(s, a->rn);
@@ -6881,6 +6882,7 @@ void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
     DisasContext dc = { };
     const TranslatorOps *ops = &arm_translator_ops;
     CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
+    TCGType addr_type = is_a64(cpu_env(cpu)) ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     if (EX_TBFLAG_AM32(tb_flags, THUMB)) {
         ops = &thumb_translator_ops;
@@ -6891,6 +6893,5 @@ void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
     }
 #endif
 
-    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base,
-                    tcg_default_addr_type());
+    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base, addr_type);
 }
-- 
2.47.3


