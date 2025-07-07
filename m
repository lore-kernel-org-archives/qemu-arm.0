Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99459C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:03:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsz3-0000OV-AH; Mon, 07 Jul 2025 17:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLB-0005Hu-Pp
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:30 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLA-0004IW-2K
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:29 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4a5851764e1so83646641cf.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919686; x=1752524486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39P8VwpVLIfAbJ0MKK9p00r7QAC2cXfVTIDM3C9j734=;
 b=sF4H6B9zyYDdjs3QnoE2CKA0OvXwVseq+38UBpvLqWyLPdaeQZRUG6gvNSxH2WiY0j
 CetSDmDhVuAbynU6F6cijlCQYyNCPKlL0dbw8CP7Aw6Dg0e86L/0A9VmspXdJdySHDki
 8Y5m/bjpnbKGd9zrqqhWW3NlsvfmE6gt0pZEphOOynkE6TyNDgxepi7rrnnYyQEgG0H/
 EwHWYXjsaXH0eTCS9Zwk3kKyrdicfHeq73ZB9XghfmNWtMDmLS4zZ5Lxr9RIIlAK7t8Z
 l0nOCNgyPtwTqQvwzABkLUDJ0Lcw/sD1ISj8l1eyREmoeqSjV4d9SlEZ3S223If6dg4l
 XsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919686; x=1752524486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39P8VwpVLIfAbJ0MKK9p00r7QAC2cXfVTIDM3C9j734=;
 b=saBglCamh+73a6RayJTWpaL2empDoJdaSsOP7lhQw3cgAXptgbEnxQdxkri2YJTPcE
 ddOJ8x+J8u2TQZq2LyNCQ91nFh2Od8i2dSQlw5DCxVV15QweQp96wN4Ss+RRHuayGfyQ
 B5Nqp1vhpKxh8phrxDy8lalU52cbNbmeDftwj/T9LLETf49O3cbNyvTImaiZqhsNHhDj
 akAZXiQctTewDJ+dkKBZHl8CrapLRH8ii2KXH1VdBua22S8wWQs7CyY5FPkp0oaUeG2y
 jl5MKBpKaZBQ6HLn8Tj3RbOkq5fWNGneY2EyQcWL9mpJA4ylKmp9v23foeZsUjqi8I+2
 Gv6A==
X-Gm-Message-State: AOJu0Yytsjn8OVOeFJ++gh3u7mr2R7UlOq0gR9hvd/hY3J6F++2MRhHU
 TU7anD0CeYbMfr6YPinzfAUqq2OwWIn0o3yHZtQm6oLzQDN4hp8Iw5du5ijUkObmpt8=
X-Gm-Gg: ASbGncvRQUtGxWp8mIwrifHUP0GXNunIqGQUQAR0LpSgUE2pKRto0jrRW8/nW7lwjGH
 rG+zfN4Gsru6IMSMwScuGvMmvgfDr5uiM9K2sOdbEtU6/SVtkmwlv1GwcLzPQiGsgoiuGTuVRvT
 +YwqFMpG+R/61u53VHiWubyvwqgQ7em9mNFByYATSoqtoFf9fc5BB3QLbwGnMhce3Ul6LSZzqWs
 GRv3Doa2PSSI3OT0RuWe9hzvQP5ZG3Ose/MrTyOOKSVzddTiDhdLeb4cuK3U57HDQHLkE1yG8t+
 ZNk1+uSWY7gEVzkWVF88k4fMGExqRKpTvdrQfSa35T809DAzDIzcunzkEcFYp4zBIHxUWmq+rOS
 rp7Qh5D5m7kG27YT+
X-Google-Smtp-Source: AGHT+IHYn0BMjkKpe9MlSSuW87004TOHH0LyNw+ZiGNipRMRa1VpCvjECYgi5N87l4Rk8zaNGhPy2g==
X-Received: by 2002:a05:622a:4e08:b0:4a4:3b41:916c with SMTP id
 d75a77b69052e-4a9cc6ad7femr12312151cf.17.1751919686264; 
 Mon, 07 Jul 2025 13:21:26 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/20] target/arm: Convert pmsav8_mpu_lookup to access_perm
Date: Mon,  7 Jul 2025 14:20:57 -0600
Message-ID: <20250707202111.293787-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 2 +-
 target/arm/ptw.c          | 6 +++---
 target/arm/tcg/m_helper.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c4765e4489..629aa7bc23 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1606,7 +1606,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       unsigned access_perm, ARMMMUIdx mmu_idx,
                        bool is_secure, GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion);
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b71c963f67..a11df31b18 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2561,7 +2561,7 @@ static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       unsigned access_perm, ARMMMUIdx mmu_idx,
                        bool secure, GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
@@ -2750,7 +2750,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M)) {
         fi->level = 1;
     }
-    return !(result->f.prot & (1 << access_type));
+    return access_perm & ~result->f.prot;
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2952,7 +2952,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
+    ret = pmsav8_mpu_lookup(env, address, 1 << access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->f.lg_page_size = 0;
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 6614719832..220a3b472f 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2820,7 +2820,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
+        pmsav8_mpu_lookup(env, addr, PAGE_READ, mmu_idx, targetsec,
                           &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
-- 
2.43.0


