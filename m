Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50505FF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:01:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaU-0004DV-8S; Tue, 07 Apr 2026 15:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaS-0004AH-Ig
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:48 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaQ-0007OS-54
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:48 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35d9749c26dso3994276a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591985; x=1776196785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P49JgMXtfvI/QxKp8JO4alWiNFfw7eGmQBelecFaY5M=;
 b=LU6vK0f4o1vu9ouOCfr6DvbCucey7ReJsHdXqivcCai41Sck2rCMwgnkUC/jwHi5Z4
 fGGXYvYW6Mc8n2cgpD+HHRqshD/wLaXogR8UMozgIw0kFmam/0k/9+uCVYzWH80IBDBx
 hqTOUTEGnsZ5kXQC5xoXybLclzCQQru9bPr2mhcAi/Jcgae++uAW/ZysQtX5NC1nQ7HJ
 eGn4SVLKbehIj3wo2aq/dhekMEWt/Iqx8IFQiwEmQo9lPaoFSknHNuwLDYW+XiaBlz2c
 JQx/f5mOqErVYYxY5FhogxceakyQ2Yjg1qJMdmwyQ6vrJyBWbCpwrqkMJQ562JjH7n6C
 DQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591985; x=1776196785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P49JgMXtfvI/QxKp8JO4alWiNFfw7eGmQBelecFaY5M=;
 b=qedzOrGe1D5eTN0nQoeuv8MfDhIn6Zb/E/8o6N61pdru51ht2HxM4AZzUT6c5rD5iF
 FBGHQ7Z6SSm1NqH/aisMASsJA1YhAYPihFSnXzScgt0GZfeG4mACvZOx2zwQvc3dl4Ob
 z3xUtXUNx7uAWAJNPjE51JcV7SB7B2zeMbJ/sDnppF4Ef+6kei12k3ktPrbN43mTQ0s5
 kg18WuR8F6gxnxZiuonTcZJgvfylnPi9YXS2A834p/NkRMYmy9YWS6pHaJ0KWQ7Ae0Sm
 tsP0KWXImgniyg9+lO3/8m3/JQxr1a9v+WtgOKcM5UDHZDAsiY1YqASgXZrrckknm8Xm
 IW7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsqYv6ImHEXlQcpFhsMkmAS6mR2VVxyTzX985il7bTXhZgNlDntMRgVlyBOYIACQbeSem+BWPmcA==@nongnu.org
X-Gm-Message-State: AOJu0Yyrh/PNk+A16iDwwiVgi2nxf8Lcf3giIZ6YVvO9Thm2UJbbpf5u
 khL8qrEqKWB80JjV1+mptI65kOCCpfGd9/s/R5cf/vjUCqTmQVA+7mrzdXEgdxgPLkg=
X-Gm-Gg: AeBDies/6VuiQt3WA/AS8uB8SVGBLORH4MxnP6iROvqQ+y3426RHz/e/Nmg6ewGwDJ2
 QJLNYCrSl33FIX4+J2WmwfIcGHWqF2pxUlr7fMOjezoteBRJNPhQPoFkenSxVzkhz6RCtVjiaXc
 xyPdItZ9oZktn4/6qO5J8+qIAWxOaM4DC71361at6Bpb2wUPoyM18SayA5vEPK87CuzflMVh5JE
 oj4++dZUJiNYKMMjg+df/JRR728QObtzruKPRss0r0Ua1G2qtb2P2LCyyETRkC+BCUwJ2u/wefd
 gBAj0FM+6NcXeh78YWAxhilMKgfKANnwfQo/FpOfwGnj/1pSoZIWZPgOAloaLlKLJnvzFSfUnRI
 Sgy9YIm8HuxjmGqsn91lAOGboRxKQdYMsVXKVud2MoP6V6bzcX2QgWadsqDnlaCcYq8MIjoRAvC
 WYOIYak2JEHNyC6iu1/7lkBswUY7NleY0qj08Rx/z89e30TLMi+grfwXKWFHDq1CNVqlZCYv5Wn
 a/F
X-Received: by 2002:a17:90b:4f43:b0:359:f3b1:6811 with SMTP id
 98e67ed59e1d1-35de67db862mr16989873a91.1.1775591984669; 
 Tue, 07 Apr 2026 12:59:44 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 15/21] target/arm/tcg/translate.c: replace TCGv with
 TCGv_va
Date: Tue,  7 Apr 2026 12:59:16 -0700
Message-ID: <20260407195922.196410-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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
TCG_ADDRESS_BITS. TCG_TYPE_VA is derived accordingly and is already
passed to translator_loop.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index fa4c7907dcd..0b3b4ab86be 100644
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
@@ -910,14 +911,14 @@ MemOp pow2_align(unsigned i)
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
@@ -929,21 +930,21 @@ static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
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
 
@@ -956,7 +957,7 @@ void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
 void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
                               TCGv_i32 a32, int index, MemOp opc)
 {
-    TCGv addr = gen_aa32_addr(s, a32, opc);
+    TCGv_va addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
     if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
@@ -2036,7 +2037,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
          * architecturally 64-bit access, but instead do a 64-bit access
          * using MO_BE if appropriate and then split the two halves.
          */
-        TCGv taddr = gen_aa32_addr(s, addr, opc);
+        TCGv_va taddr = gen_aa32_addr(s, addr, opc);
 
         tcg_gen_qemu_ld_i64(t64, taddr, get_mem_index(s), opc);
         tcg_gen_mov_i64(cpu_exclusive_val, t64);
@@ -2065,7 +2066,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 {
     TCGv_i32 t0, t1, t2;
     TCGv_i64 extaddr;
-    TCGv taddr;
+    TCGv_va taddr;
     TCGLabel *done_label;
     TCGLabel *fail_label;
     MemOp opc = size | MO_ALIGN | s->be_data;
@@ -3792,7 +3793,7 @@ static void do_ldrd_load(DisasContext *s, TCGv_i32 addr, int rt, int rt2)
      */
     int mem_idx = get_mem_index(s);
     MemOp opc = MO_64 | MO_ALIGN_4 | MO_ATOM_SUBALIGN | s->be_data;
-    TCGv taddr = gen_aa32_addr(s, addr, opc);
+    TCGv_va taddr = gen_aa32_addr(s, addr, opc);
     TCGv_i64 t64 = tcg_temp_new_i64();
     TCGv_i32 tmp = tcg_temp_new_i32();
     TCGv_i32 tmp2 = tcg_temp_new_i32();
@@ -3847,7 +3848,7 @@ static void do_strd_store(DisasContext *s, TCGv_i32 addr, int rt, int rt2)
      */
     int mem_idx = get_mem_index(s);
     MemOp opc = MO_64 | MO_ALIGN_4 | MO_ATOM_SUBALIGN | s->be_data;
-    TCGv taddr = gen_aa32_addr(s, addr, opc);
+    TCGv_va taddr = gen_aa32_addr(s, addr, opc);
     TCGv_i32 t1 = load_reg(s, rt);
     TCGv_i32 t2 = load_reg(s, rt2);
     TCGv_i64 t64 = tcg_temp_new_i64();
@@ -4068,7 +4069,7 @@ DO_LDST(STRH, store, MO_UW)
 static bool op_swp(DisasContext *s, arg_SWP *a, MemOp opc)
 {
     TCGv_i32 addr, tmp;
-    TCGv taddr;
+    TCGv_va taddr;
 
     opc |= s->be_data;
     addr = load_reg(s, a->rn);
-- 
2.47.3


