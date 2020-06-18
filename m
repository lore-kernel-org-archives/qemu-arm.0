Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1278013lfm;
        Wed, 17 Jun 2020 21:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcolDhM5zM3HgydYojSQa0xCANf7nn/W7GYbQOzXLzh0v0gGo37QTN634gCLME2ae2YRJD
X-Received: by 2002:a05:6902:532:: with SMTP id y18mr3531737ybs.122.1592456376259;
        Wed, 17 Jun 2020 21:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456376; cv=none;
        d=google.com; s=arc-20160816;
        b=lo190+qwT8HixAepNS5UtFU80WrnOIPQikNM6wn6IVjwMwZxSEe6R7pkrfO+ZdHRjd
         CuZbxBRxa3dilWa3HrX6i19gbnfUtIVXUfMQCRYpYRZldU0s7f4PXPcAzM/U2fgKlypS
         pWT/yX5IqFSv9V/C6TbI8pXXRhjSYU/O4yUdrzHl4RavOUudAoLro07cc3f3HhpdmGXO
         dJCzUmDylP9wKINGLuf54H4GAqcrFk+fLoy68EiaAVh6U6OgLwr6vP1op2FBJTDdbNSO
         ulHGnUGtccrJyJAOdFfWQdORI9JwDl+V3tLqJ/weDH7oE7D2JQw1DOFAgksu5tfBEhE0
         pEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wVaXs8beVLId9SLpfHGrwnaBih+bV0LoSt8SFaSirng=;
        b=PMib2qQIel3gQz6jwSFAWAMggu/K7y+Evm6CvsSrg06X0FsBb7bEfy+d2Z32dE+yp8
         m+GwByHJF+srzf5JSB2S8TF7a82RDlAfK24T08Ky1EMON0mnlai9n3I8oSayk6aNo89S
         8f78x3RNoly1zsX9me9qhzWT33HXmACjKCe4kpVkA2PLmDXxhTk8exH52InZCHFXLKfg
         77blhNpCHjlhUtBgcC7rcJRkrtxhY9mQCb/wTba00gaZe58SupAOQBaQa7uO0Bi851s4
         xKOVJxTFM0t+c3yBVAHuDQrkc37Ish31VMghOGvUuUmBS6bmLAs/zymqiC5Nng5sZxhY
         sk0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyiTULY5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201si1536511yba.183.2020.06.17.21.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyiTULY5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmeF-0002N3-EU
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDY-0004vV-15
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDV-0003PV-Vm
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id k1so1920114pls.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVaXs8beVLId9SLpfHGrwnaBih+bV0LoSt8SFaSirng=;
 b=OyiTULY5xJHo91gm+nhWnDJnajnczcxKhqLgSXnA1wK2+bxtC6/btSwaZ3svQF/vsC
 HVt7MImGxWHUQI+XU6w2/LS0aisN0KOIsJefX/Xf0tKmk5EqMsmN+XpiF6qaOyVE+L/1
 VMDyGTm4rShC2AYg4YjMpLzDyOB0m/CZ5JUHwGkRU9PskdO1bwIdKpK3dhrt+lh6OOeP
 jDvZA80VdglOFQz79sZVOtTGDUp6XeEN7c9P9DoaVE6GRSvdes4Ic/ZqpI15tHdCFi3i
 GEelKA0SEYxram7nyqrUcB+dmSLw6RrE/Zo1jn7PXaUdt75Cffioa4IfY2Nz4ydPJ6AV
 sbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVaXs8beVLId9SLpfHGrwnaBih+bV0LoSt8SFaSirng=;
 b=VWAWOxJtpx2NWLM3jakHRlbT5EzpPPVmnGFjpCPZ4cjaqmq3i/18R7WjzEMS8Z/tcW
 HAaQvvGl/UisE2hHR8qO8+Y3MWEcdib9J7Q/XFTkH6fHyinFG5SpnntdJpaCVSwE81M9
 /SQ0dQbgxaA871JWGPZIFhXB4U575CcJpXzOV3QPvarDeHhuBduPVnLvnIM5OcG/IYE3
 EyifMWZicn0OT/0EuLQyZ5hWBboh9PrXXh+Dtdr8MynkUV362OG8AQYIs+vf9XHUs85X
 MilC6uQGeD0099zxldfbWbrcg18oaBXzHJvkO/mswIaKLKgu1KtF7y3fv++XLFZxkhQ+
 oPUw==
X-Gm-Message-State: AOAM531wVDWzrG+9HGf8bTdQt6aftTv2zcBwywb4rSehnRqHN65JDKNo
 LwOxrc03R7JV8oYOwTfp8uLBCyZwMI8=
X-Received: by 2002:a17:902:a714:: with SMTP id
 w20mr2180654plq.125.1592454716538; 
 Wed, 17 Jun 2020 21:31:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm1162840pgv.5.2020.06.17.21.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 071/100] target/arm: Implement SVE2 integer multiply
 (indexed)
Date: Wed, 17 Jun 2020 21:26:15 -0700
Message-Id: <20200618042644.1685561-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: UOeq2QTatYdy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  4 ++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 29 +++++++++++++++++++++++++----
 4 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 331f77c908..ce81a16a58 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -789,6 +789,10 @@ DEF_HELPER_FLAGS_4(gvec_uaba_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_mul_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_mul_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_mul_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ea6ec5f198..fa0a572da6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -777,12 +777,19 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+#### SVE Multiply - Indexed
+
 # SVE integer dot product (indexed)
 SDOT_zzxw_s     01000100 .. 1 ..... 000000 ..... .....          @rrxr_s
 SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
 UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
 UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
+# SVE2 integer multiply (indexed)
+MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
+MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
+MUL_zzx_d       01000100 .. 1 ..... 111110 ..... .....          @rrx_d
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 88ffc458ee..dd2cd22061 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3817,6 +3817,10 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
+/*
+ * SVE Multiply - Indexed
+ */
+
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
@@ -3840,6 +3844,32 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
+static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_ool(s, a, FUNC); }
+
+DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+
+#undef DO_SVE2_RRX
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 5c0760de05..08eadf06fc 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -863,6 +863,27 @@ DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
  */
 
 #define DO_MUL_IDX(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                          \
+    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t idx = simd_data(desc);                                        \
+    TYPE *d = vd, *n = vn, *m = vm;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
+        TYPE mm = m[H(i + idx)];                                           \
+        for (j = 0; j < segment; j++) {                                    \
+            d[i + j] = n[i + j] * mm;                                      \
+        }                                                                  \
+    }                                                                      \
+    clear_tail(d, oprsz, simd_maxsz(desc));                                \
+}
+
+DO_MUL_IDX(gvec_mul_idx_h, uint16_t, H2)
+DO_MUL_IDX(gvec_mul_idx_s, uint32_t, H4)
+DO_MUL_IDX(gvec_mul_idx_d, uint64_t, )
+
+#undef DO_MUL_IDX
+
+#define DO_FMUL_IDX(NAME, TYPE, H) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
 {                                                                          \
     intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
@@ -877,11 +898,11 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
     clear_tail(d, oprsz, simd_maxsz(desc));                                \
 }
 
-DO_MUL_IDX(gvec_fmul_idx_h, float16, H2)
-DO_MUL_IDX(gvec_fmul_idx_s, float32, H4)
-DO_MUL_IDX(gvec_fmul_idx_d, float64, )
+DO_FMUL_IDX(gvec_fmul_idx_h, float16, H2)
+DO_FMUL_IDX(gvec_fmul_idx_s, float32, H4)
+DO_FMUL_IDX(gvec_fmul_idx_d, float64, )
 
-#undef DO_MUL_IDX
+#undef DO_FMUL_IDX
 
 #define DO_FMLA_IDX(NAME, TYPE, H)                                         \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va,                  \
-- 
2.25.1

