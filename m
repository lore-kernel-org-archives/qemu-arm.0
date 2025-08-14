Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B03CA0EE6
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXdG-0002hK-IF; Thu, 14 Aug 2025 09:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcS-0001wn-R3
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:49 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcM-00055j-J1
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76e2e6038cfso1401108b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176618; x=1755781418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=mBUhvRP4DAKA7pa1C+HJF/Uqh2PMDcHzBdQve9YWXjpQbo/36cqlZGRSDf6KhQEg7C
 1JZzi/dLCZc+j/HAVCPGqCphsvND/lH5kLVA4lsQ6CFvVB8K6Dp8G/1xAZH/DvTm2Ad2
 wS+J9yq3KAgAqPvOkB1dLmxKOZLrjbT6RGkoyZw6yQNW23Zz3RE/u92309qjfzH3qbO/
 aPvnrsZbv1DT9OICbjCKO804liJIGSgA5COnYNJtn8+nE7BRADklsgJ43ZgKHtFm/vof
 8r+o+KR/DLaSZK64Quey4dM8hNv8/hyVSsmLsx7Jp7iVqz+Fe/5yyawlQmhVifFSHDT7
 weaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176618; x=1755781418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=PQlJLma5AcKUsJtZaE1MCXc3WPjmsj3W5aOLxM+p2pB2Tksz0HYjRMQUheVX5aQCeX
 qo38XGB7jDqDtHHx/R7Z75Mdzw04qlJwU8nklyfReezhq1uDKDadARqQZDUdxCAKEGis
 J1VV4vZYD5tzPXLzhzl7kBbt2RH8X9LLB3v3lKuDehwBI8wvL61qGbSmF7zAKBDzSNj4
 M2H0i8kSwxlYiowYhPuNSM3hUCMYvGzdG7t+f43jvWMBA8uPshyzsypdlPOFmdy9XV5s
 z+DhKE6eagDUwhEG6Sjx6gLxJbWD/gU5erTY3WI73tLYCQFpHVVkasnURCKSH20A7MlU
 KtWw==
X-Gm-Message-State: AOJu0YyB/MhjANhdjxqfDoennQPFZVdmmd/snTNA4cn4rFUDTniISrLb
 x7l2gqRFV7wMZ2L2WuZDIrU+R9KcvvmqIzQtM2Fju5Rhl11+JI5SZM0+F8MkkBMQAmY=
X-Gm-Gg: ASbGnctuCA3y73cIv1mQv3OhvSedB9wlz/5Xj7tBOnSK6qQ4/5o5JXwM/jbmbEsatiB
 CBGQ6wYR7+0sRseUfJpqduBzdNzepjPnRf/ZMJzqULeOOOjunQxkVFc6YDXaVQjxX9XG2T4Fo5d
 kTDa8dnqqwtaVFQCl70ofG0eyWN9hCqupLOKAieXZAOQj1TIYXxcHQwsgFtyxtu1NQfwrz4ECxW
 hrB8D82/SI0xjUcRLQJWVweMhuIVKFOyOh/E/QTTuTBPbhnmB9ZwmXg/yDGOpGFOWwiOHsRGwQF
 L8N41KLV61wHXFMdGzpZPl5Mv8kol/LmnhLGWEdg4/zMxIhHr/oE4vNyu0q9tLKOj2oZDfDkbMN
 4oGnUfVWwGdS8bA+jrJFHc7l918RIxQWkLDHHh3vaZ/BCkM8=
X-Google-Smtp-Source: AGHT+IF/JNCY4v0x4Lk4N++1yMphTgYbY1dOTRMD8YFOhXWbC7eG2cXbUZREL/n5MSHYmFZ4BMh60A==
X-Received: by 2002:a05:6a00:4f91:b0:76b:f828:34e4 with SMTP id
 d2e1a72fcca58-76e2fc2629cmr3915200b3a.6.1755176618032; 
 Thu, 14 Aug 2025 06:03:38 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 46/85] target/arm: Implement gcs bit for data abort
Date: Thu, 14 Aug 2025 22:57:13 +1000
Message-ID: <20250814125752.164107-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index ae2acd6727..f1983a5732 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -28,7 +28,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
                                             ARMMMUFaultInfo *fi,
                                             unsigned int target_el,
                                             bool same_el, bool is_write,
-                                            int fsc)
+                                            int fsc, bool gcs)
 {
     uint64_t syn;
 
@@ -78,6 +78,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
 
     /* Form ISS2 at the top of the syndrome. */
     syn |= (uint64_t)fi->dirtybit << 37;
+    syn |= (uint64_t)gcs << 40;
 
     return syn;
 }
@@ -252,9 +253,10 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
+        bool gcs = regime_is_gcs(core_to_arm_mmu_idx(env, mmu_idx));
         syn = merge_syn_data_abort(env->exception.syndrome, fi, target_el,
                                    same_el, access_type == MMU_DATA_STORE,
-                                   fsc);
+                                   fsc, gcs);
         if (access_type == MMU_DATA_STORE
             && arm_feature(env, ARM_FEATURE_V6)) {
             fsr |= (1 << 11);
-- 
2.43.0


