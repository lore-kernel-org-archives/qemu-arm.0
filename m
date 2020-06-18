Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1266778lfm;
        Wed, 17 Jun 2020 21:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXCjN5ZtvRna6FxzoFvIFj3bhfnDHLCjjdumoDMdKUVkAIrICvUU7qfLbwuCbp3zSStYep
X-Received: by 2002:a25:348a:: with SMTP id b132mr3790333yba.491.1592455190772;
        Wed, 17 Jun 2020 21:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455190; cv=none;
        d=google.com; s=arc-20160816;
        b=tvM4dmRJorkpdX7tPCtoi+CVm0kQ3Dc72+Uj2Ld53gY5JJRmdmChl0983bYDRjrMyO
         sbEKufivPuwhoBdcNivHc1hnJ2/qhMrfIuLqcU7N0xPY9HEtE0RXbC9wOB4gsPCVIBzv
         Z62eHibRp7uF5jMlc9B3I/Z+U4eqjE4xLog4fGjtKpaKjFlrvDIpuTh6ewa+pmka37DD
         dRbRxnZkl7OK+RgZf2xUpm306pMJd263nqexEg550ftYv3kYhZdYdwWVzU7//3VxGoHh
         9kaR0Ep0VaMpkZQ0HlRXKr3PpnJarI6NUUY+5nNpe9ZoXA8s6XiQdgPmG78g/vJ8syh5
         W47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xoHgIAY17yfpGcExuE867XgxlZJHV+9UTPtnsy6m1Tw=;
        b=v9JBDN4Vr0Et1pM14XD8nXzkMrLZs1rE5zTWMb3RDuv9WnygTDfWs75/HOaofgRCHd
         JCiHJuyG4PHRfLeHhITAnbBqkzdU572mcRtdFFcEmRjJCWWmu4Uo++VhTfjV8RnAZyrl
         TwqzZNtJ5zQXu1SjBjEkqs12dL7JVt4c12vCbkkMTgrOoiOgJypMo7q9RTXQNgFDbnuW
         tZiN3fnw8p2fe6hcENM2w/87c+lxtrlxwsAZCzS61QmPMX4rothvtWa5Ibilge529rSr
         /zNscFfAOSUZ0Cfloc2NC5Ipeizrj5GzGvtjMIGppgXGq/eAL+5OX95DkUwvyGmfLhhv
         NF1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WfbRBBOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n191si1487188yba.173.2020.06.17.21.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WfbRBBOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmL8-00027t-4C
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9O-0003I7-TS
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9L-0002TF-Qx
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ga6so1967743pjb.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xoHgIAY17yfpGcExuE867XgxlZJHV+9UTPtnsy6m1Tw=;
 b=WfbRBBOYiTumsOcQsykyHhiaP2kZ6+i1TZrlJaulSs48ZoeWNU+RlzqrBtK6jDQakA
 qu81oagnb6huXwRycH4WO1emg84ruC/df046mfmt1t/UkPDLGBGNo1w15iEigKyp4DYC
 7a5/C51wGXmdx9zV6me89iRC/yXrQL2nb3ifVbkgZFkNVUewRAJ4b6KaFk/mePh89K9P
 L+vAzNjshz0DGZr9U8lw8OAyn2d+5l7WZp+TmIFeMVLSbZG1QpAjyB0MQVzd1+WYehgH
 tK3SBb0OML520IXWXa0As/jRLUblImt4DPY8Y6zszQR+kBbN6q9oTApbFyl3VbBPAEY0
 Dulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xoHgIAY17yfpGcExuE867XgxlZJHV+9UTPtnsy6m1Tw=;
 b=C8qpU06zhweOB3xZ5HhoUd5nZsykxX3hiO+bDO3vXeB5Qm/l1RuadSuGJaXOllH1uF
 oao1Mq4H4m26HNeoxTI6BvpOW+oFovv/AxmNyshDV7EZwGOZFhIjBEbLH6suOIpZl5bt
 LShCBQqYGgDINChRrU5jij0ZDzAyo8pF5nzjhUeWqY8m97iyjtQ7dl4WuwbYmn/zGM2Y
 gCKTxDYSVgU3/GiR1g72ECwqPwaoFDc2EVOrGw/6kf3tvrZgMXGaTF6SmoFHdUJDnNLm
 BPmmpFDuPr2iHqfC0hw8YlMt5kQIoDte8jct08um24nTS/5l214KzVRrmkWgt71SfZgN
 vCOA==
X-Gm-Message-State: AOAM533z9EGs0uQoweEsCCA89N/Q+ihdipSxqDAllL3Gfe2lwY2JLbHU
 lIFzSCYWBmRtpdx73bQHWyanNw==
X-Received: by 2002:a17:902:8544:: with SMTP id
 d4mr2189966plo.234.1592454458497; 
 Wed, 17 Jun 2020 21:27:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 016/100] target/arm: Implement SVE2 Integer Multiply -
 Unpredicated
Date: Wed, 17 Jun 2020 21:25:20 -0700
Message-Id: <20200618042644.1685561-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m16zjigXW04P

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
index 2a20c8174c..236fa438c6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -686,6 +686,16 @@ DEF_HELPER_FLAGS_3(gvec_cgt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
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
index 4f580a25e7..31f67e0955 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1093,3 +1093,13 @@ ST1_zprz        1110010 .. 00 ..... 100 ... ..... ..... \
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
index 92a4e3f030..850e2fda15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5361,3 +5361,53 @@ static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
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
index 7d76412ee0..cd58bfb84f 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1452,3 +1452,99 @@ DO_ABA(gvec_uaba_s, uint32_t)
 DO_ABA(gvec_uaba_d, uint64_t)
 
 #undef DO_ABA
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

