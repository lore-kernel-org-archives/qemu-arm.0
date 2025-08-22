Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA619CA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTIm-0003kN-Sk; Fri, 22 Aug 2025 11:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGv-0001tf-MT
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGY-00050P-So
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b474a38b25cso1913573a12.0
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874872; x=1756479672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NhduwSVHFJtmbAuoSXf5vp/8JFTbyhJo4xB/s950yU=;
 b=XtUWo35QSklJIjHCCAfytZS0pkBmgudg1gpCM3sLXZGNOrkcahXrHCH6iDERcJitxN
 rhNHzxwJHqWd3rJRBI8Vab/Oaju3G5XhQwNbNb3ohjkqJkCY3XFLNWVYQrK36xIg/tYX
 FsJNHdZJKAYfHfF2OCcRG/BwJ2QT4AezLG3Rf2NzNvaJmXq/Xc9aQlQ53Vi6fxRRR6uj
 OuzAwiDf/KVJpV1hrd/fTscIwJyrm0VJka5fuYEsRv51fHXiGQFZnq/LtFDZPyt+WOm/
 W435d89rWaMp0Srn4/9Fb42zons8eXXjKOXSIGxLXEY50xG0keTlRnm8lNRtrKcCcMol
 ZBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874872; x=1756479672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NhduwSVHFJtmbAuoSXf5vp/8JFTbyhJo4xB/s950yU=;
 b=RbHsz39a1lgVb4omNUd9O/psv3ojRX8p4Lh/J1z17c0M+RuaaMExkk9J/1eGk1McL4
 cp/ORqUw2dXKYywCqQw83+fonxDhSHMoVOaNvMNOAfrQUMRZ46TGy2k/PrcR4gwc9rxT
 W5Ru/lTJvZRt1/PdIpKWnjpJh8uxHtStwUgYAgm8+kJFvIxd49ll63cDU52jSSOTqQJ3
 OmzwZjX4SnU72Cg8RL8kjxn1sl/G9zXNbKa0mFgHM72CzZzav8Tjh9+M3JPT9/h+SnRk
 xTDohiQn8z66Benu4s+md13Iwq7//95QdOyE1yBCKb4pZ18cQRsfjX7i0ClDyc6V0N5T
 KILA==
X-Gm-Message-State: AOJu0Yw9+ljCzCn0vIMhg6QPTad7WkXuQbPlCOzU9/862p20dTciI45Q
 HOBbpOYdtOOflGQleZLCu5ncuB4X+8AWFIAh/bo8sUGwN7URzDGuRI5x3iujbxkxt3k=
X-Gm-Gg: ASbGncuHoeO2MD3sMtBhCV4ZxP0XLv+PtMuxeUAsht4ExdL44N2l6O9zsk9hyfidMz0
 85+lGASJ/Hy4BriBFgbPGwbt3KtIDJBfJ1U/0IMJDaAZoknzPpwHUeEauqmnOX+8JZAX04vEWrw
 eCj3SnnoZcyQqDMKQkTRZ1xgcKZajI0Pw8ajpsNXeChv3t+VlQwVSMwdvwht1bi7924kpiGhwWv
 pV3XTdAX4RSy11jdU3ph3Jyha2KryDMQ6gYsDdSCLgS4J/dVzxn41CoHRZD2WlQdu8DIaIsZ6Vo
 vPH+FxW2at3pmgIKyc5Dl8+Bqvx0EVl5uBfSL0mJeQXrPAerAROoTKOesUe4xp9l87BYHIMLP7m
 EftVsHQrgLgoJ2cpcu/uI32BnYepYjsdp+OAS8vsfZp0=
X-Google-Smtp-Source: AGHT+IEJzCll6RqVE/5VCuu0Q08A66b23ZFkHXuRy5cswO7+hyICPJ+BAXHiwXuiwU+N+XGfMPopgA==
X-Received: by 2002:a17:903:230f:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-2462ee59160mr49861175ad.17.1755874871995; 
 Fri, 22 Aug 2025 08:01:11 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:11 -0700 (PDT)
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
Subject: [PATCH v4 06/12] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Fri, 22 Aug 2025 08:00:52 -0700
Message-ID: <20250822150058.18692-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52b.google.com
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

We replace mechanically with uint64_t.
There is no semantic change, and allows us to extract a proper API from
this set of functions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/common-semi-target.h   | 6 +++---
 target/riscv/common-semi-target.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index 7bb442f24ca..6775a270aaa 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -12,7 +12,7 @@
 
 #include "target/arm/cpu-qom.h"
 
-static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+static inline uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -23,7 +23,7 @@ static inline target_ulong common_semi_arg(CPUState *cs, int argno)
     }
 }
 
-static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -44,7 +44,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
     return is_a64(env);
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7e6ea8da02c..663dedfdad2 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -11,14 +11,14 @@
 #ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
 #define TARGET_RISCV_COMMON_SEMI_TARGET_H
 
-static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+static inline uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xA0 + argno];
 }
 
-static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -35,7 +35,7 @@ static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
     return is_64bit_semihosting(cpu_env(cs));
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-- 
2.47.2


