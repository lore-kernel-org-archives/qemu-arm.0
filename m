Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288766ejc;
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8mC7BXgOqbQZDgDvzgsBb3KcdcT6d60sYPR7+wIopjrevRNxklnqFHEGraDVwCZz1d/pyR
X-Received: by 2002:ac8:5710:0:b0:3bf:d988:f8e3 with SMTP id 16-20020ac85710000000b003bfd988f8e3mr4290030qtw.38.1677475687721;
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475687; cv=none;
        d=google.com; s=arc-20160816;
        b=RuMn+01L9sWhEhB/dfAPhEYC4y1SK5kO5vG0AzMSn5M0fizlp9eIDW5czqdaCxjAz5
         ucSnmKsAGkHnqCliFYdZQf/shLYXQO9SQpeCe98S3ebM3wDiWSXK7daw1ubfIC5l2alH
         EAOdB2Vu9xjMyDD6FnCK+Ns5d+vPLlYtxdvMFpH1qchQFJAcUd7jXk05RXDDi6hkdGzB
         pul6wSkUc1gtoQWzkU5me4jZS0LCtzHSK9Ja2no9acghSE7A7kqTbsFC9CU4jdmhnLgi
         R3ybCV7gPWAkxACLPkNCgwD3TAoFqQTZasu+WdUl6RlMuiHfpj1x4ElA9opj2ySomv6B
         uy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gqHQnIXQuU7WvdYNKGsRU9JQ3hqtUaL0pq9Pxj9E05Q=;
        b=qQPVV8i2Fgc1X2VepqcC00Ilnhcpzv72J5pMS27z9cV/iTmFGsJkuXwHc5UXk7Zmyz
         /OkMbDo3GMPF9vsZCo+SvrIsfa3+rG/UgnhiAuzrkAfMuFD3du0/aCbJV2hT8MCd+qaA
         1izfrpi2NbJY4oMx1EnqZex8eiTjC8Yo4Lw9DD8Zhd03AKNzM9ZEBhqPzxiTLjZPQFYc
         WN20DZ6kfD7bgDOB8Dz8Po7VNfpPKHlU8Xhymz+kE0SFBAFzJ/Hc63T+WrCaw+Ki1RFO
         3sg4kUVb+UnXMj/yWNXLImiWasHjroMTUn41UylKd2sHCZ7SvoBbBQ20vwwWeHH/7Gre
         rD1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuKMdqLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020ac85b85000000b003a9861da69esi5513534qta.239.2023.02.26.21.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuKMdqLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW28-00008A-DM; Mon, 27 Feb 2023 00:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW21-0008St-Rx
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:37 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW20-0007F6-0n
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:37 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8834579pjb.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqHQnIXQuU7WvdYNKGsRU9JQ3hqtUaL0pq9Pxj9E05Q=;
 b=xuKMdqLyePGrT8T8X4T1rSMKzLfAJ8hjh2mMUUhGyFD/asKHRywZaxly+A0z+0UPht
 q7HhrqwACefN/KSfANTn87bNecKxkTUvFsy6nF+xQfOZnpbcIEuimU5DkgBgfqzFPdA9
 eEBpm/8KGThZuHJrnFfZbyKe7hJMh/4IwwEhKOkl1dSsIadRUAT9PonjQcAgiGePrREP
 k4blLPIybMqAdUhwiwQ3EBg44VFOXtOb/gaRGTqxowL6VRKR8aWSFW0tICuowSWq2Gj4
 +Qj/PLtONYs5i+sC4gKhfZSZbEykckOQ/b4LCrjRRGbwxivCiV98qMBxxBDepgRQpVlL
 iwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqHQnIXQuU7WvdYNKGsRU9JQ3hqtUaL0pq9Pxj9E05Q=;
 b=yFc1QkvgVgWdh4OhUfwZkPJUtZrSM1oxu+f9dtL1rrNcdVLHEHXC9CUYL6P3Er1Os8
 FOvJZgw1GvNNOa8Z3SZsIsEC2zdtlkT47rOd9HNI+1oPnX1waqMGK3ygqyGCtoKkPKBd
 chRudtneQ8WCa6WG4P+gLJGn61yjoe24xs8cAS85VNzkZArql0v6y0Y795DOqfkzvo8I
 sQ5pYyELrYy8n51PXlzpa00clSkDvOAM3G6750Gd92L0ie++51qX91TqINoHpF1RNXyY
 2c/aqNCuFMHkWgK9QaAq/PnHyL+2jevz8MRHkmXaS18+R5QcXicgHKFeW+QZFGDBXlGB
 sToA==
X-Gm-Message-State: AO0yUKUr560jmIqwBV+nR6LDCO0H1/cnJVbf/SrwM6h0wnCrI/6A654r
 aES6/O6lA4EyuF1vfIp8355GGQ==
X-Received: by 2002:a17:903:80c:b0:19c:dbce:dceb with SMTP id
 kr12-20020a170903080c00b0019cdbcedcebmr8450701plb.44.1677475595233; 
 Sun, 26 Feb 2023 21:26:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 31/76] target/loongarch: Drop temp_new
Date: Sun, 26 Feb 2023 19:24:20 -1000
Message-Id: <20230227052505.352889-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ELwT7u2LKigw

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Reviewed-by: Song Gao <gaosong@loongson.cn>
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

