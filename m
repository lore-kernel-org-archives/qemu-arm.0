Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36C0CD98F8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:16:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4Ao-0005rV-PQ; Thu, 18 Jun 2026 00:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4AA-0005WY-Gh
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A8-0005d7-CI
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-36dac5d5da0so177683a91.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756131; x=1782360931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Db7C2RFrWmKnSC2L2bY8BTdfGjmOikfBSA1gRuOEqcw=;
 b=KiACVgrpxix/U3jnZwyWrOtxLeWhdckGRXyx65oJMAxF/iHET/k4uaC+wAfuj1EOAq
 EccZq/vVtcqLWMjLjECjPSkiCNKOjCo9OhSEIBSNtmE1f41qnu0YY9VCfJsscM6Pyc/U
 fE7mjmHFWBOhss0tFA4Dz+xXEadpcGaCXtv/KzdiCVvnysf79YrdS3Fn73WRRkqGIGnu
 ++WTxomkO2m3KHILxhtqUKeyirzP9U88S0Oz6XuH8kHLKFOlXmKBZuLdZRqJIASULl/h
 ya1PFt/AkEVoIacC+exmTiJQMraS0b6QcYdy8h8ONWmT46I34XaCzMUoGZzkNSCX3ZTP
 TY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756131; x=1782360931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Db7C2RFrWmKnSC2L2bY8BTdfGjmOikfBSA1gRuOEqcw=;
 b=oAIM1Thi30qHHIKi9+4X/M/C72pZe9cffXs/MN9JeALjYcwpIpx761JF6ugCMHYnc/
 dIlsnwaJl0CwqUSPi4JhdK7pHH997NZ2KGO3edEBq9RLfTjI28EExz8yxQTons3bBJPi
 b1gZWodNY5wKuTNLGJmmPUvNtF3pey0P5L8F8KqsUY/4ZmfEpaGC/TwC7V95qEMm5prj
 hz425Jh1E8+JqXo82K/3MKhNgGeptnbwl1NeuiOgMCo8ISaiyWQx+sAIILDS9PzwcxP5
 xEa+Lyc7cTaGYkNdsDPySLpuqwh+0tDYGY/N5HHAPyDuwdpSEKkAZMY5bckYv/ItFDXn
 ym3g==
X-Gm-Message-State: AOJu0Yy/CFifpiFMzxUaqrLvQ0rmrqoX/EkSAf7DRlckTUDYaHW5lofq
 11vHComdEk/e2jgJHVvot9NOK2QaCVeJP8YnNWApQY1gBSafLJZ0pP9SuBsbr773JcoFg1NKGR+
 I8zS4
X-Gm-Gg: AfdE7ckcCVF8hAAzMuZprkCIyrjuhzsORz9ObaW+31rIaXlJhlBtgIEKoUInyRluchY
 yDE+DhBnAMt18wcOYR3g7401yj8VVybjpfBQVIIiPk20Qx2kg+DrXwUDYiGzikLl8rKi9u2D8GG
 3YR6JiGFwbwxmKCepFPHfZmcmdexcAFtoBI7UF0QR4czfLj+yBJ7+80TnPkdTNMksYBjZqDpR9r
 AdYNkq7cEAMct9pHpo27hOkKRwAh5nejeIuyUXthyY8kWASJ6W/GE63ch6Fm5tWassnhinKTga4
 kXjLbYX9QRFV9S3qt6AW6JNzR6e6sgB6hdIMRRc/g0/uO6Ib/37WqvTNvjrIs8tOKNm85u+PAvJ
 dhYV/ukXJiTifyyIgN/yBECXEBUwlOiRaUTeBrag+c24H2hAZJ5ASYuS7WkPnAczqkhdeunntw8
 oZvYAM96FZf8gj66s02figFIBuIOizqhBk+zMH8vz3ld9UeD235w==
X-Received: by 2002:a17:902:ebc4:b0:2c2:dadd:940 with SMTP id
 d9443c01a7336-2c6bbfa11c5mr73801055ad.2.1781756130610; 
 Wed, 17 Jun 2026 21:15:30 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/10] target/arm: Implement FVDOTB, FVDOTT
Date: Wed, 17 Jun 2026 21:15:16 -0700
Message-ID: <20260618041517.573469-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 target/arm/tcg/fp8_helper.c      | 23 +++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 10 ++++++++++
 target/arm/tcg/sme.decode        |  7 +++++++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 7c090ccad6..ef1375fea7 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -40,3 +40,5 @@ DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32
 DEF_HELPER_FLAGS_5(gvec_fmmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_7(sme_fmopa_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(sme_fvdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 08e04364fa..3c2d959099 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -892,3 +892,26 @@ void HELPER(sme_fmopa_sb)(void *vza, void *vzn, void *vzm, void *vpn,
         } while (row & 15);
     }
 }
+
+void HELPER(sme_fvdot_idx_sb)(void *vd, void *vn, void *vm,
+                              CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, -1);
+    intptr_t oprsz = simd_maxsz(desc);
+    intptr_t elements = oprsz / sizeof(float32);
+    int idx_n = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int idx_m = extract32(desc, SIMD_DATA_SHIFT + 2, 3);
+    float32 *d = vd;
+    uint8_t *n0 = vn;
+    uint8_t *n1 = vn + sizeof(ARMVectorReg);
+    uint16_t *m = vm;
+    intptr_t i = 0;
+
+    do {
+        uint16_t mm = m[H2(2 * i + idx_m)];
+        do {
+            uint16_t nn = n0[H1(4 * i + idx_n)] | (n1[H1(4 * i + idx_n)] << 8);
+            d[H4(i)] = f8dotadd_s(nn, mm, 2, d[H4(i)], &ctx);
+        } while (++i & 3);
+    } while (i < elements);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index a9adaa02bd..a79b0a9b80 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1233,6 +1233,16 @@ static bool do_vdot(DisasContext *s, arg_azx_n *a, gen_helper_gvec_4_ptr *fn)
 TRANS_FEAT(FVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_fvdot_idx_h)
 TRANS_FEAT(BFVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_bfvdot_idx)
 
+static bool do_fvdot_sb(DisasContext *s, arg_azx_n *a, bool top)
+{
+    return do_azz_acc_fp8(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                          (2 * a->idx + top) << 2, 0, false,
+                          gen_helper_sme_fvdot_idx_sb);
+}
+
+TRANS_FEAT(FVDOTB_sb, aa64_sme_f8f32, do_fvdot_sb, a, false)
+TRANS_FEAT(FVDOTT_sb, aa64_sme_f8f32, do_fvdot_sb, a, true)
+
 static bool do_fmla(DisasContext *s, arg_azz_n *a, bool multi,
                     ARMFPStatusFlavour fpst, gen_helper_gvec_3_ptr *fn)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 7324ccddac..1de5f341ef 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -784,6 +784,13 @@ FMLALL_nx_b     11000001 0001 .... 1 .. 0.. ...10 00.. .    @azx_4x1_i4_o1
 FDOT_nx_b       11000001 0101 .... 0 .. 0.. ....1 11 ...    @azx_2x1_i2_o3
 FDOT_nx_b       11000001 0101 .... 1 .. 0.. ...00 01 ...    @azx_4x1_i2_o3
 
+%idx2_10_3      10:1 3:1
+@azx_4x2_i2_o3  ........ .... zm:4 . .. ... .... ... off:3 \
+                &azx_n n=4 rv=%mova_rv zn=%zn_ax2 idx=%idx2_10_3
+
+FVDOTB_sb       11000001 1101 .... 0 .. 01. ....0 0. ...    @azx_4x2_i2_o3
+FVDOTT_sb       11000001 1101 .... 0 .. 01. ....0 1. ...    @azx_4x2_i2_o3
+
 ### SME2 Add / Sub array accumulators
 
 ADD_aaz_s       11000001 101 000000 .. 111 ....0 10 ...     @az_2x2_o3
-- 
2.43.0


