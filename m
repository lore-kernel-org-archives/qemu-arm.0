Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26CEC83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucp6D-0006Xh-64; Fri, 18 Jul 2025 13:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucouv-0004yr-Kc
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucous-0000pu-Ve
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so1647465f8f.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859836; x=1753464636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKf/B8VHSsBfUBqECITYfDua3rP9fWZhGEM4I7F0JlY=;
 b=wdR6pxGtvoQ3tRrDmA/2adNUm3WyNsGXCqBgEkE80WoaussEaBhfi5nvFXNo2T3BBm
 KhAaZoJ5O5A1V1ba8Tw/abIAcsdCvwszJCo+lzlxim5cTpr17NaYyg65jHxSps5r1IsC
 +FWN8czbl4NWoUQSuOo2DqMDBGOxUwX6it5FmtmOqcL2dixq0rY4zhTVskfRaKxOIZ+q
 MK08lwHQYYLhqJYKmz65RgIPdJPNLa9U2uRnIW4XdvWhl96fxA9bAei35o0eQD2rml+/
 PSr1l/waVFmi4eFa9Zs9ZRz/XJC19UcKc5Vx6skNyZIsgdNNGiKc/LZa4ZP3aV0BKkJg
 n+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859836; x=1753464636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKf/B8VHSsBfUBqECITYfDua3rP9fWZhGEM4I7F0JlY=;
 b=FWTF3z1RY68TV93+hBfgPNFsy6CsgkofVcOyfG9yjJdKkQmv8SNIxgTeVrsTr0BsrJ
 p8ezDRiUX4aHNakaLsfugjfQYgrWPmvnKvnbLweLN3TYeOFRu2Jhr15C5fVEsW/1wJXn
 w8Lp+KRXQ6jA5wUB3pc0LIa28zmTfZjQD4ZK1kP66zQjlI5kWGtcIbYihgUyNO5vKBZm
 4TO7/ygsQdh/P0rIbDKK9sU6JfXR+tgthInNma53EBopFkXRL1FOP48eBtO9h87b/Td6
 dzDoQD35mspLW+iiUtIUNNfKg4EAgRKv83DV1vOWauaS8mAjk/TsgwJ3jdbDQx5H4N7j
 h+5Q==
X-Gm-Message-State: AOJu0YzJmSrWhOzObP6y4gYPl9ajYR9raLi82QQQe3elkiowYgT6Cao4
 lYeAKSn2enRLl5myQlLlhMkTAj8q179rfhON18iZHzbGPEXnO6x4EnvoAkWofugkXF3yaQJT8DT
 lhvQW
X-Gm-Gg: ASbGncuivnByD9XYk6QTP8UdgkoLNs93cwGPyNjeicEJVxVW7oTykuahm5VA3W/AMX/
 xtrGK9JmUsVJZOZ79NPeX9K3T3xvhFq6b7rrKZQQ+JB2Exc4p97ykPOdp+HEIFwHpGnQsNk1G9J
 ftz9jZ6H06s0wNKOQgOKVHdZB4ORv6Ndi9R5t9rdqw8yEvY2CAJBxnEKUUhp1Yl0EhGq+VFumS6
 RF+Uqai4TepLMSiPCM3MQ+Vp/GpUWR+4D7c1bJGhug5XBjRd0f4lSf1gPLfLIyVkKNxN/u5FrBl
 BmdX7cswJIHiNhn0i8O6MAO2lEsGc+/dOPcuRB5QROlvrVmD/s3WTYszqhXVnUNYd98enckj3QO
 ErzciGHdltqGwO3Mm3/FpSJwOg6JA
X-Google-Smtp-Source: AGHT+IEgNdhiz0KsbxfjF3n3pcGcpcrzTZcB5zmCjOLwN7kmeBH4xUvtwkyKLdlX81FnA+fDwqwHnA==
X-Received: by 2002:a05:6000:2309:b0:3a4:dfa9:ce28 with SMTP id
 ffacd0b85a97d-3b60e4be284mr10090209f8f.5.1752859835902; 
 Fri, 18 Jul 2025 10:30:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 01/10] target/arm: Add BFADD, BFSUB,
 BFMUL (unpredicated)
Date: Fri, 18 Jul 2025 18:30:23 +0100
Message-ID: <20250718173032.2498900-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718173032.2498900-1-peter.maydell@linaro.org>
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

FEAT_SVE_B16B16 adds bfloat16 versions of the SVE floating point
(unpredicated) instructions, which are encoded via sz==0b00.

Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper.h        | 3 +++
 target/arm/tcg/translate-sve.c | 6 +++++-
 target/arm/tcg/vec_helper.c    | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 0a006d95142..d9ca5b7c56e 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -728,16 +728,19 @@ DEF_HELPER_FLAGS_4(gvec_fclt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_fclt0_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_fclt0_d, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fadd_b16, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_bfadd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fsub_b16, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fsub_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fsub_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fsub_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_bfsub, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmul_b16, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7b575734fde..f00cccf1548 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -190,6 +190,10 @@ static bool gen_gvec_fpst_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 static bool gen_gvec_fpst_arg_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
                                   arg_rrr_esz *a, int data)
 {
+    /* These insns use MO_8 to encode BFloat16 */
+    if (a->esz == MO_8 && !dc_isar_feature(aa64_sve_b16b16, s)) {
+        return false;
+    }
     return gen_gvec_fpst_zzz(s, fn, a->rd, a->rn, a->rm, data,
                              a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 }
@@ -4146,7 +4150,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
 
 #define DO_FP3(NAME, name) \
     static gen_helper_gvec_3_ptr * const name##_fns[4] = {          \
-        NULL, gen_helper_gvec_##name##_h,                           \
+        gen_helper_gvec_##name##_b16, gen_helper_gvec_##name##_h,   \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
     TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_arg_zzz, name##_fns[a->esz], a, 0)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index bae6165b505..76a9ab0da39 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1467,16 +1467,19 @@ void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
     clear_tail(d, oprsz, simd_maxsz(desc));                                \
 }
 
+DO_3OP(gvec_fadd_b16, bfloat16_add, float16)
 DO_3OP(gvec_fadd_h, float16_add, float16)
 DO_3OP(gvec_fadd_s, float32_add, float32)
 DO_3OP(gvec_fadd_d, float64_add, float64)
 DO_3OP(gvec_bfadd, bfloat16_add, bfloat16)
 
+DO_3OP(gvec_fsub_b16, bfloat16_sub, float16)
 DO_3OP(gvec_fsub_h, float16_sub, float16)
 DO_3OP(gvec_fsub_s, float32_sub, float32)
 DO_3OP(gvec_fsub_d, float64_sub, float64)
 DO_3OP(gvec_bfsub, bfloat16_sub, bfloat16)
 
+DO_3OP(gvec_fmul_b16, bfloat16_mul, float16)
 DO_3OP(gvec_fmul_h, float16_mul, float16)
 DO_3OP(gvec_fmul_s, float32_mul, float32)
 DO_3OP(gvec_fmul_d, float64_mul, float64)
-- 
2.43.0


