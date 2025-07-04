Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252342dyc;
        Fri, 4 Jul 2025 07:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGGg0kj/I2RFB2PGBBgEs4XY1FbbEGvPUT54EXmHtgfJMDgDOoCYa1CGX17KYtpv/G/XlZyOhZ/LX6wQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMpT4nssME4nX7nYXZAHGakxYSO8EIX5NHqCuB0CN+GacF8p/ZB124y/rh0tHMlNZkJBHn
X-Received: by 2002:a05:620a:4396:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7d5dc6b8cfdmr475636485a.15.1751639196579;
        Fri, 04 Jul 2025 07:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639196; cv=none;
        d=google.com; s=arc-20240605;
        b=ZwyA3gHBGKso8ms//Ts5DCkNt5RmQ8eVE29fI/C718CpOVPEjjOo/DBulrGDgvVBbO
         QfhK48hAxT/PMkCS7gWiMODWLFp5GUbFkngK0E0ANDEPATLrv+fK2SOR2zIUybnNZe0z
         301V00wqxiatkmcSm7ISluHE7hvHqyuzkCRvMJEWv0X3YXfipYzZD0zHGA9Rgx0U/7RR
         /MkWQWAfkjOHfD/VUzrNnXunEk1cJExTFsBxVKtbvBgIaSTU881DOlBvg8UsyFKiZESi
         xYZCD3VCBDxQH38jOdkllj6Ua3/fqeGZAHM/NvX3sFAsIPKIO2N2pmJbE1Osa4jhY2+H
         C/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qv/VxcFKc2nhD2P/0kekyRsDOu03G4xgMX0HwOwNFDA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=jw6rqrqZBAev1ohrtGWRHeqXK6aEB/1cJCL/TEIatzbPbPSKMwrkx2BhMiSe5w+Xlh
         20jZta6pWrjbxmLXg66DYYwrLf2ztwWFtZeqTOJIQVoKD36wPicvnpC++CUtmxpIfVQd
         iUfS7XS8BLWguc9OBn97oxz2I8hR371PqQuc9R4LRzycBso9UjUV37+25FVGA6cyJ5Go
         qDaVkVOs1DdfAvQ7M96F0ZcbjPNubh5Wql0fpPFwq46aji9U1eeh7Hv1cPuYG7EcL/gJ
         AM1IjEzCpvlP43xAp6tp2pK0+vmegHH4okrf7utNS7+70UErkexA4z0YE/ouJqXoF6NV
         iPbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y8kf/cx9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbee6b35si226843485a.496.2025.07.04.07.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y8kf/cx9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhKx-00015i-HE; Fri, 04 Jul 2025 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIB-00050v-Pr
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:34 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI9-0005Z2-OA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:31 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2eb6c422828so1283973fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638888; x=1752243688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qv/VxcFKc2nhD2P/0kekyRsDOu03G4xgMX0HwOwNFDA=;
 b=Y8kf/cx9AECCptZv1qOuJ8ZtRJ8mQkwlKiNj0mVv7nPrDhlzTHbaOHigbCpCIl1csr
 sQzaKsJbXRdL1gBJZswP4MsQshUoZxAvJz+FYT/qjwZjlfTxamrxcjvsPBwY5UDpe2a4
 FIi/tSrspozWh28jf1l3er14juyohG0XoD8y2mJJ2d23s+ESN+Euo8hbz7W17ObPfU2y
 qnl2of2xBxdy/ZIze3IzdkTnsP85gWa5f7eqZdqPPA/Msx/Qi6Z26wRCtSSHYtkjASpO
 NR/AX3cvr+Qw5zZon05rNKh3OmeYxMIk5Sdiwx5mzMMwsm4wbb60MjHKQuOf8jLCRn21
 1QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638888; x=1752243688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qv/VxcFKc2nhD2P/0kekyRsDOu03G4xgMX0HwOwNFDA=;
 b=emc8UhVzEpwnhHUxe1mLxkDtaMLW9LhaxFlmKiL4DvObO4NXaC37qsFbe/mD7hWyqj
 tCe9HrfhLyTyWMQodt6kok4SYS024ybQyb/s6gRc/sb5Si9MinsUz1DqMVykx7YcqBv2
 n06+qrL6ztS4XZPDrDOrXdCVBnV1MAkSAE85ARrZJQVlhtqNni4sU2ltZH7nsAJzMD8Z
 BPSSLtwhxK/3dgxOxwOBpiZ1HLyePqHuJ/SdgWM5z2hiEqZ5mgVE4il6//97WwqMSWuR
 Plj5PrfhHqZAgV059KA8bDbud9IeNEPfLn4SShc5hX2H9k1G7q3s7edfwNTk1a1b1IDu
 tVoA==
X-Gm-Message-State: AOJu0Ywfhjq+AIFxRHVKTnQepqVMNz5d/jiKGPOiwrDLSL+9H3OePV0q
 sAVEhwy7ckOA1GERHZJQGt1FX1WPBhcDMf4QgEjoowtdcQ64NaZHTi+5L08gwLDh3l0=
X-Gm-Gg: ASbGnctjHkUz+K+c00DqgY+/6hUmqvSPiU5EmGxFKfdI4ePxD9vdB0fEhiO3Y2njWTx
 BbRk6/jNaiCex9wAJXgJCth/1BfxcLZyUK2sAakaPoLyO7JlOsf5DemeRj/b8r+N5H/G+FRY1oe
 WEQygV5S2fDfEFup0QpmF5nTY6exH0Zq5kxAWfhuLhYn2wW5kAPWalA3w3Yw++jpGoL7kYmogOC
 TWBd6Xd+d0LhCpPQgrnD4FkfTZKK5olhF3IiPSsHBDHfe8sfX9HY+lkRbRI1GSAXet5x2d+zCZT
 Gbb8z0TrTq+fpRYWuTHFVzVTK+57er8gBghLrhypHtT5Z7ZyvvYsp0Y53JsEMUhtab3d3c9BL2+
 UITfbllWKXFWgusyr+ALqQ3z9ithjSnHX3zS/156fYDZZevmazo3CZjYxX6Q=
X-Received: by 2002:a05:6870:d1d2:b0:2c1:2262:7941 with SMTP id
 586e51a60fabf-2f79203ecb9mr2099504fac.16.1751638888361; 
 Fri, 04 Jul 2025 07:21:28 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 012/108] target/arm: Use FPST_ZA for sme_fmopa_[hsd]
Date: Fri,  4 Jul 2025 08:19:35 -0600
Message-ID: <20250704142112.1018902-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vc5UL9+O1Uvb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c    | 37 ++++++++--------------------------
 target/arm/tcg/translate-sme.c |  4 ++--
 2 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 8f33387e4b..9942d717aa 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -904,20 +904,11 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
 }
 
 void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
-                         void *vpm, float_status *fpst_in, uint32_t desc)
+                         void *vpm, float_status *fpst, uint32_t desc)
 {
     intptr_t row, col, oprsz = simd_maxsz(desc);
     uint32_t neg = simd_data(desc) << 31;
     uint16_t *pn = vpn, *pm = vpm;
-    float_status fpst;
-
-    /*
-     * Make a copy of float_status because this operation does not
-     * update the cumulative fp exception status.  It also produces
-     * default nans.
-     */
-    fpst = *fpst_in;
-    set_default_nan_mode(true, &fpst);
 
     for (row = 0; row < oprsz; ) {
         uint16_t pa = pn[H2(row >> 4)];
@@ -932,7 +923,7 @@ void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
                         if (pb & 1) {
                             uint32_t *a = vza_row + H1_4(col);
                             uint32_t *m = vzm + H1_4(col);
-                            *a = float32_muladd(n, *m, *a, 0, &fpst);
+                            *a = float32_muladd(n, *m, *a, 0, fpst);
                         }
                         col += 4;
                         pb >>= 4;
@@ -946,15 +937,12 @@ void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
 }
 
 void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
-                         void *vpm, float_status *fpst_in, uint32_t desc)
+                         void *vpm, float_status *fpst, uint32_t desc)
 {
     intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
     uint64_t neg = (uint64_t)simd_data(desc) << 63;
     uint64_t *za = vza, *zn = vzn, *zm = vzm;
     uint8_t *pn = vpn, *pm = vpm;
-    float_status fpst = *fpst_in;
-
-    set_default_nan_mode(true, &fpst);
 
     for (row = 0; row < oprsz; ++row) {
         if (pn[H1(row)] & 1) {
@@ -964,7 +952,7 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
             for (col = 0; col < oprsz; ++col) {
                 if (pm[H1(col)] & 1) {
                     uint64_t *a = &za_row[col];
-                    *a = float64_muladd(n, zm[col], *a, 0, &fpst);
+                    *a = float64_muladd(n, zm[col], *a, 0, fpst);
                 }
             }
         }
@@ -1065,19 +1053,8 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
     intptr_t row, col, oprsz = simd_maxsz(desc);
     uint32_t neg = simd_data(desc) * 0x80008000u;
     uint16_t *pn = vpn, *pm = vpm;
-    float_status fpst_odd, fpst_std, fpst_f16;
+    float_status fpst_odd = env->vfp.fp_status[FPST_ZA];
 
-    /*
-     * Make copies of the fp status fields we use, because this operation
-     * does not update the cumulative fp exception status.  It also
-     * produces default NaNs. We also need a second copy of fp_status with
-     * round-to-odd -- see above.
-     */
-    fpst_f16 = env->vfp.fp_status[FPST_A64_F16];
-    fpst_std = env->vfp.fp_status[FPST_A64];
-    set_default_nan_mode(true, &fpst_std);
-    set_default_nan_mode(true, &fpst_f16);
-    fpst_odd = fpst_std;
     set_float_rounding_mode(float_round_to_odd, &fpst_odd);
 
     for (row = 0; row < oprsz; ) {
@@ -1097,7 +1074,9 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
 
                         m = f16mop_adj_pair(m, pcol, 0);
                         *a = f16_dotadd(*a, n, m,
-                                        &fpst_f16, &fpst_std, &fpst_odd);
+                                        &env->vfp.fp_status[FPST_ZA_F16],
+                                        &env->vfp.fp_status[FPST_ZA],
+                                        &fpst_odd);
                     }
                     col += 4;
                     pcol >>= 4;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index fcbb350016..51175c923e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -358,9 +358,9 @@ static bool do_outprod_env(DisasContext *s, arg_op *a, MemOp esz,
 TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_env, a,
            MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a,
-           MO_32, FPST_A64, gen_helper_sme_fmopa_s)
+           MO_32, FPST_ZA, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
-           MO_64, FPST_A64, gen_helper_sme_fmopa_d)
+           MO_64, FPST_ZA, gen_helper_sme_fmopa_d)
 
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod_env, a, MO_32, gen_helper_sme_bfmopa)
 
-- 
2.43.0

