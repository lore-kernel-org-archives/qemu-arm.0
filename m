Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251576dyc;
        Fri, 4 Jul 2025 07:25:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+pipO7oD4LQZk+rNitPAeESKE9qjShlhhSLiIupNGgtwc6DCmYSAqpAaIPfYjSyBeqgaq73kk4ePaQw==@linaro.org
X-Received: by 2002:a05:6830:668d:b0:72b:a06b:dd71 with SMTP id 46e09a7af769-73ca65cf7bcmr1526856a34.5.1751639126926;
        Fri, 04 Jul 2025 07:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639126; cv=none;
        d=google.com; s=arc-20240605;
        b=MJ5hnqKXSTvrPE3tUQS/xtvg7QMyOjfc/DiyEnYwARJC/PYCK16cBJyvTugYLD0RGA
         urFSdTdiOX6d+TeTE8I5X+i7Eky78Lsl1pbVGPJr4spa6gEn2JEDgBttk7QcrA3bF+67
         jTp8YCNVtpUgBPn+cqS08FWtvxXyJXFdutRr/J9e+VSOIY+aAv7PhXa0ZrzxXgYTgKwf
         6Wrv9XCLrkjxsIlTofOlRwzII0ZIhqyzhdcbMNnNCzIBAs7ruELPnQTu6+OqyZtRkPsu
         rqpkTkfQcuYPWoY9EA+BbKyZ0srt9vTi5Ulpms2J9VFWA8MpUWMhr2co4gYwP3tXTGyq
         UX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=94yRyXv/a+r27FH2Y4vjXt8+mpChSefv37z2JQXcfow=;
        fh=CGJWPCofk+qTNU2Sd4VeFX0VsShUvjKUABkvqrfFatM=;
        b=R/L84MVBDWXVuzOYGjGG0xNT2gkojg/WgOSR+n/55YYNkxwIIusrMYOtZg54fNKiCC
         qkLdMYjzglvLDM+9Ws+C5gmOT1S2On1y/mCfEj2gzdpY9qdSJhMy40SRsNit6If7gQcN
         nl9/YVJRyqXgRGExNsmH6jT9U0BQYEp42QDYZF54qHAozraRCocoF8pUOkM6vwry9Std
         v1wIU5AamC2jiGaBMhVpRT7qkJ3f4ggF6sSKGP6mtooUPBvnNiH3rpxDIjzNL9G2M8ss
         m16l73V6AzcB8Pui2hopVe+u3LSasENeGQ7l1SIl2w8wWHeJi971ZHra+ozH2CUjLnuO
         ypEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PV6mK/wL";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-73c9f7b0477sor671157a34.5.2025.07.04.07.25.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 07:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PV6mK/wL";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639126; x=1752243926; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94yRyXv/a+r27FH2Y4vjXt8+mpChSefv37z2JQXcfow=;
        b=PV6mK/wL4RjUjyNLG9gNcc9zJfS39vM92NCxoNfb1DMxUdERUedG3/cEyakJD2EM5Z
         V82CCLl9R14sJTfkkwTsW4jq57RtDsFr2p32D6jqF2kLRHM5x9lvPkTjHoV/egUVzqFc
         taXmkET1A/ry1RL9RA5MO0eLAA2qjKfYznMI2Y/a0hEn63zjJ2E+NRNRF0NJ7uisDYpc
         hcK+F6Vxl78XxOUVcanZfJ/5QlNkCtUtM5AP84B1/aRs7CI2EJhP+E6gweLyeaql4pSk
         InrQjtyxLGQPJO/hIpCDVoqPYg1ZZO057VqAo5bcXrWTUs566e614q/oW01NF1oFWFWH
         F+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639126; x=1752243926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94yRyXv/a+r27FH2Y4vjXt8+mpChSefv37z2JQXcfow=;
        b=FBUaSknTankdx6ipN1I/QANkg0Kkd4fxAAgVC5CiMqepRThTqoZvDGU2JXI3bifcXR
         YGgq6WCBAeWPOAHoPzEldmdAcWwBj6QAv3xbA8pxfgSnALvHd1OnMgmGgdW5+EPfj27S
         5IFzSosWpxDKYb+v4zEVNcCVferBeCFNWtlEYFhm1PUF0T98P9ucZ93NFnMuqlSez06H
         f/Sbvvmo61KxVXoOELAHPhy5EniSDixEMpa7YdOUpicQlZc+nWjdcZYk1CFNbd5+nqg/
         kyTaK2KhFvEBiKeWQkofq+9t51juG/M8wlouZIHL9kgo8Y4R/BwoCc21SQMGF4tQ25dI
         Tf+w==
X-Forwarded-Encrypted: i=1; AJvYcCVwTC3z7Qftys5zJTRW4Bex5predrBMCFjxGgpNS4xyG007PppkqkXo4WvlZbXKjoEVmsktje24ZkXtXQ==@linaro.org
X-Gm-Message-State: AOJu0YzzdFEi2wI7f4Hpp3Plgi+bunvGNORomc7waotCf5/tr+So7UF8
	X5uVX6yfXlqEROro7YZjyYDasZcnWcvp6BfyXIrPSGxIQTgk5jdvB5igxegiG04TR2ZEfg==
X-Gm-Gg: ASbGncsg7PFv3J3cQqzlKHlhOfD3sSMP5CGCRaCSydbAE14VTP8J4R4orQTKcv5KQFa
	TbmfK+P0LfBEH25RVUQR3GrZ/lJGaudgaLOY564wSbKFlfdaSNHhbkq/ZqOQv0a/YjeMtl5T+og
	zy+Grn4vibp80xWfX+iuXfTOZ5FzsYfF6tBtVoUk/vL+aCynS2w3OD4Wexehjqr5R5vfL0eEr82
	tJ2ZSB7KOh2HOuXL5k9XQYSkdZuD1SoaY75RRfo6CWLJv1HKDSP2THQHW17WngWcGR+G+lOUwBY
	6CDQh2PR5psq6SILsW6E3FySHRWqsODbNk+m7WwBSZmlU0AFJuhr41TUqbT5tE99v7LEhGwKqBE
	7LYMR3WP8ohTMu5hb7YIS7QOvSQlsxcyx1HROihRCN3p372sa
X-Google-Smtp-Source: AGHT+IEfox0T3kKhZ1LD3ZXgcQR+pSgdZ7UmHnn8OSv1rzVSpM2MXbawUrrDdCgQaSZUCbkJmt/Hww==
X-Received: by 2002:a05:6830:914:b0:739:fe86:9dfc with SMTP id 46e09a7af769-73ca676d742mr1517409a34.23.1751639126421;
        Fri, 04 Jul 2025 07:25:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:25:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 068/108] target/arm: Implement FCLAMP for SME2, SVE2p1
Date: Fri,  4 Jul 2025 08:20:31 -0600
Message-ID: <20250704142112.1018902-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 99AxWalX7IpJ

This is the single vector version within SVE decode space.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ff70bf27b0..210a029ab8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7428,6 +7428,28 @@ static void gen_uclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
 
 TRANS_FEAT(UCLAMP, aa64_sme_or_sve2p1, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
 
+static bool trans_FCLAMP(DisasContext *s, arg_FCLAMP *a)
+{
+    static gen_helper_gvec_3_ptr * const fn[] = {
+        gen_helper_sme2_bfclamp,
+        gen_helper_sme2_fclamp_h,
+        gen_helper_sme2_fclamp_s,
+        gen_helper_sme2_fclamp_d,
+    };
+
+    /* This insn uses MO_8 to encode BFloat16. */
+    if (a->esz == MO_8
+        ? !dc_isar_feature(aa64_sve_b16b16, s)
+        : !dc_isar_feature(aa64_sme2_or_sve2p1, s)) {
+        return false;
+    }
+
+    /* So far we never optimize rda with MOVPRFX */
+    assert(a->rd == a->ra);
+    return gen_gvec_fpst_zzz(s, fn[a->esz], a->rd, a->rn, a->rm, 1,
+                             a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
+}
+
 TRANS_FEAT(SQCVTN_sh, aa64_sme2_or_sve2p1, gen_gvec_ool_zz,
            gen_helper_sme2_sqcvtn_sh, a->rd, a->rn, 0)
 TRANS_FEAT(UQCVTN_sh, aa64_sme2_or_sve2p1, gen_gvec_ool_zz,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index f808362f23..dcfc40ef44 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1721,3 +1721,5 @@ PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
 
 SCLAMP          01000100 .. 0 ..... 110000 ..... .....          @rda_rn_rm
 UCLAMP          01000100 .. 0 ..... 110001 ..... .....          @rda_rn_rm
+
+FCLAMP          01100100 .. 1 ..... 001001 ..... .....          @rda_rn_rm
-- 
2.43.0
