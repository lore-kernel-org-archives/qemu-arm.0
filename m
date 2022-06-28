Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2889287lft;
        Mon, 27 Jun 2022 21:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/eH3SOokvMKmA2riv8LvPtogYVve/vHSxT0NB/4cDmPJJ0Cl9ETSQwgk0dfSHKJSO/PX4
X-Received: by 2002:ae9:de84:0:b0:6af:a5a:ccd6 with SMTP id s126-20020ae9de84000000b006af0a5accd6mr9615371qkf.686.1656391011650;
        Mon, 27 Jun 2022 21:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391011; cv=none;
        d=google.com; s=arc-20160816;
        b=dI6dnkaRSrUPBD2gYAMCAbFfA2ziH/wWlmioxOjjLsPqvVyzGFhpxSTiIeqcz+NISF
         A/1zWO/bPlal7t0gorTYh2fxnFkI9HYqZuYYDpInPEpzuRLuXMktwg8Exts8ZktDoSsJ
         f1mm3cUL4zEzBPeVlZkwTCIzz68WDnJlEVSp5sbpb3tzORObqp2jaHCY8L9pT2wU9YMj
         PdczSUE6k+mo1Dv4GE+X5KbGSa9vg4P9BAZjSet+sL8Az1mzvdsQl7sSoCh5WGs8sJhh
         J+CjUgSNi45GIyGTbZ8yQaf9qPVyKgSd+fVhByeJYIFxh9BkTWfiMeV5bZBXJVZZbRTM
         sSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=29LaXGSIeD+aStIVxrUAaIR2rcKJR4yKHHPoRSoH0b4=;
        b=iem57RNMQvdJ07T0l1z9gU7gHtdpY8+lyw8VLxvXZvmBYhbsUfgHfRiddoAHHzcO/Z
         lUV7ytaeTGEedYw7PksgA1SzwkQNuFLJGykWHDMKEmYUA4j6oYv8L98ntdyRQNgFX+D7
         TzS1jpzUfnLibNgWbQ5LF7M/MWiSQimc0GHA0rQ7zVPfqgFudM12cpAEPSK6IUR3dZP0
         rN3vtofcDqR2z66Q0gcL7oyU6+3xVd7+3Ywk6GI/U5zaUvCjBy9eFQpj7dSqeFbst7Yt
         82pjR/oGfwtaVR5NIal4OP6W26/+ZwhejnT9AlQ9ZdV+zxhqf1nY+Ja5myo8A9GVemf+
         964g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsfDwIgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a13cd00b00304fef09da2si6349922qtk.713.2022.06.27.21.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsfDwIgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62y3-0006ti-3G
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k3-0002Am-Uc
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k0-0003mt-T1
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id m14so9985013plg.5
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29LaXGSIeD+aStIVxrUAaIR2rcKJR4yKHHPoRSoH0b4=;
 b=IsfDwIgFcusawBoVInqTSw1ID8KxgqSdjPqEdOqv5Z2R46wV8MEruo+rlSVp51XeP4
 wVsezjWpcIkrG/7njrS1YvfovI/q0KSeZz9fvIvp4Fak3MO5XxiYsQ/b5ZncVoAIxOr6
 u4kzwyyR9qRPmpUnGJDuxDu04GB4STxI8bztHL/nkmv8YrQVKaG9YeHkN7Ve7T1QvKiL
 BZ4paLNisvdoW0052vSBBxu50xpPN6HsG0io0GiDlpuSHNvglShLwi6H+YtUGalNF2Ya
 qYTX1VzdvPXE1aWzQlgM+UW19pAUT0vglnElGduf10FQ6CxGDWg2Ef+ES7J+7u0czwuw
 XILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29LaXGSIeD+aStIVxrUAaIR2rcKJR4yKHHPoRSoH0b4=;
 b=qGDzz1DqNgn3NuCa0l3o2Fjz3qDJvkJ4eWsFT6TtqYU0XBJGI5779kMpRlhzdHNdJl
 Drgbm4kxLiMPGY1QSW6wzKVlDahiEiFmgX3HQhAFDOKdR3srjLrxoUOPoVfvmQ7OlAXm
 BIOgO2wFmZ19imLs4QCrbIKNWR0rsZMS8YyIl7aU8lLTEtP2hfprvMyCmeidUv9YBjwn
 s8m//NQ3OyrMPpt33Vr/I2SHCVbmCux4t7t4QwXQn44yW8JFOYWkmcWyZLoFRFEKvr4s
 HJFI6eXqLeYqOkr8aR/8G4K6+swhrZ+PK8CgTmIpcLKJBfN/bLfzQ5p+49giKNFiD4xn
 Q6FQ==
X-Gm-Message-State: AJIora+Ppoi4zA5XjHj3rrLsPadgAQkJ5H7FHiTNTL0pfN6z10HxQ/Up
 SQ7B6Cw/jJ9sqPSqqG7OU3RkYWDGsibI8g==
X-Received: by 2002:a17:903:2345:b0:16a:28ac:1c1b with SMTP id
 c5-20020a170903234500b0016a28ac1c1bmr3029705plh.106.1656390139422; 
 Mon, 27 Jun 2022 21:22:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Tue, 28 Jun 2022 09:50:56 +0530
Message-Id: <20220628042117.368549-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8eYyuwgCsydo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      |  9 ++++++
 target/arm/sme_helper.c    | 63 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 32 +++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 753e9e624c..f50d0fe1d6 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -120,3 +120,8 @@ DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 8cb6c4053c..ba4774d174 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -64,3 +64,12 @@ ADDHA_s         11000000 10 01000 0 ... ... ..... 000 ..        @adda_32
 ADDVA_s         11000000 10 01000 1 ... ... ..... 000 ..        @adda_32
 ADDHA_d         11000000 11 01000 0 ... ... ..... 00 ...        @adda_64
 ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
+
+### SME Outer Product
+
+&op             zad zn zm pm pn sub:bool
+@op_32          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .. zad:2 &op
+@op_64          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .  zad:3 &op
+
+FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 61fe9e9dc8..31c53ad896 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -898,3 +899,65 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
         }
     }
 }
+
+void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 31;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            if (pa & 1) {
+                void *vza_row = vza + row * sizeof(ARMVectorReg);
+                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
+
+                for (col = 0; col < oprsz; ) {
+                    uint16_t pb = pm[H2(col >> 4)];
+                    do {
+                        if (pb & 1) {
+                            uint32_t *a = vza_row + col;
+                            uint32_t *m = vzm + col;
+                            *a = float32_muladd(n, *m, *a, 0, vst);
+                        }
+                        col += 4;
+                        pb >>= 4;
+                    } while (col & 15);
+                }
+            }
+            row += 4;
+            pa >>= 4;
+        } while (row & 15);
+    }
+}
+
+void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint64_t neg = (uint64_t)simd_data(desc) << 63;
+    uint64_t *za = vza, *zn = vzn, *zm = vzm;
+    uint8_t *pn = vpn, *pm = vpm;
+    float_status fpst = *(float_status *)vst;
+
+    set_default_nan_mode(true, &fpst);
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
+            uint64_t n = zn[row] ^ neg;
+
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    uint64_t *a = &za_row[col];
+                    *a = float64_muladd(n, zm[col], *a, 0, &fpst);
+                }
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 12995d6a46..1117a61f62 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -301,3 +301,35 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
 TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
+
+static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            gen_helper_gvec_5_ptr *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, a->sub);
+    TCGv_ptr za, zn, zm, pn, pm, fpst;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    zm = vec_full_reg_ptr(s, a->zm);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+    fpst = fpstatus_ptr(FPST_FPCR);
+
+    fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
-- 
2.34.1

