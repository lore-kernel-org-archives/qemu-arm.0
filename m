Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp336242lft;
        Fri, 8 Jul 2022 08:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqgwMI17kaM/Djj2prVcjbImDegNuSLHKJqQL2qGNYEN4dLaLd+1Z3VDHQd307Xx4ZwzPc
X-Received: by 2002:a05:622a:586:b0:319:4544:8ea7 with SMTP id c6-20020a05622a058600b0031945448ea7mr3437908qtb.255.1657293937813;
        Fri, 08 Jul 2022 08:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293937; cv=none;
        d=google.com; s=arc-20160816;
        b=LP+oMEucOHnI5Kz3QI6qXJU8akKIEI4mPG+vuuiNGU7Wzw7E9wfOWQI7ns6nQq2MCV
         2N9F1tS+cXMP9wdUufxpUPmqDvfeRwMZmHSE4fCm4XjmSbIajXBD84LMmVY9L0mxmJMv
         Sx0DoPeq8J0G7UOlQ44OQOy1RkoQm7E+EcKy0626GYZimFfE5XwQ5szFxGFa8akuaClF
         ITAHDLRa9UmSVp4oBBI5+u4zh645pPKP4uqR5O7JO1ZpmEgm32hlPNo1z+E00jiEj0Oy
         IoQ4O1K+2D+gW629tMHz3HjBkxPoAkaY/3uoF6KiV1znf8FqJt9e8T1DfurytaIwaIOM
         oJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=51m+FHhgZoHzjunhCGcEEKcl5F1Je17jGBCF6BKVuM8=;
        b=DFVG+WMs5ZsUa65DTUPQ82Y5Ld39lAqdr6lpFORfKZ09cNirrAQWM9faU2/PhHYTqK
         8zqRjST3wGKcSnf4i9om+1zLqni2CrwEEuR14MiQb7kbEML0yF6Qi/woDKax1G/LtCaU
         H1v6nP6xygz5L9hHjcMGPMY1o9KIicD/ucoZzeeKG9TzUYvCjqj3tvN2NCPIkl+yeXqP
         xKlribo8DoUDBpgheF7XbHS0nnYFVcZSO+20n8bb20rIS6T4k/ca/T1W8kyfKmQ+Wmsn
         2ibqcMr6K48fPOlN+/weARN3jjarXkEACFSNvXDiB81LkN7k5kz9VrDq/+0dmDwTnFfb
         gC3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bX4lUCKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac84908000000b0031ea7005358si906044qtq.263.2022.07.08.08.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bX4lUCKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9prN-0004NX-8Y
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj4-0003bb-Ef
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj2-00028w-Kd
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so2220471pjl.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51m+FHhgZoHzjunhCGcEEKcl5F1Je17jGBCF6BKVuM8=;
 b=bX4lUCKQ68l+RxwNK9CmlPb9jGvYmBlLAetMV4MG0tn735naZN0cAiWVgJF03dJOY3
 OADJYqIO2LPCrxy5rlBa/QJPuKe4jmZNHP4R1eYZc3N1UYCO7SgeD/j5iipF1ve6Imr5
 r+apn3YSVETSoLRvsUNcRHpzrwIJl2fsvQCdwxMGGHPdJfU1c4IdF4GlAdJ8xS1eQxQ7
 rrpIwlMIppx4Akeou0Ye6QuQIeP/09sygj0PrGWBqh6Kk9s3uoooHlBxBQJShWHnwc8w
 tySeh3W7hQhlHclPFn3oXUpZRxNhlkt8KwQUXzbdPiskxLag4RxtZFKKGi98EwJhD2As
 DD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51m+FHhgZoHzjunhCGcEEKcl5F1Je17jGBCF6BKVuM8=;
 b=7zAVH/tKv2tnVQPJb6t3KASdYf5WWYRegOG/tVokD/uv8vVzq5ocSoI9mjsccHHZKL
 RNYXrxzYVMTTT59YpqKxs16aBLLnSMQmjifcw6mcPcdGNmoczDMTzOoUbrSr/1cxOIcl
 bxCJoN/J4xQPG34naYZ5yZZNV6eyVUxIsG/KyJpG/VoeenmCeC0wwOjFjfNCiULlxLDc
 tWLr/FkTYcZY/Syn/oJcwUXfHAKv6Lf3cnFm/cNskzOVv1Sf4jqkhQtvEQPB76ZiMnk7
 3TX92rs/jebq9OTGiwje1LPiAEn19a6ZyixDNpugPxq346dNdfDkaJBc6K9mZqgUy6NI
 MdPw==
X-Gm-Message-State: AJIora/24pELW1aoBKRmhUQBHYfqVRMX6D/gWZvpep+zjLoxVFU9Mka2
 fckfR1CX1ElhQlr++B1nBLksig==
X-Received: by 2002:a17:90b:4d86:b0:1ef:8701:1b4c with SMTP id
 oj6-20020a17090b4d8600b001ef87011b4cmr411854pjb.10.1657293419618; 
 Fri, 08 Jul 2022 08:16:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 24/45] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Fri,  8 Jul 2022 20:45:19 +0530
Message-Id: <20220708151540.18136-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: n1/FGPUFKEQg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      |  9 +++++
 target/arm/sme_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 32 ++++++++++++++++++
 4 files changed, 115 insertions(+)

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
index f1e924db74..7dc76b6a1c 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -918,3 +919,71 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
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
+    float_status fpst;
+
+    /*
+     * Make a copy of float_status because this operation does not
+     * update the cumulative fp exception status.  It also produces
+     * default nans.
+     */
+    fpst = *(float_status *)vst;
+    set_default_nan_mode(true, &fpst);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            if (pa & 1) {
+                void *vza_row = vza + tile_vslice_offset(row);
+                uint32_t n = *(uint32_t *)(vzn + H1_4(row)) ^ neg;
+
+                for (col = 0; col < oprsz; ) {
+                    uint16_t pb = pm[H2(col >> 4)];
+                    do {
+                        if (pb & 1) {
+                            uint32_t *a = vza_row + H1_4(col);
+                            uint32_t *m = vzm + H1_4(col);
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

