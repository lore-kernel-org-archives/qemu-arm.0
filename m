Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2642948ejc;
        Sat, 25 Feb 2023 01:29:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8NByblMYVAwL9SNaKulEVxNzaBsZUwC45bUNh/mJjNz2D3SsDQS5KAF8XPHk1MO3R4lxXj
X-Received: by 2002:ac8:5fc7:0:b0:3b6:9414:7f45 with SMTP id k7-20020ac85fc7000000b003b694147f45mr21222378qta.37.1677317385887;
        Sat, 25 Feb 2023 01:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317385; cv=none;
        d=google.com; s=arc-20160816;
        b=HoqRdL/8OZ/EVuWeM1WFEK7H0PIupPQlM30XexsG+MknBWljIHitdb024hNgqHYd0N
         TdGqO8nHDOdXshEZSaRdW+40dmMO06Bosb54ceVWznGuOEAi5VvHcjM9ATnskufZgT2E
         1BfB9ChStNU1VSC7sEVGW5HxA1MEol+9G5Oxuk1tVbSp0BA24ZhUjp1PaCt0pOuuW78m
         cK0lF4hZAubqR2xdZbei9dlnue29r/4BJl776/AdiypcxArPERsH1KGh52tuRTWJ9oei
         BMbyfWxpTzAeC1hZhmOCkGTu7v8b1m/NKUEYErlMS0H8eI8dVOUcYFKvp/OhV7nd3TPA
         SFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BOxM+Tb1bwmnIEw8dgEhWm1s4rF8ejPxKOa7NUQZfU4=;
        b=yT083LUr8lLQR2ephNZdALWAnahfPv2G7XSWe87gdcO6yGg8c9gL67YIS142xPOJFF
         6ujlNKghveZPcevysiHDFplDt7DbX8qfJmSHvmFBy7YivsOjx2GFHqMlDkXNJWXwuBV7
         vNsKEfm/A4NIFH2EEgMJzFdr7D28kcNT3I1ZS9oKif7racnyey2N3VmrRLJtfF+Bvikh
         Tpn1LJhq8DNi1e1rzN9Pi1J7DsaeJjSlayvL+7LxGAykzmkdNJVMSaDyQ5sSC0CYX7aQ
         k0s2yVUIwpZwR+xhoF5O6JFC51XCxIa1T87IC9sDmONxBA1KkRNW0+zdmbIzEi8w4F6e
         wMfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sT7RtYuP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05622a199700b003bcf93dc620si1449279qtc.596.2023.02.25.01.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sT7RtYuP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqja-0007PE-Gu; Sat, 25 Feb 2023 04:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqih-0005ES-Bg
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:55 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqid-00031K-A4
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:54 -0500
Received: by mail-pj1-x1041.google.com with SMTP id c23so1414640pjo.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOxM+Tb1bwmnIEw8dgEhWm1s4rF8ejPxKOa7NUQZfU4=;
 b=sT7RtYuPLKxOiqyYPM8KS1XQRDVfNkxBwcsoj+UawZfLC8X+/pOkaOX/pfgyX1TJem
 Prv2SsfWjbXm5mcVdBa8nvdljWULfbr6IYw7SXsPimS+9o498Nt0O/WthFa9EIWSBBIu
 HiojcBzJpNc4KppcplOeHoZRhuyaNCk1jgt0qIyiQb13cQQhYEE64j1IHsAGL/MYnk0E
 DprHq+Z1EC7mWP7PzmAkCiG/KbhYhZiBM8BQ7rMDBugGnKp6Z0i7D047hIyP5lUhQhKw
 6uM9y87z8oHL60IPW5OLIj5uWEjt8XsS+ccoHC7Ylo4jj+wnFLPb15JeeCIApKN4+qZ+
 5Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOxM+Tb1bwmnIEw8dgEhWm1s4rF8ejPxKOa7NUQZfU4=;
 b=nGoc0RYdXm7D52xWNKKCdM3GNg7xsCUWqxFNdmtYTxLvbC7tkG+W7gO2gnx1WW7ay7
 skh9Bwg+G2jZ6rmoC4veJ4LLtutP4W1xpqoqP1sBKHkuGxGUTvUo5RZ8lWxDvdEdJzl2
 In1FLJqoUdwSkhZyKubBUJTaR9M9YWHFKH9/ZMHoJ7It9pH55cd0r4MA7FUUQ7R8vwAx
 itvBAtbUmNGO3e+cYm3WKeaBshbU9UhcysYc9QtHbT6CGPaD4GAlMkLLfim2cv1d0fjS
 bcOHia59LCEtaQOE1zCNZ2wRZlVMLeTISqG0yHyP+7GorN0tCyyug4xPoWwspYEE4EJs
 aJyg==
X-Gm-Message-State: AO0yUKU1mdXA2leuxunvieD4Cge5vgtUSue9U3wgdhkFEma1N3qkVDbu
 yC4cdO+ipN80lEzVYK5+Yd6ctHtSEMB+s0wskv+pjQ==
X-Received: by 2002:a05:6a20:9148:b0:cc:dca8:cfdc with SMTP id
 x8-20020a056a20914800b000ccdca8cfdcmr517085pzc.2.1677316785918; 
 Sat, 25 Feb 2023 01:19:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 51/76] target/riscv: Drop ftemp_new
Date: Fri, 24 Feb 2023 23:14:02 -1000
Message-Id: <20230225091427.1817156-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6HMWxgTchhlJ

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f9d5d1097e..273e566d66 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -106,9 +106,6 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
-    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
-    TCGv_i64 ftemp[4];
-    uint8_t nftemp;
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
     }
 }
 
-static TCGv_i64 ftemp_new(DisasContext *ctx)
-{
-    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
-    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
-}
-
 static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
@@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
     case MXL_RV32:
 #ifdef TARGET_RISCV32
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
         return t;
     }
@@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
     switch (get_xl(ctx)) {
     case MXL_RV32:
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
         return t;
     }
@@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
     }
 
     if (reg_num == 0) {
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
     }
 
     switch (get_xl(ctx)) {
     case MXL_RV32:
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         return cpu_gpr[reg_num];
@@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->nftemp = 0;
-    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         ctx->temp[i] = NULL;
     }
     ctx->ntemp = 0;
-    for (i = ctx->nftemp - 1; i >= 0; --i) {
-        tcg_temp_free_i64(ctx->ftemp[i]);
-        ctx->ftemp[i] = NULL;
-    }
-    ctx->nftemp = 0;
 
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.34.1

