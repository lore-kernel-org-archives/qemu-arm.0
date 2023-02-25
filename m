Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635467ejc;
        Sat, 25 Feb 2023 01:17:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8XWBf7ctIceK/TYrNtHb9TnZtTK5rgrYAa6WWCcz43/ZCYAjzv9DIv1cusZCN0TgxN4xbf
X-Received: by 2002:ac8:5714:0:b0:3b9:bd1f:1de6 with SMTP id 20-20020ac85714000000b003b9bd1f1de6mr32244297qtw.40.1677316651956;
        Sat, 25 Feb 2023 01:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316651; cv=none;
        d=google.com; s=arc-20160816;
        b=XzYC7hP/TvFFThNNI3zLXzEHEkfErCBJvEvXrtCkRs1Bu2Rk4BRkE8DTl2ES+8DB8c
         XavM7o5mltBYs6Zc3Fwa6AyT0+lXQQ7JmTYC58h5bKNCqZjATRt+13lgmsEsslWjoUCK
         yAhyQGmXkBWxiCWSVM6tcgiyadgYcr2mrZ0qh5wg7/9VOtYlhzhFuPzBtPRiYLsuFqC3
         fzkT9DQJQfzGH8f27Tx8K7a3/eh/vJOWmGzocB1t6fcON58z1y3fhKgRlI2NNqgqRIgB
         8pom4ZW1Nmow5QOSLkcG2cyi05eAwzUzg1p/7YmZgtu7+TyuyGD67deoLeLv3seXgHO+
         SW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bxv20wDZNoYmk1wFfK5vA87i6c4bvUZYOBsOJZkav3A=;
        b=tUD4svLh87NCnuw8DdMHaoqovfEqudak0IFqu0z+5sFVHxsmL1OSFnDxMyDvO77git
         VFix5qWGeT9rITqxExtB7MJbPKBX+deQ+Wdc/yzaxTLKSKiSLpiGGfonPGr0MYN8zCzo
         wxk7CvOmF952SK7vmtpga3x7hO7oXYwOGwgF0y+c3CVi/Z5WWjnn3OLZmdfgMZK3wgpp
         uyJD/EK+E2vMjA4nuoQ+U3cPoV9yv+iNsBfYXZXTcP8m3zNmLbxJoXgPYUwGPIcjFBAC
         UcnGlNug5U+jJVz6p4L7C+q5IwexbGaJw9aSjqW8ycVx1ytckWjHY/xQ0sib2pGVe3wZ
         b5sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/hEikYp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05620a451300b0071db2c0ba6dsi1407692qkp.611.2023.02.25.01.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/hEikYp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqfX-0008GJ-Qm; Sat, 25 Feb 2023 04:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqer-0006O8-OG
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:57 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeo-0001hG-MH
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:57 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i10so1863844plr.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxv20wDZNoYmk1wFfK5vA87i6c4bvUZYOBsOJZkav3A=;
 b=B/hEikYpB/6T9h3mraH6+bM1Eqvdhil4XhoHVLmptSJPaQQJzpXzBCUAJtjj1h1Gbf
 M21YSmGztxUveNS/7PoPAvf5OrizAWVw6QYYwNInsgtWkhfKrfUjduMv84yu0JQzPYzQ
 4szzaN7C3PUliQT1ZWk/REbtgVMJ2RFDFPex3oTQmUJXbbGS1kuAlccEde2uy6AmJS4Y
 wvRCRpjaD/XyH87IVLuSjESeFhyEpczblxhBp+Fa3/+I+Tf/6tzRRuLq9x+0k1dd7Qse
 TFHgWQJyS+rsay6iwrtD+zVbOqD9GqrfvUo+8mbd3+Eu089sSnSPK5UdV2YGbugpnJ9W
 YeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxv20wDZNoYmk1wFfK5vA87i6c4bvUZYOBsOJZkav3A=;
 b=PWdeJZvp8/kcE5iR+CfEryS6T8XgO0cQOgq4gR45lv4luHU4P06927tlbDvG2SMdqT
 UQUoKwPSFA3UvHLdtnzwSKdRMMSeW0lYo6gSOJKPk7F9NVVhQO3fc1yfxfqAVwdRNU79
 uP9RWcPeQwAhAcP5MnjJo2eoNfU6GLMYnPrbSPbh31+H4Eec9DR+1OIW2rKAe+YPGcT1
 R4kUMWW2FpnJnzCDW9ZS55663/NxEziLnnABb8wI32eYOp4emCxhDLGayrmM3Q6prVIr
 blKFpdqn20o3rBlwvM4+2QeKyY2WxzBaFnEgKhM6rlK7qmGou/k/ARlulbAufVCGrizP
 Irpw==
X-Gm-Message-State: AO0yUKVVBVaiRUpJEmv80+qXUjVUgsIvBTy1u7LkHoFTQjJ6VAb4CqL2
 iIbm0S7PKtMxvA9yfFRiaEzT3oi8ImhBydmQWrs=
X-Received: by 2002:a17:903:290f:b0:19c:f888:ad52 with SMTP id
 lh15-20020a170903290f00b0019cf888ad52mr161229plb.49.1677316552653; 
 Sat, 25 Feb 2023 01:15:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 31/76] target/loongarch: Drop temp_new
Date: Fri, 24 Feb 2023 23:13:42 -1000
Message-Id: <20230225091427.1817156-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7JupB82mJJQR

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/translate.h                  |  3 ---
 target/loongarch/translate.c                  | 21 +++----------------
 .../insn_trans/trans_privileged.c.inc         |  2 +-
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 6d2e382e8b..67bc74c05b 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -32,9 +32,6 @@ typedef struct DisasContext {
     uint16_t mem_idx;
     uint16_t plv;
     TCGv zero;
-    /* Space for 3 operands plus 1 extra for address computation. */
-    TCGv temp[4];
-    uint8_t ntemp;
 } DisasContext;
 
 void generate_exception(DisasContext *ctx, int excp);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 2a43ab0201..f443b5822f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -85,9 +85,6 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 
-    ctx->ntemp = 0;
-    memset(ctx->temp, 0, sizeof(ctx->temp));
-
     ctx->zero = tcg_constant_tl(0);
 }
 
@@ -110,12 +107,6 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
  *
  * Further, we may provide an extension for word operations.
  */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
-}
-
 static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
 {
     TCGv t;
@@ -128,11 +119,11 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
     case EXT_NONE:
         return cpu_gpr[reg_num];
     case EXT_SIGN:
-        t = temp_new(ctx);
+        t = tcg_temp_new();
         tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
         return t;
     case EXT_ZERO:
-        t = temp_new(ctx);
+        t = tcg_temp_new();
         tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
         return t;
     }
@@ -142,7 +133,7 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
 static TCGv gpr_dst(DisasContext *ctx, int reg_num, DisasExtend dst_ext)
 {
     if (reg_num == 0 || dst_ext) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gpr[reg_num];
 }
@@ -195,12 +186,6 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         generate_exception(ctx, EXCCODE_INE);
     }
 
-    for (int i = ctx->ntemp - 1; i >= 0; --i) {
-        tcg_temp_free(ctx->temp[i]);
-        ctx->temp[i] = NULL;
-    }
-    ctx->ntemp = 0;
-
     ctx->base.pc_next += 4;
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 40f82becb0..56f4c45e09 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -243,7 +243,7 @@ static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
         dest = gpr_dst(ctx, a->rd, EXT_NONE);
         csr->writefn(dest, cpu_env, src1);
     } else {
-        dest = temp_new(ctx);
+        dest = tcg_temp_new();
         tcg_gen_ld_tl(dest, cpu_env, csr->offset);
         tcg_gen_st_tl(src1, cpu_env, csr->offset);
     }
-- 
2.34.1

