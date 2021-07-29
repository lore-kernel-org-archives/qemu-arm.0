Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5180999lfc;
        Wed, 28 Jul 2021 18:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHPxDpjk/a/WznwUQ3ai/QzoeAgWxRIgSRroUBKxQxZ00PNW9M15qmbUuYX9UWTSkP6dtu
X-Received: by 2002:a67:f982:: with SMTP id b2mr2615066vsq.60.1627520610096;
        Wed, 28 Jul 2021 18:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627520610; cv=none;
        d=google.com; s=arc-20160816;
        b=uEkqYQdwzm9JxKOeq+T62r1aC8S0kbCTyRsHd9qB732mfpf1pLl+JqIPC5Ijsc9jVP
         eTJUV3mQKQMHNoeXzK3qEg108UEwhbOgNaBF0cbvt2xKNLMVoFb0SqJWscA5E60Nb4p0
         /Oghz8VBeO7Uo9Dyt4/p8pqcaA8UYS6RjH4s9hGu8E1O3iKqNJMTLU+2gRaix4AVOCjS
         ixqK8Lo0AkqRxTBcT4+VvjMCMJPOLcmeBWa5gZeZBjcsrfkMDTyE9II17z/baoJivldq
         G0P01UZfSAqXhTgTSP0x+4wMQYq5b9GphnqFXNTPn4B8KNv1aUxN5nvECWDKYkxssqSD
         6GBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NHRZoirNoTHxGtgnKBD5KU0nwFZuPSOyC5ewe+RRNqg=;
        b=bQ1xZlf7av7r2vkWVRmwEZkpKx3vuZKI28XqMo4fHJJEj7QTB+fC4+sm5jncTZKRFJ
         kc3HlLhpYCC5mhyAHf1blgk06qQfBdpnksadMApG8J3scdvYKBGc94k+VCz0hbXOWWTr
         woQ4m/tQxWAdp4J0l/AKDXxICxW+ZE/m3sGrz5nMrwLgCzeuxxlAtMJtQosO77TxZCt7
         L/H5f96FH0dUkg06sWj7yFn9U0nnmQhr2r3BNfr75lT7+zHapxAjaMte80hTB6BpW2ug
         DQ5qf/yYInuMHz6bM4XRNIHygL8JB1jJG1WkuzQ4FTuEFD3cm5wa/FbanvSjaqeIQbYe
         hAPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKzN3vjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o128si743411vsd.238.2021.07.28.18.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 18:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKzN3vjD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8uSP-0005gJ-6X
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 21:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCt-0004mP-En
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCp-0002ik-JW
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id m1so7800972pjv.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHRZoirNoTHxGtgnKBD5KU0nwFZuPSOyC5ewe+RRNqg=;
 b=pKzN3vjD/DXW44u8g3p5CRvd0fnsk+rRkYQ7QgJ/JWKWIRj11GmSJpYAc2g3VtEwJU
 gRkimQXJpkg/qHQZf8aw/Y8I+hoQYuJaDzj9Sz5Tunpw+Pp65nHKNT4YtKlCNk/Wb326
 z0JdYtUpWhZv1Qp+wUj2e5jMFQLodZ6pAgCwP3GlOChuThhjGZsVS3o/gKB3klBveK47
 1X/19fUcz1bcJSpep6CGqEmOvls5kkSwEMQ7ZtF/gvcspLR44MXvQGiNs4ahPjrc775F
 d1qIf90VKKfOamuZoL6Un1ENv1WY4a1+1HkKtOJHZNsJtCQrEDTNpPQmLvPfjYb04/b/
 6pLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHRZoirNoTHxGtgnKBD5KU0nwFZuPSOyC5ewe+RRNqg=;
 b=SQLwnqJ6nLt2nM2A5sLu79tQqcanxhNLKHTcvJNcaLDdYSzYgh2xqgUG7M6H0EWBfb
 PNSXhZMU3zROHPbXsDidOQOxrJGySA+nYuyVlb06lfmzsfVzjYzpkDOajBGf5AmjU8N2
 GGOD+ThfDS1UjNrDevnjtQk7+Lkv00Sqh8E5CdX/YlAtDcK92ylc9ujb6lJpcEESbkLt
 K66uWV2T3EmxonCKN2/Vzkjm3OTKFWGrN+RWv7Jct+fztaZavhVnwPVYFgBQ4QAFx1V1
 UG/jX1lfe1MZZwPWbKn3Fzc6QgdibaHlinlU/kfm2htm2v8d3uER+pEbPMi9wObuS1Gk
 jAjQ==
X-Gm-Message-State: AOAM533Mv8tEZddozQKi3kg8FBuTdmq7b5+4Vt7C8H8EDSgwEC/Xx2kX
 ZMf+dMw6i/w+JsrR3gejXCsWxRTO9XNTAA==
X-Received: by 2002:a17:902:b218:b029:11a:bf7b:1a80 with SMTP id
 t24-20020a170902b218b029011abf7b1a80mr2249031plr.82.1627519642276; 
 Wed, 28 Jul 2021 17:47:22 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 27/43] target/arm: Use MO_128 for 16 byte atomics
Date: Wed, 28 Jul 2021 14:46:31 -1000
Message-Id: <20210729004647.282017-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KysSB4GVJWLI

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 13d1e3f808..f06399f351 100644
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

