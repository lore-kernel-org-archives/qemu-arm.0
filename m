Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C64CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 21:58:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9Z-0003zg-BG; Wed, 08 Oct 2025 17:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9U-0003yq-NX
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:52 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c94-0006eH-9F
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:51 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b609a32a9b6so156117a12.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960582; x=1760565382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8jzmwbEOdXd1Y+zB9l972AjYHk0b/qSjoQoHCfbnn8=;
 b=mCwAKay2RXiDtvUn5i5SCoURZS/tjFXmdS8bc0h3MDbkUHcbsFGEdBkLcbniYQSUBQ
 JO4yjX33ASZn0zjePIoS7poOyrJC3Y5Mz5WtT05UdyvAHDiubPhiuQflrJIaqPlpP2uT
 62mbN9xfyDG5LOHcYaFnGn2qbd8uRJMms/p/F3JQxyclUmxN68NKqEJHX8nD6j0//wms
 auvRnMBkKVH6O/kLntP67FIcpKCIbzj4Il1akytm6h7T7tx+xTp6/zlJLTcDaMGwUW7k
 YeCFwhMpWkVbliQr0sDp2E57+0twLfqkiol3pSQmssh2uys3GfEpRTB2N7aSzNIdZpAE
 ELmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960582; x=1760565382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8jzmwbEOdXd1Y+zB9l972AjYHk0b/qSjoQoHCfbnn8=;
 b=klJiKHvUGFF2lXj5t6Kg8FazDrpcSJrd7uelWu5Bfq6ZNVC1mQ4vae6zppowiv3bS+
 pHxagFslowyvU1Q1LawF3DWemAYlfredxMvYtnUZHRFbKrRFoLENrMWPpgvjx+hWRrdM
 o2y/ybTwpafSOYx5kScQ5bJbEtXQomFDNipc3M7uUYYxh1cQyl4SdAwHQ/cM4pp4FYpk
 +N+Ootbt5rAY5AWpezENpTSeJyZvZQT46ctRqz0KMLUjAux7+51Cup5UYz3cwMx8hrJ6
 NNFoyymAzx7oWqhxwxkLbxwmS3ccHhjufGf7+tDx/fcBFX2faHcrm7y3WU+72969cgtU
 Y42w==
X-Gm-Message-State: AOJu0YyJhs+L/wp/DDTtydKvplkPel8B+m5xNuiWQsSIvQl5OKOC5XIl
 /FkdWC2QCrAiWOIM30R22elBu8K6lgjDuM0G7hWwyUuzU2wj71XRNla5mND3h66+xEw=
X-Gm-Gg: ASbGncuizaB8kTwvbe375LlJqYE6VWxUfjLKcYFyzPXQXGTUG3mE++Htdr4YRWeeevr
 jKokjfXVR8kePmmPD8HYZKPjNvtriP8m6Jc8nzzmPgAXzP0QLDGRm/DMB+pfiSJxvobDVDT3bwX
 e7yjKnGhWAOXbZJx6IxRltgIwIeSODCDznuQJO6+UQgUcYlMt3Pz0hq7NL0/8aHQh9eh3smjhjE
 PiNn84+thnVj6opVSSwhnNrsXFd7kg1ZPs2wAlWqeqOHqn8JvM3eJysnv7PBUx71eyqBWYAZAIJ
 yGm+6fxonNyG0AaBot6DPt5iccxJrVIk69UwjEwxbyHgalZ9TVLKHiZwVxZRvtq3n1fmmZuSKwM
 GiaCAXS5Xzt14VpkVFy1U+3t1MkV0SimMma/bye4Uj0XdBeEeQMBEJd+zV/piNAaK6FM=
X-Google-Smtp-Source: AGHT+IF5wkEP2yRVuvkjCG85rUX4HHWM/TXYTR0Az8Quw73+hNrAeNv6eZANJaKLqP9QjTGmBpY9kg==
X-Received: by 2002:a17:903:1aeb:b0:26d:72f8:8d0a with SMTP id
 d9443c01a7336-2902721672amr67151065ad.12.1759960582139; 
 Wed, 08 Oct 2025 14:56:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 11/73] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Wed,  8 Oct 2025 14:55:11 -0700
Message-ID: <20251008215613.300150-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Prepare for raising exceptions with 64-bit syndromes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 +++---
 target/arm/tcg-stubs.c     | 2 +-
 target/arm/tcg/op_helper.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 22947c4b78..b59650959e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -304,14 +304,14 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
  * and never returns because we will longjump back up to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint64_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint64_t syndrome, uint32_t target_el,
+                                   uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aac99b2672..aeeede8066 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,7 +16,7 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 5373e0e998..dd3700dc6f 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -46,7 +46,7 @@ int exception_target_el(CPUARMState *env)
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+                     uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,7 +70,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
-- 
2.43.0


