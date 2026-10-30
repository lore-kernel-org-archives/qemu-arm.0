Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A219606A31E
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OY4f7YWq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMsWH-0006Qi-He; Fri, 30 Oct 2026 15:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVi-00063s-Cp
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:35 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVg-0000A3-Sv
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:34 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6f8a519e215so1018306eaf.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793389411; x=1793994211; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L9U3xpR2VVEc/VBrMNdYEpXepFo3fcltUSwxFqBgYFE=;
 b=OY4f7YWqz5cjhOU2KECWVccQCRJ/PSqH5PTDPzFGDqt6xUQXxCgcNrfaSgZXIo45XT
 XoTmXU01C29v1NXUDaVEQdKrzAHkcBoxHuvpQUHV3Yd0uZHnwVvML29xcP86v5jgfrGi
 vXLo49Djau9OH5sazcgB3qtS48Rr+icCEZsFqV2V6CoXuV3A/xbbRn+HX7T7cEPypZDd
 EyGlmaSSjHFGSzWsVtwek5d/zYfVaJsDrOzTeDVNEgSPrZCT43v7MtICbBA+l6VUQxcn
 dUD7ljRwiZ8xvtN8OOyTkks/r5LWLI8AtcdD4FJHwaHc/m5jEBWCVODyy3hMpvLNKD1m
 NIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793389411; x=1793994211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L9U3xpR2VVEc/VBrMNdYEpXepFo3fcltUSwxFqBgYFE=;
 b=bN5wa9Z3jLbItKj70pdNqG7fZo4aB/zizl5Nm4rf7sJkWgZagzZhJGeEz/Fura/NpR
 hJ1bClJslpg5OuM9l1VCd9MECZeM5neptbubY2KwLi5NrRGzVKPI5VXwDYdp2NozzMPS
 pW9cefbDur+Kox1YZbgkAT0oWTYdYfgEXdli5YyVXxQy4ZV8+OtTfflI4vgBuwGCxpQi
 nrcXPA8FnwgKGQySB/ZK4HQMuYREgXCjPiCROyofjOeu4x1AvIxTxHYVKXA62COKYUqk
 d83IDXGsrkwE8tknvAP2DVwBpcf6j++ekPBZew0JOuLJ6UE+K7d15gMHbrTbHe1BP0Jb
 tTIw==
X-Gm-Message-State: AFq9FYIOISQxAQr6EbpXKvZbZsJ+1vg4M57hw0mN1hPVOx3MZ5WLXIig
 UxhGslkYkd1OkxoQqZU47+CEcYCjaxiV9vmRoWirsFyl9seebkzMOnlArSMDGpqw5M4=
X-Gm-Gg: AYBFou2TqcyiZ/wmeQ6T5YnITWuzsiCNARLIRXoKfFzq4lQ/1WDvvX8ui63rUmlE2Vy
 9K9Ne9fNQs3S5vhj8+PFhANlakFdmQNJR1jE9h5kXFlHu6+POovllYaIMX4rz7d41gm8woDHmPq
 XetvUCW4UVfOwWJ3bajDBBpifcK5gKJxUnmN1mCAbW4D1+0WBoaUjSdEV2e/sZadhhMVjF9Kwkj
 hr/2Fa/QUIuyonq6MdH0Ezq9/V1M4WubXMQe3IIqKf4t+DjBkX8kGz+bWjplJOCYVO+FVW4A73Z
 BO8q73lBpKm+1KyJB+or3tDorLBRjqyP5LwBc+w3a9mnAN5ZKI8YRLkevaNzafjTccnadoSSXC2
 BsH6AQkUnSAmUgIJ0CaRM43libPZqCyGDT3Zu3ZXzY4WYL6Cht6VuPyLfWEk4Z6sG96F8Ssh8iV
 WJby1ujioKMMVFyQ9gPRjULFCH4F/AFb0W6VNmbq8SlTSS+Y5cGqQV3ZJdLtx39Xj9iZMJHKyQK
 MNW8PrOIg+n9ktxb9QwSPB1ZQMl5baI4jkw5A7GyahIEHsIguqinBh97YiD5Mnm5f+3A3nOSmjN
 RF/WLmkyqrylMsMMUaM4WakMeDrShFQG2t0=
X-Received: by 2002:a05:6820:1898:b0:6f6:1e3a:6e1 with SMTP id
 006d021491bc7-714ddf7f9c1mr3641187eaf.44.1793389411493; 
 Fri, 30 Oct 2026 12:43:31 -0700 (PDT)
Received: from stoup ([2607:fb90:5e62:412b:1381:b0c1:1339:9c82])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d351e77c8sm2654768a34.2.2026.10.30.12.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 12:43:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 8/9] target/arm: Rework gen_goto_tb to gen_direct_branch
Date: Fri, 30 Oct 2026 14:43:17 -0500
Message-ID: <20261030194318.319310-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030194318.319310-1-richard.henderson@linaro.org>
References: <20261030194318.319310-1-richard.henderson@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The only remaining uses are true direct branches, or
simple chaining from one TB to the next via fallthru.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0f6331a695..edbf67b03c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -573,15 +573,15 @@ static bool gen_indirect_branch(DisasContext *s)
     return true;
 }
 
-static void gen_goto_tb(DisasContext *s, unsigned tb_slot_idx, int64_t diff)
+static bool gen_direct_branch(DisasContext *s, int64_t diff)
 {
     if (use_goto_tb(s, s->pc_curr + diff)) {
-        gen_goto_tb_int(s, tb_slot_idx, diff);
+        gen_goto_tb_int(s, 0, diff);
         s->base.is_jmp = DISAS_NORETURN;
-    } else {
-        gen_a64_update_pc(s, diff);
-        gen_indirect_branch(s);
+        return true;
     }
+    gen_a64_update_pc(s, diff);
+    return gen_indirect_branch(s);
 }
 
 static bool gen_cbranch(DisasContext *s, const DisasCompare64 *c,
@@ -1780,8 +1780,7 @@ static inline void gen_check_sp_alignment(DisasContext *s)
 static bool trans_B(DisasContext *s, arg_i *a)
 {
     reset_btype(s);
-    gen_goto_tb(s, 0, a->imm);
-    return true;
+    return gen_direct_branch(s, a->imm);
 }
 
 static bool trans_BL(DisasContext *s, arg_i *a)
@@ -1795,8 +1794,7 @@ static bool trans_BL(DisasContext *s, arg_i *a)
     tcg_gen_mov_i64(cpu_reg(s, 30), link);
 
     reset_btype(s);
-    gen_goto_tb(s, 0, a->imm);
-    return true;
+    return gen_direct_branch(s, a->imm);
 }
 
 
@@ -1837,11 +1835,9 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
 
         a64_test_cc(&c, a->cond);
         return gen_cbranch(s, &c, a->imm);
-    } else {
-        /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, a->imm);
     }
-    return true;
+    /* 0xe and 0xf are both "always" conditions */
+    return gen_direct_branch(s, a->imm);
 }
 
 static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
@@ -11265,7 +11261,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, 4);
+            gen_direct_branch(dc, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
-- 
2.53.0


