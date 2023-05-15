Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6567886ejq;
        Mon, 15 May 2023 07:53:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7R/RqnkCpOkWM9egwr28N7disdTlByBX40emR7iPTB/NqTwNyBRTLYc4zg/EW3dPioKZgM
X-Received: by 2002:a05:622a:1a09:b0:3f4:e11b:d18f with SMTP id f9-20020a05622a1a0900b003f4e11bd18fmr28905096qtb.25.1684162401464;
        Mon, 15 May 2023 07:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162401; cv=none;
        d=google.com; s=arc-20160816;
        b=VRtX02gm0P5MO4xZcYJMwl/A9uXVv5Oy8klmnFuAzZV6Ea7lkQwrPaQIz0xH3fX2yi
         4ZpUgc3Gi+ZDigWHBUpaM/LFFh6EK7tDgKJ24/XRTkVgajQ3e/ouEmC0rmWi+i6cO+Lz
         Hj3j/Mphk9Ih2fU6jvZ508Y5U2QIw5oK/wzQ227qQkcoJEWa0mOOeDGQsvRAb4viYRPp
         3GiDCUWQbtsfyHn0Nh1SKO7XaNmluqahCtGMMKj7q1KuYwFnm6PUqUKIj/2XMIzw98N8
         Kf66dyUbeYluyhgV92GyQ4yAsSUxTiEQ5QLf7krp6ns8zqJ+mlwgCSoblGoncupq3e4j
         raBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t1hIIKUo7PoLuxvqXryvPnYOSzjxwn2GYHszm/BGZZQ=;
        b=PYh5RpIbmNd4nfSKaw+HNEhsZQtyZ3Ae0C1S2cAsRIrszjc10X/CvMu5u5XvvG3Q/x
         7RNRilbyzWTwKUNNDFlT6RSebS0bvKa8E+ThrZGIKMO5UG1q0vPg9SAyazHYHdXBwpnz
         0j5Mp8qb3B8JQ8ihMKKl9+Bv7lxy/xg1e9oO5sSO9lN+6uwZpkTJm8JDj+jaSmPGjvZ/
         4f2MLZLpkaY41JD6ynm11AGpJPUKF1fM2K9RGzONTy1JLJ+QMG6k0/qOHLwgMd9I7qrq
         dCumcoX6IQ/h8O8hpioUKbi09I3KiWqKxI9gIm9mqUaHIztii4M84cty44tgqlBZMGhW
         tylA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wx1aOCcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b003ef5bbe2904si10085278qtf.741.2023.05.15.07.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wx1aOCcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIu-0001un-TI; Mon, 15 May 2023 10:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHh-00079h-1F
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHa-00050d-NQ
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:42 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-52cbd7d0c37so7357904a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161217; x=1686753217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1hIIKUo7PoLuxvqXryvPnYOSzjxwn2GYHszm/BGZZQ=;
 b=wx1aOCcMxrdRBcClXzU/JVDXzLeYSFDD/d4zTHM1y1SWA25cLtkLgG7hS2iIvfR3tL
 TpxtXw4huShC+24M2GF0TS7KLUm4+7ZX4NeJEKhmGH7dypvjg6Gy+cep6BBIQqc+kTti
 swexNPwxc72S3x2oZiVEhwgtsRBdOAU8gTwh4wpv0MuO2BOqh9bGJAZylQBOi9gKtKf1
 qzSs0LxI1+FsctKB3EFn23Ig0s59nk0eZFEQnr349kGKetPEAVIfxhicxL1/reVglkoa
 1JOpZm45Gdc8ShRaT3CErkqgNxgs3Jv8Ex/y/9DTcKolvv/S2MONqAj/pA5IsTVK2gqk
 duzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161217; x=1686753217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1hIIKUo7PoLuxvqXryvPnYOSzjxwn2GYHszm/BGZZQ=;
 b=iuDm7ZN6rRCaZoXAVbVQElhQsyP5Hz2tFdnYPNijah4BptdDBWLtFZcvu/R+MPtVtN
 yRGihLsu1vqgiRFq3/c/sCdjGvCFedm4naqVbgzoP4YT4oDkJahQvdqeKNiSAfuzcBwH
 jg4WgutitnoVr7hEcJSRKeJd5OAyzXnKekkEkgV+Bvh03OEKi6hq1SyXyDcOczOKeY0z
 cy0P+f1P1ih6uVPmo2sTlwDLpZbeQ8L+Kr1D2togZPb+oL+CGOXWzcyRapDyTqEAK+Cg
 tEVF4hZ9ePki1UysSpJ9Ig2sgaW1Gjef86g7+eaGtdfqKgkeNJ36lm+Wa66+DW32r3aS
 tRkQ==
X-Gm-Message-State: AC+VfDxgtFTpt1UQVTg39HHGBSY4xn5SzBNC1i/w/zL0kt1DqZXufMPG
 4FJrOKPagTCkSQkk4JebdrqfLcfkeOXVQOhmzHE=
X-Received: by 2002:a17:903:48e:b0:1a2:a904:c438 with SMTP id
 jj14-20020a170903048e00b001a2a904c438mr35834889plb.58.1684161217185; 
 Mon, 15 May 2023 07:33:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 26/54] target/sparc64: Remove tcg_out_movi_s13 case from
 tcg_out_movi_imm32
Date: Mon, 15 May 2023 07:32:45 -0700
Message-Id: <20230515143313.734053-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3PD2lqe1K4PO

Shuffle the order in tcg_out_movi_int to check s13 first, and
drop this check from tcg_out_movi_imm32.  This might make the
sequence for in_prologue larger, but not with worrying about.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 15d6a9fd73..2689599fd6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -407,15 +407,10 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 
 static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
-    if (check_fit_i32(arg, 13)) {
-        /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_s13(s, ret, arg);
-    } else {
-        /* A 32-bit constant zero-extended to 64 bits.  */
-        tcg_out_sethi(s, ret, arg);
-        if (arg & 0x3ff) {
-            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
-        }
+    /* A 32-bit constant zero-extended to 64 bits.  */
+    tcg_out_sethi(s, ret, arg);
+    if (arg & 0x3ff) {
+        tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
     }
 }
 
@@ -426,18 +421,18 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
-        return;
-    }
-
     /* A 13-bit constant sign-extended to 64-bits.  */
     if (check_fit_tl(arg, 13)) {
         tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
+        return;
+    }
+
     /* A 13-bit constant relative to the TB.  */
     if (!in_prologue) {
         test = tcg_tbrel_diff(s, (void *)arg);
-- 
2.34.1

