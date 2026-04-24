Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD26CFB44A4
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Dc-00036f-Gs; Fri, 24 Apr 2026 00:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DU-0002ku-C5
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:36 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DS-0003bb-HR
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:36 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-40efc77933fso4920323fac.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005153; x=1777609953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54bb6apibanZeN0W5wppAFfxiFHNZOnRdTLBU0tG80Q=;
 b=UprfmIgIEfIaMUxg7kEkphIFW+PLIgYuRwaaxVYZWu71tOqwRHhjn2wp/bjXMGSKBE
 KgAtWaqWy3mrPwAFVS33fgSCGUAFLqhTfS/8WX55umm0vGfDzjE/ahYA6B3NlGcfvBLD
 yRDJuvjEOIN9UJr7/wLc6lnSfA5HTEpkVm4wkJB+GVT2142LtdRowueGqFX2JjbQcTNN
 YHS98HE2HNXOSQon/G3305j66yJ5G6eO7k/OJ1k9hc8x++ngKv7AOqXsQYxbxg7FZtPz
 xBW3hG4fimi9V9gKPN39hOvX4kjTTUQWrPa23BDVW35yRKuZwY3kz/36V0i3q2RweFO1
 ggvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005153; x=1777609953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=54bb6apibanZeN0W5wppAFfxiFHNZOnRdTLBU0tG80Q=;
 b=QaHXGcrdvyw/bmH0iPI5CJwfuo9SUbIKhddqtECBymlOpzWYebc3EXnCqnmRv03e3b
 nHpfIM9hVCkXDOhmeXm5ilwHiuz0gdx5d869GkndnoAaZGHfVTJ/0LosPXjRZQoXFNHh
 mzzWpAckLc4WnAc6Wsnp2KQI2wvtdFNHquW8X+TnMCLGPy5uZwiaI0x172y0USzNSrFq
 RELZZp6+bX2z1TOlI8EA9+UHe0vrIhEpBNER+si5h7A4lj30FLyHb601gPPAv3TuSgf/
 di9NtNJ1RLiRncAEgZzaOcKMsqa0ZtMiS6T1wRwqcTC8oJG1Vew2OIud5qIq9qmjZ0wV
 E7Bg==
X-Gm-Message-State: AOJu0Yx16DTMHkVFEShx+fdCuL/Nr25JkX5pPZ3w8j0eg0GkmnhctUUo
 aDR3x8QAOixdy4qsxLVT/9sWxOj/vOp6RGoUwRh7jSkqYjNrNR94tVKI57ky0/bsJCLNhedObeX
 iLiwUG/k=
X-Gm-Gg: AeBDietEuSCo4yE6NoSvrH7KKw4L3EFBcDbYlfuLqWWgrnQJDxMbQPb/HS0fqxf0TTj
 kD4xzXhROvruJm3Xr52uYCiriR4e7PaKTqrQ/yxgpf9wuVWMv+XLe80CsHgmzAU2QbvdwUR2CUh
 0mTsz3kPvrKCxOCyYA8opGX/hcER1qozbJvRps+d9Oct/JH3aYuUDcUfRX1O2wyfDmShwVLhQHn
 1kdH9QE10H+nKaWi5oAWi+YQtggmBsBrXLQrH0PZDtFoAu+9s1azl7A0jbGeOzm/+mgkMpFIMsn
 pY4jknehqGtJxj5CE+qQlAz8sMyJk78nnVm1dkpCXsKaM7u7jwo1IY44KhYI0zlzNPA7Ct6jXKr
 6QdnUnPxZbCxosPIQxVRr6TRde5TAUKP5qeym2Ajn0aJRgUIwQPtLstokCiLDhfw3nZ+Skc9TuU
 tTPN0fppTjxyMeP5h1jTO3uPaB/+l1YW35r5w26VyZRw+6yFV/utFo3S5LOC/ZRA==
X-Received: by 2002:a05:6870:169c:b0:42c:111b:73fe with SMTP id
 586e51a60fabf-42c111bb241mr12463992fac.18.1777005153217; 
 Thu, 23 Apr 2026 21:32:33 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:32:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 33/40] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Fri, 24 Apr 2026 14:30:07 +1000
Message-ID: <20260424043014.46305-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 40 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  1 +
 4 files changed, 44 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 023a49e12f..e67fb191c2 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,5 +16,6 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index fecd9cca0b..9bc1349950 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -481,6 +481,46 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e0 = n0[H2(i)];
+            float16 e1 = n1[H2(i)];
+            d[H1(2 * i + 0)] =
+                float16_to_float8_e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                float16_to_float8_e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e0 = n0[H2(i)];
+            float16 e1 = n1[H2(i)];
+            d[H1(2 * i + 0)] =
+                float16_to_float8_e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                float16_to_float8_e4m3(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
+
+
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 54f1b253c6..319a28e94a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4098,6 +4098,8 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index b6ef8ed8de..806953bc35 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,7 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
-- 
2.43.0


