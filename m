Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA19CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jGx-0001Y4-Bp; Fri, 03 Oct 2025 13:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGv-0001Wd-Aq
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGR-0006Fp-F3
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-269af38418aso29198445ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511292; x=1760116092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8jzmwbEOdXd1Y+zB9l972AjYHk0b/qSjoQoHCfbnn8=;
 b=bu9OG5LNSjnHxd1DmJKkmhXBF7X7iMY6IuF7iKByFiMduej+ivfIltwkMRR/4KiyIT
 RFm2sHW9TNYSctCfZHUG3IcEkr5ndyTbu/YIugRB3ILabtnKfXS34/9UkBzHyBnNgLxm
 TtIS8wmcBxvskDQasQptRTFP6+sw+zj/CtuuMYzMfu9KDHuS4LHmdBeMRxOfSHt06fkK
 KKG7i6frHII8hH12SJJk8J6P1BbHm53ZrWPDiBdYxVoJmVuwh2H959reFhPEbukvo+Bf
 R98cFQoEJnva+mhaxzM29KXm8YjbLr4eaPUDCcDgf3KfHQmR9hRgvUqsedBYR88xSNRI
 YScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511292; x=1760116092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8jzmwbEOdXd1Y+zB9l972AjYHk0b/qSjoQoHCfbnn8=;
 b=kunhDDG2c1mqM+HV/zrrs2f5Cl1VO0DIhKq/4nq78IQXm4wwM7KpfytVvWpsevsUiU
 MDtpkaYm2r7fvBF66IGzzEzh8P6LQ7AyF1ZiLY/1d5F+s31JxdVmTf+RpKgNUDCKqXV/
 n3gvkoL4XOzUmv45pQkIbxJxXiK6AXPQm2zme/sc4oHVqYpxCk4TUs6nRUsdL9N+riFj
 C3dTIf1GVT0u6zi9fvXb7d+VX2Mjdng+PdyFoHUM9GcjdkZ+BQGzPq+/IORhWTQJ4C6+
 yLDSRZd0ZtXdjG5shglJbnE2KwSbguFJW1hlkczJELNNBDQ2PsaqVaOQFmeUDsfHAWlv
 62lQ==
X-Gm-Message-State: AOJu0YykFDSwtQ0bVVbDSzHxH/aoaH6vGnuZMw2+9GYXA3M0t/YXu+Mv
 kCOmQA2iSxoErZeYmf6h+7kB9O5fiejfcBOxv6nCiZXgHBJtqKhYzREW+44t0VDHWW5xzlHLW56
 QTfHrVp8=
X-Gm-Gg: ASbGncukryBorDQUuZnP0AK8yVkMAXL8l9Js4/tPNY8iHm8/CZmG1SUWbE0HFt393eo
 tpolXI2XiuGxus37wlA7jSC5AZJw62kc++YpB2eDQ0+QJ1OwVu3SFC0/6S27EtXTuyQSmD9h8FJ
 9BtVN3hfDKpdrhAjc+p/4D4n2BdpSiyjOVCMKW69O8/hkfOHVF6xFEQPKawan5xbt275CRAd7L4
 jWl5Lyw/WtH8ZGEWIfQnRWXrwo6u2QqDgBjn5lrDDzn8fMw6rFzk4ll5qLZz/cdstc+2TFdTqpU
 4BAkEX2oIPezesUz5v1/8/uGlZc0q03MjpeiBwek7X9ZKcYa+X+ycN80RUqb05b/GSvxBBd2Az6
 HXdw4a5FGsMJHXtcToyfCcfrSCUNSm7eUjBMiV8i6hXk/hImRLPA1aVyd4h0UMKfq1Rc=
X-Google-Smtp-Source: AGHT+IFUbSL7h/dDpwA3Nx+JYto/xWnQxc9kUgy3u1MpGOdDSzaFETfMceu/QK8A81CMghafCl0NuA==
X-Received: by 2002:a17:903:3d07:b0:268:500:5ec7 with SMTP id
 d9443c01a7336-28e9a5b9441mr44641475ad.2.1759511291679; 
 Fri, 03 Oct 2025 10:08:11 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 11/73] target/arm: Expand syndrome parameter to
 raise_exception*
Date: Fri,  3 Oct 2025 10:06:58 -0700
Message-ID: <20251003170800.997167-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


