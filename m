Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6268773ejc;
        Tue, 7 Mar 2023 10:37:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8A/SoRvBR41qf4Jy5SCU8a+QbeWLhk00Hg+PIkKMO6PKx3YrLL8oP0X5rbWyrpKLLDEK50
X-Received: by 2002:a05:622a:1823:b0:3b9:bc8c:c216 with SMTP id t35-20020a05622a182300b003b9bc8cc216mr5864905qtc.33.1678214220336;
        Tue, 07 Mar 2023 10:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678214220; cv=none;
        d=google.com; s=arc-20160816;
        b=Ucbq4TRs00y+2BARHqOVq00MsIn7EUMLnrrdtpWnwfmorjILeC+xqA3NYnEEdHnh7o
         hMQmlcif0q6foeLV2ztVp+AeCBUF3dveUNryotSiROxUv2/I/ULh4Lz7ATvWqbZNhGl3
         ZaiuO2rJUrRaSUEtbk6kzOxOZKqZ+ps9m2+6Wq0WXUkU82dr4a50W9fGLTPUyyo4/tTg
         FuQ6IB67FGRtiFtmeqdvwe22vR2DX8+a5oAPYdjE0sOkB4X7EOKtWu3IMG/I+gOJdJBy
         sdrhhFp3h6gbGNig97CNqTUwN1/On3S3186s0UF7JypuvjxzTZFjgvEB35C6hDeE90Ko
         Uabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kMT53egGb5FZrpdFSM78/KYr3JkgK3hMxF5PhcHm6Jw=;
        b=jZGL9+3hWzj+WC1OurbG0E0igXxN18ofCyp/YfVZ/dl4zlhs+L9+UGk8UU0ZkXSjNr
         9B5lORZQ5tOcy/c0LlUENt+mx7OvNfdpK/Gi9VBlb4yY+hlGVfdMIU+/zM6eDCLaOhxP
         ZMS2fZ9lmc3qFhsVdO/Nkti8o8TW1h/Ulr3g8mbYU/wwJCko3Bl9TiYsfMYSUqyEiXNj
         v0HNS1Zr7N6HGIf9EDRxCbumjcXltrZGQqBpQzh5oEVSGPU3NWe7/ripVAqyGmIHWUt9
         qd3gslvFZaY26JYWAfNBhqUn0yvx9fxCf00vSwuTL1YlIlp3CKuEhqLJ2PYfac1qicQB
         I20A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkTzyJZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj3-20020a05620a190300b0071a901baaebsi10598639qkb.7.2023.03.07.10.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 10:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkTzyJZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZc9b-0003bf-Ne; Tue, 07 Mar 2023 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Z-0003ZU-RJ
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Y-0007jU-1U
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v11so15107979plz.8
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMT53egGb5FZrpdFSM78/KYr3JkgK3hMxF5PhcHm6Jw=;
 b=wkTzyJZNnw6svbvJG9Nqyc3AK9ZsaAX+uSR7sJ2zdjUelleKA0vwdWAgGDj9Jy3BzV
 YzjW5ahX6AqhbbQ1xl8NDeDBURayViR9HeV6mPSpF1qnw96/XGUU2m+y3gYt9H2WoSml
 VQFSIQuTMyIvfXHSye1+GLhRiF9y6nbTZ6Xlt84yUZFbpkamZzPzpb3wEcwY4biyma8u
 bDh74j2EhQp7TB8HAtAqzO4d8yy4uNWx3Niatl2pnL2H3l7ZbcS29q87cDmE6auZO/Wh
 lvPItNiCIO/W8m0CpqG9KcTHMiSom7WwZ/kL5/prSB6IDo/AH3KG6eaZyEbFL7Ssmqrb
 ZYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMT53egGb5FZrpdFSM78/KYr3JkgK3hMxF5PhcHm6Jw=;
 b=krALaAIVjf3mMh43WQMc3uRYSBVtll6QmFMLHEoMAiAN+HD7BORk0J9kHKEuLxZWbD
 9426UzYNPS6EWfw5IbqyapmF1t6VJx0zVQTdl/idPnwPku/cyelU5dmBmYYdyDZppiZn
 5uC9ABq7mOMxvMFTA17/CVpKW+a6bZSJJTjK8x4JY/WVfN8cNyFasp+0SFAmcYdk5489
 WsC8NPRorB0GG76FhblaVB2poUGO1Mr7UfyF18eIUEOezG6QcUE71ud2ggTRQwWwV5LG
 H64q+b62nFw32ywZUhY+jGVljjvYjIDJJflkUTZ4sTZsy+OVaccuRBhsysr0i/SqGOkn
 j/4A==
X-Gm-Message-State: AO0yUKU+O7dDgv6wKhmkXULjpcrGaZyLVwXrfhqJBy6FbQNhtYqjz88A
 EibeAi3QUeE96TfwhvUEaE+gG/3Frs+49JiA68k=
X-Received: by 2002:a17:90b:38c2:b0:234:2807:55e3 with SMTP id
 nn2-20020a17090b38c200b00234280755e3mr20179810pjb.7.1678214110527; 
 Tue, 07 Mar 2023 10:35:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 08/25] target/arm: Avoid tcg_const_* in translate-mve.c
Date: Tue,  7 Mar 2023 10:34:46 -0800
Message-Id: <20230307183503.2512684-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: LutjCLGWoWxi

All uses are in the context of an accumulator conditionally
having a zero input.  Split the rda variable to rda_{i,o},
and set rda_i to tcg_constant_foo(0) when required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/tcg/translate-mve.c | 54 ++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index 9744bf3de0..31fb2110f1 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -1150,7 +1150,7 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s) ||
@@ -1177,21 +1177,22 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current rda value, not 0.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
@@ -1258,7 +1259,7 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
 static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         !mve_check_qreg_bank(s, a->qn) ||
@@ -1278,13 +1279,14 @@ static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
      * beat must start with the current rda value, not 0.
      */
     if (a->a || mve_skip_first_beat(s)) {
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
-    store_reg(s, a->rda, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1396,7 +1398,7 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
         { NULL, NULL }
     };
     TCGv_ptr qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         a->size == 3) {
@@ -1413,15 +1415,16 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
      */
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from Rda */
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
     qm = mve_qreg_ptr(a->qm);
-    fns[a->size][a->u](rda, cpu_env, qm, rda);
-    store_reg(s, a->rda, rda);
+    fns[a->size][a->u](rda_o, cpu_env, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1436,7 +1439,7 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * No need to check Qm's bank: it is only 3 bits in decode.
      */
     TCGv_ptr qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s)) {
@@ -1458,28 +1461,29 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current value of RdaHi:RdaLo, not zero.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from RdaHi:RdaLo */
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
     qm = mve_qreg_ptr(a->qm);
     if (a->u) {
-        gen_helper_mve_vaddlv_u(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_u(rda_o, cpu_env, qm, rda_i);
     } else {
-        gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_s(rda_o, cpu_env, qm, rda_i);
     }
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
-- 
2.34.1

