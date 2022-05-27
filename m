Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1212526lfh;
        Fri, 27 May 2022 11:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmG8rS+b+4C7EZdmMR8mncwnxNiN3SN8lsUswelavx5P1vxihNtgeiI3RfrVd0iYIOMhyY
X-Received: by 2002:ac8:5807:0:b0:2f9:47e7:5262 with SMTP id g7-20020ac85807000000b002f947e75262mr15492457qtg.591.1653676476829;
        Fri, 27 May 2022 11:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676476; cv=none;
        d=google.com; s=arc-20160816;
        b=xGvpVx0nZJw6wDBcjeOnjuuysNh7+8fle+NGdlGvNu4nvz5yXpslWlnqwwF+uuTcnP
         eMOorc6z+/oAjpsEqtqDvgiOgCS29IghteyGWs3CWC4ZWXmGpBen7jJjBUGwaj62pqE/
         1JdNsIVF1zEMcZC3OHzosy/FVSv9+/D4kNW5ul+W2oDnI0tzPdS9KOfc3XBznMkaf1Cx
         Vh257Gi0pigUVi2u/FjwP/CbMN1OHMFmBmn+Lk1RRUQjOQOFTCwVwCvMuW02Hkalis5k
         2QwtcUbZ4fluS8KZ/CH2yvjTE82r1apv6QOegKOINgD1Tc3dkrzHvAcqELDABA2Y/gCd
         fMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BHNpAw9EjAAEi6vEkKb3dOiSHgbppKaP06mHfmvGup8=;
        b=MoQ+dyFAwCSv1zmogKQsKJYhBTUxiJtB6vr3p+j1SJSDGIYA7icc5uFlT6di6TE2Hz
         A5Pg0QnpFBQzSUCQs1xqF+5FXrakIi1SU9gap2sGt508JhMsg+fbo9827rcHgp34BkX0
         4iBv/7p4OSRd+j2E+ypcm8xgjMJjo7qjXChG1YuMstEkrnSQj2ZeTYWyAgj4VZ1Y6tVB
         XnG8a7PFmK1b9I3oE1OgChCelv/NvDeFZrQVrbnCUwC1TK4d9tiVtKgqdToOJkxcRRwd
         6I864pTOYJTlSZi9APB664jqW3p/gJDZXclUWiVpzJuFbtES7X+4cXIGi/27R2gDmBZy
         xDEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=srjFzTpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22-20020ac85cd6000000b002f9469369e2si3212446qta.344.2022.05.27.11.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=srjFzTpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuenD-0005Qi-5n
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYl-0007WQ-R0
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYg-0003Vf-UA
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h186so4571841pgc.3
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHNpAw9EjAAEi6vEkKb3dOiSHgbppKaP06mHfmvGup8=;
 b=srjFzTpTZZTc9FLhIJhFO2xDvNLjWqskWVoKz1P47MJ1AvIO0bpOrTvPzQ382ylyRV
 dRFuMKdEW1+FClEVlcBVx97F9S+PwBWJcx81ODI2kxstc6/o4u+UIG4J+284cL8Wp9WQ
 Y2qCTlsQfNWII7XfShp8P7Gm/Df6VU6nuDhfYaczojnxwozj6TllofD7k7unGIMzlSpE
 AJ7JLwxLMVYAi3mGyTCvui1CU63Czjdq9Jhj6DJxtOjjj0s42vtoUFz5XGvO9wGz7DFw
 hDUFSMFhJtrgL2TkPXLvTCdOJhiXHpYLSwfOc5VE6xq/Ueve7ZhP4tWHm9CWPEiVZNUm
 dHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHNpAw9EjAAEi6vEkKb3dOiSHgbppKaP06mHfmvGup8=;
 b=j+WJBbrVn9hZ7fH+e0TeAnw834D7ntnRFp513mLS0NSNSKY57M9CLBNJMaL+cMxDcl
 1sBiWGESEtH+QDnDhlKEV/r/j1Mq8qNx31WSIHElK+G4NU41DlOS/yGE26qT/tQji4pc
 h5pk3Wmo6KIxq0a3Br8qJJd9ulprBlU8j/Sc47eU+AVGjMHMU+2cBD8iJzwnbCJzImEF
 B67VkcrdI7fmWI4X7zljhlnxqZzqPAhH+R+2EJ4k+v6lI6n885FO/o+Aq/o2BhpM4NcT
 TUcd7tV3h/DkNNJnTCF0wtld5iGcwzjhfQ+2hsS6mSFmiZ2AMLR2d8NV185St0fIfvrY
 eycQ==
X-Gm-Message-State: AOAM531c8p4trrEkan96LqntwVZoHZJUfJA7eX8lzPBw8fR0TIt1X/6j
 qm0m8NJCMKEepEnGz9cD8Uujrm9lkzcSqQ==
X-Received: by 2002:a63:1163:0:b0:3fa:5e1c:f86f with SMTP id
 35-20020a631163000000b003fa5e1cf86fmr21997725pgr.543.1653675574164; 
 Fri, 27 May 2022 11:19:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 027/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
Date: Fri, 27 May 2022 11:17:40 -0700
Message-Id: <20220527181907.189259-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: zvRjjR3S9NuO

Convert SVE translation functions directly using
gen_gvec_ool_arg_zpzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d63099c5b7..f8277eeb7c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -755,54 +755,46 @@ static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
     gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
 }
 
-#define DO_ZPZZ(NAME, name) \
-static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[4] = {                           \
-        gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
-        gen_helper_sve_##name##_zpzz_s, gen_helper_sve_##name##_zpzz_d,   \
+#define DO_ZPZZ(NAME, FEAT, name) \
+    static gen_helper_gvec_4 * const name##_zpzz_fns[4] = {               \
+        gen_helper_##name##_zpzz_b, gen_helper_##name##_zpzz_h,           \
+        gen_helper_##name##_zpzz_s, gen_helper_##name##_zpzz_d,           \
     };                                                                    \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME, FEAT, gen_gvec_ool_arg_zpzz,                         \
+               name##_zpzz_fns[a->esz], a, 0)
 
-DO_ZPZZ(AND, and)
-DO_ZPZZ(EOR, eor)
-DO_ZPZZ(ORR, orr)
-DO_ZPZZ(BIC, bic)
+DO_ZPZZ(AND_zpzz, aa64_sve, sve_and)
+DO_ZPZZ(EOR_zpzz, aa64_sve, sve_eor)
+DO_ZPZZ(ORR_zpzz, aa64_sve, sve_orr)
+DO_ZPZZ(BIC_zpzz, aa64_sve, sve_bic)
 
-DO_ZPZZ(ADD, add)
-DO_ZPZZ(SUB, sub)
+DO_ZPZZ(ADD_zpzz, aa64_sve, sve_add)
+DO_ZPZZ(SUB_zpzz, aa64_sve, sve_sub)
 
-DO_ZPZZ(SMAX, smax)
-DO_ZPZZ(UMAX, umax)
-DO_ZPZZ(SMIN, smin)
-DO_ZPZZ(UMIN, umin)
-DO_ZPZZ(SABD, sabd)
-DO_ZPZZ(UABD, uabd)
+DO_ZPZZ(SMAX_zpzz, aa64_sve, sve_smax)
+DO_ZPZZ(UMAX_zpzz, aa64_sve, sve_umax)
+DO_ZPZZ(SMIN_zpzz, aa64_sve, sve_smin)
+DO_ZPZZ(UMIN_zpzz, aa64_sve, sve_umin)
+DO_ZPZZ(SABD_zpzz, aa64_sve, sve_sabd)
+DO_ZPZZ(UABD_zpzz, aa64_sve, sve_uabd)
 
-DO_ZPZZ(MUL, mul)
-DO_ZPZZ(SMULH, smulh)
-DO_ZPZZ(UMULH, umulh)
+DO_ZPZZ(MUL_zpzz, aa64_sve, sve_mul)
+DO_ZPZZ(SMULH_zpzz, aa64_sve, sve_smulh)
+DO_ZPZZ(UMULH_zpzz, aa64_sve, sve_umulh)
 
-DO_ZPZZ(ASR, asr)
-DO_ZPZZ(LSR, lsr)
-DO_ZPZZ(LSL, lsl)
+DO_ZPZZ(ASR_zpzz, aa64_sve, sve_asr)
+DO_ZPZZ(LSR_zpzz, aa64_sve, sve_lsr)
+DO_ZPZZ(LSL_zpzz, aa64_sve, sve_lsl)
 
-static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const sdiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
+};
+TRANS_FEAT(SDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, sdiv_fns[a->esz], a, 0)
 
-static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const udiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
+};
+TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 {
@@ -1068,17 +1060,12 @@ TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
  */
 
 #define DO_ZPZW(NAME, name) \
-static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[3] = {                           \
+    static gen_helper_gvec_4 * const name##_zpzw_fns[4] = {               \
         gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
-        gen_helper_sve_##name##_zpzw_s,                                   \
+        gen_helper_sve_##name##_zpzw_s, NULL                              \
     };                                                                    \
-    if (a->esz < 0 || a->esz >= 3) {                                      \
-        return false;                                                     \
-    }                                                                     \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME##_zpzw, aa64_sve, gen_gvec_ool_arg_zpzz,              \
+               a->esz < 0 ? NULL : name##_zpzw_fns[a->esz], a, 0)
 
 DO_ZPZW(ASR, asr)
 DO_ZPZW(LSR, lsr)
-- 
2.34.1

