Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F107CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAR-0007eK-Iu; Wed, 29 Apr 2026 20:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAJ-0007FL-Ln
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:03 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAH-0006V1-IP
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:03 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c7963df6f17so207661a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508520; x=1778113320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhH6fH6MOP8Z89o00i5zrQUQaeh5fKT9d43JWep2BsU=;
 b=whe3PftmloT5rXlcRVwgiujsUqg8qvyPBlgPwPa3L8Dcp2CNNywjTAVxv9VgKCvu80
 TEHXT/8Cl9+t2YoCtvgLWTuZRvC7Q4J1wRLQfMD4jY19nkI9GIYOM/GRvZwm7hFcwTay
 rgV+vDqzzVnEvh3Pc1bm6JwpsC5YCHAxtFD/lvKHfNuHV8OeDBlJqnKEvmhKAU58+EbX
 uOo8rcFUyqHu4KNNErHVUsSD42jB/HU5gyk4DtN6y06X0S38tj6nX5TxmJ5qafZWsKu9
 7NmEp5rZ4O1evRLTzMGYwhBjqi7jehb4lXlrRC5qx1mvcf/xwc55867KgauPgLuh0SES
 PRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508520; x=1778113320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZhH6fH6MOP8Z89o00i5zrQUQaeh5fKT9d43JWep2BsU=;
 b=H54IHxHfrj5gWqiXWIShDEK1qUsXl1H95XH9BZYhX9bL8qVtJjrnDwzYlj6Xi5xDRh
 7twBiCMfOb6QSnve5w3jM3SIgJCpEF8n3QMVho5nANN0zGdkOouHYftnD7tTRkfqOe5b
 aeniTnbQRVD089OweFJN06LtHUidU3djkhADuJr4Ba3ZrOtwQmsIRtdEXSnwzLmQukdl
 Q9iYc9ki1vN3VpBCee6XyB6pzPli7C+CDpkX4gMyvNNkaIOBzJQeEBNQG+azsLmkrKVg
 dZ/p8C6dN6kBMQrBJ1AeqKDwGiy1K4Zhh+iEui3M7H8jCcC/nzbKtQqObj2EuxTBiuRX
 xOkQ==
X-Gm-Message-State: AOJu0YxZaKHDwLawpuuSAMfM51AdtpomU1toGT/ZdnFiWWQp/DZThkoQ
 V1z8dC1VbtBPepuGqog4SC3rE1KrVDi3myW9bbKxPiCc+ho0M2SsoA07LBnRROAl0yc3I3vjYx9
 yZFPw/zc=
X-Gm-Gg: AeBDieuY9gXspGvgBgrgrH/yVr1+B9HApM2zXW/IWI5cQpQJuV+cJmW/fdAuktz09Ss
 +l8yfT16HHJz65A0F3ySaibItKM+gX3tLafSMejEMLA7d86atAcW+dshKWpudQdq4gtZ019AB1d
 54z6r19GXT3Me6QHD2pXPEe8XwH9X+bwuFDoRGAn8amNMVzwYEf1xfdVmcoqOovbRWiZco7h8wl
 ml5NAB3djG5r7OgDe56DlIc46rorYD90EQrry0y9jLlwTX+30yDYcKyE/+UD5qFeaCVxvpn7qaD
 zTpP5egvdkeNVXj5qtdblgycIzG6Kt8zWi63Z8wafjKERAHBIVOMQyXMKz3JZTrOcvOVe+kNlVD
 9NsXOLzSO0KDOUrpJkePW+a3zrCQNzAtwKI/pOwUQ1fcnknf1myzUm1xJU8QpepKXw1qfvg497/
 jvuERp1QPP2FtHekWF+KimTZkSEpb1+3FdpI7LghXn
X-Received: by 2002:a05:6a00:a256:b0:834:df57:9d31 with SMTP id
 d2e1a72fcca58-834fdba7411mr841606b3a.28.1777508519901; 
 Wed, 29 Apr 2026 17:21:59 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 31/47] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Thu, 30 Apr 2026 10:20:30 +1000
Message-ID: <20260430002046.59739-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
index facbf4f6c6..9c89964721 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -587,6 +587,46 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
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
+                fcvt_f16_to_fp8e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                fcvt_f16_to_fp8e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e0 = n0[H2(i)];
+            float16 e1 = n1[H2(i)];
+            d[H1(2 * i + 0)] =
+                fcvt_f16_to_fp8e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(2 * i + 1)] =
+                fcvt_f16_to_fp8e4m3(e1, ctx.scale, osc, &ctx.stat);
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
index 7276d9c44a..c7fcf27183 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4099,6 +4099,8 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
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


