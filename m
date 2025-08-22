Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A7CA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTIF-0002js-DS; Fri, 22 Aug 2025 11:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGr-0001pS-Mw
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGY-00050k-Sc
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:36 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-24616482efeso9565565ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874875; x=1756479675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+UBZqDttGYfj8iBFfEmX5S23CgoyF14FdfzJLxCYYE=;
 b=vChrI0LDG/bUZcTFEczD2m4SfyZ6msjV3SZkCDHsdzWxll+1KIidnJf1ZrDZNZj6vy
 lfaHC9Pru+gCgNM1edgxHnnb+VnX9R2qUHS8utsUUi/USus+7hTuKbTX5GXJSM6iOdsa
 cVTyIjwT3jK0nfoLPajDVpgagVKs+fkHFyLTi/kHr0cEZfw9EK/jONxlsc5a0qZaXtRC
 EBxqvXx9pPe1s09m3S1AKfkujhM+UIIRvT8svYSvBQ+p0nAvq/uCHGgP4rb6i9tjbCR4
 hpfkA10ePCJ5YLGiWlNK2PklauntyHID1kSQ9pkgh3e484MxE0MrDNNk2d7h3HMx94y9
 Yb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874875; x=1756479675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+UBZqDttGYfj8iBFfEmX5S23CgoyF14FdfzJLxCYYE=;
 b=CBVpKx3hYH3Tjo0jQxZDrSUKGFnkAb8Lr+WsqxxDxKTDuda7WnbsSaMBp/ILOIE5ux
 HHAJ6fnYxzfYAvF/e9OntnrrmJxrlp2e6oZPeleMKFoq8vT8dALImLGU8twpg8s85JDR
 xGXUGRQtCiZpN8buVEodpYypuajDnXwpO1yqkNWXCUbISCV15ifF+pgNr7c+8/DzgRod
 NRKvdUlVytXkCXzIKaBTiyn0JS4VBDRniQHp5/mGZmjp8wVIExDhQ81PAZBdrjfzU8uX
 BMY3Z5tRcaSChydPVtCpu2/1rPn89JfMlD85AUgH9RYpu17no1HD4pL3dzJ+Up3PCmDJ
 fMTg==
X-Gm-Message-State: AOJu0YwsmwYY0G2Bs+GabQZAhIAgFIjROZ/qB75XGO0c3GAosLC9xkqv
 llljmr3z2HvXeUu5HfSgoXkQEAPToSETwRwB4TPfEllqUuKHpxX6EClaTK6f35c1nyA=
X-Gm-Gg: ASbGncu9oWQeD2NtSXFRZjbymssryHp7XZcwV5J3s/Z2XtKXM7/vsLAquWcusC+sZI2
 BCCe7UymTzrns7OsmCtaI3EkaAPtgpKttEi7lG5p4PhUY4SRXw+l/YbYeo5AxGpLJu2gWglyPtV
 91U3KXjlROff95+wQkkW5hP4PI8LXM+1TaWeUx3TW6+6xgf6CkXA1uBYiTH8mt2OCNMw8I0vDXd
 N1LeAeAbtl3npR2ob+SjX8syByazJUwmCq+TX8QyiW/UaE79y1boT8A4Kz0Qp1airof+hpw17lV
 apz5h+DTMeJf2v9vnq7EyNwXQ1/uqigYIrQACB99wHaMaPJ/Q8Bw8JJDTWt6bEV3nu01SwGOOrg
 o7n6xTqqZMSGZXCBbT4TcAY7SCrgdY1rS4Q3rpAFK3Ng=
X-Google-Smtp-Source: AGHT+IEg5xE2u1buBTkXUoOM48I3ZwKJ9V/NRfcswgT1R/KIkoZD+94xNQQAzg7oqPtKIN/hxI8zkA==
X-Received: by 2002:a17:903:46c5:b0:23f:f074:415e with SMTP id
 d9443c01a7336-2462ee80edemr41985525ad.14.1755874873198; 
 Fri, 22 Aug 2025 08:01:13 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 07/12] include/semihosting/common-semi: extract common_semi
 API
Date: Fri, 22 Aug 2025 08:00:53 -0700
Message-ID: <20250822150058.18692-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
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

We transform target/{arm,riscv}/common-semi-target.h headers to proper
compilation units, and use them in arm-compat-semi.c.

This way, we can include only the declaration header (which is target
agnostic), and selectively link the appropriate implementation based on
current target.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/semihosting/common-semi.h             |  6 ++++++
 semihosting/arm-compat-semi.c                 |  3 +--
 ...mon-semi-target.h => common-semi-target.c} | 20 +++++++++----------
 ...mon-semi-target.h => common-semi-target.c} | 19 +++++++++---------
 target/arm/meson.build                        |  4 ++++
 target/riscv/meson.build                      |  4 ++++
 6 files changed, 33 insertions(+), 23 deletions(-)
 rename target/arm/{common-semi-target.h => common-semi-target.c} (64%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (59%)

diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
index 0a91db7c414..aa511a46f42 100644
--- a/include/semihosting/common-semi.h
+++ b/include/semihosting/common-semi.h
@@ -35,5 +35,11 @@
 #define COMMON_SEMI_H
 
 void do_common_semihosting(CPUState *cs);
+uint64_t common_semi_arg(CPUState *cs, int argno);
+void common_semi_set_ret(CPUState *cs, uint64_t ret);
+bool is_64bit_semihosting(CPUArchState *env);
+bool common_semi_sys_exit_is_extended(CPUState *cs);
+uint64_t common_semi_stack_bottom(CPUState *cs);
+bool common_semi_has_synccache(CPUArchState *env);
 
 #endif /* COMMON_SEMI_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c593d5e0dc..5877214c47d 100644
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
similarity index 64%
rename from target/arm/common-semi-target.h
rename to target/arm/common-semi-target.c
index 6775a270aaa..2b77ce9c17b 100644
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
@@ -34,27 +34,25 @@ static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
     }
 }
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
     return is_a64(cpu_env(cs));
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
similarity index 59%
rename from target/riscv/common-semi-target.h
rename to target/riscv/common-semi-target.c
index 663dedfdad2..aeaeb88d536 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.c
@@ -8,43 +8,42 @@
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
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
     return is_64bit_semihosting(cpu_env(cs));
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


