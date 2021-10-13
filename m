Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3216073lfc;
        Wed, 13 Oct 2021 11:25:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTrYE6kJCgNbUDqi5ZCihvYijMPNQR8JTgHWqP9V+0Yr5CLUYwKhfnPDz62RTDx7WyYb9i
X-Received: by 2002:a37:bb86:: with SMTP id l128mr742883qkf.411.1634149516602;
        Wed, 13 Oct 2021 11:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634149516; cv=none;
        d=google.com; s=arc-20160816;
        b=NKR1zYKLt/BjBM9/sEjvwuuPis+jO53mxDrP1rhB1BO6coFMlp7tIF2oH2LY0E3Kts
         B+gKZa1rg5ClIl/fRCdgZd/vFg1CqJebf6Z2dRUpSixCU6Q2zA0KoPbmhVj70CcTU9rm
         fE24UB/3IRa9UmEWdPeHBy/UeTWzDwgsnPdxXBIinmTqWQY0XeK0wdlbpe1paDwvA+E4
         17tr8ZfJ6qVAXqmioGFJJXHww6k+i1bUUDHbw7ExCDA8BaUcngknLM7psEx4rmHfG/AM
         bfx+P6gy9QpA55A2fz8om6u09hPMqdbkUrbrouICMpkxMl5OHZZMaEWr/jfnfw+m/L0W
         oocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
        b=ZtWBf82HWZ01A33QolB5IIR9XJmSgW72/pCu9u+ijwHIp+2bOQjmNYZfecwwWHYH+d
         vbCpHudqY7iBKdXfVuITXdzwMcXz9fSWN75Qr05Zv5wCugy0yNtDS6UTHlUBLg3jPZge
         FgiAz6fMbNnEAXhNwc+tq+fP1Am9lq9EA1t5+te+jM9LK3LXIK9NK0ocxGIjsxrHm/w+
         FjkDz73Vo3OkmOdkRWXiZ637oBi4y/R2ox5DEnWBWLY8jQpFQ4cguy2q+AVoxI1TdGS8
         PTgm/Vqoxz3v+cD3RyvW1PHAtHf7HwxbUqoyZm1R2TbUo7HMCB4KJo/ZXES4smKuQrCP
         7Z1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3VDWABC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si226276qko.92.2021.10.13.11.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 11:25:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3VDWABC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maiwF-0006Tq-W7
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 14:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maits-0003ea-BQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:48 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitp-0002yl-VL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:48 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 75so3155274pga.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=S3VDWABCajdzmRVm9tKJJpitfXWFI1zb9O8xRwXms7dyT80VYfEfduU+MQ44kBFfrp
 RaPqkCgX/e7IEmBQH/2nZVGN2VJlYwxuiRHKnso5rXb2B0k/IFwGzZmgvBaCCtLMiq23
 s5q0O8G8qjHdXF1j3e6bsXrAcHMYoNf8ekskN0wCTEtJnMwKVGrZVRMZkDqbGfmFi5Rc
 0QoT8TKAkMOj+SsN6l+OYkK7HTOWNyqbc+OO0A3MyVIxL5KXyD075J1HDc6tZllW+sWq
 /2EjuS6puZTr/JK6N8mn/ccZuISjm66tGMFXMrDkDCO7Dov6016tf3GGscReiriBoDhF
 91+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDciQRPakuuX9DSUk6eQQR3ypkG2xXbHMYU5/kDhb4Y=;
 b=DxiSmfEWbtzN8ud1iWvxVMfegehb/gpNnyb0imjpGGRloEyX7Pc6BDi+KzSeVtFxOo
 ZoITEVAzgdydpoTAWiVUiOGv90zVDDYoEpl2W+rdaL+xeipC5+l9Yhsl3Oxh3VUbczeJ
 sUYycw2OzYbR/nFZ4y/df6hInU7wbilkp8JfBo1TvQIeiNfvmTEvShFJODHWZsw/l54R
 TzqdQc90xOoFLLffXzUEgAdA3NpGV+yIu9Qtv7e5peL0hfYmo0SuxTLbX1qtbYxMpmc0
 2vhVajpD5DXrZiJo3LvxtlY4+HwSf9/p99FrDGL95gypwA+9cgcaPelH+2cwhAgJkZzt
 2eZw==
X-Gm-Message-State: AOAM532VcWRe5sHKO/7qALUv3M7EBauQ8F4EkkmQ9Tfo8FAxJ99lX9LJ
 Q1O8UUmKNBiZ4mJMFrSwNAZbwR31ccbvSA==
X-Received: by 2002:a62:3893:0:b0:44b:9369:5de5 with SMTP id
 f141-20020a623893000000b0044b93695de5mr927325pfa.40.1634149364306; 
 Wed, 13 Oct 2021 11:22:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] target/arm: Use MO_128 for 16 byte atomics
Date: Wed, 13 Oct 2021 11:22:26 -0700
Message-Id: <20211013182239.991127-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kOTyS4q8kaGt

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

