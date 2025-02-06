Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1778288njb;
        Thu, 6 Feb 2025 12:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXdQCibtWe2T2zlwl4YDQ4qoUsJAR+U/ZPovn7bM7vwuk+SpPtaUFdvWQwBX3E1P5oeLOrQ4CMQZsAXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHQCjunAlqHppH9IPkp3+8WugV0CD9hdd0k+896mgktdCumkRU/Q6hJ0B0mbipkLWXh5WZJ
X-Received: by 2002:a05:622a:406:b0:463:1577:2412 with SMTP id d75a77b69052e-47167a9ef4dmr8917971cf.20.1738872018125;
        Thu, 06 Feb 2025 12:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872018; cv=none;
        d=google.com; s=arc-20240605;
        b=WYjk3P78rrO7UUmcvNHoiMIB6ucOhHlVqMsM1y+6b/XKWvJ2d8sgNIlMS2v5em72eY
         vdD7xm8E8tOVo0nKPZtfNWGjMywBjEdGkKa3yCGDD8Xz6haeQmuQfWaLtoe6QvHiHTKV
         ba88WbOQd6YEeML2SlNJtxWkmVTzEYAnU95LHCPxRaRLguiovHkS/uzAgZ9t4OEA4268
         E2LNz6up/fkGWQcBXuTLI1WW/y8W07GgI0MMn8addevLb3yKyJo7wqpKPlydTgX6Ovj7
         W0QTCpDKcanh+fdq8/QGIIcxj8QDeLEOgqaPlUQsaD/+7ji0u04LbpD2iIM3oWYTaV1J
         vXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5Q7cXwghROfN3epkOy5NpR9R9wlHVJGHAzzuq527brk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=W4Utx74R1iZ888n853V6MoFSP5f1P7PLgMcOQz5UfAxDtKZHMmoSwBLq745A6QztDl
         teRl+5XQhM5f95bK0KPyWg7ELIRz+fKZjWDSfeCtio7OzxHMJ3w/+KbbZ7mcHSp2sIah
         xOAhVTNlfcfcyNfMG5Kxpf6RrTRBVnmkXwk4vUgVK41H2Z5Vx42XVtNUvG0SN6P8/xMp
         U1Dj+ZaCfGIPX18N8eSzYxnJedgIbNsFI/4hX3wGe8q8KEEbguXWYq3Uqq8+UMN6tNXl
         e6qljkSt9NqLUf47QVCn43duDb+ACSs6MjsSC/zTKxvG3R+oUMxHNMGujsW7Pp0axbkz
         dDSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JfEDnXZ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bebbbasi16665011cf.665.2025.02.06.12.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:00:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JfEDnXZ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg80G-0007F2-DG; Thu, 06 Feb 2025 14:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg807-0007AF-Hj
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:27 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg805-0000Tc-Hj
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:27 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-216728b1836so22592025ad.0
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 11:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871844; x=1739476644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Q7cXwghROfN3epkOy5NpR9R9wlHVJGHAzzuq527brk=;
 b=JfEDnXZ8L26LTr88aLdV9yECCyLsZcQH4qv3yBCTuXb8xZK8/fphftYSIxVC5ssXbz
 iztsQGcNLG8VN20Zd28eftzl8cLD4EuXnZRhgc13n+Zc3+9j71rnV1JpJDp2aS/z65nB
 uL0gU9/mcG/6gwKzoyAOrHzl2+yKE3/bdKVmblYMqGPOxqX7hDxn22echwZrN3jH4gNN
 04Z9nyxPj1cmi3hE5hsJCHYlxOsdrjzKrA71QeObx9G7uPihmdREvYA+tts7XqobGf5C
 mbD3bdOBQPFzBXdm20FFOWqiMhF5oz4MX6qzO+1MiLRuOmknPaa/3LUycZMWODe09x7s
 RnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871844; x=1739476644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Q7cXwghROfN3epkOy5NpR9R9wlHVJGHAzzuq527brk=;
 b=nYLT53Yv9Q9n4VNzv9NA8Nx08E3bYN/yvE3y/13dR9gkyz8V45f5rK7waRQS/kGeQG
 fyuyzeq00vIYZVJOiaYkPR7q9qRXPQADl6lQe+a3JtTZkKvH/Do5sh7MetI4KSRrA3/9
 ZNc/l9ZL3tUprJPIhPoxnWQddTWUJaejE2nFD6zEhox5DwMtKL4MDLUdqpTciOuFsJPp
 l0IduAd7WBUgzSKw7qsP9vjOhyN108xvYXdo8PqPvtSkRLaX0DMbSOd67Y7nSAYJ2sxg
 D4H7L+W3S3iZxADb4xuwIpGUhm5Wji+26VOWZGQSdVqo9O5lFuNf6oP8Loz+poDf+CgI
 EFJw==
X-Gm-Message-State: AOJu0YxI0ATCtdq94M5NJ2l+iUrnK3P4i4uhe/5FZr2sFxtB+5ONJp6I
 aVbs5KVb4u5QL5gTUCELvCNRtec2nh8pOltQWC48UqFiPmSwGTqZxXmsPMfqZj894Z9Zz3Guqct
 v
X-Gm-Gg: ASbGncup0m8GV55j4EX9JQWrek1UusSuSD5TD9qY+Vydu3lO1Dpn9ECem7n96xNA33x
 R+eVGWL1+uWj9KNmpNTSpGzrTme6b8XXfGZ5a3w3OQfXrQeABPVqistDDlOkGjNCddNrsNVS3uG
 EEmrB74szcjzrKrx+0LQTjguquhkOYtRz8vMHtARCfkPTYYI7OAS/DKprNlzSwi1v1aUPr67tn5
 WRhQV1T5oHsBKoc6KhJ4i0+gs/mUI7UrqyB/BZZIny6vmH6MD8NZpPPB7KPWLW7uEOj76ZbIbhK
 Z1FCDcJVQKuX6Z9IkbY0rdIKPdsV+2g6L+bVogxLEBjPIGA=
X-Received: by 2002:a05:6a00:848:b0:728:b601:86ee with SMTP id
 d2e1a72fcca58-7305d549ebbmr884776b3a.16.1738871844261; 
 Thu, 06 Feb 2025 11:57:24 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/61] target/arm: Use FPST_ZA for sme_fmopa_[hsd]
Date: Thu,  6 Feb 2025 11:56:24 -0800
Message-ID: <20250206195715.2150758-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kFWwH7ZYh6Tc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c    | 37 ++++++++--------------------------
 target/arm/tcg/translate-sme.c |  4 ++--
 2 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index dcc48e43db..d4562502dd 100644
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
@@ -1035,19 +1023,8 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
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
@@ -1067,7 +1044,9 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
 
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

