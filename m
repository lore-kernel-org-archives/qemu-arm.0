Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4563216lft;
        Wed, 6 Jul 2022 02:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s04nrqB3gnwOZK2YMy8mwznpQq+evExgrTjrN8OxUuvcFjRPRwOfJ6YU2UeN+1AW7f+SoJ
X-Received: by 2002:a81:23c4:0:b0:31c:8bf8:af81 with SMTP id j187-20020a8123c4000000b0031c8bf8af81mr19747352ywj.340.1657099097300;
        Wed, 06 Jul 2022 02:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657099097; cv=none;
        d=google.com; s=arc-20160816;
        b=eiKBPxuJU+TaA/MuipEiAL9lvsocwspSYa3tW6m2V7fDO0V5MPz5aF5noMtXc36mEb
         otUsGYaMezS8agj9o3vToP7PgLRl5pxJoOTF0z3h+YJ2h/x7yVKij7gexTHZRD/jafZ3
         jTQoh4Kaml0wsI3Fli9MS5FrV1fbU7/1NrYvqeC4bPkWRG5KbVqejMzOvj03VJHwR3vY
         XsXSLBJBDfrI/vklLi64T2Rj86xCdxXgz97sW8J65Gh59Qo3OJOupE2lV941Y51K4KdB
         CKV9xFJebjSiY8CPsaPxO4bEvOguw5212SvETtSHYlNPfqLl58J23mKBbHMUwVX1Sw4T
         5zWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z4hqPmoRZ7cVUM8Y9hb593g0CFOYpdMYGSA5G3fCVmQ=;
        b=b93BKYNSiPOCDGrDdq1M9TBGHCgmBOWphYWzoKJUE1BYMrGj9p5Uo0R3Rre6VWGD2l
         Q1TjyJIWyzG5wcxdKW+FosP7Z3+217jLzHkxYWHOZyBfQdNXOBAINT4XlB4Q16Ira+ES
         TI2C1zt8n5eYOMzqWoeBPYMqHta2hg99w6cAaeYgcl9uNpBJ5depArdA7OeR2/iz7kTw
         COuWOH5C4A05skXmz8dVNRiK76mQxGx3S57Lmt5uLO7EU4bflaPvU9brrmrxES0QF/Rj
         4nuasyeGObc/PezTvZhBNzn2N4yS1mEOPmfJq+0xZLH4tOWFOFwjQd1/xtEfR7pFkv9J
         vJ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQN9xa31;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a811e0a000000b0031c86e97b24si15263486ywe.208.2022.07.06.02.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQN9xa31;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91Am-0003TW-CL
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ls-0006bW-90
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lp-0000ka-Rh
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id o12so179412pfp.5
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4hqPmoRZ7cVUM8Y9hb593g0CFOYpdMYGSA5G3fCVmQ=;
 b=kQN9xa31mCVICHCMs4C9zeRWKoZnCF6Qa9PzjDwOpbVKVF7DMJXj52SW2FptVbxN0N
 FX0T+P89lqZOlVeilXYAypkbplkd266ZlBMkWAeUdJiEs/xZnBgGZ7MAqByT12JcWhiW
 X7Ko14qIFewZj2uf+l5tMOP5TYd+LmmhRhr69xka6fO7dFdKgWsQPhYTPUYLqjG+ME5D
 F7MVkto75X2m9A4w1I8HMIxyc+h6nVh2f6Pisfw+pJXyRVl07wHl9AJpEo8WbMRfTZ7O
 ndrHam+JVHVhG7KVbBfAhcINysSkG/o7GcJUPOV4JZmP8Lhb0FZQ9rC3erI7ptESEZ8w
 m46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4hqPmoRZ7cVUM8Y9hb593g0CFOYpdMYGSA5G3fCVmQ=;
 b=Jtoyhnroi3EVa0Zc7WqpPq+JqS19tjm695dCxcmlP1BsyWhrqkuTRAiIQ6hWX6fB6Y
 84SWnfWR+nwC3U2BsFbG+95gxegaiMZnyfOZk9fSUFEnE70aKOeLqxecfaYcOlUCRg2L
 8fXWs7tZwMuU62lx9szoNcXaKwLfXctMvBEWvy9B7FTQGahmuFYIHqbIFSvUtKk3Wu1O
 ij034TRyAGluSS6Hip8coohXjHICk6f08zc6hjFhgWE4eP+ZFFxPRSaW58d6V792RQR0
 T8T1YgcJA9vfczLesQ2J+eNr9t8Rq6HZy/6oVYl89AhsiNcFAop+iiOwPzicrvgKAqLJ
 lWew==
X-Gm-Message-State: AJIora9j3bzhFBw/+A7TKc5YjRQaeaKqufye+1/hWSVj80gotE2oxbos
 NtUGq3dL5iLILeGpVF+vy1eiiLmaXtOOTnie
X-Received: by 2002:a63:5366:0:b0:411:415a:5888 with SMTP id
 t38-20020a635366000000b00411415a5888mr33140204pgl.286.1657095934817; 
 Wed, 06 Jul 2022 01:25:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 28/45] target/arm: Implement PSEL
Date: Wed,  6 Jul 2022 13:53:54 +0530
Message-Id: <20220706082411.1664825-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R0pM+FKgijvX

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 20 +++++++++++++
 target/arm/translate-sve.c | 57 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 95af08c139..966803cbb7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1674,3 +1674,23 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
+
+### SVE broadcast predicate element
+
+&psel           esz pd pn pm rv imm
+%psel_rv        16:2 !function=plus_12
+%psel_imm_b     22:2 19:2
+%psel_imm_h     22:2 20:1
+%psel_imm_s     22:2
+%psel_imm_d     23:1
+@psel           ........ .. . ... .. .. pn:4 . pm:4 . pd:4  \
+                &psel rv=%psel_rv
+
+PSEL            00100101 .. 1 ..1 .. 01 .... 0 .... 0 ....  \
+                @psel esz=0 imm=%psel_imm_b
+PSEL            00100101 .. 1 .10 .. 01 .... 0 .... 0 ....  \
+                @psel esz=1 imm=%psel_imm_h
+PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
+                @psel esz=2 imm=%psel_imm_s
+PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
+                @psel esz=3 imm=%psel_imm_d
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fd1a173637..24ffb69a2a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7419,3 +7419,60 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
 TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
+
+static bool trans_PSEL(DisasContext *s, arg_psel *a)
+{
+    int vl = vec_full_reg_size(s);
+    int pl = pred_gvec_reg_size(s);
+    int elements = vl >> a->esz;
+    TCGv_i64 tmp, didx, dbit;
+    TCGv_ptr ptr;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    dbit = tcg_temp_new_i64();
+    didx = tcg_temp_new_i64();
+    ptr = tcg_temp_new_ptr();
+
+    /* Compute the predicate element. */
+    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
+    if (is_power_of_2(elements)) {
+        tcg_gen_andi_i64(tmp, tmp, elements - 1);
+    } else {
+        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
+    }
+
+    /* Extract the predicate byte and bit indices. */
+    tcg_gen_shli_i64(tmp, tmp, a->esz);
+    tcg_gen_andi_i64(dbit, tmp, 7);
+    tcg_gen_shri_i64(didx, tmp, 3);
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(didx, didx, 7);
+    }
+
+    /* Load the predicate word. */
+    tcg_gen_trunc_i64_ptr(ptr, didx);
+    tcg_gen_add_ptr(ptr, ptr, cpu_env);
+    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
+
+    /* Extract the predicate bit and replicate to MO_64. */
+    tcg_gen_shr_i64(tmp, tmp, dbit);
+    tcg_gen_andi_i64(tmp, tmp, 1);
+    tcg_gen_neg_i64(tmp, tmp);
+
+    /* Apply to either copy the source, or write zeros. */
+    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
+                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(dbit);
+    tcg_temp_free_i64(didx);
+    tcg_temp_free_ptr(ptr);
+    return true;
+}
-- 
2.34.1

