Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4559636lft;
        Wed, 6 Jul 2022 02:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIgG0QA5LjPasflTlLsMg3l7JTyk+EntYkkJtPEpcBRVj9fkHnRf/XLz/1BqYmWvRW42PU
X-Received: by 2002:ac8:5d49:0:b0:31b:457e:459c with SMTP id g9-20020ac85d49000000b0031b457e459cmr32736278qtx.390.1657098735831;
        Wed, 06 Jul 2022 02:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657098735; cv=none;
        d=google.com; s=arc-20160816;
        b=syWIHYq+VFIh+uYt6CDwkSMuWBXw8Kp/1zKRRV0/IOHxZ/QlfZGfZKK5tU0R9jxgOC
         OZhVFKybH2x63eHHIIL1Wa6bNQY5mHp5jtIoObHofHefCkEyZjS/iTXHYbOVodABljQL
         M57naX33Cttr4A8/ZqPwp7alEoS5O78I0EIiCO94e18QJTjOVRlv9Lt9NYMFAUcy4fBF
         aPuLdzBtTvAdp+2esajlh8pUoWDM5I5E3WWb12/BiASH7pIDtyMK4DeS6tDtgCVBKuXM
         jlGa7/JrGodFpWUQ6xB9R4hRZRJGwIxM2ES0ortWCApC1kELAoUsYjp+T3gv0eWl+F2o
         mD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Nd7aoiJ0a4Om5oS4WouR0rEr++9q5c771YPccSG4HM=;
        b=suFesqZvvA9OQzmVPECzjvy4gxjlxFL2mP5InpbEupMviUqRP9pR9S5SkqlpoNEJsh
         Oad6Yxtl76HNWs9G+XN4fnQTfP8F+KMsmg3x39bWZYnhS2Ltu+OMjVmjNy+SvyB9TnXe
         e+h4o7ph9u96b9BKZ0t4m5htnJw/MSRVm8ptgZhc80f4izcC1PhGDbdLh+KDoeq/LQhp
         KgdEAWozBDQw6MiepBcOYBx7z5Vqt+Tzo400FBgSB6qN94e0Xi9qKkX3pLuSQzxmuxt0
         FlhGfAJNHrY7M7naOYAr0TTwqs3w5Ouh5o/XNL/An6eWOS2/eHYruKaKmsZsSFudi0JV
         3qEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LoK1pMNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv10-20020a05621429ea00b0046469da5f0fsi19615187qvb.241.2022.07.06.02.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LoK1pMNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o914x-0003Ll-6l
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Le-0006Pl-DV
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90La-0000go-RE
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a15so13706183pfv.13
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nd7aoiJ0a4Om5oS4WouR0rEr++9q5c771YPccSG4HM=;
 b=LoK1pMNZaCDE+QaIRjGwGTG7mcJb+2/vEi3wvhOKPh/7Vv3JBjSa50j1zF1eSA2508
 mbfYZFpDmaCykCnbSwSfYw88ojLBxHD+Q3IZivaJNaB7vnclzNYPHb4JSyNiwgS585Wn
 mx3tK+gnm/+/d8FRuvZShSp8VG14IWR/574j6uQ7G5EV95nHzjJBUAUV2Q0eN0KwT/rp
 59dwk6Y8JtgpPY1dUoxNgGTbwxa4W+PVkZg8k5x2TiVJPjk7c4XWAyIjlnZ54HEr/Teh
 1ADCi0XrliyesGyOevUs9OCIStlYgeXQ7eAN78PQnZD/5+1IxUzWRf8dSQboSqqKpjYo
 YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nd7aoiJ0a4Om5oS4WouR0rEr++9q5c771YPccSG4HM=;
 b=TTQb3/RZe8OnwYYfJxVhlK/PdKpOytmOk5EVOnTXfc3b0Bzk2x6JKAJE0jg9bIw/MP
 pQQEt+3Y6dyBs+BH/HhtPQtsx3fp/p7EhbfIB89CpC/Y9pSu4WZEcSY7Ye/h9+pq1zGY
 umWZkJGE+BOrjyZav7K0W9qUX9Di/c+KgakZB+1F6s/2hkS1rWekhQb8aXcLiEPERY+q
 FHERsAZ2TmrlunIZPVXKb5cqWozygXuIjI950SZ1eqIsRx/b26brYuQf7HBFq8cE5tzt
 0EhGVFV7zJTRtAr0zkTLFTIcFEG24AzlkgT/+k2NsrBVDMs5gfpzTIuwi76/nSyvC8/u
 dveQ==
X-Gm-Message-State: AJIora8FysCrYtgATRooV273Pmh/R67wFMB6kVlLL/p5PeeFF38Q6QgJ
 Ny+54ZhS6BaA35qyVNbqcrbeDlbQvtlyhLKP
X-Received: by 2002:a63:7b18:0:b0:40c:9f14:981 with SMTP id
 w24-20020a637b18000000b0040c9f140981mr34108077pgc.176.1657095921415; 
 Wed, 06 Jul 2022 01:25:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Wed,  6 Jul 2022 13:53:50 +0530
Message-Id: <20220706082411.1664825-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: +EXuyOdyQENX

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
index 10b7c1ad68..78ba34f3d2 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -918,3 +919,65 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
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
+                void *vza_row = vza + tile_vslice_offset(row);
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
+            uint64_t *za_row = &za[tile_vslice_index(row)];
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
index d3b9cdd5c4..fa8f343a7d 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -298,3 +298,35 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
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

