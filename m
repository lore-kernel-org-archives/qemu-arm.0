Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A6BCCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:20:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7JaP-0000Rd-Lu; Fri, 10 Oct 2025 16:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaM-0000R9-9C
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:30 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaJ-0002mv-Je
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:29 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso3664342b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127564; x=1760732364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpOqxN2RJLucJYrBCL4XiSbhJrK5bcbpor4bzH0LpBQ=;
 b=T8WyIIOYRJXkT2gDCNmBLMKKbzLBQS5ru2gYkoruCabWa41um6EjFNb0OjJ2J41YHb
 xaet3RQhL+LKneoHifX8TvFuVFaKqHH7YeMI4pAhG4v935TFqXFcM1N4Y+InY6z2H05Q
 s6KmRbzw2pDqEKQT7lNe21/+0zhoNaohgrExJU1MaJ6kej/cCTv4MX9Yjh3/IwkO6wmt
 9oGSvmUAZaQviOKmMFtuU7L4ps3pD6RHErYwHIqYH9xSvfJTFDfqJGhsfSGe4+qMl1SA
 uwEtwvnEbPc3W2V2m5ULWP52yUbBJJDUu9bfRV0Zm++4O824J7Nv2QNsZvidJPafGg8k
 Fecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127564; x=1760732364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpOqxN2RJLucJYrBCL4XiSbhJrK5bcbpor4bzH0LpBQ=;
 b=XE6byQWO8X0x69zU8u0Lfc4qlk6Ujfbb4XHVt0XTvZBVVE1/09jd0moR8hF2xOyV3C
 /stnv7kh7i8R7bWYm13FAiMusnSa2VHN9rvdqla4ihCNftvn7O3zU0qhsDiazEoa1uLs
 c1WqUdhxJb/1asTCX3u7nEWdzoqp7nYjZeENr8WQ5taT3nw9NNhWreu+0l70Z5nWmPks
 /Pz1a0NOWUdTQZIoY5VTMI7fJPnIB5nv92WJ20re9rpiUwApPYfLdnp+MRWsthJzccf5
 +xWc6TDTwB4CLgauHTuNxC1IXnp0ld+oNPMxFpvWDzjPnDR0k+TTDf5CJPcFqMbboJz5
 8qcA==
X-Gm-Message-State: AOJu0YwILS78Uc335fvRnzrarXHs1/Edjv9FUKO3nq3e8BRf4YaSmV6/
 AcjeCfuhaSg5BCe3HVLphene5IRbwhiPEXmonELdIz7fBuXFAl/dLnH0mAGdmEl6wj9m8XflYIY
 I9vPtv1g=
X-Gm-Gg: ASbGncunsEaXDPDYXvX9nlXvNZYFx5OUqqxWFIpJcAjI6tOhLHDh3p1ZCs4Yj4f2bVF
 fo2qc0ME6Y/6GJ1mcNbaS8G3YMwXraGWU+nVa/bLf5i7y7uZME8BFZuXMcrhNJo2ewRX6XnrG1r
 3FKW/EdPk5VEVJyDoJYRzUeLrxa6qOSoUcKD/Z5ijx74H+Zb4LzXLXuk6iMlL2hLUYHarMj1UQ2
 ieEPz009KMk3OIjunRapOvVZg5ZrOPAlq8vUwmO3JfqyUINxoDeLqpf4RV4rLOgPLsWRlKZF69X
 HPsdbGfKxWOy5Pz6mi0Dm9sT1fyUGeiNa9QwgvkvAJQygnwYnb/CIWlBFeUpvxXpBKMFvoMLdyU
 LdDNXaP2pxDZENx/azj6oOe/w+UVocscSQ+qy7IWY4S2FLDiVWNjrjWeBnEMxew==
X-Google-Smtp-Source: AGHT+IERgO1YZ3zhuCSh3EAsVBiDjqNgb+8RNcVYpvDRtvEUbDfCNofpBkwNYfbKDoigoxDkBbHMtA==
X-Received: by 2002:a05:6a00:39aa:b0:793:11fc:783f with SMTP id
 d2e1a72fcca58-79387a21bd2mr16797144b3a.29.1760127563790; 
 Fri, 10 Oct 2025 13:19:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 7/7] target/arm: Enable FEAT_AIE for -cpu max
Date: Fri, 10 Oct 2025 13:19:17 -0700
Message-ID: <20251010201917.685716-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 1bffe66e81..6871956382 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1331,6 +1331,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
     t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, AIE, 1);      /* FEAT_AIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index bf81da124a..31a5878a8f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -21,6 +21,7 @@ the following architecture extensions:
 - FEAT_AdvSIMD (Advanced SIMD Extension)
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_AFP (Alternate floating-point behavior)
+- FEAT_AIE (Memory Attribute Index Enhancement)
 - FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)
 - FEAT_ASID16 (16 bit ASID)
 - FEAT_ATS1A (Address Translation operations that ignore stage 1 permissions)
-- 
2.43.0


