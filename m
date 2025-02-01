Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143152njb;
        Sat, 1 Feb 2025 08:43:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVE4bcXsKEgP20aP5sqhdBDK4jFD+OjCmF9IRxHMBzMpctMJg9EfY+v9L0vPwCaeQbeoI7IGMlaKImqUg==@linaro.org
X-Google-Smtp-Source: AGHT+IGoleiO6UZsDMJJlUbMLsywZXBOObn5zJIX7yFl1cAUT297k+9P+DPTfDxzjeTyxXQFE3X1
X-Received: by 2002:a05:622a:5a07:b0:467:5f95:679 with SMTP id d75a77b69052e-46fd0b6b509mr229295781cf.42.1738428202483;
        Sat, 01 Feb 2025 08:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428202; cv=none;
        d=google.com; s=arc-20240605;
        b=HXwYCcWWuY9dEQkgSzKvyvMZLryUyKSCZwbMYpvfZ8wuACQCMfgk/SMrL+fjm/Fuhc
         W/r5DKKoWUN/f9f8AVe1A5t/lheXS9PdLSXb8hmMNTHug2NWUv7MRW3nVrOTlMFzjdbT
         8ItgECXAFB1Xz7vHOOhjLhxvorX6iTl4us4m2hEN2HqAipF9fnaEsyhz30h6FhNRTthY
         jROZ6CD8pWvNgmh8UUr/lWF74YGe8jw2P1isLmp9+DbYwe/z7hWAEtptmeIVowzdu9Iw
         cQme0ZJlZJVzbrVYPd+TaJbHsDpmPg/iT3/WDuwHWhXSVWXHwqipA46oRxyLu6hWcy6U
         eTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ON/Q5A+D+dYxinxhBdih1LIywvHUNEqZZNcBcHMSebw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=KE8ImuPRR88Bv0T++GcJ/8PiKP2kbskJHQekpJfHkbLfi4ymLt/sOnmedJeHpxzXW0
         8jDFxjsxAN8IKYqKN+5W/C3ap9wDM+hOg5mquXWv2TyEq0Gjf+bxttThAAZg8sLSuEtG
         Yr//vRUfA1mvoMt7SoQfIRjih1wsNlA/LkAlhnVbHcz3KXKhg8FFolmy6iSnUI2q3Ewi
         MtOQazktWXA9Wy1YcFnc+iRIlcGKSeLL21tyPmAK6Wly9Ul6MWYM9kmTIQpNeA6ClLyp
         x2Y/NqCuTqqpb0zZjEPo+cs4MmH8XBDuGh37FuVZwxupHHYaxrqLig16s+OQsQlLcz0+
         gEPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueXaG5do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9bacsi61427151cf.336.2025.02.01.08.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueXaG5do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY2-0006At-Mq; Sat, 01 Feb 2025 11:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXu-000644-Kj
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXs-00015i-TA
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f796586so35164815e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428033; x=1739032833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ON/Q5A+D+dYxinxhBdih1LIywvHUNEqZZNcBcHMSebw=;
 b=ueXaG5doDV0LGTarxoWpR4hQpeQwq/243u+vetdF7vWRZ7ZgveUB+pHm5ROArisJyt
 ZDJDeFvFLMAFtmr6iv+WOpMvODLyxcXD8hMAQt7Pp6QtmRxL8X3IupChu3i0G4hY0NeJ
 4VdAb7hFXVgfSUJ2DwBIPD2xHGWj7zRYxaDBuzZtYL1p+IuWV1CruU2kQYRrYkDi3/es
 52jZso2M8yIVIwVzS6OsfHwj+5YoQfnoQE+ipFAVj+O6H9YqRtX2HMWt9QN7l1wVOiOE
 BeBd6qAT1H07XZsnpnF5knvdgYA0iGPdvoik8w8UdCbOrsIIn+q+bU9jfGnIzDRIm6lG
 /6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428033; x=1739032833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ON/Q5A+D+dYxinxhBdih1LIywvHUNEqZZNcBcHMSebw=;
 b=dGkJrxjKkZbfTLmZ5vqJhBlSn7oTdYULIhjMQwJsJv+iGNP2rNpg51UQ//44fHYKO9
 0tnPO2OSquFYyUN1G2DkSy8K+iN8vML0YdrTKlLkQJyIUFhGRXkE++RZUnxnU+g0YAeC
 lB+7ewZ+k5ivCB2e1tRUtY4SrYpOeLOIdQJvQ5KJUR/DyMwtDKo+2PbfdQaKakhv3sjv
 xnJxxCFYmms/dv7nwd7syVrGqHf7IdJft8p2duJwM7NW5VLdggvP6nD0HCpRScZwXZkr
 MqluIpqUBJCdLQOm+CFnWTT/qVDUIdlt/doiYcKH2VXwd/Z+Cl6bfDXPUDnEbalB0YGe
 MkCQ==
X-Gm-Message-State: AOJu0Yxl17Y9NYxbo94Srp35jNM/zVOoNDjgIrDus27EGYPmbQdgf1wZ
 30/lJsU/G/Y9HxlEcR86OFKejyL39jhb5JO6oGw4PLNK6erDSAATPYvY6/Y0b8x9Z3qZdSaPXEr
 s
X-Gm-Gg: ASbGncvjW5lK2HswGduREYB7kCFSwsiQ1ZflsoH4YxKk2fIjAR0cvNza/AtOApjSdHF
 gIfXPgogNNkRdiEMNawaAx5/y8np0j9c9Cx3md+VQiTsNUx1QqHKifQLDFhWPxPR8iaFyFgV05W
 pp/Pa0lwIN1mtBIFXP9LWq5AqMTz9FhC8uNADvZlCOQTOjpfJN/DTxRrGevnELsT7HGPGb8hAOc
 OJgWwOOr6JBRo7S/AApLJXkwER2f2WvgixCO5Emj5qt7XM5hOrP1R1a/WaNgtiEVenaXJUogDqe
 97/ZdtaK/jFHCTSndHlk
X-Received: by 2002:a05:600c:3d05:b0:436:18d0:aa6e with SMTP id
 5b1f17b1804b1-438dc3ab518mr183893725e9.5.1738428033121; 
 Sat, 01 Feb 2025 08:40:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/69] target/arm: Use FPST_FPCR_AH for BFCVT* insns
Date: Sat,  1 Feb 2025 16:39:16 +0000
Message-Id: <20250201164012.1660228-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: lh3SvkF8I1zf

When FPCR.AH is 1, use FPST_FPCR_AH for:
 * AdvSIMD BFCVT, BFCVTN, BFCVTN2
 * SVE BFCVT, BFCVTNT

so that they get the required behaviour changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 27 +++++++++++++++++++++------
 target/arm/tcg/translate-sve.c |  6 ++++--
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b01d05fe30e..bb32ccabf0e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8514,7 +8514,7 @@ TRANS(FRINTX_s, do_fp1_scalar, a, &f_scalar_frintx, -1)
 static const FPScalar1 f_scalar_bfcvt = {
     .gen_s = gen_helper_bfcvt,
 };
-TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar, a, &f_scalar_bfcvt, -1)
+TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar_ah, a, &f_scalar_bfcvt, -1)
 
 static const FPScalar1 f_scalar_frint32 = {
     NULL,
@@ -9290,12 +9290,27 @@ static void gen_bfcvtn_hs(TCGv_i64 d, TCGv_i64 n)
     tcg_gen_extu_i32_i64(d, tmp);
 }
 
-static ArithOneOp * const f_vector_bfcvtn[] = {
-    NULL,
-    gen_bfcvtn_hs,
-    NULL,
+static void gen_bfcvtn_ah_hs(TCGv_i64 d, TCGv_i64 n)
+{
+    TCGv_ptr fpst = fpstatus_ptr(FPST_AH);
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_bfcvt_pair(tmp, n, fpst);
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
+static ArithOneOp * const f_vector_bfcvtn[2][3] = {
+    {
+        NULL,
+        gen_bfcvtn_hs,
+        NULL,
+    }, {
+        NULL,
+        gen_bfcvtn_ah_hs,
+        NULL,
+    }
 };
-TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a, f_vector_bfcvtn)
+TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a,
+           f_vector_bfcvtn[s->fpcr_ah])
 
 static bool trans_SHLL_v(DisasContext *s, arg_qrr_e *a)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c084bb58e7e..be2b5528ba0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3904,7 +3904,8 @@ TRANS_FEAT(FCVT_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_hs, a, 0, FPST_A64_F16)
 
 TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_bfcvt, a, 0, FPST_A64)
+           gen_helper_sve_bfcvt, a, 0,
+           s->fpcr_ah ? FPST_AH : FPST_A64)
 
 TRANS_FEAT(FCVT_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_dh, a, 0, FPST_A64)
@@ -7054,7 +7055,8 @@ TRANS_FEAT(FCVTNT_ds, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_ds, a, 0, FPST_A64)
 
 TRANS_FEAT(BFCVTNT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_bfcvtnt, a, 0, FPST_A64)
+           gen_helper_sve_bfcvtnt, a, 0,
+           s->fpcr_ah ? FPST_AH : FPST_A64)
 
 TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_hs, a, 0, FPST_A64)
-- 
2.34.1

