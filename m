Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1264941dyc;
        Fri, 4 Jul 2025 07:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaJvnSdR1nE0YAPgnrjjeGg6oRiEBGoDqxJMekRvKIKzHWIdCI9UC8gbAP+HhCwAspQEMRASvRRH0w3w==@linaro.org
X-Google-Smtp-Source: AGHT+IGMm691jq9GaFru7EkarHxLfHWUw56My7V467J9ri92PUaA6yd5mnXOzIWUZq3fnJ/vguYG
X-Received: by 2002:a05:620a:4409:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d5df0f35e7mr282897185a.16.1751640480352;
        Fri, 04 Jul 2025 07:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640480; cv=none;
        d=google.com; s=arc-20240605;
        b=RCinL5dj09LPnN0dSPhkJjkCVC/BQ4/PCbyWrUORCAbQMHEkOmZuc+cNGkUAbnkh8Z
         TYSAch5/lUOlhOZKIF5lxh79c2b/iqkZMbSa+Epen6eKGD6EwzAyfSoXK7wIG5lucoyP
         W/Uw4g6PGqyJaw9A++WbeJkHA50qrxAEOztinuKjTwbpGdsoXnCBg5BVOnaytpUP4/zS
         0XThMeWOU1ZY8GJxm7cM3hX/Mvv5EV8Mg95mAMlenyCT4Qx73GFhET1XfJoTG/mR9RXz
         mpKWArAdtif7+6U/iiu4x0IVU3HsWx2oCC6plTaXOR4WtDOLX3G/Cz+0rBsNV9+Xo2Ix
         V+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=61hUKPP4NzlChuyDFmm/IMVLnPZIGc8U0gNoQgzlADg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=PneZwr9lDwAOPTHlzW0RFH18EQuXRp1jzjIHOgvDSWf5Uo/sIkPMyddm/CguzBsDBU
         6Ee6dPqeuLDbJndpM+mD+Yw0i/bnpqxezYZQYBD6gzAnkpGv1q/BmquW0VfkHoJk9DlZ
         lNkwq5+CTzomtABZ8F9XQsuHOj52VIXMg7SPCDN+mC+UvqZLSepST9vzfjjH6v3GW1W4
         gH0nOHxfcsbjiGPBBEgwq6ylHvsFvVDvVN/PW3TNpwSxmu/Rud2huY6QUVgwvGDQKJaA
         w+LZhEuH+kk3/Lsjw/7f1BqTjb/7Bu9zGq1iDmXfgP5F1Uh3pWJwKk3cq75VPGyOtSvE
         3MYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDkPtjI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbebb6d4si231672485a.306.2025.07.04.07.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDkPtjI1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhQr-0004nj-Bg; Fri, 04 Jul 2025 10:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLv-00047K-Ua
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:27 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLo-0007xl-6e
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:20 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2e9a38d2a3aso1079387fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639114; x=1752243914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61hUKPP4NzlChuyDFmm/IMVLnPZIGc8U0gNoQgzlADg=;
 b=YDkPtjI1Qo9twiZFFyVnuuawQUwA0ncqd5q7cghQMU6XvFksBriHHz+BMiDWGdFD+z
 +BFhSlTBpsvcZtt3ma4NDDooUTgSnW9wNOpSmjULXmcskayOlu+MiubyCNyYCcAd7iXd
 zmukG443XvApbN+ifWXvYT2CXrIVwiOeoDXcihBJ0DGbJsrqD79eVCGS6P13FBnwYM4t
 qX0EThneZ00N1zrQLt8nHv4FZLjv7aTej0tbufqpGjpRQTUJEIgsqDm8pD6/5D7UW33o
 rI9kthq1qxpo++tB3JoHFwcEuYVSgXWMAgoYoYYIQwgp3BRubt7/pVc2xO/Vf/nI2Omt
 Oz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639114; x=1752243914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61hUKPP4NzlChuyDFmm/IMVLnPZIGc8U0gNoQgzlADg=;
 b=GjF/cz/GZx4cQD0JoyxQvp1YiqF4SuLh00c/bG6bJ9bYmuXeaqQhvAbiWE7Klqfg9f
 l7k5+9FXruJZ+c92CR263ClciNiwcBrD97b/z8UNBSLKU0rRAtOGUofc7HUTqMhJldcC
 QOHKRGa1KIvt3zlbEEuyWxtL6xqMO+tJ54TOenoqUV1Xsk1H1zcOQ9kixR3P7xogE7j3
 vXmcQJioPba+auzI2lKImBiu6MEipy6lopz3q5y6bm90bUKm5G+qJ1awCqrmxRCnDmCa
 gTACjv94F5lnwQUFYCgQ8Cl2BLazkJftbefKZUpAb1P22oMB2tsA3JrEkCFPGlyoVml5
 63LA==
X-Gm-Message-State: AOJu0YwNTEDg5gLSi1JR6St4/fY/ydLK3sQ2UtT1rrCao8ugr6L8460E
 yPY7vPxgX6FHLx4i+Qab9xoLF33CKMY80aaTd5xfD6UEXPiCVHQgZjCWSXazFSMQL2c=
X-Gm-Gg: ASbGncvQCEzUVhcqBvZmRkJDwofXxbwvdeySrgspn/P2nFX9QFURb2QEseP8Pr6phFb
 FNq2n0EcX+uJOh6knAisHom/nYUO5AYe0kvL76xof+ZKRJHpHSS4dffQlNyrjSGKvp9No9TPlD6
 0cfOATS1oR7QVrkrwFegPV7WREn2u4fCj1FuM1QO1uGRE7+z7BlnznxYFQmBgJA7Pchd7WM8taY
 5aJa52jM7rPICuZ9qp1hqIOw74EFvIXVK+EhOx0VeQCLUny612+/EztcXzXY61tRQyYITUDwVHg
 zAEh8xMEvcG//wUnWPoEpaqox4bnMLXh5kBHOl9CJw+ou8fQp7ckyZtDZmkBpC0VzYD982+pMPC
 PIuVAOZvfJmx01w3oZN4uzHrrHXe2NbOuivv5dH/vF6rNmPNb
X-Received: by 2002:a05:6871:8302:b0:2c2:3e24:9b54 with SMTP id
 586e51a60fabf-2f796a5834cmr1688497fac.11.1751639113962; 
 Fri, 04 Jul 2025 07:25:13 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 055/108] target/arm: Implement SME2 SCVTF, UCVTF
Date: Fri,  4 Jul 2025 08:20:18 -0600
Message-ID: <20250704142112.1018902-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: Ld7mOx0Ou3Sw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  2 ++
 target/arm/tcg/sme_helper.c    | 22 ++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  5 +++++
 target/arm/tcg/sme.decode      |  5 +++++
 4 files changed, 34 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index be4621f2d9..6314ad7e01 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -219,3 +219,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvt_n, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_w, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_scvtf, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_ucvtf, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index c696246d15..d3841400ee 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1636,3 +1636,25 @@ void HELPER(sme2_fcvtl)(void *vd, void *vs, float_status *fpst, uint32_t desc)
         d1[H4(i)] = v1;
     }
 }
+
+void HELPER(sme2_scvtf)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    int32_t *d = vd;
+    float32 *s = vs;
+
+    for (i = 0; i < n; ++i) {
+        d[i] = int32_to_float32(s[i], fpst);
+    }
+}
+
+void HELPER(sme2_ucvtf)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    uint32_t *d = vd;
+    float32 *s = vs;
+
+    for (i = 0; i < n; ++i) {
+        d[i] = uint32_to_float32(s[i], fpst);
+    }
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 3bf2b6935f..dce3b56de2 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1370,3 +1370,8 @@ TRANS_FEAT(FCVTZS, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_gvec_vcvt_rz_fs)
 TRANS_FEAT(FCVTZU, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_gvec_vcvt_rz_fu)
+
+TRANS_FEAT(SCVTF, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_scvtf)
+TRANS_FEAT(UCVTF, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_sme2_ucvtf)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 79df2dcd2b..449d97bd28 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -746,3 +746,8 @@ FCVTZS          11000001 001 00001 111000 ....0 ....0       @zz_2x2
 FCVTZS          11000001 001 10001 111000 ...00 ...00       @zz_4x4
 FCVTZU          11000001 001 00001 111000 ....1 ....0       @zz_2x2
 FCVTZU          11000001 001 10001 111000 ...01 ...00       @zz_4x4
+
+SCVTF           11000001 001 00010 111000 ....0 ....0       @zz_2x2
+SCVTF           11000001 001 10010 111000 ...00 ...00       @zz_4x4
+UCVTF           11000001 001 00010 111000 ....1 ....0       @zz_2x2
+UCVTF           11000001 001 10010 111000 ...01 ...00       @zz_4x4
-- 
2.43.0

