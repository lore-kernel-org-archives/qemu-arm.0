Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6FFC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:10:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEzZ-00014o-8X; Wed, 30 Jul 2025 18:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwZ-0001Ro-Sm
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwU-0002bw-Gn
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:39 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b420b87cb04so309603a12.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913193; x=1754517993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nDq0C18lUJeM5JVkXkjc5p9y1haSfvcbRrvaA4/kgI=;
 b=crL/qYL8hhCwI3t4v3bfP0avjjkpu6laQi7ZKlOD6R+ng6Pp0aytWDOmNuUYaisNmL
 s7Lslp84Ern8/qCR1gRiNVvzz3UgHV5mWtHIHBTxiYQM31bNe7zNHQFzqNsErC9GeTeJ
 X2YA1w+Kj38sX8rQQMSAw9xqO/Zq24hSwk/d6lV/qFsb3A3YCVAe4X61tgrGD/KuVeuL
 q6YO5idTq7EAVMMIJLQzF559zC0gcKW8AhJUOo6+SvLzlEOcCJnXJ/0H+4+9V/kqihXk
 Db0rYhq3Vu87iuXuyTwkMav/jhT8htvvMu7N+UXiwozf6iR2jxHzROwkBet5os+OpRsS
 aluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913193; x=1754517993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nDq0C18lUJeM5JVkXkjc5p9y1haSfvcbRrvaA4/kgI=;
 b=pefYrnY/iR5Im1IqhUoLnY7iNLiXLjpYbAkCUWebggzPigeUP6LliMJxbYJD0FqHJA
 Y9A66MY8JVH9GTIBrJ57ebYvl3dgnLeIU90tmsp9jOs5ZER0TybWxUgXTQcTOO6KecvB
 p17SWt+R3TEOLi6zTKa92f2rYxbNk4GuxUv7WsXgBrVBi3Cr1+6pGuIAY8U7wSv9sFI8
 9qPjybnzZAmEeuMjWBM8Uy1/lHoJtSxzFJvyga5orkkPZ5jZNloHrwVv5tSr6V4iZx5O
 Up5BV6IN5s5jhusaZNObrIvRMKT47xUi6A/45OEvlaQvFvH/NGud1l774UtwaIujSNok
 nLog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT4+17cyn1wG1COxhrDSfvZuifYe4pFdGzaSfNE2V3W4iFMHg/879gSuXY0gQfBJ1CwmkAJMfjCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/Rbs4LQJs1XdUZ1gMlpQr4/mN8Ien6Db8dzdbAguh81RjFJNe
 5Th/Tvwg4/4we/yztGT6Z5/MxzNNZjSyFgW2YuVKhVbALoK1/qr/SzT8pH52y8tEbcT1mGnkBx4
 9xrbo
X-Gm-Gg: ASbGncuCoIGFeH5+Fw2tqG5a7e/sU0ew3yShp3W0xa40EOuqNe0ylk+jkEGba2OXOnV
 EV/AsIjsYhCcMeHFjM4zGigJYuR3PYq6muE7CEerKIZMr3Lmn64N3h2fUc+LdQGmi7T1GiDNDA9
 O4n6DS5cmDR+fKb5UHURtow5u2SgHGM54GDd6QiDOFVNjdH4/bTVwlYf/lv/RtTXStAxjKkuvCb
 qNgBB1Y5cUhKlhlUD9L1UutnkKPUmVBcLQkf8zccEPbyS4K+VJMRHPV+B+r1dSzr1guqCAM9Tld
 +vQ2eGF5IOdSrDs7lVlRKqb3EgEhm6b4xvaIUyVCsUPObSz3/AdofPJ9lWNieZ7/gEpdPGEeULb
 54EaznLzKyrvNw5A+uST8zHY7inIq7VUG
X-Google-Smtp-Source: AGHT+IE+LPvsEOxgmE1Qq8a5IUNmA34Jo/Hm1/k6xdbqPOdHIVYe1nMV0yw9QWa47P5U866jlKgB6w==
X-Received: by 2002:a17:902:e78e:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-24096b2f89dmr80756495ad.44.1753913192699; 
 Wed, 30 Jul 2025 15:06:32 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 05/10] include/semihosting/common-semi: extract common_semi API
Date: Wed, 30 Jul 2025 15:06:16 -0700
Message-ID: <20250730220621.1142496-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
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

We transform target/{arm,riscv}/common-semi-target.h headers to proper
compilation units, and use them in arm-compat-semi.c.

This way, we can include only the declaration header (which is target
agnostic), and selectively link the appropriate implementation based on
current target.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/semihosting/common-semi.h              |  5 +++++
 semihosting/arm-compat-semi.c                  |  3 +--
 ...mmon-semi-target.h => common-semi-target.c} | 18 ++++++++----------
 ...mmon-semi-target.h => common-semi-target.c} | 17 ++++++++---------
 target/arm/meson.build                         |  4 ++++
 target/riscv/meson.build                       |  4 ++++
 6 files changed, 30 insertions(+), 21 deletions(-)
 rename target/arm/{common-semi-target.h => common-semi-target.c} (66%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (60%)

diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
index 0a91db7c414..9b8524dca13 100644
--- a/include/semihosting/common-semi.h
+++ b/include/semihosting/common-semi.h
@@ -35,5 +35,10 @@
 #define COMMON_SEMI_H
 
 void do_common_semihosting(CPUState *cs);
+uint64_t common_semi_arg(CPUState *cs, int argno);
+void common_semi_set_ret(CPUState *cs, uint64_t ret);
+bool is_64bit_semihosting(CPUArchState *env);
+uint64_t common_semi_stack_bottom(CPUState *cs);
+bool common_semi_has_synccache(CPUArchState *env);
 
 #endif /* COMMON_SEMI_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1a3abd45c5b..5a04ce55ca9 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -174,8 +174,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #endif
 
-#include "cpu.h"
-#include "common-semi-target.h"
+#include "semihosting/common-semi.h"
 
 /*
  * Read the input value from the argument block; fail the semihosting
diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.c
similarity index 66%
rename from target/arm/common-semi-target.h
rename to target/arm/common-semi-target.c
index b900121272c..bad33a711d7 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.c
@@ -7,12 +7,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
-#define TARGET_ARM_COMMON_SEMI_TARGET_H
-
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "semihosting/common-semi.h"
 #include "target/arm/cpu-qom.h"
 
-static inline uint64_t common_semi_arg(CPUState *cs, int argno)
+uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -23,7 +23,7 @@ static inline uint64_t common_semi_arg(CPUState *cs, int argno)
     }
 }
 
-static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
+void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -34,22 +34,20 @@ static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
     }
 }
 
-static inline bool is_64bit_semihosting(CPUArchState *env)
+bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
 
-static inline uint64_t common_semi_stack_bottom(CPUState *cs)
+uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
 
-static inline bool common_semi_has_synccache(CPUArchState *env)
+bool common_semi_has_synccache(CPUArchState *env)
 {
     /* Ok for A64, invalid for A32/T32 */
     return is_a64(env);
 }
-
-#endif
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.c
similarity index 60%
rename from target/riscv/common-semi-target.h
rename to target/riscv/common-semi-target.c
index 2e6d6a659a3..7ac8b9164ee 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.c
@@ -8,38 +8,37 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
-#define TARGET_RISCV_COMMON_SEMI_TARGET_H
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "semihosting/common-semi.h"
 
-static inline uint64_t common_semi_arg(CPUState *cs, int argno)
+uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xA0 + argno];
 }
 
-static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
+void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     env->gpr[xA0] = ret;
 }
 
-static inline bool is_64bit_semihosting(CPUArchState *env)
+bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
-static inline uint64_t common_semi_stack_bottom(CPUState *cs)
+uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
 
-static inline bool common_semi_has_synccache(CPUArchState *env)
+bool common_semi_has_synccache(CPUArchState *env)
 {
     return true;
 }
-
-#endif
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 07d9271aa4d..688b50a2e26 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -27,12 +27,16 @@ arm_user_ss.add(files(
   'helper.c',
   'vfp_fpscr.c',
 ))
+arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		        if_true: files('common-semi-target.c'))
 
 arm_common_system_ss.add(files('cpu.c'))
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
+arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		                 if_true: files('common-semi-target.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a4bd61e52a9..fdefe88ccdd 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -8,6 +8,10 @@ gen = [
 
 riscv_ss = ss.source_set()
 riscv_ss.add(gen)
+
+riscv_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		     if_true: files('common-semi-target.c'))
+
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
-- 
2.47.2


