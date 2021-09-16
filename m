Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1280297lfp;
        Thu, 16 Sep 2021 09:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhE8LpIJSOlJJll2cpsaTu83jIHybN0UOEeIbBrtJC2/yfYIVjDUHAe+PBD1e6JB+QcL/7
X-Received: by 2002:a05:622a:48d:: with SMTP id p13mr6057320qtx.282.1631809646157;
        Thu, 16 Sep 2021 09:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631809646; cv=none;
        d=google.com; s=arc-20160816;
        b=mjctFkEiN0laSBE+TyrmSveDgks5GPX3Bux2ex/l5prBp87O5SB27ZoscKnOM+BrYE
         6KobpI98cI4Ne7FFnklj1P1un85OSpDa9BhHKeDPAVZxS/nEGlxR4SPv1pNEp8+vrAn6
         c68I7yHaFHyclRTJ0uetUpriGnLubDoeR/y3qiq1MQOcSf1EYkDIS5OM48uIP/H3sVl5
         9eDZd8bl5uzHPti3x9g1w7e+1S854AlVyWrKZw8OP49Zc16rloVH1ZSgaTomAEGdKLRp
         jzA6T1Kc6zDp8IRp6XNMTD2D6cgltPp2vzVSErZy+csjbKx0bxBVp2gHBgac4jh8fOrU
         I/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=w110ntviUhDfY71s7aOdC2xU71YlnWrX5A3BVVSAcvE=;
        b=xelSuPumFKiDhOIsvGUauAKdcqlagwDNKeAQDRv4YPlBVLPNQd+PoBQXeAkkfb2IyL
         8bymBLgsmc8fgDvpEAWLaugyNnECLaDa2WhWSIBj7axO7zhe7VQMYKfIssxA87dDLm3Z
         +5kFBzC5P+9pXOuETA3QBtW0hSjPu14NGR+MfibyEVfd7G1Hlu0lUw4ZVmFAfQJ5ypAF
         Yrff9irPp9c86PqdgbTyewJ4sSiakFljAyG5v0tFEJkCQEqWoxFNNQC+KpGL/5IhqVYv
         tuB9Ee8TW279awigq71iQNqxUg3W73KyB9oF5PafhGHAk0u0eThEl8wEFEYo3X6Mb+BK
         WZ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si1919224qke.61.2021.09.16.09.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQuEP-0003bK-HA
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiQ-00035i-3t; Thu, 16 Sep 2021 11:54:22 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51400 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiL-0005BE-AV; Thu, 16 Sep 2021 11:54:21 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 63EA1608075F;
 Thu, 16 Sep 2021 17:54:11 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
Date: Thu, 16 Sep 2021 17:54:04 +0200
Message-Id: <20210916155404.86958-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rKniM/xG30wb

The SMCCC 1.3 spec section 5.2 says

  The Unknown SMC Function Identifier is a sign-extended value of (-1)
  that is returned in the R0, W0 or X0 registers. An implementation must
  return this error code when it receives:

    * An SMC or HVC call with an unknown Function Identifier
    * An SMC or HVC call for a removed Function Identifier
    * An SMC64/HVC64 call from AArch32 state

To comply with these statements, let's always return -1 when we encounter
an unknown HVC or SMC call.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v8 -> v9:

  - Remove Windows specifics and just comply with SMCCC spec

v9 -> v10:

  - Fix comment
---
 target/arm/psci.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..b279c0b9a4 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -27,15 +27,13 @@
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-    /* Return true if the r0/x0 value indicates a PSCI call and
-     * the exception type matches the configured PSCI conduit. This is
-     * called before the SMC/HVC instruction is executed, to decide whether
-     * we should treat it as a PSCI call or with the architecturally
+    /*
+     * Return true if the exception type matches the configured PSCI conduit.
+     * This is called before the SMC/HVC instruction is executed, to decide
+     * whether we should treat it as a PSCI call or with the architecturally
      * defined behaviour for an SMC or HVC (which might be UNDEF or trap
      * to EL2 or to EL3).
      */
-    CPUARMState *env = &cpu->env;
-    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -52,27 +50,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
         return false;
     }
 
-    switch (param) {
-    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
-    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
-    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
-    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN_CPU_ON:
-    case QEMU_PSCI_0_2_FN64_CPU_ON:
-    case QEMU_PSCI_0_1_FN_CPU_OFF:
-    case QEMU_PSCI_0_2_FN_CPU_OFF:
-    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
-    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
-    case QEMU_PSCI_0_1_FN_MIGRATE:
-    case QEMU_PSCI_0_2_FN_MIGRATE:
-        return true;
-    default:
-        return false;
-    }
+    return true;
 }
 
 void arm_handle_psci_call(ARMCPU *cpu)
@@ -194,10 +172,9 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    default:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
-    default:
-        g_assert_not_reached();
     }
 
 err:
-- 
2.30.1 (Apple Git-130)

