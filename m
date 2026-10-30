Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286B606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 19:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pmE27pA7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMsVp-00066G-7T; Fri, 30 Oct 2026 15:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVg-00063W-CV
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:34 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVe-00008w-4x
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:32 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6aa9606ddadso853093eaf.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 12:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793389407; x=1793994207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4TPiWxPcL0oaR5SpRTfp9lcMqH99uPLgLl4P4JCSLM0=;
 b=pmE27pA7k3tHO1njZqkKRh2H1J6v5l/KzoICJbq7yRQXAm/Qi9ZkoX+hHc3nXBBY1w
 Y0/uK83gORvt09Bps9W7NYXBgFc/AFOnzJPLgEPsUK9V+8CbyTn/PK3/wRb24Xm/2f0s
 noJVSxWIiyCfpv/1qdYKH+lrDZovTw9xS7WqZ+fhbHcTVBAxpB9YRd2Qz2mt8RxhhIK9
 0ynDRPO+kgiJvEV+TQISCujUm0QqfCebgl7kTBw6q+ynDVmGGTtXBozlZHci1sVUqaom
 domLv29vMxbfAGCnr47kQKqndXvG+IZ2tbj7FkeIAb9ALI6moyUF2kKoLuSaJPLu3hmW
 Nklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793389407; x=1793994207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4TPiWxPcL0oaR5SpRTfp9lcMqH99uPLgLl4P4JCSLM0=;
 b=SXWUFhniZYrnl6B1RPubBYvJ8dqDgK+1q/foNb+a0YfM4X9Dh4xVWWJXcwIJhJ7B2e
 Mj7Le84jYLnrRWJdqDweu68dAezX7K/pGgzVRSFjgPqlrUvzG2h1n88BuwUTEjccyxaX
 uPrDpVnwjWmWHDkSuFEPq9KScW9dfOwvvv3dwmMmJ7Uc0txrjJgLFwsoECniMJD2Qfv/
 t/dR/L4biOj7zezZhyttyePxVyz6icjxQscU5pnuLYAOKZVBYVZusBXEc329SY9YPAwn
 yE4QOLQD6SUDYwlZlAOsZqc/6XA3u4MnUVg4OfCUZwPGUiNMYDm9SeYo5RJM2dCKfGEi
 JKIA==
X-Gm-Message-State: AFq9FYLyy/OtumSFVAtnnTV/oL17hfI6hGTW6nH3Ulsg3oM+ObfHKHzi
 gyPjnCZEfqBwvwvMyzOZvCcHjv5hz9e7OZqEJkXHW6cafdYONmjQbfIEuTDGgmkSIN8Q0LSsGCO
 ucWgy
X-Gm-Gg: AYBFou3cZ5LIWR0FYekUN7VWaUM30KHetk90XdP5QXJ5P+tMtzAw0zJKvJWBLt2XDgh
 LnH9IKa38etT+BhYwPOSZukdJ7kJ3ZrMh0c8feiIHALZFQW2Og57RZ0CzMJ69p7KQPbru7niEB6
 bUZLSMN65mgAdaDklKq1dsqZR90FHUnkC0NAcY+DBYHUATgfTURdzVvMijq4r6WRBSMbY0HPq1P
 6wYcev7eQ0yhIga9/74P7O6PhSnflaPErgPl3c9GLKMROo4jdgMHIu3XEW5v4vDgdUxLD2trmwE
 tTmb/PPp/owg+A6Z2H6wWtw/wZaEvJwh8WF2NbuDq6ii4L6AR8+gYyAD28LSza/vjuV3483dKCU
 1YqxEOYgQ6ILrM/LmDqxelGqchmeGWrBZJiucfJxrVaJWdmOsnKeP5zTmW1zn2W6wpUMHnelBjO
 4Fyk51978xK/wOuFeSkaWOH64bOvYxkZ1rECClCnExWVZPq5RDlBr/W9gykNkSpvjrY+jPg3umG
 yxXWngdzSnlRKBE2dXcdleykdTbeod5u3XqN21rKOiqemcy0pOEbTFT7W8putAocg3b4CGeAxcO
 b3bPnsvucHSFt7pUUc3ywUaPNF7cIjOGvMs=
X-Received: by 2002:a05:6820:814:b0:6c1:f38e:7053 with SMTP id
 006d021491bc7-714f24f8d11mr2469476eaf.3.1793389407600; 
 Fri, 30 Oct 2026 12:43:27 -0700 (PDT)
Received: from stoup ([2607:fb90:5e62:412b:1381:b0c1:1339:9c82])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d351e77c8sm2654768a34.2.2026.10.30.12.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 12:43:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/9] target/arm: Split out gen_indirect_branch
Date: Fri, 30 Oct 2026 14:43:14 -0500
Message-ID: <20261030194318.319310-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030194318.319310-1-richard.henderson@linaro.org>
References: <20261030194318.319310-1-richard.henderson@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use this instead of DISAS_JUMP.  Existing indirect branches
now end the TB with DISAS_NORETURN.  Share the code with
gen_goto_tb when use_goto_tb is false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 51 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4289b65fdd..c8d1251f13 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -562,6 +562,17 @@ static void gen_goto_tb_int(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
     tcg_gen_exit_tb(s->base.tb, tb_slot_idx);
 }
 
+static bool gen_indirect_branch(DisasContext *s)
+{
+    if (s->ss_active) {
+        gen_step_complete_exception(s);
+    } else {
+        tcg_gen_lookup_and_goto_ptr();
+    }
+    s->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
 static void gen_goto_tb(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
 {
     if (use_goto_tb(s, s->pc_curr + diff)) {
@@ -569,12 +580,7 @@ static void gen_goto_tb(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         gen_a64_update_pc(s, diff);
-        if (s->ss_active) {
-            gen_step_complete_exception(s);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-            s->base.is_jmp = DISAS_NORETURN;
-        }
+        gen_indirect_branch(s);
     }
 }
 
@@ -1921,8 +1927,7 @@ static bool trans_BR(DisasContext *s, arg_r *a)
 {
     set_btype_for_br(s, a->rn);
     gen_a64_set_pc(s, cpu_reg(s, a->rn));
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_BLR(DisasContext *s, arg_r *a)
@@ -1937,8 +1942,7 @@ static bool trans_BLR(DisasContext *s, arg_r *a)
     tcg_gen_mov_i64(cpu_reg(s, 30), link);
 
     set_btype_for_blr(s);
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_RET(DisasContext *s, arg_r *a)
@@ -1950,8 +1954,7 @@ static bool trans_RET(DisasContext *s, arg_r *a)
     } else {
         gen_a64_set_pc(s, target);
     }
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static TCGv_i64 auth_branch_target(DisasContext *s, TCGv_i64 dst,
@@ -1987,8 +1990,7 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
     dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
     set_btype_for_br(s, a->rn);
     gen_a64_set_pc(s, dst);
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_BLRAZ(DisasContext *s, arg_braz *a)
@@ -2009,8 +2011,7 @@ static bool trans_BLRAZ(DisasContext *s, arg_braz *a)
     tcg_gen_mov_i64(cpu_reg(s, 30), link);
 
     set_btype_for_blr(s);
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_RETA(DisasContext *s, arg_reta *a)
@@ -2028,8 +2029,7 @@ static bool trans_RETA(DisasContext *s, arg_reta *a)
     } else {
         gen_a64_set_pc(s, dst);
     }
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_BRA(DisasContext *s, arg_bra *a)
@@ -2042,8 +2042,7 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
     dst = auth_branch_target(s, cpu_reg(s,a->rn), cpu_reg_sp(s, a->rm), !a->m);
     set_btype_for_br(s, a->rn);
     gen_a64_set_pc(s, dst);
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_BLRA(DisasContext *s, arg_bra *a)
@@ -2064,8 +2063,7 @@ static bool trans_BLRA(DisasContext *s, arg_bra *a)
     tcg_gen_mov_i64(cpu_reg(s, 30), link);
 
     set_btype_for_blr(s);
-    s->base.is_jmp = DISAS_JUMP;
-    return true;
+    return gen_indirect_branch(s);
 }
 
 static bool trans_ERET(DisasContext *s, arg_ERET *a)
@@ -11240,11 +11238,13 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_a64_update_pc(dc, 4);
             /* fall through */
         case DISAS_EXIT:
-        case DISAS_JUMP:
             gen_step_complete_exception(dc);
             break;
         case DISAS_NORETURN:
             break;
+        case DISAS_JUMP:
+            /* Use gen_indirect_branch instead. */
+            g_assert_not_reached();
         }
     } else {
         switch (dc->base.is_jmp) {
@@ -11261,10 +11261,11 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_a64_update_pc(dc, 4);
-            /* fall through */
-        case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
             break;
+        case DISAS_JUMP:
+            /* Use gen_indirect_branch instead. */
+            g_assert_not_reached();
         case DISAS_NORETURN:
         case DISAS_SWI:
             break;
-- 
2.53.0


