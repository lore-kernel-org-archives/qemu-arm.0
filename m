Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3D6C4451B
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrty-0001ap-7m; Fri, 17 Jul 2026 19:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtw-0001Zs-0U
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtt-000718-Vr
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c9cf07d2df6so5326683a12.2
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330604; x=1784935404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=axCNshnRaz9sCH+JYe9sKgtaQsPlSADENghL889xQUY=;
 b=jMQXmI+GP4Z8tRctsLixEZRmnkvyHeA3JQdlBwN/T1pm+PIvWbg8ZWZNJuDdE/7tb5
 zWDCWHwi+Hyq8bBx++/Nw7adz90JV7gtH7D/iJq4VromN1ww/6anJQJIigq9zPN+VDyN
 vlUfIzS6Fdc8mD7zSzTkElqxoYBuQnDSB1w+75M/Coev23PTX8ubEaSEM8uMZkqbKbD+
 0SX2lj898Ul22tmbaMXl1HvhYyUdiCvpuX1RA5V57k/CjwPNwD4oSGOLPh9S9NjxO05y
 pI+/lrwoGH6cHRuEfv6o1F6XFZsZSo98tGujNXs8h0EhahDjxvgtPJxGJ5YqWsFDa1kC
 T5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330604; x=1784935404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=axCNshnRaz9sCH+JYe9sKgtaQsPlSADENghL889xQUY=;
 b=iMXlPwfJOCq7FwhO9GvEZoAfBvAc5WFzx+y7IedsnV554+rbL+JmMrNxxsMzkfcAiJ
 qYopwYJA2zdY+b5mUobLkFcNmySOyMdDfE8Ddt5fYQ9HfZm7eVWNpJ7/KO0Y3Szt9SN6
 PgNQy2tATTaEe36P8NoUeY/mKj+kQPtIlV91yyRIDAI+iMrvIo6WoyflJInuPgP3Tvc3
 BRJLYTLRjGQliVW6gdBc0WcfUmeQ4cjGDEy12yEKO++xF2T8G9I7aT0m6jOlI/UO2TJN
 W+xrYlIN0NHp/2bjT0U+7aLvp3KDFv6lh3b8KhVMwk85DeiQNh9V+ut+t7KALAGLQTDy
 uh7g==
X-Gm-Message-State: AOJu0YywZeOCNjMQQthXxzXcnPOzaoOZBHjI71S0XBpH/TFRxI52I42d
 iwo7XozLaDoJs6gF2R2CO1WVYlCyq+qdHQgf1Jg1NOHvoO1QGfFuCxQxpS+u8R6/384gxXcpqb9
 X0w3g
X-Gm-Gg: AfdE7cmskluelvpR8frzI9xNM2NcMNDx9J5jE2hQ5xh0+BrylF5lWl5sBYxOoMtswtV
 f5Uxil4ofSm2V5njGo3vYYS08rQpMDocut2u3I0D1uZwR3dOvQXa+hpHASvItcWUNb7MUcNimvC
 U6S1roFqoZ7k+BA0ws4YZbv13ZM5PbYiBxxIOKBaX3ysEoLW64dJiGavIxucn7Me3SJG6ldFuvg
 rzCTn61SRG7YfO7Ya+pM7q+5j9pBc2nfBq0pEyot/toIPgX/iBvstNQlXYsivwqHjR+0h/tKukL
 rSnlzaFjpR6u9UyUkEAYNMIKjhU3JzKqpJeFfh+VM8M7kZhSh0H9exFRJdFXOd16xZl5aKKn0b7
 dsLSNWEx22fk6KC7L0lFOMwIek8evR2qmXEJ2TCSDYO+mDq80H5XAdbaSFKk1l4gLcepIDxtUBY
 Nmoe29FbTQ9+ktpvYvOQ==
X-Received: by 2002:a17:90b:3808:b0:381:cef1:11bb with SMTP id
 98e67ed59e1d1-38e4b51c562mr4861888a91.22.1784330604256; 
 Fri, 17 Jul 2026 16:23:24 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/17] target/arm: Split out helpers for creating MTEDESC
Date: Fri, 17 Jul 2026 16:23:00 -0700
Message-ID: <20260717232306.378988-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Assert that align and size values fit in their fields.
This results in more fields being filled than some
helpers actually use, but uniformity is for the best.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 123 ++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 65 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3d838a4cc1..590c7d8064 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -292,6 +292,43 @@ static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                             tcg_constant_i32(1 << log2_size));
 }
 
+static TCGv_i32 gen_mtedesc_xas(DisasContext *s, bool write, int idx,
+                                unsigned align, unsigned size)
+{
+    int desc = 0;
+
+    desc = FIELD_DP32(desc, MTEDESC, MIDX, idx);
+    desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+    desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+    desc = FIELD_DP32(desc, MTEDESC, WRITE, write);
+    desc = FIELD_DP32(desc, MTEDESC, ALIGN, align);
+    desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
+    desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
+
+    assert(FIELD_EX32(desc, MTEDESC, ALIGN) == align);
+    assert(FIELD_EX32(desc, MTEDESC, SIZEM1) == size - 1);
+
+    return tcg_constant_i32(desc);
+}
+
+static TCGv_i32 gen_mtedesc_xmop(DisasContext *s, bool write,
+                                 int idx, MemOp memop)
+{
+    return gen_mtedesc_xas(s, write, idx, memop_alignment_bits(memop),
+                           memop_size(memop));
+}
+
+static TCGv_i32 gen_mtedesc_as(DisasContext *s, bool write,
+                               unsigned align, unsigned size)
+{
+    return gen_mtedesc_xas(s, write, get_mem_index(s), align, size);
+}
+
+static TCGv_i32 gen_mtedesc_zva(DisasContext *s)
+{
+    return gen_mtedesc_as(s, true, 0, s->dcz_blocksize);
+}
+
 /*
  * For MTE, check a single logical or atomic access.  This probes a single
  * address, the exact one specified.  The size and alignment of the access
@@ -305,20 +342,10 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
 {
     if (tag_checked && s->mte_active[is_unpriv] &&
         (is_write || !s->mte_store_only[is_unpriv])) {
-        TCGv_i64 ret;
-        int desc = 0;
-
-        desc = FIELD_DP32(desc, MTEDESC, MIDX, core_idx);
-        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
-        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(memop));
-        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
-
-        ret = tcg_temp_new_i64();
-        gen_helper_mte_check(ret, tcg_env, tcg_constant_i32(desc), addr);
+        TCGv_i64 ret = tcg_temp_new_i64();
+        TCGv_i32 desc = gen_mtedesc_xmop(s, is_write, core_idx, memop);
 
+        gen_helper_mte_check(ret, tcg_env, desc, addr);
         return ret;
     }
     return clean_data_tbi(s, addr);
@@ -339,20 +366,12 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 {
     if (tag_checked && s->mte_active[0] &&
         (is_write || !s->mte_store_only[0])) {
-        TCGv_i64 ret;
-        int desc = 0;
-
-        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
-        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
-        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(single_mop));
-        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
-
-        ret = tcg_temp_new_i64();
-        gen_helper_mte_check(ret, tcg_env, tcg_constant_i32(desc), addr);
+        TCGv_i64 ret = tcg_temp_new_i64();
+        TCGv_i32 desc = gen_mtedesc_as(s, is_write,
+                                       memop_alignment_bits(single_mop),
+                                       total_size);
 
+        gen_helper_mte_check(ret, tcg_env, desc, addr);
         return ret;
     }
     return clean_data_tbi(s, addr);
@@ -3119,16 +3138,9 @@ static void handle_sys(DisasContext *s, bool isread,
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
-            int desc = 0;
-
-            desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
-            desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
-            desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-            desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
-
             tcg_rt = tcg_temp_new_i64();
-            gen_helper_mte_check_zva(tcg_rt, tcg_env,
-                                     tcg_constant_i32(desc), cpu_reg(s, rt));
+            gen_helper_mte_check_zva(tcg_rt, tcg_env, gen_mtedesc_zva(s),
+                                     cpu_reg(s, rt));
         } else {
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
@@ -4967,7 +4979,8 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
                    bool is_setg, SetFn fn)
 {
     int memidx;
-    uint32_t syndrome, desc = 0;
+    uint32_t syndrome;
+    TCGv_i32 desc;
 
     if (is_setg && !dc_isar_feature(aa64_mte, s)) {
         return false;
@@ -4992,23 +5005,15 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
     syndrome = syn_mop(true, is_setg, (a->nontemp << 1) | a->unpriv,
                        is_epilogue, false, true, a->rd, a->rs, a->rn);
 
-    if (is_setg ? s->ata[a->unpriv] : s->mte_active[a->unpriv]) {
-        /* We may need to do MTE tag checking, so assemble the descriptor */
-        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
-        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-        desc = FIELD_DP32(desc, MTEDESC, WRITE, true);
-        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
-        /* SIZEM1 and ALIGN we leave 0 (byte write) */
-    }
-    /* The helper function always needs the memidx even with MTE disabled */
-    desc = FIELD_DP32(desc, MTEDESC, MIDX, memidx);
+    /* Construct the descriptor whether MTE is enabled or not. */
+    desc = gen_mtedesc_xmop(s, true, memidx, MO_UB);
 
     /*
      * The helper needs the register numbers, but since they're in
      * the syndrome anyway, we let it extract them from there rather
      * than passing in an extra three integer arguments.
      */
-    fn(tcg_env, tcg_constant_i32(syndrome), tcg_constant_i32(desc));
+    fn(tcg_env, tcg_constant_i32(syndrome), desc);
     return true;
 }
 
@@ -5024,7 +5029,8 @@ typedef void CpyFn(TCGv_env, TCGv_i32, TCGv_i32, TCGv_i32);
 static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
 {
     int rmemidx, wmemidx;
-    uint32_t syndrome, rdesc = 0, wdesc = 0;
+    uint32_t syndrome;
+    TCGv_i32 rdesc, wdesc;
     bool wunpriv = extract32(a->options, 0, 1);
     bool runpriv = extract32(a->options, 1, 1);
 
@@ -5048,29 +5054,16 @@ static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
     syndrome = syn_mop(false, false, a->options, is_epilogue,
                        false, true, a->rd, a->rs, a->rn);
 
-    /* If we need to do MTE tag checking, assemble the descriptors */
-    if (s->mte_active[runpriv]) {
-        rdesc = FIELD_DP32(rdesc, MTEDESC, TBI, s->tbid);
-        rdesc = FIELD_DP32(rdesc, MTEDESC, TCMA, s->tcma);
-        rdesc = FIELD_DP32(rdesc, MTEDESC, MTX, s->mtx);
-    }
-    if (s->mte_active[wunpriv]) {
-        wdesc = FIELD_DP32(wdesc, MTEDESC, TBI, s->tbid);
-        wdesc = FIELD_DP32(wdesc, MTEDESC, TCMA, s->tcma);
-        wdesc = FIELD_DP32(wdesc, MTEDESC, WRITE, true);
-        wdesc = FIELD_DP32(wdesc, MTEDESC, MTX, s->mtx);
-    }
-    /* The helper function needs these parts of the descriptor regardless */
-    rdesc = FIELD_DP32(rdesc, MTEDESC, MIDX, rmemidx);
-    wdesc = FIELD_DP32(wdesc, MTEDESC, MIDX, wmemidx);
+    /* Assemble the descriptors regardless of MTE enabled. */
+    rdesc = gen_mtedesc_xmop(s, false, rmemidx, MO_UB);
+    wdesc = gen_mtedesc_xmop(s, true, wmemidx, MO_UB);
 
     /*
      * The helper needs the register numbers, but since they're in
      * the syndrome anyway, we let it extract them from there rather
      * than passing in an extra three integer arguments.
      */
-    fn(tcg_env, tcg_constant_i32(syndrome), tcg_constant_i32(wdesc),
-       tcg_constant_i32(rdesc));
+    fn(tcg_env, tcg_constant_i32(syndrome), wdesc, rdesc);
     return true;
 }
 
-- 
2.43.0


