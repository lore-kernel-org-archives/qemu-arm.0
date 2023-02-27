Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4406495ejc;
        Mon, 27 Feb 2023 00:27:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/QWILb/+D+wjC5ZoNo1ovfXM3+gIAuwre2rR1tN6yp0YvYGOF5a4bDcRr/YPL1oPc9cywe
X-Received: by 2002:a05:622a:14d2:b0:3bc:f954:323a with SMTP id u18-20020a05622a14d200b003bcf954323amr35564733qtx.62.1677486477046;
        Mon, 27 Feb 2023 00:27:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677486477; cv=none;
        d=google.com; s=arc-20160816;
        b=x0Bn+dbNegPSnZZS4JROQj5voYxq7Dg5ucHCscL2zsAHd2EJA1tDvHNjHZ98/J1vvR
         H/D9d1cUq27b4/MKBwc4KVT7DTOf+Br6W3gf0GhY42qWR3oM8L412l4DHXftXJb3YG2x
         nu3374CXrvgp+oxY4DFRIFMtAZsz/r0GSV8gsNSUHDVESu1lNQg4A1YGrwx3rEa1RGV2
         AOsvb+BSTj0sGFCQjPH/A/KihwxDXapDKqnfQOOIhVdBwK++Xc9U2i4dCVpTxePTRiXh
         26ae4sK4Fit0SXhEIjwOJQMmFvSDJhUb6/ekIclHK1lAKz/1gtCnFe/kREGLHT3L+GSd
         lVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0nmZI0+w1F7+8GnTL6IOgNGmXVjRV/sPnzdawMkimPw=;
        b=YvODwh7dQ4kvAveg64x4warY4ikl3YtfLV31PXRVUvLnrlj1TUa8RUSL5sjxFZKJ1X
         Ad0cGs2KXFaKkYTnoVXrokeSFBOK33kH5vOJOPGrrdh5/qfOKp8q0mwNj7cUUnqK11cA
         ZPdKyU4ePmwgurzXm7pA7fjSFr6kifqm39DXZGFYTjnKL6eQIFoD2JTSpDcDyaxZxlhw
         5nPytnwoUmuNmi04oFFrcOhaZuNg/lwnmed/XMhr+KCpX4GMHxXtN67mPH0uCF8iKk4G
         LfR5UQIFLMR+lVypzZdszvRhdhJozB9G91TYC6BrJhogyMAQNpNXqj7DxnYJNRRA/TWB
         cl/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K8J/HxW0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020ac85f13000000b003bd0a5ef178si6219335qta.339.2023.02.27.00.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:27:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K8J/HxW0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWI5-00030Y-SJ; Mon, 27 Feb 2023 00:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI3-0002uM-99
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:11 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004nL-Vm
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:10 -0500
Received: by mail-pg1-x529.google.com with SMTP id q23so2845664pgt.7
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nmZI0+w1F7+8GnTL6IOgNGmXVjRV/sPnzdawMkimPw=;
 b=K8J/HxW0kYm5MJYbIN1+NHclfSdEHUG7kRD5dK3ljLUzPY/O/eS3zPjZU+6C1MksUe
 jZXDFI76tpfAUMvXWXMBcmY7+9ZYWk55GyUsveT5VUhhl8MxDy7BkSafu0jgsVH7ytwS
 A29yeGul3VsuxaAg4Sc8Ng+tkVqjgKDH3HOHx/fQBK6IIFaPRpunAnngWTIH9TtEsc6T
 t2AxIQoXlQk5I93wYlyXRqyC7HhwPw9MUQHDk4JWgsmYI64owIOpubEgVmKO6y4qQrhe
 Mbsv9Z7exMhrsI3MLdVRgMKjPG9OdgYTpocZiVrhDqesaU/CEUStYA6urFMfQ7dobHfi
 i/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nmZI0+w1F7+8GnTL6IOgNGmXVjRV/sPnzdawMkimPw=;
 b=ewpL/f7jFswRrLttWCWirIZkb1bn7yIxWDOKX0zvMvYpwQZDPmiCfvHPfKqvanM5or
 nZl4bYhblSeljpDNwHAUuh7gj4Lohd43l58vvfU7ByeL7YUK8vhnJ9HGDRJG5DdlhluF
 WXKAL0xNnsNn+dzSht1RvWrTY0KvH03GLP5k0sgNipwK5ebUQAWdG4W97Q2RiMM5ATQw
 eck81deFP8ZbtOf8IY5qHI+J6jaCYKekznKAVPxYdpnaDLkAu08P3ljMPZ6un7Hp4NMk
 rtB3B0opH9ywWIokfLcJXpsvyGTzmK3l8targ8Gk6kMkeDlxl2PT2Em3MS9vY+nuxfSH
 Tvfg==
X-Gm-Message-State: AO0yUKUr+uFQZFoASbnNqblXdQihX6qvtxpg22eXElBwOrEO0R/KE/K/
 5uE4kpPMM7jMWT8W5xNN2cxspg==
X-Received: by 2002:aa7:96a1:0:b0:5f1:468b:c88 with SMTP id
 g1-20020aa796a1000000b005f1468b0c88mr3280250pfk.27.1677476585074; 
 Sun, 26 Feb 2023 21:43:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 08/70] target/arm: Avoid tcg_const_* in translate-mve.c
Date: Sun, 26 Feb 2023 19:41:31 -1000
Message-Id: <20230227054233.390271-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: pTxamTKHDpnI

All uses are in the context of an accumulator conditionally
having a zero input.  Split the rda variable to rda_{i,o},
and set rda_i to tcg_constant_foo(0) when required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 54 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9744bf3de0..31fb2110f1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
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

