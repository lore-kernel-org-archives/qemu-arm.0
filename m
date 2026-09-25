Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093AEC9832E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADow-0008Lj-Oo; Fri, 25 Sep 2026 17:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoI-0007mw-6X
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoE-0007oH-CR
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:23 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-85469a3490bso1077300b3a.3
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373020; x=1790977820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cOzcQc8zTJgOy19nChNBP2tzW+uTl+R1lYrTRq/sk8I=;
 b=OsWWApk21a1rG6ukCqzzX599c5yZ+LkS8TjkBAZf88F78O6ecR3U72U3f9W+fE94Ua
 eorH5cZEHXMEEsuxNHPhJTfu9bo8sx9lC3QasZKAHDxaXLT2BWJBlbOEelPCzi6UGgIe
 GqMIe9pZhapf2lRZEOqohZ9xaFvuE6RR5Wj6SyXKM6oujo+Wm/OtlwMwVAyRPtflmOJc
 HtxZlvL7NMru75vPJgt5ehj5KHtOr+fEnVAEvK/xGrzWjHrZ3NGQN4WJ4sHjznmHFt7G
 0AAIwbk2uGfjx5JEbuIBvpzJixG7tDQcAS8FHWipX/Y0gM2OMOj0LnkjR0Nk7ouP/og1
 bTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373020; x=1790977820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cOzcQc8zTJgOy19nChNBP2tzW+uTl+R1lYrTRq/sk8I=;
 b=qfdlIZkTcumnj3QCH+oOcYpaT1RHfoO5NjUgjAYE/jZ6jHhnV++wwumo1HhkaHLZMT
 wqgKtY7AF/WBL/nVcRRpV/iiBQLuDF1B3b4X62zQfCNfMOObpmRe7QVmjONs0YBlwzr8
 mNShH8hQXNT4P44wjHsRm3ste2563shHe7KI810lPPF2JBjqMls/2q0lwrqvhiEAEuUz
 yzUrYiTPXv8x7/4WYdkAj8kYMdyBLQwZ8UZMgXc4CwsCJ+xf0owNA+PN5jx/QHV9qp2/
 YQT2F8sYcmA4DwvPLWtH208yvL+BXA0NihypVZaDdPzXJTfOBhIMoVyLANkb1XMefteY
 fhSg==
X-Gm-Message-State: AFuF++nZLD6mWq8KM6wz0we0EhSxXxPAKUWEpEyUvU6WqXonu14hz+nf
 1FY6zhbZ00FWZTyv3xumaeyIQCHqDOop3LQjoN3Q76UimPrA9sxbZBhMopm3G9LI3XJA8dxWH04
 zvC9P
X-Gm-Gg: AYBFou0JnCfNrGDLoD4RH4DHyDm+9EuPUgCS+JToORxJjaeFQbql98OQ6WfiyN9SjIA
 tgHkppN7GAg2hWn5yn5LpwNr82lKkGkMgadLKT43s6oMzo7P5HBMGciExFq5y0nfL1yUxMTy72d
 0f8H1iOMtWRKuVgufqSVf+ASEd3WZzGgQX6PRbbfB7qLEd83xiXbRD4BwNJklj5rtSFXRoX52px
 +WwZ8+qkVScCVHbjEUTdr618UVOV//2afhDPjNHPCcNSQat1pWghF2pJ2qXoZpvDP3nvui2hVYo
 qJxbMcxSax/uTKcs8tHf0z78mIy2cKbV0EGfSqnSqdU3Xp6crffRsgjcuCvVSZLWQaC7vIacFg5
 4UzTcmeEngCxmi3IX9RnlvEGym1LCwm1gaZzKgxyum0rWcPfw49/dcM0DkfBf9HPcDiQT3s97fJ
 9n+q0aGScBs+4OKcvMg92quWjUdks4BNBzffKJnqBKiIT27uXAf9ouHunrrOdZ+K8dItWIgXwOm
 K0Co6/LsNPV/bWwtzMuDb0JwL6wyQ==
X-Received: by 2002:a05:6a00:28cd:b0:878:34d7:6985 with SMTP id
 d2e1a72fcca58-8802d814675mr2664436b3a.51.1790373019553; 
 Fri, 25 Sep 2026 14:50:19 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/14] target/arm: Honor PSTATE.UINJ during translation
Date: Fri, 25 Sep 2026 14:50:03 -0700
Message-ID: <20260925215004.456336-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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
 target/arm/tcg/translate.h     |  2 +-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     | 10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 7eba9b764ce..57e45ea8724 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -382,7 +382,7 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-bool check_il(DisasContext *s);
+bool check_il_uinj(DisasContext *s);
 void gen_exception_internal(int excp);
 void gen_exception_insn_el(DisasContext *s, int64_t pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7f858654c43..5d5b11e2da9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -11174,7 +11174,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     s->fp_access_checked = 0;
     s->sve_access_checked = 0;
 
-    if (check_il(s)) {
+    if (check_il_uinj(s)) {
         return;
     }
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index fbacc3b7574..6983153ffc6 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1164,12 +1164,16 @@ void unallocated_encoding(DisasContext *s)
  * must be checked after reading the instruction.  They have more priority
  * than the AArch64 BTI exception.
  */
-bool check_il(DisasContext *s)
+bool check_il_uinj(DisasContext *s)
 {
     if (s->pstate_il) {
         gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return true;
     }
+    if (s->pstate_uinj) {
+        unallocated_encoding(s);
+        return true;
+    }
     return false;
 }
 
@@ -6167,7 +6171,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
 
-    if (check_il(s)) {
+    if (check_il_uinj(s)) {
         return;
     }
 
@@ -6737,7 +6741,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     dc->base.pc_next = pc;
     dc->insn = insn;
 
-    if (check_il(dc)) {
+    if (check_il_uinj(dc)) {
         return;
     }
 
-- 
2.53.0


