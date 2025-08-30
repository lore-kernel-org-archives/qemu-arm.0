Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2108CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:07:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxU-0003Ti-2o; Sat, 30 Aug 2025 11:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQL-0007Cd-Kv
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:46:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQK-0004pc-59
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:46:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2445805aa2eso29798155ad.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532806; x=1757137606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=FQfB1zLB1nRIdgI+BncuHSRsnkluJcMmR/vOvQLWRav9K861phZ1cmHE8CVqk66mhw
 SmxfLEuOpTFuhitrycAcb1PmKonoH8PDxzcQr7LE1wFYjrs33Q7GueaC2wCcBiFPxhdd
 hRGnL7lsXsE7F96/a/4gZsnG0CJuxkvtnnquDhA9r6dtYMdw/+VcIKLHKmpgHT2D25Mv
 g5nPml7AhMzR77PhpZ0iJiDxKUv/zVuvsMKaaokw2R8FvxFhOYWMAYc6m4EgW6g15W9F
 wTTIyQmunaqiUmcDi4bDXQxE9oPeJDrUHp0QNn3Ql8OkVS5wZr6vUljwhWkp9DY6BtBA
 is+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532806; x=1757137606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=qrDil08wMZpIKSrbVS6ta2xN0Mm7cfFXl7S8YbRYXpIxXIP1zqMc7QUqmoUgL8GwHs
 FHJHq1xYjkgi0z4yJ0bDnmS61ldbhbRfsZwisqIcXwMBjqT3HUyX7iosWYanTojuShPN
 5GdZz86z4YOBcotPl4kw9YR6ptVKQE3CBi8LcV+W1YH5qsOHNvltDfYBKumH19LB59CA
 P33jdanfBhAfX5fql/uUaKQDQGWv21BbBHGsAs3rp+e+/VFDMVJ1MX3qpvcNIvZ9BjAc
 jwR34WXLj2b5PvC4xlcwDWeWMQ5TwFNBOSPaxO2JFmvybF69z9j9/UbN4CkHjsM+gK9y
 8WaQ==
X-Gm-Message-State: AOJu0Yy2MMV7Vn50RH+4g7OoJT31SBEv2BzLh4NqsOn1eVJkBQs3OzcJ
 IkKfMaSc2TgY9rbdeZbzThcJwLE2dcK+ofeXSTUJ+XKl+xbDTwVB0aKBQxfKRQa06AoLCkZO/le
 cQnLqfU0=
X-Gm-Gg: ASbGnct67B6OriWetfl4AYkZmEHcxCWk3uNoOFy/cQOGh9PGHQUYeEO48/+FUeQMaYb
 PprjgTXsiOmBEDociBH1s/e6KgIAzE0eo/Oe0T8pI7lqQHzcPiOZROPS4p4p8X3XuvWHECjgC1z
 +yRuu+dJ7n3q7r1ArRPiVgJ6uTGiQQJ0gGrTj9zPXl/omda1kSrZKJ/E3uthik+FfmagKdy+iIb
 0RJhT1I7T0nF7rWvZyJn1sEPr8CzSqs+/MYpGQBq8EqmZ1lvQg+XC8GshorwYFvs/o+340ZZa4L
 P5DTxlC535z2XqcKt8rIp/xZ2KAOpGs6zyTu8HIGTszGQts+enCacvFnQ8I0CcfbqHNhzhaA4jR
 /rE54aZE1gMvjxUr27N5AkBFBi6ru4xBCFRz4ry3lJlle2cPKeVW7o2kbRhsFwtQYzs62yzMyxg
 ==
X-Google-Smtp-Source: AGHT+IENyNyEVAuyalTEbfbRr0O62gIKo3HxW95LAEcbR4IxvqWRKzdjc3cxPf5hr5pS3iVUodaPHw==
X-Received: by 2002:a17:903:1aa5:b0:249:17d1:f1d5 with SMTP id
 d9443c01a7336-24944b29de0mr15030175ad.60.1756532806361; 
 Fri, 29 Aug 2025 22:46:46 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:46:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 46/84] target/arm: Implement gcs bit for data abort
Date: Sat, 30 Aug 2025 15:40:50 +1000
Message-ID: <20250830054128.448363-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


