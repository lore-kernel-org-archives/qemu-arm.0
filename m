Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp928919njk;
        Fri, 24 Jan 2025 08:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUntymGM5vNMWz/ZOEutxwVsHcjjMaX1mYtYEux59Z621gZ6YxB8tO51M65pQfbN/yUxGr9iivROZaPpg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwkT+gn9FJHY2V3IsgphMPEhn1Gd+rPfr0jB5d+L9HMftmfzyz7GBW3ju/JH4dWdwy/fq6
X-Received: by 2002:a05:622a:14d1:b0:467:87f4:a29f with SMTP id d75a77b69052e-46e12bc5dbcmr409096581cf.45.1737736364148;
        Fri, 24 Jan 2025 08:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736364; cv=none;
        d=google.com; s=arc-20240605;
        b=UhDFvMcB3CSnVkbJTK6iygU+yOOmh3PH7CXQXyd8zqZSQlXwYfy+ES4UVVqSqYcg6H
         UsHmRfzZaZXk63O1yfBb858hXouXa3EYqAaixfj+HXOFbvPy6rlPMgHvt9XaDn4YeZJL
         Otv+1XpzFGx+1MCJ/in7Rf71zfFiRjWNrRaIfFXMI+U1as+Cra1wQAtlq95X3Pdmpz6s
         uWYnTacJe6uolP/QvcEHtIs2Y+ndlbKZQEco8SgIBckaWV1kw+4OnQSSMy/RQS+5G47k
         06zBNHKOI69S3FmGr+gSLeIkBmpaFoS2veLmnzKS1zow+B8WwpotuIFtF6jeKueiWynp
         o26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lnkT6ulKHq7dxxtpiNjIKSKMJRk+cdNio8Qkq1PdbQY=;
        fh=p4KiR89ld/GNb0OGHboAOLXiCvMne43CVqs0bTyY+KM=;
        b=IhNPpPCN6PQZncGaniP4h3+Mg5/QX+L25xUz/iEwrknh70AMnYjK1TUS1ZGaYKis5l
         ecod2KcVHrKbvc0BNsOB4JXhArltovI8E3rGZ9QtQSg6giCnaVLGxQJzppJRF7GdORUt
         agfM1DAvRIpKUk3A/toceiB2eBh5rAAkeRhRY/vX3U6lK9oGWrNLrteyvU1nBuDt1LBN
         RO/tIF2wGFqjTaByPAt3gzi85V3gQuWDu7BFp+3n+qZAU64XuIrEu6GRUl1vm4pQoPHq
         C/fTWyduL96XV5abCMt8/i5Es6wkL1PEamSyzOZRD8CditayORl19tliGoejDDDi04uE
         nebA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBn3PmHU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f04c05si26171166d6.322.2025.01.24.08.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBn3PmHU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMYr-0005C0-KE; Fri, 24 Jan 2025 11:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYa-00041S-3O
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:20 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYX-0005Zp-UG
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3862d161947so1270888f8f.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736156; x=1738340956; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lnkT6ulKHq7dxxtpiNjIKSKMJRk+cdNio8Qkq1PdbQY=;
 b=oBn3PmHUwNg/QGxLVHk/WDVxZ5JQpspjVy1c/S7EGMJO2tqoA9EL9FEOMhQrBAbtQE
 KjmSa6QhbgSdB2SgFh+JjXJe1BYxxNrWDPrKhwKOaumhZtbpLeys9DT9MHkJFIBJ8xMK
 UTc+qf8ueGoaRxN4k0TM8wHTDD4YjSIfKGG7uR7kaPRZfWy8vRtET343KJp4UTynqazj
 uPiSrKfjHYBFWIWnajpKqajoCjZLEzTu0dfjZkGGE0KQFkR1M/fCxmKfHkd5wivT38ur
 Jl4N0F5k1GVCtzpdLz/+xyDi63wQoYvJbpuyBYBSLJqNLG1VuHpMXiHz4yFO3bHWTNGo
 EoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736156; x=1738340956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnkT6ulKHq7dxxtpiNjIKSKMJRk+cdNio8Qkq1PdbQY=;
 b=ncpz3WEnPwn9C5u3OzkE1PyI1117Lax2YMGWw7idNWgu6PDq/ZqIWZLEcErFXrtT3B
 2ZjM1ioqA6ldwqi+TLcIsHrqgC8euM9CSHJJwBBM0O77RDRXXfDJ271W7iivUpZIlSQA
 r7KzgTOgM0ipKLdOwb6+dbJ9L896BrVLcHbdzW0jcwbr25Jton4lXHy7e2v212GvA8hU
 1C1vSu56LGoq336FuXJ3ocEk0LWcW4keu/GMG90TYMpkg9/Hdb0Kd7n9WjEU57Sd2wGy
 5T9SKycwlvpA8iiwYYsAshMrW9pSYPDEx9ulv13LDSFnCJyRM8KEtfSYXltU/+UqZoX9
 W/LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgF6IK/HwwXw84rhFuotCjGWfuQ37q1LoJ7e6ovThWirUMTKX0zXvhx1Hu1q6ixBr+UT3HiIwriO/3@nongnu.org
X-Gm-Message-State: AOJu0YzgL8DPdf/mxkA6ByjucElWJoQgaU2iks1e0f+R2FiCwvFz1Kxx
 dq6tX9ilBOGooOo5MIJVPAc9PKbB0e5PS9/qAGeQJPHioQAzPSO3xYPl2qVMWJ5rLB3bM96BwNf
 N
X-Gm-Gg: ASbGncsx3BvRAN+eLtYxybpXP8w1CJ0ZlG+0uO35Ngm9tV1rPf8OCrza5jAPszHSS+H
 spkpzg8MyouTTz/pA+Cn3PQhWKsTseB90Iw+XZTjHfQ70Dnf1OvUopqYlhYAIE1UIbPMaso3uaj
 k174TwYXvs/v4akgCzkUWtcPQ9fzPJXD/4I/pBFoAnxC13D/ORkdKBnyBRxhRH8v7eCcj2HJfyf
 jlScRFdhVtGvyGicdPoxWOzxv4b10K61xoPceVgGZGFCj1I1ezKE3g/UQ5cgziIb3MXk0t2In9x
 YTvqpF5+Og8=
X-Received: by 2002:a5d:59a8:0:b0:385:fa26:f0d8 with SMTP id
 ffacd0b85a97d-38bf5655a0amr27922080f8f.8.1737736156326; 
 Fri, 24 Jan 2025 08:29:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/76] target/arm: Adjust exception flag handling for AH = 1
Date: Fri, 24 Jan 2025 16:27:50 +0000
Message-Id: <20250124162836.2332150-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rVlzuUU8gi9I

When FPCR.AH = 1, some of the cumulative exception flags in the FPSR
behave slightly differently for A64 operations:
 * IDC is set when a denormal input is used without flushing
 * IXC (Inexact) is set when an output denormal is flushed to zero

Update vfp_get_fpsr_from_host() to do this.

Note that because half-precision operations never set IDC, we now
need to add float_flag_input_denormal_used to the set we mask out of
fp_status_f16_a64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 7507ff24bc0..2eb75bd7ecc 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -78,7 +78,7 @@ static void arm_set_ah_fp_behaviours(float_status *s)
 #ifdef CONFIG_TCG
 
 /* Convert host exception flags to vfp form.  */
-static inline uint32_t vfp_exceptbits_from_host(int host_bits)
+static inline uint32_t vfp_exceptbits_from_host(int host_bits, bool ah)
 {
     uint32_t target_bits = 0;
 
@@ -100,6 +100,16 @@ static inline uint32_t vfp_exceptbits_from_host(int host_bits)
     if (host_bits & float_flag_input_denormal_flushed) {
         target_bits |= FPSR_IDC;
     }
+    /*
+     * With FPCR.AH, IDC is set when an input denormal is used,
+     * and flushing an output denormal to zero sets both IXC and UFC.
+     */
+    if (ah && (host_bits & float_flag_input_denormal_used)) {
+        target_bits |= FPSR_IDC;
+    }
+    if (ah && (host_bits & float_flag_output_denormal_flushed)) {
+        target_bits |= FPSR_IXC;
+    }
     return target_bits;
 }
 
@@ -117,7 +127,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
 
     a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
-          & ~float_flag_input_denormal_flushed);
+          & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
      * Flushing an input denormal only because FPCR.FIZ == 1 does
      * not set FPSR.IDC. So squash it unless (FPCR.AH == 0 && FPCR.FZ == 1).
@@ -127,7 +137,8 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     if ((env->vfp.fpcr & (FPCR_FZ | FPCR_AH)) != FPCR_FZ) {
         a64_flags &= ~float_flag_input_denormal_flushed;
     }
-    return vfp_exceptbits_from_host(a32_flags | a64_flags);
+    return vfp_exceptbits_from_host(a64_flags, env->vfp.fpcr & FPCR_AH) |
+        vfp_exceptbits_from_host(a32_flags, false);
 }
 
 static void vfp_clear_float_status_exc_flags(CPUARMState *env)
-- 
2.34.1

