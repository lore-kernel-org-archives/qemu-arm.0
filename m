Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2466254lfc;
        Tue, 12 Oct 2021 19:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlik3vqK9i5fgwJ0MXCvzmsWjZNps6bAUaN/KrvfyUmgYTfuk4AWy2Ad0d+kttrTE23sNY
X-Received: by 2002:a37:9d91:: with SMTP id g139mr12947636qke.308.1634093770698;
        Tue, 12 Oct 2021 19:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634093770; cv=none;
        d=google.com; s=arc-20160816;
        b=bx9Qu+nDYOUwHlRFb7xQ6aKfTc0mrHZe/djjZ+HheqsTBWD8q0cGZ5wFKpWj2Ku3cr
         qvIICEln81OD2zP0ElvQBUjcPPVAYxO1N6Arts+T8RWFE2Xz5/5naHKducU8dQg1409Z
         Aa8TFeFNpLHjhL2gZIYwHRNE8Tx9+roTp7TrJp8RuCjaLe4iK9AwIMMiK+OGubKuBc7L
         5lbG7jcvtPu5mdXuf2z23daBN96lnpK1V6Uc7X50gV851ylB+ihuEoYZs7VYiH8FMOqx
         od1YqlTkvn2Cb/R7nmI47xZ+lVo8i1rh37VTjYeO9wrPRgm/E5b6+2DMlio/CohsXS6j
         o+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
        b=krspinvsk0lTB2CnPIuDCPoHy6NhRLqr0gZFpoX4ytPVYNMnJhpn9bIzkZmYOh/kb1
         YjmpW1glCaGLF9nS2Bwz/Z51Mgp2ELue2IDqiHD03e6MqeM1l1NIGVJlaJCVU6VRBUUu
         pPN7snZ933ggX1Kf1SGeDVdhFlWZy94fdN1oSO69niyTm72Kp6V2Q/EIi/Ut4e5yfC5O
         x7dObWhel4LWQyQFZagmd9xVjzjo32cR0YGrIZmj8qBu25TrF4NmvqF4uvphGeCmpXzF
         m1JQrXIcI80WD736/6s3xcaJSkwXgl+jSTyIukLj7izHimpmyM4yWnzgcZ4L9Y48tr8F
         2/pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRGieUJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si10853143qta.123.2021.10.12.19.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 19:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRGieUJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maUR8-0002Kc-62
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 22:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHm-0004io-Oj
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 22:46:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHk-0004wE-3W
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 22:46:30 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f5so860153pgc.12
 for <qemu-arm@nongnu.org>; Tue, 12 Oct 2021 19:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=TRGieUJXKbCJs/I85N6IfysWm5eqa0mUvOvjIGnuQIQ31/zGMcr9dJ3uwbm9BFf66S
 wGc5LLJkiXH8sTXiAERtTDhIrY0pRJ5Hri+GHzc6C8EipHY6P0KS3AVj9/VGsOrjPQMN
 BqjO6kP4Z/1yZfXQ/7DgpBhFdLK13CzwSKwqFd1U/vHdFAVHW7ean75kDw4xCbB6L8Py
 hnM/l5E0VQihCkJiKGCLDYoZz4zOBUGmlkxSwf4edZlBdfR6Y5QSumCNiUXYCQFHpq1l
 0lMuVb78rCaA5axiRXT2dXsMZ7nl12vG/7uFHEF+0BiyIBvjLbFcZ5vD54f67MFAPDqv
 2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=Zl8pWOuZh0dv+UbYxtfX75dMt2twBhhiAPW4Pzmq8ZSlz76XJMbbreyKHceTS9f4ER
 2ITmGf1P4To8RNlVU3LsZWifFCP/iBo/bB3UIPZ0nF5RhPQ+36ApRxLXP82ieqUAip/R
 P3vTkVIK1gJ/F93DENRgqO+564aXC3N1fNstoO1eqtbofuUyjkaDAOO7ox6X1dtBTm+R
 6XHXhpFicZHjQS+6XIuMb0z1YRT+cLi1gOQ4dR1yAokeqHIFR9NJpGj63wsslaKlvmv2
 6rPs4zQcyzJHgl+P+S+smiwZBVF/NIy5xKKyezgsmG57QcI2vqDhmr6WbKPDuq0BgT2c
 RzfQ==
X-Gm-Message-State: AOAM531YMiiVQVNuVn0Bp0yBXOiU2mIiUHmIiwlvpCLL8k1nb3XX+XcS
 CTid0Z/arhWZWy2Lo4UKBUUmdw==
X-Received: by 2002:a63:470b:: with SMTP id u11mr25438098pga.441.1634093186769; 
 Tue, 12 Oct 2021 19:46:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/48] target/arm: Use MO_128 for 16 byte atomics
Date: Tue, 12 Oct 2021 19:45:36 -0700
Message-Id: <20211013024607.731881-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9U0TAOPJtpi

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c5af779006..4cafd3c11a 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -560,7 +560,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
@@ -630,7 +630,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
 
     /*
      * High and low need to be switched here because this is not actually a
@@ -656,7 +656,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
@@ -677,7 +677,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-- 
2.25.1

