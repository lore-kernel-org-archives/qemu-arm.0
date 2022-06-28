Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2895638lft;
        Mon, 27 Jun 2022 21:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzUTvqG9MvfT0lYS0Z381LR4986+0kKbxKdTVykXCrKxI8Z1fry1Uw9jBygKAjcZ3edXc0
X-Received: by 2002:a37:9d47:0:b0:6af:21c6:2757 with SMTP id g68-20020a379d47000000b006af21c62757mr6311984qke.169.1656392013016;
        Mon, 27 Jun 2022 21:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392013; cv=none;
        d=google.com; s=arc-20160816;
        b=eS9DLSf3zaxivHf1TlFBKwCu2ULJO9hgo2vBMe30KjUbyb1jPZacR+JaXNM8EifxRL
         wDWxWFLrEzzkKfAybpc49r4r5RLyJC6qmtgxEy+Nl0Bkl1zeIiMZzIqgfqxjQLMrciGJ
         lm9syAJ81nFwYfEh8rXPmtlxtjEtGIgvMs+a1RY55YKAVrcakNUGEdCGbMYGY0KzdM/8
         LKXIaaewS8E+0gwSDd7zshFgpaWRZNTom4uXwA5UTPPV1hlaD6/gIZyLkoaJevCyUoiZ
         RXA6vvBF0RHtTHEeac6sJWncAFwwmkXdu2OegKzB80CMg15dTrhdgMfKPTZWImdQH+Mm
         xoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jaoQinxUaximkiCoQcc+UCRePY0G4BJDjQPWJn5V2Us=;
        b=tnW1vwxzhmKSUGCmyx+YYAwspF+xDssHVsdyVr+PMvo9YesivIcJlpUiPEoG9UWE35
         xIey/1RC+0OzNjMWVgVdUPmbqxQsKbt1sNAHlNC13dQGv5v/MlQdf8vG8yLrpNXK1/uR
         mJYHCx+7QG1h/JI8B7lDKqqVoByCkECGZieVtS6eckIUiLldvgzDy6Tfda6KCJ2p0Nvz
         Nm9oYm2oQKwNS4taYZADMiKe9bEoWAJVgonK579uR8YFVjgsnmOPTdckH7ZOKnjLDprh
         +NLDKIi57hPyRs00bF1fd7dxb06yvUdlik1fbx552GgP2aw/zYQbLB/18MLIVXeEKoL4
         hyJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zw55OJt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25-20020ae9c319000000b006a6c16be691si6473820qkg.498.2022.06.27.21.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zw55OJt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63EC-0000fL-Ea
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k7-0002KX-Vr
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:28 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k5-0003nk-Sc
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:27 -0400
Received: by mail-pf1-x42a.google.com with SMTP id bo5so10902827pfb.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaoQinxUaximkiCoQcc+UCRePY0G4BJDjQPWJn5V2Us=;
 b=zw55OJt2BihFiphDe/Z2gaV4hB6htx3vFjuaas04x2wh969T7ss4f8WBe4L+BlIMcb
 MqCzJDXESjd+BHZoCzjlz7ZTRPHopCv/LR2FokgewLycw+7AoN2yVZPjIW6phaxbWzRV
 xPKXU+ppWJjUkqCE5G0o1J/cft9HjISVF8++lmT2hZ7l+Iwj/ufg0F+3jsJRan0+PxIF
 RqT3UQKtj6LJcJ8phcyiiHqmkxQc4hq+j8AvxDMvIAODydcwLcY7Z189AfYZEcx97CuJ
 A3uBju3tVKA1+YfYeAAzdXlPZj6J7gjpI4dA0MDkk/Rqb3hD0UDnvGwBZrY/fQ7WPnm8
 glQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaoQinxUaximkiCoQcc+UCRePY0G4BJDjQPWJn5V2Us=;
 b=tI9zWLh5xHvVqKJXB17EXV/aLAC/bjY5lKN8cfXW/U1SWbT6EyRsiBhzwIf/FjzuC2
 1HC1q2oSAwd4WgpcNeRhpNO7AMkeCBjj0nK9upyJKXEPleTHVfVvZ5b0MO3d5qxn4vKn
 UceJevqsO7FxTRokTC73pZn0ZcsiGJWVKoCt0L3PwWAjOSCxkIokY2XusW9cHbtcgru7
 y2Fe93OnyIug12Rqr8J18vM1n7Y4lzZJ9VzzwtXamUdo04HpsDz1/9YxYb9Zdi9RMg/i
 GgdZ24ILP1AoVqjzP1GM8hVjpF4Cwq/AgbHvxPyfnRJ0kozwXk2riUXvuBA+FhAqdZYl
 Qo2g==
X-Gm-Message-State: AJIora+iakek9gHl/G9xUUV1nowta8OtLCFOIM4uq8YlRFtiqWNeUsSY
 RxvmS/NbVYfgchUEmcQgae59AhGTtNBEZQ==
X-Received: by 2002:a63:36cc:0:b0:40c:5301:7fe2 with SMTP id
 d195-20020a6336cc000000b0040c53017fe2mr15472584pga.547.1656390143786; 
 Mon, 27 Jun 2022 21:22:23 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 26/45] target/arm: Implement FMOPA, FMOPS (widening)
Date: Tue, 28 Jun 2022 09:50:58 +0530
Message-Id: <20220628042117.368549-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IR1OM66vaCZb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  1 +
 target/arm/sme_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  1 +
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 1d68fb8c74..4d5d05db3a 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -121,6 +121,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffd..e8d27fd8a0 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index d2e1057124..39d630a91c 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -978,6 +978,74 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s_std, float_status *s_odd)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
+    float64 t64;
+    float32 t32;
+
+    /*
+     * The ARM pseudocode function FPDot performs both multiplies
+     * and the add with a single rounding operation.  Emulate this
+     * by performing the first multiply in round-to-odd, then doing
+     * the second multiply as fused multiply-add, and rounding to
+     * float32 all in one step.
+     */
+    t64 = float64_mul(e1r, e2r, s_odd);
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s_std);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s_std);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst_odd, fpst_std = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst_std);
+    fpst_odd = fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + row * sizeof(ARMVectorReg);
+            uint32_t n = *(uint32_t *)(vzn + row);
+
+            n = f16mop_adj_pair(n, pa, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pb = pm[H2(col >> 4)];
+                do {
+                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {
+                        uint32_t *a = vza_row + col;
+                        uint32_t m = *(uint32_t *)(vzm + col);
+
+                        m = f16mop_adj_pair(m, pb, neg);
+                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
+
+                        col += 4;
+                        pb >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            pa >>= 4;
+        } while (row & 15);
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index e537a14b6d..0fcb33cb3f 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -358,6 +358,7 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
 
-- 
2.34.1

