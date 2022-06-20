Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp605370lft;
        Mon, 20 Jun 2022 11:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scFgX1F7Q2NIhYMYNIs4ys4FNhZW/Fxnk+thZNyWwFTDJSlHX5U3c17HfjQnYhzs5MqaRY
X-Received: by 2002:a05:620a:410d:b0:6a7:571d:8615 with SMTP id j13-20020a05620a410d00b006a7571d8615mr17376933qko.259.1655748472148;
        Mon, 20 Jun 2022 11:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748472; cv=none;
        d=google.com; s=arc-20160816;
        b=W6PRIX3NLsJVy161069GAwkBnFjMTQJdWbeSj+aw0sBa1ORpJL+Tmwvd0i2jJ3Q3mb
         uPHINQAMVLoOWV9DVMPzgMdvCidX42uHNocCD+uAx85usRYvop+TCWQy3swIaNcoI/eo
         06ijf4BtYm+6Jjk9L95jUiXHxM0kFsfH9V43tKmSWitoio6J/KHxAlOEqk2h41I/k7gf
         ukY9NnzjaRMb87V3Q+EF7ck5QgpnuguNYHGr4x2QAhahcq4mFS3BKPdv+5GlsRwbHMOI
         N9X32lxbV1c1dt6AHMsnHgbW04hRjeG3ORESHdnax4jOfb7DTCrOSKHyAuz4feSQvaFO
         b/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AD+UvXjpslUT9sr8kVRM5D0jSKgblhRpitHFAAgieyE=;
        b=Si87qMzISVXTZNG7kAm7wroQr3II3AndagmjT7hg23DaUleUMdoD7ZTnnzi4/U+ZV7
         vqZxV/dFIgZyEWlIkkNjBfHeXJxXpBcBWA3P8Vrm/WGExe6C2o2IBOckvXG7LZrgait1
         136qbJRxxHLEOcUrDXEiPgD17AN+BbElM7wbM+zp8JhZBs2NC8e/2ngzAnjsdYpRuobf
         V9Ej0McRZehkIRWw3RarINGwOS7fJYJsKTc1huZEgrbOoitiOjAn5sfSFI5oZcbAbffP
         WIbqNXxkAFedkzHDVk5ybf0EGWt1Dvs1Y5pMElBr0JtPaIcdwV4j1dvJJwbAslR9lzdM
         Sf9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/ytqWDH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a37a402000000b006a37a7632cesi7597957qke.549.2022.06.20.11.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/ytqWDH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LoV-0008Nq-Kz
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0006Ng-KI
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaB-0001Tp-Ny
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id d14so7365932pjs.3
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AD+UvXjpslUT9sr8kVRM5D0jSKgblhRpitHFAAgieyE=;
 b=Q/ytqWDHXYwyOiwPmB8FY0oEQgezQ8N1cJwtoR0nLdjuTsKvEoyGLNa5sGEnwHLWUj
 FWaHPAUfAzQ+UDoq31XenVMmuPHmAtrV+4F1Xr39V3bJAs8vZIqw8cZui18GBEEPnzZu
 7cPY+1O/oNmdD5SjJ41eJsO5TFI4lHs36Gikyi40WkZnG81vEkXDC3lmJc8Mfv1/dDwZ
 48Xi1IrJbdtpBgnSFoMVpT4L007hcw0xVpZCcABX8xMDOMm4KeF/pN8OAk+pbiJLFssI
 AR8kQq9br6j263cAVpCCjRJFdABINAhNb+ZIMFOX1vwKkz7dWJkDmS0K2fFNFm6indrj
 VicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AD+UvXjpslUT9sr8kVRM5D0jSKgblhRpitHFAAgieyE=;
 b=DAMpmk0CJUcOfyuGI3pYTjOREyy59zqUvCzKMX1ZfETfoEwaou3FTOTevI1wMj0SKD
 Ljlf3msHojZ1uZPw3qzk6uyFc2osL7GecoLz/nrmTj0tsz16lk08ERMADUeLqQajF2Lo
 S5QClHJ5dpHcC2hGd9wHdhSf04ADk9tC0EnShPjvrJ+1XUnnEbvIFFk4Yhp8uHNxqpo+
 pnZf0+7BES6McUR/RYtnhG2mexILkBEyVci96Ha6koPgQf3UULHz+h13jMPtrX2Il13Y
 CuUN6JWpMUPs+7LWjQIkT7SU0CejXzpdwUvYoD73Y8xLFzyleUbarzsQyL7TJmNG5C4j
 5oeQ==
X-Gm-Message-State: AJIora+fzMOyNQHAzbC6wULxd21aUcPXsDBt+BPlC3O6riUQ2cMDaKIm
 3IgMJurKFsnnkgmcYr3xlyJ1kRgiABF6bQ==
X-Received: by 2002:a17:902:d2c9:b0:163:bdee:b2df with SMTP id
 n9-20020a170902d2c900b00163bdeeb2dfmr25187168plc.98.1655747582487; 
 Mon, 20 Jun 2022 10:53:02 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 30/51] target/arm: Implement FMOPA, FMOPS (non-widening)
Date: Mon, 20 Jun 2022 10:52:14 -0700
Message-Id: <20220620175235.60881-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: jyB9/NbGxh3I

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      |  9 +++++
 target/arm/sme_helper.c    | 67 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 33 +++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 6f0fce7e2c..727095a3eb 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -119,3 +119,8 @@ DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
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
index 799e44c047..62d9690cae 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
+#include "fpu/softfloat.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
@@ -897,3 +898,69 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
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
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
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
+
+    set_default_nan_mode(save_dn, vst);
+}
+
+void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint64_t neg = (uint64_t)simd_data(desc) << 63;
+    uint64_t *za = vza, *zn = vzn, *zm = vzm;
+    uint8_t *pn = vpn, *pm = vpm;
+
+    bool save_dn = get_default_nan_mode(vst);
+    set_default_nan_mode(true, vst);
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
+            uint64_t n = zn[row] ^ neg;
+
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    uint64_t *a = &za_row[col];
+                    *a = float64_muladd(n, zm[col], *a, 0, vst);
+                }
+            }
+        }
+    }
+
+    set_default_nan_mode(save_dn, vst);
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index e9676b2415..e6e4541e76 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -273,3 +273,36 @@ TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
 TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
+
+static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            gen_helper_gvec_5_ptr *fn)
+{
+    uint32_t desc = simd_desc(s->svl, s->svl, a->sub);
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
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst,
+           a, MO_32, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
+           a, MO_64, gen_helper_sme_fmopa_d)
-- 
2.34.1

