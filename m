Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F68F588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:20:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sc-0000WU-Co; Tue, 21 Apr 2026 01:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S6-0008Sp-I2
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:14 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S3-0006ut-Ql
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:14 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso24163975ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748510; x=1777353310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54bb6apibanZeN0W5wppAFfxiFHNZOnRdTLBU0tG80Q=;
 b=aihioRRMKsEb9WL+alvjMv2g36IDJhbfqtX1w+xhsTO0HO5+1kBvCOdf/yDUUr2gbb
 osSK+kAvi+yxbQcpllq/eS4CAOwy3hrsccRQzquweep6z8ZD4/gZxx7CmP6rboBHvFvH
 fZfmXx2qPofenr15BDv5YPlUBNeBpuUyW1SX7bi1P6DIa/VKW4R/D5gPKsYJ46R/xriL
 lrp2dhhgCw/2iB5nxO97ocbQOEAqtjRbOUEKyyoVCkH+r1vRvKB/2mTK2mcyHlvSmfxH
 A3ortx+JshUtbuqRFE/R1Wo8eGaq3AUbDiLbbTlA2BJg9f61Lfa0Kl3rk9eKspqMhJSY
 EH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748510; x=1777353310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=54bb6apibanZeN0W5wppAFfxiFHNZOnRdTLBU0tG80Q=;
 b=bRWkUijJlBtpvvM16YUW5UxkdyA4g6ZFQ/R9lwlCIJHQkkGTGSIKIJP3AiryXsT2fH
 yDP3qw8WQ4nh3CSGB/05sPy45xopYrWO4id+CNmpmBDvh8bjZEW3PrtiQugtKLzzzh9Z
 4Rkn5mVsRG578QZBTon0ziKx9hvnaWIkf66qswEyNK8F2Bof0amWn0nTrQ50jWsiNmgt
 sCMkPubf82tA/SnyOIgO2e1OA2FVybCS2tEL+F7z7fJZ/efswFmQPBJ9zVSh2iAkujAs
 k640hgnP6qTiYUamZ3xcDvA3NGeYsf4n92PfKCKCZO26fE4wC8dvsE5yhE3xwvtj7HQd
 XiDA==
X-Gm-Message-State: AOJu0Yx3BArEoAGQTbimoZaYZC/5E0PfHsAhTYI54+QdyDqhRiHYzI83
 t4p8nCr/OgsNbRsLHJyjXQyfIe7JdvF/oBCq3zhtO4sFu4lJF0oTT4MzztvuzvDkcMk=
X-Gm-Gg: AeBDiet0AA+zXvKBSpWQ6Zb4iuCano/ob3eoDCVddC4cGqvZu3Ha6WlLljCln0jtUqB
 IUy9V4gB+HfwktZT4gxM3u2FFnrPfrWuOjWlvOB4bpS0jOCRuAE3jJ90dIqxyEx/F2sVmwhfkU+
 cKZu0ocwlBCPA1MdH8zzMzJ2UZKbzA8vpbQ8HHsbwPD+GVucMOyNTFQDHeEjyiUBBYj7XL9icqj
 WMBQA6IgaNUUQjwKLedY35UM6xHemlwxald1mmdoQrFq0rfk/Nlw8avHNcm81TqX4L7KAg6ulUz
 TkYMRoz1UFKv3bbhZ+E6WPAl6qXgSr498oBPa2/56UgUmJS7+PR6eahKgijJMMlNYd2EQeEGNlT
 MeJ/OPcWbMdMEVWQOF6RioWSfZBQeYhniNooe8taNZTSb07dCN1eQBoKxH84ey0KT/6o7HvEdm8
 4EL42Mx1Ua60N1ekGk5sg3G7w7G4IUzXoDK+fWJZnTVydIVGK9KiQ=
X-Received: by 2002:a17:902:a98a:b0:2ae:5eab:132e with SMTP id
 d9443c01a7336-2b5f9eb0965mr121396715ad.12.1776748510351; 
 Mon, 20 Apr 2026 22:15:10 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/37] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Tue, 21 Apr 2026 15:13:42 +1000
Message-ID: <20260421051346.41106-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


