Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2431437lfb;
        Tue, 7 Jun 2022 14:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxedIcP3j91C72ysLuhGc8RLMHtq79WjSKClLe+ggIo8ACtE/ZfvBspxVR4sHGh0AEtHn/u
X-Received: by 2002:a37:a16:0:b0:6a6:8e35:a37d with SMTP id 22-20020a370a16000000b006a68e35a37dmr17739789qkk.401.1654637974981;
        Tue, 07 Jun 2022 14:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637974; cv=none;
        d=google.com; s=arc-20160816;
        b=o7cJ5wEQNYXwMbOemDPz826rWf80T6XGhO+28COXT/HiuiY+R2DH9snEcIlRtVSUI9
         k+q92+krIkl7Pqe8Ij/huzT6yDDOXphq1AGsQCSMO+IYOBczduufAyKjSI/IoXQpwpx1
         IJ2Ll9Lfj5MJt3v8+otZ6jvcHuiXX6dWRt26nXcXRJh4Q1xxzQ5rf/jGshHdk1JPp+vw
         EpIPGA/2R3TzC59BSpVB1UHnSzi+cnFKt7ix2jFJD0jXc0n0WUSbSQFMKG+5dKf/yAZ7
         w9bEF4/K7mvGn8VmAJlU+0c/9UxqZfsGNsobc+i8KO3liE+qW1K7m55AokyK9W/8fzUM
         +WKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EVICy9Y6fCRdAU+92OA2KWmzp+fTiCj9J1NJfjmnfMI=;
        b=TtMO9zbUItPDPhjumHFLXQ7hxK6JYneO7hTzb+NxYlymq2YFuRPuKA5lyZ9/YaMlbH
         C2gkEXCPJbVjzEPRfmsD438qiRLEGRRoh7h3Q8NK/aicz7thz/5XxhOlGl7seufzRmK3
         LySRSkGK1pSRUSyXhW433BWqjyLyhevsG0NlfHm7KYoglRmOSgLZetU5TspMRean1htQ
         yGDYKMtWhdMPrSXXPjsNTxi0pDZIs8aVPLmDtVubEb8boeS7DueqyfC4i/NdgEiEllyg
         1lmWHgUXE9yqjX33Y0WTl9VwgNGfXB79bOSyeRRU9G15sFCKyewcfOBNN+CdLT1WRZjI
         5kRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7b6obt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p68-20020a37bf47000000b0069eea440dd9si9129828qkf.396.2022.06.07.14.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7b6obt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygvG-0004Bh-Fb
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwm-0006nI-F4
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwf-0008Hy-Fv
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n8so15830195plh.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVICy9Y6fCRdAU+92OA2KWmzp+fTiCj9J1NJfjmnfMI=;
 b=x7b6obt2+2220WwOtOo2MIQkFth2X3/w6L3TIHptmadFMYSL5aZDCnTtjAlpzr10cM
 gBYydCtGdVMo4X2XZr2bdxH8BiZq/b9QHyK5tYAgGcsK4rz6rsVbsPg4TBOF48NA1H10
 gBWd7mX3BckQpGB7dKfRyCxeMFZCci/wUj2Lz3SVCf8eJMgNRj5obnhUwfSI5J6b2rL8
 MJwmbxzXlBextiub6IOYjdNKWHlo/Yo1e1NHvDImzJlnt17WDY5qJodoDOJhpsVILmkQ
 E95Tq2V8853b8/ygWDyXvmqUCDFuzZ0ek7G5FXqO+7EZ9xntfbdzXpygvJ98T7dFQZO5
 oAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVICy9Y6fCRdAU+92OA2KWmzp+fTiCj9J1NJfjmnfMI=;
 b=od7B4DPbHjDLx087PI8V5HKc4Gpg7R+TZNb1pYViQPv14ZByn1QPysZRn8jAXKRhLO
 y1zcwPeXv9ERRkx+cpC5QFBFOlVUWjqg1OYLfx/NRVp2srW78S1ZFPFTutOmY0WEE6z9
 R0aPPprnnzGxp7nE7pC6F5Y5+RKYgHX0/N7udTaOOkijyi2oTVGsd/VSNKg9rqQ0gBhv
 Q3zendQ4kCGTELRk3Alw7CtPXqB5Qs4L3MSMtNWQJtRhxjL5lWLU+2HmRGurQzWTEXoR
 522Qim2guv+P0vJxa13ysdGUYL7wXHLw6As7C8oPswMUjCZl+HzmvpzYrOg9a7hmP8dn
 BFiw==
X-Gm-Message-State: AOAM532m5ttqBlZkLi6YHzTS3e138oNEUFofWlsyze4lveL8FG0YNWYR
 Xxju61gbB1+LcA/doD+mGa+xiFSLIkqeVA==
X-Received: by 2002:a17:902:ab42:b0:165:7d40:fa80 with SMTP id
 ij2-20020a170902ab4200b001657d40fa80mr30861706plb.43.1654634216205; 
 Tue, 07 Jun 2022 13:36:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 52/71] target/arm: Implement FMOPA, FMOPS (widening)
Date: Tue,  7 Jun 2022 13:32:47 -0700
Message-Id: <20220607203306.657998-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: s/48TPrNf68n

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  2 ++
 target/arm/sme.decode      |  1 +
 4 files changed, 79 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 6b36542133..ecc957be14 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -120,6 +120,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 61bab73cb7..6863a204d4 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -981,6 +981,80 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s);
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
+    FloatRoundMode old_rm = get_float_rounding_mode(s);
+    set_float_rounding_mode(float_round_to_odd, s);
+
+    t64 = float64_mul(e1r, e2r, s);
+
+    set_float_rounding_mode(old_rm, s);
+
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
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
+                        *a = f16_dotadd(*a, n, m, vst);
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
+
+    set_default_nan_mode(save_dn, vst);
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 581bf9174f..847f2274b1 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -328,6 +328,8 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst,
+           a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst,
            a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffd..e8d27fd8a0 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
-- 
2.34.1

