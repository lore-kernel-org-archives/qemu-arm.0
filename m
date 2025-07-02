Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3706456qtb;
        Wed, 2 Jul 2025 05:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTqNWg46gHmA1dSzB2+Iy9mp0FxVx4yBJdeFNCUA+7tNDQMfrV004tcGqxEryv6mfsPvIXh7K9Q68nOA==@linaro.org
X-Received: by 2002:a05:6870:1d0c:b0:2d9:3868:b324 with SMTP id 586e51a60fabf-2f5c7c53388mr2091728fac.23.1751459907074;
        Wed, 02 Jul 2025 05:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459907; cv=none;
        d=google.com; s=arc-20240605;
        b=MfcIBeWLKc//NcZnJMhIQrKoKteb2rE+x38MqGawiWtsceQ4fkeSfEZ/bF20zNzklR
         K3dNNQmRsKi832/uFdQRqG3MLIkO1TaAPqVj30NyBGUtVRGxDAPsYRyV1v+UKpfl/owa
         IKyDDqhuuV9ISp5Ugth97OQG6KAsLPhBOKnstZ1oRS8Ki0XTWBbw4MHNwLHe/nu17xos
         XHyDkA1US9HgwExpflPxWTMvQcfTqzNWSc7/O1nMzIWgC42d5dX+qVGsGCokteiyYL/y
         dpIWQnhC5N5KcqCocatnid220VcyeX0+qRle0G8WTM2oaRPgS/AKlKUNTbTVBH9JutD4
         MSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fYKrs7/vnCW+3D9Wa8KDDkWEpeNBkgolpoiBmK9XdxM=;
        fh=njEjvfkRltzzVkQ3AeFCyEAWKAshKVnTPNz2aiXrKgY=;
        b=Bp60OMUkgMj46MMa9HLrFUHV3B1kaY5hfGVJ+ZnLnTu8YwIW6EVeQxzJzAinotzaTq
         Ry/gAxvSnny6zcTCodYCgP44/tYDU9CgHhaAxMzI7JM5yGdgI6HbOGbHBZZQfM3xVKXH
         GnwZTZ+T24nh3ZmyewD8f3uY4oymLS+Tx0CrQGkXH3DAiPpC4RhKNQohjV5ZchsmBPDJ
         9ErpGZ/ktTS/Ys77b/yQ7rN4uizm9lu8ctYRrNryjh0xQ1Ih2JHumUk0OQcy2mCfGqYg
         fvPyduM1DwjBnSAHcJEyFacfJx+nu0De1O5bMKQqQAI3zgezYg9jTcqTvD7mJ8MxD69O
         onHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XjrH+Ol3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2efd4f111cdsor2182338fac.5.2025.07.02.05.38.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Jul 2025 05:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XjrH+Ol3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751459906; x=1752064706; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYKrs7/vnCW+3D9Wa8KDDkWEpeNBkgolpoiBmK9XdxM=;
        b=XjrH+Ol3WJSe2r+xJxl+HnGK2qK2VC+YAOVnbDZzVwilEe7jE+QkuxVrydEJezRutt
         WEmTgNZT+5u2Rb4z+X0qDodlGswJy84GpWlcxatTYAwnDH14Kybib6zzd0z3qEy7n5q8
         ZmX9BqZr6Yf2jzqKbJTRD7tXyh/Du9PqTj++w2VF3LisgHgbZXJ6AkzyZ73ZJCDgMaBu
         T7XDHnBwjrj0eJtM0hUfi4EbJxLpRSXYKAmBS2rQi3hM9YN6S0SsLv9OEDZSUHSdBVqV
         H9LX03+5ZrU17KQvQjkDR854FxrD0mEwHlP5W4bBHhOgvBaZClMp3hIFLO4UfjBhTMyo
         kRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459906; x=1752064706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYKrs7/vnCW+3D9Wa8KDDkWEpeNBkgolpoiBmK9XdxM=;
        b=EyeIv8ZzbmxdSbebFFJd1tvX9DyiRTUrVvrqDcJx9jpc6DrlbWQO6cWTL/gZx/1obq
         5idc1lQe22soXFBJofcWCWD45qixxquD9ARCxz+KCorSQivl6sxd2+wn8U+t5HiS0REm
         Yq8zxsDsd7jNc32eoOEmAGi1iwWGTA2/TM4FF98QhKCmq8EY9IKEHcetrUnOw6zwkeRm
         kv0UlOnvT/jnT8NJAYifDcx/o0FUZJ0kaVeLJM8WQuy3YV6ZxQlPI2Pn13qa8qoJMbwV
         zajbPmRrBKZ+BpMUkpLgMu5i0rfGZT/U5tMOcZtLf/2In2QxBdeUT94eTC6WsNAw9V8J
         9ZfA==
X-Forwarded-Encrypted: i=1; AJvYcCXw0CigDQS5DwtOgdkTemlqftv8lhakJYmB7cf7zkznW1oXMNQpJysjaw2QGWhMUsYrNLjq/izvG4LtRw==@linaro.org
X-Gm-Message-State: AOJu0YxEix4bKY9/BOzzQ/dp//vfjdq/iQaOoUwDxYPc2ZaiMCGPiIU2
	SSXytp7HbGOLM7/MO+gJnG6JxtS9H+jABVMa/SAB6FP304qg0m5RDzGmKhO++UgbY7f/cuQUXP+
	ll4icTmvHXg==
X-Gm-Gg: ASbGncsRyXz9E5VH4XeNu0x8YqufExj5tVLeWUfeeQWAmW3bawVRy9J+HfRhElEJU/5
	T1eyae907jClE/13ZdLvzAM2EsJOIMdzYkfahmvfoFV4SMknr35tQFvbGBEGHnNQynGQOWV8UmF
	/A1d8sMOIoEQM8nTsU+alKN3zavjR6JbCoAr7lBuHtkPAhqikDj7kKJ4UiSHtSDX6TwFJ57kmUY
	DWR/S++DqJPKV9V3Hk72O88y3q0cmcsLCwjET+05PfwpCUWWpYaKtcEJRnyoPSaGYeBFEfEEzr7
	hyiOg6t7+DY1Jz8obFHLOvaEm046GfD1Mj10dGWdcDrdG+9ZJ7hc3wGyS6/+R24WtkhmkA==
X-Google-Smtp-Source: AGHT+IGwoHkEHB0tWzN234xQKd3Tf3qaIC4hOtxlwsRTmlGTBhlhpRvnRsN7+3o8xEbC5HnjU1F7xg==
X-Received: by 2002:a05:6870:9602:b0:2a3:c5fe:29b9 with SMTP id 586e51a60fabf-2f5c7d5790amr2167207fac.29.1751459906609;
        Wed, 02 Jul 2025 05:38:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([187.210.107.185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:38:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 58/97] target/arm: Implement FCLAMP for SME2, SVE2p1
Date: Wed,  2 Jul 2025 06:33:31 -0600
Message-ID: <20250702123410.761208-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HhmEj2u7nNLp

This is the single vector version within SVE decode space.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
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
