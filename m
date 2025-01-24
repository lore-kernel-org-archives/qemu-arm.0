Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933006njk;
        Fri, 24 Jan 2025 08:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwMuWUAo8v7ijMfiwXDHz9V0uTtjXHhsaohDIap8KVTa3zpq0k4OWzLLxjwSURcL5Dzey7OnEn8hBZbA==@linaro.org
X-Google-Smtp-Source: AGHT+IFpOVXQtZWQTv4QI7bJsS/TJLBmtLACsH1iw5j/gCDuj3b/Dcw8o3D4nNj/Y4TwUy6alg1C
X-Received: by 2002:a05:6214:5a0c:b0:6d8:a67e:b2fb with SMTP id 6a1803df08f44-6e1b2235a4cmr465240316d6.39.1737736770633;
        Fri, 24 Jan 2025 08:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736770; cv=none;
        d=google.com; s=arc-20240605;
        b=chXlMXkZ54ok+mGnMLDTlo0nGUa/dq8cDDwX70R755+ed6S5WcIv/K+6fr6zLfNGWC
         4KvGJb6/kzvSAuLXd9nKdPQnQtGi69YsfK6ESymL3ZNuiPf9cLABQH9jVY+TTavXhUH5
         Q29SLzn4Crv8MjEsYZ+M/jEgQ1FvJAD9NH76VZllU0isIzW2FTXzGceYy4vFY/nYYGfV
         wE4hmTIE0PS9MVlh1kjl1WGj7V+f+l/JTzitK9sy34e7tTrLHGQUDpUyIJsIet2FOwlZ
         a/e9HFVAEwfarRwno2sz5XVeFw8CyM1ZDBZcOEGASDjmb74sM8fuFQbzMMeboGNh9wF0
         RBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=34luHZDyy2429KmxgwNFbXGPJ5mxedoShXZjqrjksvU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=GY3dPQtmCo1FP2fJDjWgynnNYOsi6rYT4NiRmntBCTd5PCDz9uC/Mb9Vvj/1ntGsqZ
         20OmOi7r5vNvsFqmqeK2sYuo1VJ+frgwO6rkXTFCHnDmKkkdv88xDMmZ2ELJ43yW6Y0n
         Lcir0mK7r4bIEW7EhFADauDkCJsNW2MRRBM7p2KSlx6PBnjZQGZW1j4GQlko1gIOiNqT
         oSnOI4+edwcm6kMBQl4bW/7lcbgJH3kkCPzIwhcZMSTH+BSJFmWZGOm1Gdde2YzgL9Xq
         Kf5bNVRBKovFuogrrLewVpzM7b5J/yU6AFOgEyWUYOQP4sD5zIcXKo3X7ARjsxCCatuz
         tWOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/EKfThN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525cb75si27141296d6.45.2025.01.24.08.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/EKfThN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdT-0007iv-Ka; Fri, 24 Jan 2025 11:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYn-0004u2-CE
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:33 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYl-0005ei-I7
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd730so16570385e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736170; x=1738340970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=34luHZDyy2429KmxgwNFbXGPJ5mxedoShXZjqrjksvU=;
 b=q/EKfThNwnS6F1UljhblK22mmQeYpI/va+Q0N4FmJwAugqvip2HI5i0xZL/l7aIwe/
 f2zoyS3qB22EmCvVKzVJ71QdDERD7USgFV6Zpb7RMZJEXGH2S+4KRczFwqt7j8zNY+YL
 lNeemEveOcrohE6GHBHkarx6kiFd7stHcXf5ZHKMrjgyho4kA5D3Jk/vI3KwdCKdurDo
 x8SRYZFObHit2Wx7leePVLXnvRGhH+CnU4Lx4dZiIBqZ4yB55Fx/KmgUHw0ZN3O8tCFQ
 rXDZ8+pgUb5/m/7vCNxON6F6V96ZXu+qKM0f8tkp4A3U9mcPLC7oiUM9zMUAYY90BumX
 ueSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736170; x=1738340970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34luHZDyy2429KmxgwNFbXGPJ5mxedoShXZjqrjksvU=;
 b=fMr5G1aXskl3AzOMkWuYuv9Pn2vW7PTGbL65/ZCoYLuDYaIoPGX3r1YMHqPe9U9aGD
 qf/XFlrg09Wsox5rmIoVPlAUVSww4TnCHlJmNW21D3XrrYj2mUC+ZyIbpuA0WZXIOIeh
 dhUWg5JcPCVxt5xV8ruXsIR5o1eXfkQfMdMYSNSvcNUJDIiwDeay2Rr9rhYpZjJTBa6m
 qHgjkfr2J/SRkjn8dO5hMQ+zSDd6dUNizVoRhPNNjtFh8n+WLD7uieH5QQc+1Qa5pfRK
 olMAxjQofFTQxy1/qZLS8I79Kqnz4oA+dpl+zntRIc2fd0TZLLQQ5Vy8l/I5LdTVj1sv
 oskg==
X-Gm-Message-State: AOJu0YxMs1/9De/eUfhM4h7tH4ejbYgo8KNMCcd+f7CdKHM+wMYMcVSq
 DYYdF9XWXVzVOFmTRp1CDCSDfyaSZDTAMyB7lVYV/u4VebECGXyEN8GQ3w8MvJXVhCT3+MgwAKu
 m
X-Gm-Gg: ASbGncu6M2mh3baWa6euqGENjw65eAf3+0gohuhMhCFl2XCmbbqzvc/oWbuMiIDhadc
 Erh8UC/hI2Az2NmWh01dojWLXE32UDoGB26+t4U3UCDKfL+0mR3VVY4skOyHHOgjM8k8iAoi5s6
 aaBIqhCRca67JWxJfbuUseLIB+REJIBaxoIwfs1nqdk9O3WioVHUADfIUxzO4ac5xvxoKzi+b7k
 iXQDL8bbMvtMrazS28Nvv6s5sLasB1TvKEw2QKEFTsfgB0/HTpC9LMzluEd0+Jp8S6FYhFyN1ym
 Rv5AW1pyY4s=
X-Received: by 2002:a05:600c:3542:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-4389145137dmr242320265e9.25.1737736170078; 
 Fri, 24 Jan 2025 08:29:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 42/76] target/arm: Handle FPCR.NEP for scalar FABS and FNEG
Date: Fri, 24 Jan 2025 16:28:02 +0000
Message-Id: <20250124162836.2332150-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0l1NRYa8dLky

Handle FPCR.NEP merging for scalar FABS and FNEG; this requires
an extra parameter to do_fp1_scalar_int(), since FMOV scalar
does not have the merging behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6c20293961a..7412787b6b6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8437,21 +8437,30 @@ typedef struct FPScalar1Int {
 } FPScalar1Int;
 
 static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
-                              const FPScalar1Int *f)
+                              const FPScalar1Int *f,
+                              bool merging)
 {
     switch (a->esz) {
     case MO_64:
         if (fp_access_check(s)) {
             TCGv_i64 t = read_fp_dreg(s, a->rn);
             f->gen_d(t, t);
-            write_fp_dreg(s, a->rd, t);
+            if (merging) {
+                write_fp_dreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_dreg(s, a->rd, t);
+            }
         }
         break;
     case MO_32:
         if (fp_access_check(s)) {
             TCGv_i32 t = read_fp_sreg(s, a->rn);
             f->gen_s(t, t);
-            write_fp_sreg(s, a->rd, t);
+            if (merging) {
+                write_fp_sreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_sreg(s, a->rd, t);
+            }
         }
         break;
     case MO_16:
@@ -8461,7 +8470,11 @@ static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
         if (fp_access_check(s)) {
             TCGv_i32 t = read_fp_hreg(s, a->rn);
             f->gen_h(t, t);
-            write_fp_sreg(s, a->rd, t);
+            if (merging) {
+                write_fp_hreg_merging(s, a->rd, a->rd, t);
+            } else {
+                write_fp_sreg(s, a->rd, t);
+            }
         }
         break;
     default:
@@ -8475,21 +8488,21 @@ static const FPScalar1Int f_scalar_fmov = {
     tcg_gen_mov_i32,
     tcg_gen_mov_i64,
 };
-TRANS(FMOV_s, do_fp1_scalar_int, a, &f_scalar_fmov)
+TRANS(FMOV_s, do_fp1_scalar_int, a, &f_scalar_fmov, false)
 
 static const FPScalar1Int f_scalar_fabs = {
     gen_vfp_absh,
     gen_vfp_abss,
     gen_vfp_absd,
 };
-TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs)
+TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs, true)
 
 static const FPScalar1Int f_scalar_fneg = {
     gen_vfp_negh,
     gen_vfp_negs,
     gen_vfp_negd,
 };
-TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg)
+TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg, true)
 
 typedef struct FPScalar1 {
     void (*gen_h)(TCGv_i32, TCGv_i32, TCGv_ptr);
-- 
2.34.1

