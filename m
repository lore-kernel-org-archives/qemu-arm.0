Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3791294dye;
        Wed, 2 Jul 2025 05:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyqcCQMkDOBLJe8rDwSh89oOiXpfvmYsJjSJYISzJvm4SaVrB8+jNOFx2LuHTDyGVCTubeuYwT5hJySA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5P0QnIqpvZi0l2dsnonKi/+hRwjYAicYinyCeEMN3jyygRdCfG7qWv7ivnRxiaXvE+tV8
X-Received: by 2002:a05:6214:4019:b0:6fa:cb05:b455 with SMTP id 6a1803df08f44-702b1bdb322mr43361156d6.35.1751461197540;
        Wed, 02 Jul 2025 05:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461197; cv=none;
        d=google.com; s=arc-20240605;
        b=avgUYX293NaVsNyYrrr+S/mgTVzZkJ8kh/thmeBvGGdWZHsnNiuCdY18eOWp8YuY4P
         z8F6ulG4phGkorcessbDGBxo4wUPKuOGw6ytawqG42xE+bcoIcAGgf1hZniwKKx6wVtA
         GjPyWaOeBcahOr+1cJATxiA6egVlqsYbm395lN7UNpA7hWMqsVbWyNjkUR/GGDMX6p24
         IPhS7+RErTAvzsGv76rDnI4dQA38fh7OtVPvuqbYydet6kEKuUcFuRovz8j9qur9h9Qx
         dgM5LC0HEOmC7sTwkiXsPosEKo+K1h2srsVWsItZR+YigT7iFbgxEFTyv7BtNXYxGP8u
         1jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d3iqV402n2zRibf20P4N2YxyvHzHBd9L0SbttgPpbJQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=KO84oPBROtnuCt43EkFXYv8XO6zdqqseQQ0TAgQaQtzBL8I0L75n0T75QSnz89nlwQ
         +c8aUxcQtOOdF4b4/9JcND7iRn9tjieiU9LwnHeofT7ah5SeaEl/zDLtECifJiP5e2ib
         aCbcgam82IMX/3i2ieA6u93wmbMIkxBtNvGc+Ilywv3baC3VnDAWF5qUsuwDMdcgZhCs
         PUEU6ufLQ+yHrus27OIym5X5TiEq5F99LLrIuZFCG3Hj67M+50nvcTpXaNzeB8W/+yh2
         vjOxrnFbseClIfPkzgB7EsGEN3cNIheUWnZoRIDRSpmSXmQGXRJ6lNHq0f+3mybTcNfc
         mFfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZYBAtd1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd772871efsi140772386d6.51.2025.07.02.05.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZYBAtd1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwnI-00007N-I3; Wed, 02 Jul 2025 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjn-0004g2-Rl
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:59 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjZ-0002Cc-Jg
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:55 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so3760279fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459919; x=1752064719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3iqV402n2zRibf20P4N2YxyvHzHBd9L0SbttgPpbJQ=;
 b=vZYBAtd1jUFxMsb3VI5urNcsh/zVmn9NzL6pC6kcA5HZQQiISlpqAZy+4Ns8fUQpP+
 QCWT8YYDCnGrbFpW6N2Hwl5ppmj8i4C9wT9JWvFN8BYfmfABzYeg8KAsnTCm2QxKHdIy
 aQoPTSfRSosPJYTgYovh/6jYkjjcsE0EovTIiTEKeLiYDmCBU/fnfhpReqo7gVnLj9av
 fr9tR+rvoP9yok5C9IU5idDk78B6LVlFl+jiQBHdfs+zDyjV1x0umG9kef2FkIAm+OkZ
 /xD5Vx1jGSwI4zgwd4tF8B8AgAR26E9lF3SEWJj946odqFSZg2ZFv21Hrx0kyDqp77KB
 3T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459919; x=1752064719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3iqV402n2zRibf20P4N2YxyvHzHBd9L0SbttgPpbJQ=;
 b=UWxJ22UvRabMZGcyqaj/b9VljuJyHMc0tqAm5qBgDdSB4sTAEyYE7XwXC/RrkoZBmB
 7zr+rzorAc1GLFuf+vakuY2S/6LkwAmaEqyQorVokgVLQ5Hm+lpkHDuZyaoSNrJ/eJ8p
 qzGGjhnRlyRr8pzowVcBcDqu1F20UbanzwPBOa3xTmSP99BtN0jZrdteSHJixBcH65hg
 xCI1OSVz63L/gezOiH8qyuWv6JpoCMMmrLtBhb1D7hi7ijiViENw63hwbY+sZ5Aai9r9
 S3ccSHM2Yc0xENEN0Jj2g5+JnFIRvdlgOrHlSWrz/CIfk7YROLjrUpHre73fopNkhj5+
 DotA==
X-Gm-Message-State: AOJu0YxqRZGnOi8u9lvDdVFOW38EhXw2MAe2Ny0IQIgnp8o87vDFXXaW
 G3ym/YKsqRgv0jjW3e7osA3Z26PjECieEtDs16qTAi5xmKyeqMSnneeZ4cU4gJw339k=
X-Gm-Gg: ASbGncub9bingRwIfLRF0KjHi/lRKt72+6q2MIZyu3YSydMYmFLeVfA1ld9E4Vzj+n4
 4btH0wxD8nKzxxgP3DxzwyAeG0S3tgusKHD7eWUfC6qKuyVrGVlLlsGQLjK2iBNBYq+WFU5HI5S
 xswFyszTkheTaRdSnr/jxbx6pujmGUZ/ypczX2WR+dmg/cn2SpNGmtUh/EN3L1vVFdGtmH91iVe
 5R979ff+Tje32wpVLMN+V3ORVV+2iRZHWPBGOfyIR/iag7RtVV6q/R18A6WIoJkWQe7lP9780+P
 4U4/GHdqLxzsyRgTrHvs9jo4f7djs5nei1VgzfbWUSCze0pj1C8/BdYkVst3MlnHUfLyGw==
X-Received: by 2002:a05:6871:7897:b0:2e9:e9b9:fd7c with SMTP id
 586e51a60fabf-2f5a8c3aba3mr1881211fac.26.1751459918888; 
 Wed, 02 Jul 2025 05:38:38 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 67/97] target/arm: Implement SVE2p1 WHILE (predicate pair)
Date: Wed,  2 Jul 2025 06:33:40 -0600
Message-ID: <20250702123410.761208-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
X-TUID: zfXhLGlCvF6T

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  3 +++
 target/arm/tcg/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c | 14 +++++++----
 target/arm/tcg/sve.decode      |  8 +++++++
 4 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 0b1b588783..eac23e75b9 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -941,6 +941,9 @@ DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 
+DEF_HELPER_FLAGS_3(sve_while2l, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_while2g, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+
 DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index dbade6ece0..2aec963f74 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4142,6 +4142,28 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     return pred_count_test(oprbits, count, false);
 }
 
+uint32_t HELPER(sve_while2l)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    do_zero(&d[0], oprsz);
+    do_zero(&d[1], oprsz);
+
+    count <<= esz;
+    if (count <= oprbits) {
+        do_whilel(d[0].p, esz_mask, count, oprbits);
+    } else {
+        do_whilel(d[0].p, esz_mask, oprbits, oprbits);
+        do_whilel(d[1].p, esz_mask, count - oprbits, oprbits);
+    }
+
+    return pred_count_test(2 * oprbits, count, false);
+}
+
 static void do_whileg(uint64_t *d, uint64_t esz_mask,
                       uint32_t count, uint32_t oprbits)
 {
@@ -4174,6 +4196,28 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     return pred_count_test(oprbits, count, true);
 }
 
+uint32_t HELPER(sve_while2g)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    do_zero(&d[0], oprsz);
+    do_zero(&d[1], oprsz);
+
+    count <<= esz;
+    if (count <= oprbits) {
+        do_whileg(d[1].p, esz_mask, count, oprbits);
+    } else {
+        do_whileg(d[1].p, esz_mask, oprbits, oprbits);
+        do_whileg(d[0].p, esz_mask, count - oprbits, oprbits);
+    }
+
+    return pred_count_test(2 * oprbits, count, true);
+}
+
 /* Recursive reduction on a function;
  * C.f. the ARM ARM function ReducePredicated.
  *
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index cb60b533e9..de6ffe7511 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3109,7 +3109,8 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 }
 
 typedef void gen_while_fn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
-static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
+static bool do_WHILE(DisasContext *s, arg_while *a,
+                     bool lt, int scale, gen_while_fn *fn)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2;
@@ -3164,7 +3165,7 @@ static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
         }
     }
 
-    tmax = tcg_constant_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64((vsz << scale) >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3205,8 +3206,13 @@ static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
     return true;
 }
 
-TRANS_FEAT(WHILE_lt, aa64_sve, do_WHILE, a, true, gen_helper_sve_whilel)
-TRANS_FEAT(WHILE_gt, aa64_sve2, do_WHILE, a, false, gen_helper_sve_whileg)
+TRANS_FEAT(WHILE_lt, aa64_sve, do_WHILE, a, true, 0, gen_helper_sve_whilel)
+TRANS_FEAT(WHILE_gt, aa64_sve2, do_WHILE, a, false, 0, gen_helper_sve_whileg)
+
+TRANS_FEAT(WHILE_lt_pair, aa64_sme2_or_sve2p1, do_WHILE,
+           a, true, 1, gen_helper_sve_while2l)
+TRANS_FEAT(WHILE_gt_pair, aa64_sme2_or_sve2p1, do_WHILE,
+           a, false, 1, gen_helper_sve_while2g)
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c90d975ebf..968b2a57e9 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -796,6 +796,14 @@ WHILE_gt        00100101 esz:2 1 rm:5 000 sf:1 u:1 0 rn:5 eq:1 rd:4  &while
 # SVE2 pointer conflict compare
 WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
 
+# SVE2.1 predicate pair
+%pd_pair        1:3 !function=times_2
+@while_pair     ........ esz:2 . rm:5 .... u:1 . rn:5 . ... eq:1 \
+                &while rd=%pd_pair sf=1
+
+WHILE_lt_pair   00100101 .. 1 ..... 0101 . 1 ..... 1 ... .  @while_pair
+WHILE_gt_pair   00100101 .. 1 ..... 0101 . 0 ..... 1 ... .  @while_pair
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
-- 
2.43.0

