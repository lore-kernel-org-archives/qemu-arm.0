Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA0EA7184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:16:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sj-0000as-9T; Tue, 21 Apr 2026 01:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S8-0008VR-69
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3S6-0006vE-Bh
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-35d94f4ee36so2233230a91.3
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748513; x=1777353313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WADg8Bv+oZ53s3C00yS+/mTr8WhaGyfIt8vkJcIP8Zg=;
 b=AoYY1mAPoknKGzeNIGDJePkIUQDtZsSbsdpxV4bCXXD0WQDY9CizxdSqzdmmUwZYP+
 5TlnxBWAFIFqzjgLbszkCnKTaJ4nmMKblIK3IQqzcVzzceDKIXOC7p999VvJ73a6Ueb5
 65gCtPuFz/qnCIsqOl8sjCvMz0aVAjc9aqtk3dTvsNoGfNRGFfMtlPmqH3Du0jJ/L/+X
 lCr1SNOtf3k6/Rd+yhocu2HQR0winsUDtK1D4N2m22XqoiSYmQOMhJAkkcFdpNbEPluA
 q+u8TJIWi6gwXFr+KXpkKl4yDIx6z0cyGQ8DuQXfyNBu3xZtONsP3necYYtM18ubH7hx
 IVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748513; x=1777353313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WADg8Bv+oZ53s3C00yS+/mTr8WhaGyfIt8vkJcIP8Zg=;
 b=kXk5sUoR7vw+yhe9rbd0YHPMXZgMt3RciTzS0OEaO0CEezPNRlFRJ0EFuXilYjKgTk
 J5aNqt7KhsI4Fx0zusxmm2bk6x0ck9dzwxae9vOgn4/DArdxc8JiD2CbERszOw9whNIe
 3mwKqML6sFghye+s0xzMJnt8uNt93QHL5Jdoymv5SxFvoR8eJGJF6f2OICeTJyAtD/YO
 dq+2lNuy5Av1xoYR6Qd5NRXQtT4bkex5uWoRqff0881/Iw63Dv8GyzO9fJQwJ1QlySC6
 hr0OHODxgYZbwkP+r3aEaVYDZg8XnDabbYkzi+zVZBf0MtLLQDl6detkM8Sg993kaNYb
 mu+w==
X-Gm-Message-State: AOJu0Yxdm2gpekaqe2x/lXbkiE6p0bsSNBOmS/MQtB94pVUDriOJ6uVa
 V2N9iMgoKMr1nVoNLDmbfytFypsT3MdfaFK3snjaUDKJ3C98OyAdh1bRJEtvQ+bEPfqy/mQcMDE
 ++muyaJM=
X-Gm-Gg: AeBDietzF7dMF2R0htNWtfEdxSvvXZWLYzj2vBtMK3cR2BcPGkUPb4BQZ8Vhbtz4Ct/
 bBL2WDg4XCuioF7TiLnykW15kVg4/jbKPhWY1iNkG4W0WYXeSeUm6dC0WdgN3aBocNetojlitXw
 3SeZMhWBBBF9FpkEOFUjxY1S1Fk0q30HfaLHaXNbtO9bVrYTSv+PwZVVf+PshOJxe52VDCYdKt/
 FMLVLTgNo3FMlRw6SVUAFK8WDtlFBKp3m4B2RD84x36zzja/tjJ+gVPtGvWRlGkq12FaNxWGOhQ
 SZ3WFwARlDV21pzmij53ZULMGUxtruV1nfQGrWX9tQHdgpZToUuS3K6li6yT4rJEZiivQpEIOVx
 eOCo4JjMrOShLuMCQvPE1r+yksK+v3N8gFrvQfoJ8riVMu220dsomNxIWku2q+M8Z56Ja09uYgt
 TC7VNBLwNZVZLzBy4EZVFQU0rcT1fiKOKCNAoJMmLl
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id
 d9443c01a7336-2b5f9f4f562mr175894935ad.27.1776748512724; 
 Mon, 20 Apr 2026 22:15:12 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/37] target/arm: Implement FCVTNB, FCVTNT for SVE
Date: Tue, 21 Apr 2026 15:13:43 +1000
Message-ID: <20260421051346.41106-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 +
 target/arm/tcg/fp8_helper.c      | 85 +++++++++++++++++++++++++++++++-
 target/arm/tcg/translate-sve.c   |  4 ++
 target/arm/tcg/sve.decode        |  2 +
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index e67fb191c2..5863a6dbb8 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -19,3 +19,5 @@ DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnb_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 9bc1349950..ebd448b466 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -520,7 +520,6 @@ void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_finish(env, &ctx);
 }
 
-
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
@@ -562,3 +561,87 @@ void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
     fp8_finish(env, &ctx);
     clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
 }
+
+void HELPER(sve2_fcvtnb_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint16_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H2(2 * i + 0)] =
+                float32_to_float8_e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H2(2 * i + 1)] =
+                float32_to_float8_e5m2(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            d[H2(2 * i + 0)] =
+                float32_to_float8_e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H2(2 * i + 1)] =
+                float32_to_float8_e4m3(e1, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        for (size_t i = 0; i < oprsz; i += 8) {
+            *(uint64_t *)(vd + i) = 0x00ff00ff00ff00ffull;
+        }
+        float_raise(float_flag_invalid, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
+
+void HELPER(sve2_fcvtnt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            uint8_t d0 = float32_to_float8_e5m2(e0, ctx.scale, osc, &ctx.stat);
+            uint8_t d1 = float32_to_float8_e5m2(e1, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 1)] = d0;
+            d[H1(4 * i + 3)] = d1;
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            uint8_t d0 = float32_to_float8_e4m3(e0, ctx.scale, osc, &ctx.stat);
+            uint8_t d1 = float32_to_float8_e4m3(e1, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 1)] = d0;
+            d[H1(4 * i + 3)] = d1;
+        }
+        break;
+    default:
+        for (size_t i = 0; i < oprsz; i += 8) {
+            *(uint64_t *)(vd + i) |= 0xff00ff00ff00ff00ull;
+        }
+        float_raise(float_flag_invalid, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 319a28e94a..eff3e71ade 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4102,6 +4102,10 @@ TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
+TRANS_FEAT(FCVTNB, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnb_bs, false, false)
+TRANS_FEAT(FCVTNT, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnt_bs, false, false)
 
 /*
  *** SVE Floating Point Compare with Zero Group
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 806953bc35..7fce189b36 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1103,6 +1103,8 @@ BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
 FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+FCVTNB          01100101 00 001 010 001101 ....0 .....          @rd_rnx2 esz=1
+FCVTNT          01100101 00 001 010 001111 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
 
-- 
2.43.0


