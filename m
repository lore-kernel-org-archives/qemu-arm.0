Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3446652njb;
        Tue, 10 Dec 2024 08:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSzTOd9QXXobdntZsljFMhdzw+R/N14ob/T3xJUcfMTM3oMYk8knARilOXiwXK7pdS98jFuqFtuf3V1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFzoV497Wg3henzKj+fQj66VlS9UbN8PtSMeY0l3mbHGserZQHUmmcDgETFzA5T/aBknba6
X-Received: by 2002:a05:622a:5809:b0:467:800f:f475 with SMTP id d75a77b69052e-467800ff5f8mr42959511cf.19.1733848226992;
        Tue, 10 Dec 2024 08:30:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733848226; cv=none;
        d=google.com; s=arc-20240605;
        b=lBjIa4xI0Lp6oKikr0I/WiP5bat9mxZ4gNupTbW9IoHjyMtQ8qHD9BRx9f10oMwKe9
         QMLFme4vWn9pD0iRJBY9QnBFVQDBW74NZ+yvo+7BGtYdaJTUbf4w5x5yFmv1CDVMQ80Z
         9vb2jxitkNr0ri3u7lFDzl8+HwLh7JphN5bA7FO2ySxXD/xIOAZyFDpJ9iaAqrnOu1rR
         VlfVj8LJEZkbEG1kfHb1sR1zY1TEd1os3a9vHZMZ60fQiGcHxiBN34y/pA7ENbYiW2Ce
         fzvQCIpbFnmxcegtBrV+7cy1OyOjv5q9NhmGQgO2ysJv56rMoGPqkZgIkaFHpgU3bOup
         M9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=TZ6y+F57D4fouKQLA6T185KyU5VYiN6Vrgoa6ngCNmKnamOPYskha7v3pcxD8BPT4x
         mCbkVeFJx5+0ylvcsv1wNfMnCMTEH++iEjEmKEIDdsw1DLLyAd1BbR1q97+qn5wtJkJH
         m0kudmgeki6NQcea82zdgmpufyxTejzf2lXgkVQNcZNbY0V50GA8yXknI0g/TT+7a54n
         5jSQ12OxdMpRvz12j+t6PY3gzKAf1CW3n1sKg+S7a1rVsh6emXTqCgbkaOF8Wz6voizm
         hBviVDHgIPFq8up6b8dKq7baTuW4ybjYrcXUtRwYaF9lWm05xLW6240BGXtuZts3jHkZ
         Fvgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEx0dY5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729842e4csi133175151cf.625.2024.12.10.08.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:30:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEx0dY5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL32i-0000M5-PU; Tue, 10 Dec 2024 11:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32b-00086q-0H
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:53 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32Y-0007cr-TY
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:52 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e384e3481so3420015e87.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847889; x=1734452689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
 b=xEx0dY5cEdE9SaW5odMwohJB2vW7Oly9RwjVOiVCMPPkqeSCkqTTQMmwJhcNAXLUXe
 ylWcPDtgEhsHIkafLhptj/wdjPzvl5/YYxGfY5lBscpYVD+NyZIieZIDuAgQQ8M6ZSIO
 JILNS04KOwxNVhSK6ieN7qxtFthENMZzU9syRvk+aRdUieTApO7v/L5PtS5hy5xZu7sU
 5sN2Z4AkWaD6gkrPyyFi/mHHPTt2zUt1s2ovg/FlbSgwsMSSFvo7+s878uSVCL6kPt5r
 DpPON9OKKyV40BToze0etzujETx7qSoRM9ASl+KCbqFh1OxR+f8LVCSdlNK0iNcSaYEI
 QUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847889; x=1734452689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
 b=ahBuOrgASkJcbF2qeFTaBVjb7CM6u5Z4vVIkBU71FRRk+z6gqnYPBuq5+MJ/T3y+SV
 yhJKAwhos9a8lkq5khfXzNOf444gODLMbXhvbCLe7nl3e5acP5pcJBRjjY4lrIp/XE1V
 dd1doKTCdWxObGzYdjcPC0G6MwvC5rAhg2Ss2buZ+KW35cMQKMaK9gQJ8Xta16ZJ7t4b
 F+L7TmMu5p61+9qxp2+R8p6AkeubEKlnT/IT0euACuY7tWwEBU9y/CljwrHRuHSLplQC
 73uxPG/yKjo6012xZyZqSBfcukcLuQcjmNOYIjAGu+nwsgQmsAYwAsNEYHZtZaTgo2U4
 CULQ==
X-Gm-Message-State: AOJu0YxpINvtoIy1BUcni4xf2jvk4j1m3wgohV0OiM3UWWC3oT8ZDynD
 Wf5hZSS0rMOwM2aEXhJpeIS0H7YrOHoDBFxtE57PHxJUNVPv9uaJfTw1Og0yAkI=
X-Gm-Gg: ASbGncsNrmHVXmAuyUCNOtG/0pmMLMutvZlH5qjlJnB9W0ExOTeykHuTl9UaabZ5o0o
 U1zx0C3xPV/KnuYly48raEYatp8eBzuVOPfd5P7b6Fcfn21rJ1zwHH2tRuTLRKtpsV982ylZ1iW
 pkwenx7HTFoWkdyfCZAb04FI8QXci9hXoRKV4DQv81VdSDRYXaa62KvQub9q1SePcFFiOv5pE3U
 35hXkrMh1L00AnuUigxmXnMAl8tIkDOAUEwC8XIvkWeJbjB8rsVIt1HXZ0=
X-Received: by 2002:a05:6512:3b29:b0:540:2339:3761 with SMTP id
 2adb3069b0e04-5402339387fmr3130757e87.31.1733847889253; 
 Tue, 10 Dec 2024 08:24:49 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:24:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 61/69] target/arm: Rename helper_gvec_vcvt_[hf][su] with _rz
Date: Tue, 10 Dec 2024 10:17:25 -0600
Message-ID: <20241210161733.1830573-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TMMmqrNnywqi

Emphasize that these functions use round-to-zero mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             | 8 ++++----
 target/arm/tcg/translate-neon.c | 8 ++++----
 target/arm/tcg/vec_helper.c     | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 04e422ab08..f2cfee40de 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -650,13 +650,13 @@ DEF_HELPER_FLAGS_4(gvec_touizs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_sf, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_uf, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_fs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_fu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_fs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_fu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_uh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_hs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_us, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index b9b3d1c1fb..f9ca889bec 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1409,13 +1409,13 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
 
 DO_FP_2SH(VCVT_SF, gen_helper_gvec_vcvt_sf)
 DO_FP_2SH(VCVT_UF, gen_helper_gvec_vcvt_uf)
-DO_FP_2SH(VCVT_FS, gen_helper_gvec_vcvt_fs)
-DO_FP_2SH(VCVT_FU, gen_helper_gvec_vcvt_fu)
+DO_FP_2SH(VCVT_FS, gen_helper_gvec_vcvt_rz_fs)
+DO_FP_2SH(VCVT_FU, gen_helper_gvec_vcvt_rz_fu)
 
 DO_FP_2SH(VCVT_SH, gen_helper_gvec_vcvt_sh)
 DO_FP_2SH(VCVT_UH, gen_helper_gvec_vcvt_uh)
-DO_FP_2SH(VCVT_HS, gen_helper_gvec_vcvt_hs)
-DO_FP_2SH(VCVT_HU, gen_helper_gvec_vcvt_hu)
+DO_FP_2SH(VCVT_HS, gen_helper_gvec_vcvt_rz_hs)
+DO_FP_2SH(VCVT_HU, gen_helper_gvec_vcvt_rz_hu)
 
 static bool do_1reg_imm(DisasContext *s, arg_1reg_imm *a,
                         GVecGen2iFn *fn)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 60381258cf..282dba4bfd 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2507,12 +2507,12 @@ DO_3OP_PAIR(gvec_uminp_s, MIN, uint32_t, H4)
 
 DO_VCVT_FIXED(gvec_vcvt_sf, helper_vfp_sltos, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_uf, helper_vfp_ultos, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_fs, helper_vfp_tosls_round_to_zero, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_fu, helper_vfp_touls_round_to_zero, uint32_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_fs, helper_vfp_tosls_round_to_zero, uint32_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_fu, helper_vfp_touls_round_to_zero, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_sh, helper_vfp_shtoh, uint16_t)
 DO_VCVT_FIXED(gvec_vcvt_uh, helper_vfp_uhtoh, uint16_t)
-DO_VCVT_FIXED(gvec_vcvt_hs, helper_vfp_toshh_round_to_zero, uint16_t)
-DO_VCVT_FIXED(gvec_vcvt_hu, helper_vfp_touhh_round_to_zero, uint16_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_hs, helper_vfp_toshh_round_to_zero, uint16_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_hu, helper_vfp_touhh_round_to_zero, uint16_t)
 
 #undef DO_VCVT_FIXED
 
-- 
2.43.0

