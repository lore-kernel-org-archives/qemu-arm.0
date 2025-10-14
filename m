Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B64CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lKA-0002nx-TB; Tue, 14 Oct 2025 16:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lK5-0002jq-Ri
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJA-0005Oy-Uq
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:41 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-28a5b8b12a1so52105095ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472459; x=1761077259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yz/BsnnxH/AGtjqnFOXBYx31cM+7NtxzeRTWBiS0WY4=;
 b=SVwJSC5fPsDSivo0qDED/Cezk9LRXjxdYy+PG8kH+lMGUk72k5z/k5/2nXwwfjd0Am
 ORmUeadGUsOhujGMRPg2eoR4hM+mbHtNBX6RF89QQybZwUv8dlO9zNJBeg5Hg+Ni4U8V
 +HWia/108ZJgmqKOL1/UvzMC5sXqxCEGRqGCuJHAsVmMVOEu3DL8gZMAfL3MiYvDoFHY
 KaEAgzfbdHPBkVn9S2+TFUKIgB4oADw/TSJlal90VThTCn/Iuj8f3Q5xjA5aZzJpg2b9
 +ImeATLXWuuh9cI5j8zW0IcCYLadJqlYCGrjKL/rdvL3bzLdQYeh3hTJWn1CznM7RDvn
 +KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472459; x=1761077259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yz/BsnnxH/AGtjqnFOXBYx31cM+7NtxzeRTWBiS0WY4=;
 b=Ii/zJVT/dq2v5OkRYNiGHhsUBFULuQfACinsfd0LfqTToyCFStaaCyLBuDfjUVrcK9
 o+CiRpGZmPAo2MIaKBtV1FeWpGWejovBiEzCJ0nqZ/s9KBTZrfxSavr72bDuXiIG3HAA
 WXYAOmmm1TVy1sXi13LZBoFjMZxP2qffWAGqjg0lLiH09MQsYU9NwEwv6y+MAxmRo8fW
 bHmWoifJD+MRZ44fhNqp69ncIRHhfmNJFQydshyM/Zrt63Az24Rzxy9swjhUUE+Ru+W6
 AMPUhWRS13ZIVat+r6OkqCneSTHYwFHTQ6iFFOruta4Ha0Kv9gDQ0WVVaB16tFAP5Fu0
 jQpw==
X-Gm-Message-State: AOJu0YwLOYHjS+yIF278nnjS9m1qGYMk29sX/0fXRsiZYZiNpNTODCDH
 3eGtCOvttF/QmSusxIlaKHfcIU782xYooDkqDRdwzbql6FskYc82EXCwAgVkPR5es9SJlb6Sz6v
 fAQa5/mw=
X-Gm-Gg: ASbGnctuueiPbvzN9z+/aJZlpXbeFFbzQWNEJz7sXSCraFSNuNJydwS/qP9MddXcSEJ
 cadOlMxk/2mKJSByVnhwWZoLtlelA9VymoRXob3JMoZKDzMfmxKd5XhtBc9euEg/9gwwyFbqbu0
 70onaELdkOZR+kFEWOFwRbJ7lpdZYfB2x3NhThZO0WRfM1lfZxafaUWGcJRekNg5Mq/wSse2MCD
 fEUQ1/g5pXDsIxSATJ3c5Y30DGy/2jNB1Ov7CIrMW3pAxIv8Fk9IsJSTmZOoE5XrCSt/gwqnT47
 MVeXpjL1/zvbZ9K3sZeLVAlSbkdvkXwlyGwDYcpAkptsxkEGBgh7rxaiVkB1p4MdivbRKWpkgAm
 Bsup3z1WcZA8+RCaZsgxk6ZaH1PAMbU7iNsGS08Og4wvDrgd5bAQ=
X-Google-Smtp-Source: AGHT+IGUnQe8IVLSARPXZ9y1ekfmbJ0bvi51uOVKcweeC0HmBBkl6XvwlT1+icnoRWNCj1iBu7ElrA==
X-Received: by 2002:a17:903:948:b0:249:37ad:ad03 with SMTP id
 d9443c01a7336-290273ee21fmr347600935ad.34.1760472458725; 
 Tue, 14 Oct 2025 13:07:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 27/37] target/arm: Implement TLBIP IPAS2E1IS, IPAS2LE1IS
Date: Tue, 14 Oct 2025 13:07:08 -0700
Message-ID: <20251014200718.422022-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/arm/tcg/tlb-insns.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index bf8f007869..f7510a1208 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -536,6 +536,17 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
 }
 
+static void tlbi_aa64_ipas2e1is_write128(CPUARMState *env,
+                                         const ARMCPRegInfo *ri,
+                                         uint64_t vallo, uint64_t valhi)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = ipas2e1_tlbmask(env, vallo);
+    uint64_t pageaddr = sextract64(valhi << 12, 0, 56);
+
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+}
+
 static const ARMCPRegInfo tlbi_not_v7_cp_reginfo[] = {
     /*
      * MMU TLB control. Note that the wildcarding means we cover not just
@@ -719,12 +730,16 @@ static const ARMCPRegInfo tlbi_v8_cp_reginfo[] = {
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_ipas2e1is_write },
+      .access = PL2_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_ipas2e1is_write,
+      .write128fn = tlbi_aa64_ipas2e1is_write128 },
     { .name = "TLBI_IPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_ipas2e1is_write },
+      .access = PL2_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_ipas2e1is_write,
+      .write128fn = tlbi_aa64_ipas2e1is_write128 },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-- 
2.43.0


