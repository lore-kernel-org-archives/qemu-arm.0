Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp467691lfg;
        Fri, 30 Apr 2021 13:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjvVgMZsw/0WeeLNi5EfWyATbI31RxuYgk/Z70LkUiCBo+ejHYHvkp3n/vrrodNfMRVM1J
X-Received: by 2002:a92:d5cd:: with SMTP id d13mr5301811ilq.133.1619814488829;
        Fri, 30 Apr 2021 13:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814488; cv=none;
        d=google.com; s=arc-20160816;
        b=SmXJi0vcCQ0Z9FlFA7AtC5cKwBIM5lJq0bYtQZ4RBpvHjbNONfnwEniFOUa7WlaSnh
         4Iqlt1l0KPSSZoLBYU0SmPtr06/xb45fhm673AumFiHb8cO+Bj7UlFO1/4a/gh8JyVDl
         ukDFBaIqijf30Q4uS1TF2r0dJIO6hlcAcRw+C65/mQL8foHLU1+zQA2bkkDhFW4gfaT0
         dlEmn8HRTjS2hLyTB8z9fimPK11NDsuK5SuwUcoEPjJqXS+A04u6ABwEcndR+vLEaDtr
         C+KhFgYl4BBCrFa9UZVikNDhR70GT1ClHAv809/8c2LIn6bs/QYjBxetnAC+yrR9cP58
         WGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y5trnwoiyeOfl0r4vLyT45eBorm8d2BCBnFoodmdZyM=;
        b=MjX/vc7w0G4iWLGhSHQ/oxFe3WHbsC5uEAEmeO1uZIoup7R43AvsGEL/4bT5DjxFS8
         NV6Yxu28MDad8Acwr/He3Be+yW+e7gRAusMVHaZLub+pe18GwJ/UpZsVI0UZSs8wgHCF
         q5dIxmXWbCk9N4aTN9945SqIWYDTyP91KNEPe0fcMyiHEaWM4FgLVVPSqiK1apIoNh7w
         b8/QTroLicsLgZPzF1Cq3ImuQwRdvgtnI2gXuvYYcVh5iwfOBXbB5LsV11d9ERTtFtAH
         PFnYYxYDJqGYUziqBWXtOiF++gHz+f+ZUcQgbeaoT0CB3fBYYanKccLOwkcyLBjK6q65
         0E3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xBtxhyUn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si1153375iom.73.2021.04.30.13.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xBtxhyUn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZk8-00021A-35
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiL-00084H-In
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:17 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiH-0005rm-Se
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:17 -0400
Received: by mail-pl1-x634.google.com with SMTP id t21so6128883plo.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5trnwoiyeOfl0r4vLyT45eBorm8d2BCBnFoodmdZyM=;
 b=xBtxhyUnGA/Vl3wdyNEW6W44HqHkHT840Jctgl0XaQFA2oTN1cxq4Jy3HjMnbbU1kX
 DqYU1XAuI/Q5uhweNDUS7/xhqwjQ6NAGYfiEXf7t5Bw0ZZ3xdKni/+3HyxjgYVOJnf0C
 92phgRkunDus7l6ROqDKwxQSh2iDzsc6ik4Cr//ZU/DTvdhX0c5LbIUlFdksxpBA5GCx
 bL5z6+tu9ERS/9HzaeSDRBxrQG4CC0L/JIVbUt/DuOl9O4+/iB2hiO5FU4xCU4YRaW3Z
 IIL/87AANPcYpUKqdrlf+/GE4dGYyg6TBJHRaOg2jzLGdi7u3MbNIpU49gLDX0n+cjP6
 Ydwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5trnwoiyeOfl0r4vLyT45eBorm8d2BCBnFoodmdZyM=;
 b=hcFBCwXZ8IUPLMlHd8/jT1j/rLU+ZLveCccWbWWjCqBBlwWWwHhSpEG5g09BjHzSTk
 7T/HIET6S7algHPkg7RoBO67+jg8U+T3oII08E26Nu1uItUp03wS82sjp22ghXS+/Xx/
 KtU3X1EG1SQXxzbs4IbEhW1C/55OA0qT/mpeid1ocx6ebKfV8RKnLpgP4j3eTR5iNh2n
 Elt04APygyCe2pklhSl4vzWN0o1u5DjdDmKkKO0gdyHWv1xgdKUhIU/oORS6vTJX3R8G
 +syugtlAg5teKcPSNoiRTekK/X0mQ/GQq3q+Ee2yq/jXW4LUOV58Rt0w36LN/oVDE/46
 EFdA==
X-Gm-Message-State: AOAM533FdRG0PLPcSnlPwZb2aAvS+uDjo25zQbqO8Zh+/hzB1OB0kuvG
 9A4XXa676t5i2bLGXS/BscNI3KEZroSoFA==
X-Received: by 2002:a17:902:b687:b029:eb:6491:b3f7 with SMTP id
 c7-20020a170902b687b02900eb6491b3f7mr7030388pls.38.1619814372402; 
 Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/82] target/arm: Implement SVE2 Integer Multiply -
 Unpredicated
Date: Fri, 30 Apr 2021 13:24:50 -0700
Message-Id: <20210430202610.1136687-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: luPMJbeW47iM

For MUL, we can rely on generic support.  For SMULH and UMULH,
create some trivial helpers.  For PMUL, back in a21bb78e5817,
we organized helper_gvec_pmul_b in preparation for this use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 ++++
 target/arm/sve.decode      | 10 ++++
 target/arm/translate-sve.c | 50 ++++++++++++++++++++
 target/arm/vec_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 166 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index ff8148ddc6..2c412ffd3b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -828,6 +828,16 @@ DEF_HELPER_FLAGS_3(gvec_cgt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_cge0_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_cge0_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_smulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_umulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_sshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ushl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5c90603358..557706cacb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1090,3 +1090,13 @@ ST1_zprz        1110010 .. 00 ..... 100 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=3 scale=0
 ST1_zprz        1110010 .. 00 ..... 110 ... ..... ..... \
                 @rprr_scatter_store xs=1 esz=3 scale=0
+
+#### SVE2 Support
+
+### SVE2 Integer Multiply - Unpredicated
+
+# SVE2 integer multiply vectors (unpredicated)
+MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
+SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
+UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
+PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 864ed669c4..f82d7d96f6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5795,3 +5795,53 @@ static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
 {
     return do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz, false);
 }
+
+/*
+ * SVE2 Integer Multiply - Unpredicated
+ */
+
+static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
+        gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
+        gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 3fbeae87cb..40b92100bf 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1985,3 +1985,99 @@ void HELPER(simd_tblx)(void *vd, void *vm, void *venv, uint32_t desc)
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 #endif
+
+/*
+ * NxN -> N highpart multiply
+ *
+ * TODO: expose this as a generic vector operation.
+ */
+
+void HELPER(gvec_smulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ((int32_t)n[i] * m[i]) >> 8;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = ((int32_t)n[i] * m[i]) >> 16;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = ((int64_t)n[i] * m[i]) >> 32;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t discard;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        muls64(&discard, &d[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ((uint32_t)n[i] * m[i]) >> 8;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = ((uint32_t)n[i] * m[i]) >> 16;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = ((uint64_t)n[i] * m[i]) >> 32;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t discard;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        mulu64(&discard, &d[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1

