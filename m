Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD22CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:30:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcI5-0006ic-RL; Tue, 02 Jun 2026 23:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI4-0006h2-Am
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI2-0003fN-Ce
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:12 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-842307473b5so2558269b3a.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457349; x=1781062149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r41k7hp2Q+5ha2UX8W8KuldhcDvQ3TFyKKDFHS1QckA=;
 b=Ur1CkYNNOs9D7Z2NjEk+IEZVs5jI6yQ1ouSTA9WX3OAaXB5CnwswJC61LCivPXZsFE
 HME7UNG8pJUhh967p6OTxkq72b7xQHIvGOOwHO9jc+Kgiw+Uul2/2mm0S0wnSjtXeRuU
 3bDWqHJBfYWV7MzvQ1a9zgsRREWu5A3goKw+qpgf+OXGpMm4wZgnnidBNDngDwlkUjaJ
 fbB18yhm/OKL0PtM6VLCgUlUeqNmhSGS7cJVSoEj0yOXRlyvirL8citpAYYweE+YKY1i
 BArliCvwLfxpBmaNm6qb8B5uQX+Nqrb6QU9ykjT9EkXbr6LE3Hmf+k2f9bQhqR/NCOcB
 LQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457349; x=1781062149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r41k7hp2Q+5ha2UX8W8KuldhcDvQ3TFyKKDFHS1QckA=;
 b=C8RbNRyEUl8pplidTo8lo/hgdJcLgAaLuum+AOO6uu43yvSr5Wr1iV/mH5K2Ti2Mqf
 OI2d9NDxuTMRrpbIeQx5s3rgWqbDOCfh10r1Y2Th672KhNXvH37qHuRBYBjzySqByc8f
 o43GnJLWeFRhzGn9wvIDpOgAfObjoW5YkKNOR3YICp+yH+vUjxIU+SCNwvJfVvZ9Xp0y
 SQrF7JIjokuboeohLXqM4gXjIVPczVBmQOdlTO2KVtOdSox+G1fXLDbETOEEk5Fa+AZS
 U3F6nSCZz2bWDGvg8le7RfACiJ2ZWTd98ZfSFtoon8gR+8IEHqMMUWA93+uCFBNiTQON
 cLbg==
X-Gm-Message-State: AOJu0YzxM3eSuECdOb3t9x3V97KS2Ii92dSsSmT9hfvqplQMUafDJvbA
 nNd0rzmct0L/AebrrBnZf34GtRm8Hgm9AaRraCjnLNs0j5IPVcBcMrBeeRFtbCWxBpg=
X-Gm-Gg: Acq92OGyiCeWWsjImzupYiyp+8GsL/yu5AbHiH7rLPNVnz+XXji+lwF0h/DHJp/ADq2
 3MTQAUx9nff+s5airzq0un6YznaNy6iFyNcmWSvSy8KOj9LKRk2+BUiIekpYMseouSgeV7p/B+i
 fvoGyLHne+cNtHQ3Q2kbG5mB3FF/dA3j6vOYYR/8IhS3ugG+8dXQ6X6IbFrsG06LZ3VYeXuNidY
 1VERqhHb68o17h0pJR37xXqVwy6Pb+pCYbdVJF+EsZ59v8zhRfTEnS3NV/lSyLXmsy1sKeyKKvJ
 szPozlSv/jU2XC0/o89Y8fiPmxrkL1CB8BHJ4+dbpMxytFsdBvp+rSnRVnEN09Tyoc8u/lIqP+h
 4LILUDqZcy8mjZYCcDa9tSTWyNKfLmzgJJlxZOv7ppysHZcWaSOJ/CNw6xeIqKZbyvLyI9T6BmB
 AtE0Tfd5N47gQ9tjtKISE74RAoPFfa84H8EtyXh5Y=
X-Received: by 2002:a05:6a00:b483:b0:842:2ddb:e303 with SMTP id
 d2e1a72fcca58-84284da5a08mr1657628b3a.12.1780457348886; 
 Tue, 02 Jun 2026 20:29:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 18/45] target/arm: Implement FCVTNB, FCVTNT for SVE
Date: Tue,  2 Jun 2026 20:28:27 -0700
Message-ID: <20260603032855.106930-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  4 +++
 target/arm/tcg/sve.decode        |  2 ++
 4 files changed, 55 insertions(+)

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
index 8295725b83..3bd57ff350 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -462,3 +462,50 @@ void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
     fp8_cvt_finish(env, &ctx);
     clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
 }
+
+void HELPER(sve2_fcvtnb_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint16_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float32 e0 = n0[H4(i)];
+        float32 e1 = n1[H4(i)];
+        /* Zero-extend uint8_t to clear the odd lanes. */
+        d[H2(2 * i + 0)] = fcvt_f32_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H2(2 * i + 1)] = fcvt_f32_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
+void HELPER(sve2_fcvtnt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float32 e0 = n0[H4(i)];
+        float32 e1 = n1[H4(i)];
+        d[H1(4 * i + 1)] = fcvt_f32_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(4 * i + 3)] = fcvt_f32_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index df2b89cad6..63fd1fe3db 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4104,6 +4104,10 @@ TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
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
index 806953bc35..72755b27af 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1103,6 +1103,8 @@ BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
 FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+FCVTNB          01100101 00 001 010 001101 ....0 .....          @rd_rnx2 esz=2
+FCVTNT          01100101 00 001 010 001111 ....0 .....          @rd_rnx2 esz=2
 
 ### SVE FP Compare with Zero Group
 
-- 
2.43.0


