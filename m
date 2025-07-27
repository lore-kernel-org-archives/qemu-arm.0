Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D72C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMc-0001Q6-IG; Sun, 27 Jul 2025 04:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLy-0005tE-2W
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:30 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLw-000499-3Y
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2363616a1a6so27449555ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603407; x=1754208207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Lmoqg22csYQ2DFF2//zFesjPFppxznMHPDSWw6zVyE=;
 b=NNYt6gFzmDaVWv/n0u2egiGs1nnemCD7e1260T51ikjdR99RvdK1QhoHrIRqhOiu3Y
 TLn6drCZ701WW/hjroofzW0U60pp0HImU5OLBIabltc8652Z+zGrQlLSqDriEXNEUalt
 JSFc+mz3VOpuevOXy92BjBB7hk8mTETat+zx+PkSgYZco+XLTZIQxNn7IZFIKSFwZ8WF
 y3pJoy1e54g2MIqqKVymjZ8/kspmfC2NyyyjIy0Knv6c4N0GFA6cpVg1sAaIk/8C5cRT
 lHODeKNhWQhzI2h0X9jLijVr5Zy/bJcZwVCFMG+Y0xLlNXRYM2TNSwNfvi5J9TKM/SiE
 H6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603407; x=1754208207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Lmoqg22csYQ2DFF2//zFesjPFppxznMHPDSWw6zVyE=;
 b=ipOo6c79FtZT6x5P1rvcdKtIjQhB96kyX/k6squ2JAwgcARBYvFoX0IRNhdLid5KAc
 MHDdhSRPSY+NhlaK08lo91NITj1F2enTixeO981cR8HNgtAxwt9Us3Ru8IZne2sa2Ipu
 LOfbZ+TQUkGvWcE0gZhSNTb5AJMVY4nC96GritfbP0wdfoIEM/vcEHqeHA0YS4WXSyrb
 2frhfFXgf4JN4B+rQDNVtF9mgqCnL9N+5vF0g/OxBwZuYDpWgmN4F1EDkYRmynKqLGKY
 gV9dAQR375hEZ6z4edugZrKAFAhzXnoaVSODcu6o7arZ8nS4xawb6QRb8ASPnEjCWj+G
 BqaQ==
X-Gm-Message-State: AOJu0YxJgRhbStDFhD7twMHmwvZVn5kMdjCfZcCVuKFy6VySz7F32Ens
 g9jwRP7MHNG+yAgr/d4QLaqihFCeOdr2Ehy68lds7IYSutwwhAgIM8MVziZomnOY/B8=
X-Gm-Gg: ASbGncvvyz1ophpeRS/7g/DeNkh63GXmWNN9cHix37nsgTP3R0BD0MmqyDN6CBDIDua
 HLh7QOG1br6rdSD0uMABAe/ntRk1dhO9GyoAzCMXNbPZeWS7dWYk/z1Q8eQNLfq74iR+R6jRMax
 Iy/5UkZIiGLfaQ3buQ6L/FCymP4Ev0qbE4zcuRqtwIzmo82aia1UspD+iOzX0Cm3PgvA7LFHSp4
 2p2erwdN6WLgLZTyTK6wkv8hcmX5zUK1Hi4YyPl7kTeMQk1bPi3dLR2XUXt2FUFfMP06DdrfKaF
 7+32xp4FbX4eNZ1bSFvHZLZahs0Syg+YurtZZ8Xh4xttbj/PjEnA2qLrlLejg5deMDyXHeVlPD3
 Y/yXqFPtjjMi65JChknGi2Kw+s3BtWu904bVf8WmRPAXqQP87l0Z20tUvlmaO0czJkynL20f2L9
 IIAfvcCHSBkw==
X-Google-Smtp-Source: AGHT+IEQPP1SILRmrPIfyCrWl9l2RoJ8pQ4La73nEkl3hpCZCtnjXihtfwdGY+gzUg8Q1Alc+HiPxQ==
X-Received: by 2002:a17:902:fc4b:b0:23e:1a6e:171e with SMTP id
 d9443c01a7336-23fb3184928mr116965895ad.51.1753603406771; 
 Sun, 27 Jul 2025 01:03:26 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/82] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
Date: Sat, 26 Jul 2025 22:01:57 -1000
Message-ID: <20250727080254.83840-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This array is within CPUNegativeOffsetState, which means the
last element of the array has an offset from env with the
smallest magnitude.  This can be encoded into fewer bits
when generating TCG fast path memory references.

When we changed the NB_MMU_MODES to be a global constant,
rather than a per-target value, we pessimized the code
generated for targets which use only a few mmu indexes.
By inverting the array index, we counteract that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 6 +++++-
 tcg/tcg.c             | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd835b07d5..85b1ab4022 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -596,7 +596,11 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 #ifdef CONFIG_TCG
 static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
 {
-    return &cpu->neg.tlb.f[mmu_idx];
+    /*
+     * Invert the index order of the CPUTLBDescFast array so that lower
+     * mmu_idx have negative offsets from env with smaller absolute values.
+     */
+    return &cpu->neg.tlb.f[NB_MMU_MODES - 1 - mmu_idx];
 }
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index afac55a203..615675d185 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -425,7 +425,8 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
 static int __attribute__((unused))
 tlb_mask_table_ofs(TCGContext *s, int which)
 {
-    return (offsetof(CPUNegativeOffsetState, tlb.f[which]) -
+    /* Invert the index order -- see cpu_tlb_fast. */
+    return (offsetof(CPUNegativeOffsetState, tlb.f[NB_MMU_MODES - 1 - which]) -
             sizeof(CPUNegativeOffsetState));
 }
 
-- 
2.43.0


