Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253669dyc;
        Fri, 4 Jul 2025 07:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX63ca5GVbCVbWCH4D3341uE5EtfZOVj/YVxoEJL3ylIit0vSgISsPaODA7SimZSWiwJYdLVX1mP9S8Cg==@linaro.org
X-Received: by 2002:a05:6870:8a0b:b0:2e8:f5d4:607f with SMTP id 586e51a60fabf-2f796d8d38fmr1701924fac.26.1751639344517;
        Fri, 04 Jul 2025 07:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639344; cv=none;
        d=google.com; s=arc-20240605;
        b=XSjwAw0G1dcxzZ444ThgqPT1W0r1QM2ivf985E9MAa2wu2g29v2bact3R1lQdbC8dy
         jyvbP9Y9IpIB3101i7QTr931gPi7ltRvKaI7nS5GF0YRfJEhvbzkvWWhR+JlG5MVOdWl
         RqaGfMcK6UkDQKaLG2Y1RsiWDsaVbV/+aDZ4wmAMMMKGjda4Iity8IWLs7UYv0b0WLe5
         S+YGhU824doWg+flYNamM3cFZjWASemNklLb1Xtz3pBg/5wJktSHdDvKXaOFtKtbBmn7
         o1XAeXWpOzLJonkhi3TX+5nqjX2C6YYiO4zAK1fxzphJGlGtacNrC5BxUWzYU7iMjTMJ
         +ziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KeNVKwtvSWzfTAd3k1fcKH4xf4XoDEBrDb3NZwoYAzA=;
        fh=kHKNB7SrEgKIP1Wik/JzMEcyyDjOITKV5aMXhnyBXlg=;
        b=er88es0NnGyQrZUmCGzt0EG7aZNEz7RViSL+EI06k/kKaV1NqK5C42SSXdWeJSppJn
         AjRH1AoeT2wCGQNnFZSH8zQD9FQ2oKkuk4KUa2+ZXz38QqnLsHN23pfZUP3D3VQc/1dz
         +a0xzcv5u8gCGiPYqyUSraPDzOUxsO317fbgjzQO1tH+UWU/vt+80P0g7Q9iHNllh50r
         NzJ57GeBvrGLgrQZWGBnVBKBfEr2WfSkOjyzURYBAZi+3Qm0nVEUMX42Jcnd3UlilC6f
         7sBhqAu+rNVKzIjKSiruOp0mLaHH6r4NRLmpwFsHbx65bz2ZMJHG83MO2HEJ9cUhLhaT
         HZzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLwtugQG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2f790055000sor300600fac.15.2025.07.04.07.29.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 07:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLwtugQG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639344; x=1752244144; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeNVKwtvSWzfTAd3k1fcKH4xf4XoDEBrDb3NZwoYAzA=;
        b=TLwtugQGge6MDBuUfeBV1zSZjzHr0RGVxQleEVSowZsOwScrwb1Y0XQtw5IjmSlQXV
         2Rx2yKiDITxTTHLQDno8ScO6ogjLgmA2jx9Iy1s25IklW3ul4kSVj7AE2a+f8jyYZvtG
         OeDucvPcn27SFy4MPTs1XYLMopkdQdim2fOGI5WgIw9emfcSCll2q0KQkEJWxRBGRygi
         XBdpMBCSGvgx+OY26o/Bip/KbIz4ItIh4qKIYB/6xGmDFmPluxms1xw2FrBHRf73c+s8
         NeMVlZunOv3LNhkzDcj/q1JQ/6ZNovE6PoexF9PiEW4ex6k0XmyZtDeUTG/GrO8fkcXy
         pUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639344; x=1752244144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeNVKwtvSWzfTAd3k1fcKH4xf4XoDEBrDb3NZwoYAzA=;
        b=cezdBI1RB9OeUGj0K0EJprxp/MgRmZ1jINQF18OQOIZqTThAb94VvmvcfE/yijlmEX
         q/F9mQXyLeDw1GyGgcrgdYTTQ9VGtUVldOrPL4rZ15nh1kJ4qx95ii6eNrDIvT6IASau
         fQCMSTtf1sjU2Z7qRZ75Cgl0RSXFPwTEnTpRB8hYxJ9Wb+VsLDQN6gS9kIj0ww+IOt7E
         PxJGsSHjTSA1xCRBWstJgNTWdwbx0fHd2TAvaWQnv5oRu2O7omZHrfX5Ci8TbNKmG9RO
         MySHceW8YsG9QKuyE1RC6qVilIwlFII2QL+r+PlXLztP7vB7BEq+SazOBnIScYkRYUS9
         ps3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp2OLv5LElpzsuyu+MUq6Wc3sZLz4PTuG04bz1sSeYYvd07TmirXnPxowP88Y0mdr+suaKIuCEiP8WMg==@linaro.org
X-Gm-Message-State: AOJu0YwxElxVTCVHQizjXHVhTb/CirCrL8eRu7XIkQwBuudVpwovs1/+
	JjCOlPbA8N4Pd2QW2kiwlQatWPKSZZwViOSf0ZmrbUrSCu5F0C1MfXqUvV9psd7kII8Gpw==
X-Gm-Gg: ASbGncsAABRwv/cLUFuJ2V+WjFK5Enzv2lxj0HKt6+NPRD1H9DDXBDMlVGNfEkEzvVl
	CJ/C0k+t5PjetMQ29iK4Ex3Mr1n311QD443CYGYDawXt8YkurQPcYsIrILWxocYTOhbEQajcYWF
	8eVx708aaeF5zbBEgHS5CsKQb2pby308YrnlvJJOZO2YbKkx6hgR7UDM4YkV4hZfDQ4nfOxygtU
	CAMs5b5kMkuGXLduyhjSYiV9mYTttnwTFcvWs7YV69W5xHn1hH63fj+C5s6mGO4CFDzfHf2sv3h
	88UZhLcexPeYLn9Xcty929xayFNrBbLO42OmaSn2DhPMH4EHMgIkKWUNLKRzQdp7awBPQtjTESk
	KMb1Kxm5oMVDdm9PpeEHzAOXg6ceqPXGiXUQNCdOnzu4IjPGI
X-Google-Smtp-Source: AGHT+IEx6Ze62pDKfPs7wG4Dytn88pewLs7GfpWSvSLL6gQ7c5zPCFQPNjiHyX1nKV+kVkAHIpdeYw==
X-Received: by 2002:a05:6870:1484:b0:2d6:2a40:fbe7 with SMTP id 586e51a60fabf-2f796a56f59mr1899344fac.6.1751639343963;
        Fri, 04 Jul 2025 07:29:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:29:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 104/108] target/arm: Implement FMOPA (non-widening) for fp16
Date: Fri,  4 Jul 2025 08:21:07 -0600
Message-ID: <20250704142112.1018902-105-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: URIGo4lsk8zJ

From: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  6 ++++
 target/arm/tcg/sme_helper.c    | 51 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  4 +++
 target/arm/tcg/sme.decode      |  2 ++
 4 files changed, 63 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 2b22c6aee5..fac70a82b9 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -137,6 +137,8 @@ DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_7(sme_fmopa_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
@@ -146,6 +148,8 @@ DEF_HELPER_FLAGS_7(sme_bfmopa_w, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_7(sme_fmops_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_fmops_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_fmops_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_fmops_d, TCG_CALL_NO_RWG,
@@ -155,6 +159,8 @@ DEF_HELPER_FLAGS_7(sme_bfmops_w, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_7(sme_ah_fmops_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_ah_fmops_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_ah_fmops_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_ah_fmops_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index eff0ce7480..d23d9f08d2 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1002,6 +1002,57 @@ void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
     }
 }
 
+static void do_fmopa_h(void *vza, void *vzn, void *vzm, uint16_t *pn,
+                       uint16_t *pm, float_status *fpst, uint32_t desc,
+                       uint16_t negx, int negf)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            if (pa & 1) {
+                void *vza_row = vza + tile_vslice_offset(row);
+                uint16_t n = *(uint32_t *)(vzn + H1_2(row)) ^ negx;
+
+                for (col = 0; col < oprsz; ) {
+                    uint16_t pb = pm[H2(col >> 4)];
+                    do {
+                        if (pb & 1) {
+                            uint16_t *a = vza_row + H1_2(col);
+                            uint16_t *m = vzm + H1_2(col);
+                            *a = float16_muladd(n, *m, *a, negf, fpst);
+                        }
+                        col += 2;
+                        pb >>= 2;
+                    } while (col & 15);
+                }
+            }
+            row += 2;
+            pa >>= 2;
+        } while (row & 15);
+    }
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_fmopa_h(vza, vzn, vzm, vpn, vpm, fpst, desc, 0, 0);
+}
+
+void HELPER(sme_fmops_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_fmopa_h(vza, vzn, vzm, vpn, vpm, fpst, desc, 1u << 15, 0);
+}
+
+void HELPER(sme_ah_fmops_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                            void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_fmopa_h(vza, vzn, vzm, vpn, vpm, fpst, desc, 0,
+               float_muladd_negate_product);
+}
+
 static void do_fmopa_s(void *vza, void *vzn, void *vzm, uint16_t *pn,
                        uint16_t *pm, float_status *fpst, uint32_t desc,
                        uint32_t negx, int negf)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 782f408061..119a5665e6 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -569,6 +569,10 @@ TRANS_FEAT(FMOPA_w_h, aa64_sme, do_outprod_env, a, MO_32,
            !a->sub ? gen_helper_sme_fmopa_w_h
            : !s->fpcr_ah ? gen_helper_sme_fmops_w_h
            : gen_helper_sme_ah_fmops_w_h)
+TRANS_FEAT(FMOPA_h, aa64_sme_f16f16, do_outprod_fpst, a, MO_16, FPST_ZA_F16,
+           !a->sub ? gen_helper_sme_fmopa_h
+           : !s->fpcr_ah ? gen_helper_sme_fmops_h
+           : gen_helper_sme_ah_fmops_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, FPST_ZA,
            !a->sub ? gen_helper_sme_fmopa_s
            : !s->fpcr_ah ? gen_helper_sme_fmops_s
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 8ad86f707e..3c58fdd2a0 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -183,9 +183,11 @@ ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
 ### SME Outer Product
 
 &op             zad zn zm pm pn sub:bool
+@op_16          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 ... zad:1 &op
 @op_32          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .. zad:2 &op
 @op_64          ........ ... zm:5 pm:3 pn:3 zn:5 sub:1 .  zad:3 &op
 
+FMOPA_h         10000001 100 ..... ... ... ..... . 100 .        @op_16
 FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
-- 
2.43.0
