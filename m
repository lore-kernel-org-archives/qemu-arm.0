Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F1BFDEE27
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:05:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxTs-0002Zh-Ad; Thu, 23 Apr 2026 13:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxTF-0001aQ-GR
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxTA-0005kG-89
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d70c30767so4611333f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963843; x=1777568643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+igmwACxKAAriU8rkOxPQALcbbgJ0c+NUQHQmbA0Oqs=;
 b=ZZ1vcM/DKMfjIYSbz6C3eQXOE8LBX/M9ZKEqsHfphitZgcPIf+YBKQyIAgkvycPL+B
 Uj411BXVUL/Elfh1EBoUwGsgYZ7+HmNo35hRkC1cqL/dcuqD0oU28FxXZAQBf1RvfrT0
 4sbRYJJCJQKBb9sUPSpkdoamo1+Q+DHYZzx+QgffIV3ZeP0fKo+xNedD12z1qvaakelq
 YCFCXp44Wu1KkfjicB6Z6Ag7sPumz/BlAv5bqF8TSSzV91YaCVmMV5aBVaRnjzMIgNr9
 r79mztr0X9HSZg9GrnGLS5eziFhJF/VulCImlHuzHrm7UegCpUiGIh8PAjHLO8SnrpA5
 KC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963843; x=1777568643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+igmwACxKAAriU8rkOxPQALcbbgJ0c+NUQHQmbA0Oqs=;
 b=OOiLroHRlc8CifjtnJdi5XNeu+3YgeU3lQeP7lZwxVvqDDZQsA8lYdOmQ7mAJJZjmZ
 NxcoEiwriRZNWh9mqiH87KniSNKfdiukmAeLO1b+H1tu9uGhEFWFtnK6Fr8t0F7Qp0m9
 AcZqji4evb4+LSHglOI7Qb3Xf1OSybkn5fHB5ch6Bng0NszJmOafflJufu0Kbsco1InM
 Bvo/i1lNVrYf5Fnv5P7KR7wHJzKJwwcKfvNplgmJKNagjYAXQqFmr1vqddQEPGDZHEGN
 XJRoyTVobfgujwXLuLUyhwI13GQ1xx5F6KOchN1MlhDg4FonMlMddn/ghoUMBV05WOm4
 +IpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8brJ83FMi1CYw/g3jE6lKIBEyWIIz1/WI7qy31mI+It9TpsLRIJugvzdRtcI1RdbF9WTfb7q1nlw==@nongnu.org
X-Gm-Message-State: AOJu0YwLDAmew7Tfwm60vtCoKT5l5FNBE28Rk3tyZKJhZbEtK2q8Bjzl
 Bww978hwwaS1xTmTQdXwvoF3x04dtJ41b+PHoMslOh20b2e3Sk1s7ln4Yn3UmqTk84k=
X-Gm-Gg: AeBDiet65pCq0nr1Reb8AJn8D9U4H+x4lYJVxaj0YuU8yb39poFbHxFOeauRAa2M2NP
 JBh+YUmYpA41nvYyx5syP4VpcBOFi8gWMj6YP4KnXBaBDb/HLRy2IjhnuuuiMLLxW4dvfV02Jcy
 6Z5qnBu8x4gXFfD2jw8omRdCdB5FzG9+3/GL6v5fJzfgRPq2fzutnAN2XrCqhKc4nUxElkvprwd
 Lq7aoFgGekN4aRDqpJytIoRrqcDKMljk49mQzqlyidzNnHpBpT4DwRqBG/McccqPzv2jJNFeN3L
 tOwsG8aQAoMkdDHMfxIFKjfMhUr7+coLkJP37IaosZ9MV6KqhwC+Nwv77lAGJqhIsjCHTvntX6h
 BOaIy1w4TieFtzJi/wlatmyt+pI4+rnGKcf0iCJhDjwAPYcAAeJWlbmzaHcTFz3jFVDygS5dbYY
 1zS2EDSuP1qWZBu5DWOi8vbOvws5fFHKxzNwpeBPwYaM6OdGqPhfZdq5jQvS58cRq6sk5XjluA+
 ICoR67AXqI=
X-Received: by 2002:a5d:64e5:0:b0:43d:7606:5a47 with SMTP id
 ffacd0b85a97d-43fe3f358a5mr43126165f8f.2.1776963842597; 
 Thu, 23 Apr 2026 10:04:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm19901683f8f.23.2026.04.23.10.04.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:04:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 12/16] target/arm: Remove vcpu_dirty=true assigments in
 hvf_handle_exception()
Date: Thu, 23 Apr 2026 19:02:24 +0200
Message-ID: <20260423170229.64655-13-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Commit  2a425aae0b5 ("target/arm: ensure PSCI register updates
are flushed") manually sets %vcpu_dirty in hvf_handle_exception(),
but these calls follow calls to cpu_synchronize_state() which
itself sets %vcpu_dirty. Better have the generic CPU API handle
this, but add a pair of assertions when serializing the accelerator
state to be safe.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 2fb768048b8..f2c5bde5983 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -737,6 +737,8 @@ int hvf_arch_get_registers(CPUState *cpu)
     hv_simd_fp_uchar16_t fpval;
     int i, n;
 
+    assert(!cpu->vcpu_dirty);
+
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
         ret = hv_vcpu_get_reg(cpu->accel->fd, hvf_reg_match[i].reg, &val);
         *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
@@ -888,6 +890,8 @@ int hvf_arch_put_registers(CPUState *cpu)
     hv_simd_fp_uchar16_t fpval;
     int i, n;
 
+    assert(cpu->vcpu_dirty);
+
     /*
      * Set SVCR first because changing it will zero out Z/P (including NEON)
      * regs
@@ -2239,7 +2243,6 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
             }
-            cpu->vcpu_dirty = true;
         } else {
             trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
@@ -2256,7 +2259,6 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
             }
-            cpu->vcpu_dirty = true;
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
-- 
2.53.0


