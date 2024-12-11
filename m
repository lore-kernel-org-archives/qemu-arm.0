Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193917njb;
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6EYc7ODP9nuWyCA5HB2ysVkH/whEvGP8oT8umdG8wwcxEgwJ2YscxvscWazEDkbxeDzH1EUTX5s1Qlg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIGDnDL2spvqUDIR2nOCBetQEYMuQmG9cW4oah6cPMiNICfX6LkSvMR8t1TA2CMGGQ96Y5
X-Received: by 2002:a05:620a:6883:b0:7b6:5e73:99e8 with SMTP id af79cd13be357-7b6eb4611d7mr697485885a.25.1733935077087;
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935077; cv=none;
        d=google.com; s=arc-20240605;
        b=DsUIGG2htBCfpQJzu6Ud1cX+0qilnzajFkKRdBVw9FjLNdV/ittUFvBegnH/96RqCw
         OcMU9pLj0k2LdPR85L5sp6YXjbdv77wKbnT+aT1eVFUf93ggN1dXliHVJV2Z0fn02tfY
         JydJeC7DxR+J2NhHZmi5irhhXnDogURfmCzUFvhpOqzwPjT8++3t3IEkbpfrQVRohb+2
         /yPbYzUSxxwu2i7pQH6pShREOpCI0xJFxQODwY7x+/LsDprBFy48POCH3jA2DlaThfnc
         i8TzBkd2V3MJZqAGynf6SUlFVckf3HU1teDyc5NmE7AR+Ykh3uCJbdrukF01opO55I5x
         3RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=byQvauYianywLVIUMIottWk2GHkyZavTa0gS03Yq4b7/M+CwzEyQXVT9pk4UqCOx6V
         DpDZiIlak8wcVWRWqvBeoScJ+ngxJHw8gygEtdT7kVTaM3gK98/wPenNOYDCk0l1utIU
         9rBWZx96esPrrz/4X+3qXluuYNJn8Hpr0P271Fx7AmjngeWM4BahJ0wj5HRu1aQXPFcH
         yNUTK+5mtP0a8vKZCfTbSM5nzavyGghC2p58Sgy9S3lvPoyov229/7+4LAzbn3GxGf+g
         ORsOkY+DEysMuI3yH4t5jDrkqtBY1KFoBK7PoONigr76hUEPbeOZCTZ8gz1Z6O56FJ4e
         5XnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rX0Mazky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6e5ef711asi368203185a.537.2024.12.11.08.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rX0Mazky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhv-0001qp-AE; Wed, 11 Dec 2024 11:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhq-0001ZF-1h
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:58 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhm-0002Jw-HV
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:57 -0500
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6d8edad9932so39773726d6.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733935013; x=1734539813; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
 b=rX0MazkyTVm7MUprROHcs4uAUUtD0Js36kYyXfW786IxejgK42U1VHyplR2cPgquM0
 s7hLyIhRgBlJk4B3TRpwJz8cqx95GGcnzUqxa2Ifp5pn6regXTcbLGuxAMbizMWgTToQ
 KY7lUzK6ntU5m/V3WOnOrdqdCptHY+ox7sN+4SWa5mVObQPAbPDdt4GivnZLITTujEDC
 499HNmZhAG4SYFSTN2A9vdBkUpylsmN7U2qsSpM105ZToIl9ynZvODn7k2bA1kQKJ8QQ
 tyxslwR2wY15JKGbCNR4fBcTw93HsmjC2eTPRKDyV7PPLXknWVzEUtzg+fJ2hck2q2ky
 urSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733935013; x=1734539813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liAAdjYKod9NdKwXJas+WzjDNtaLglsOGyeZ0ckUOos=;
 b=cMl4Y0hNwfVOcGwBITvSatNyexwNNGnHulZXXvWRmxG96m3ZWM2qZI9wl3mxXEg6H2
 vJ78+g0dnjV6sh9AKfu7XQ40Jyx+h5/wQw/2DdfrwnQkoEH2gbWXX76bSkXgOo/ICKyf
 Z4zaYKauP8xpNmQig9GF+18MMbnFo63CjNnVeBvvCgAnYlbdAvoRnqY13XXhciei1Q49
 MQOPL0WowqhruIhihSEkEcwjzNLmuR435Yje9GDdnZ3U67kZpXUtXglewGgDDSajIryB
 gyqT7M4vtUACY/fGQ3BGNYunVkdlHtbXE2XUldzroPkF4nT9VW0D6HvF3igtzhg2V0FA
 1q3Q==
X-Gm-Message-State: AOJu0YwcguFXVDsoiKvKUeFJZW5ZYySpK4g9ILJwLUG1UP1V6ZVrPsBI
 oI4ROzCIiAXn5/Wr5DYWYJlZ07Nbv5xb829ROxFr/L4VhTMyD7n+Ciq+3jzdOhk=
X-Gm-Gg: ASbGncu9XNd+1aC3S/oRXhr/F0te1sXW8fy7TJSdeuC+Rz0UBVxZjPQ1ebzniC5LFiD
 SVAucYjQEwLOdXxpjpbjmnrZy/Zj3/L7Yu13dQC/g8bFGFIedFbg2gewHpsn3cKY6VR34/ve1Y3
 +u7ry+MeAGUbrvrjySYvnADIeGUklIqXHU9HforovotJL3DDRpH4PsnU9cJrHIL/fIK1xcuR1vY
 8mMgKqG02BNUFiERyZU9jDhKyJ5zd30XmdYspQmwrImKVtfqrcGxQF0CBxG3Q==
X-Received: by 2002:a05:6214:20ee:b0:6d8:9660:8877 with SMTP id
 6a1803df08f44-6d934b0e2bemr70592696d6.18.1733935013479; 
 Wed, 11 Dec 2024 08:36:53 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 61/69] target/arm: Rename helper_gvec_vcvt_[hf][su] with _rz
Date: Wed, 11 Dec 2024 10:30:28 -0600
Message-ID: <20241211163036.2297116-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
X-TUID: QUngLnX2CnLv

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

