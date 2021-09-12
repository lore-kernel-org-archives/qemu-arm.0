Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3182582lfb;
        Sun, 12 Sep 2021 16:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8kgEAL/dG1Eb5yqdoJRY4IlY3EzimAtsHLaR9kgTB4QJU/YyCdvhsBVSJ2Rl2wWGf3Xqk
X-Received: by 2002:a05:6e02:b41:: with SMTP id f1mr5968557ilu.269.1631488235380;
        Sun, 12 Sep 2021 16:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631488235; cv=none;
        d=google.com; s=arc-20160816;
        b=DagUSJUWNu7GzTrH9G2jN/E2rvk3hpB1xnXpAY485nd8Gqx/RMlKP14lQkvD8bDoOp
         ShAGLuXsQyqB+l+6HdimL2mTzvV3WgwrP1KeZN1nr/11M/PH8y3+b9RhQIzFSZtt5Lkl
         ee03VNrbdl1L6b0mJqcGd3KiOJHqDX/wnpB24XauWqhdp3ykgzQlgAyNzmsgI3wHqYuB
         5AwT+R6Oog2oxn/ituNseuzBQ6ZdnY0XwBioXnntzoKGWsY8GIc3KEHUGCC+1KqhqTN1
         BFvaJsYTpH4LLi7mkDrltVk8zV7qjbRp2MC5jfFLko96Z9RCatW5q6QqFATJ+k/2zMdx
         C/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LcFuPO53a6oB2JqOuKNIKfhcrvtCjXnjgi9lK33doLI=;
        b=W3QHwyrx91EbXEfjrANqJc765Ryapk8G0rMqML+0TADJQlIzv5uTmCKKnuFnWBIMlV
         zclFs+o8pYf8wgmcLQ/mZhLI/6E+vpkGBkmY6Wm0xjQCqAOkU6OAcn8Zb45vZek42Yn1
         vk/pmcLSc7R7JFd/0Ik2L+fmPhGQoHNFKJLeMKr2qmAhcs4Kvq0QxObwukNmw2ISdHLH
         Xre3IzAIlANTQNs0wyz0R6ZPRK3faIPLfM2kg645XQC1P/VbhK7Tfi5qhR9eY3fVtcO7
         4xL42DiIzQGpcRiy8KE67xZCtN2+5MrQSnMt//HuTqW3gLEjr5Yos8afKxFW6W9BX8YU
         YBVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si4722184ioh.72.2021.09.12.16.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 16:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPYcM-00005g-Hk
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 19:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYa0-0002KL-Mg; Sun, 12 Sep 2021 19:08:08 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43586 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZy-0003IO-8Y; Sun, 12 Sep 2021 19:08:08 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 7EC0E60808A0;
 Mon, 13 Sep 2021 01:08:04 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 10/11] arm: tcg: Adhere to SMCCC 1.3 section 5.2
Date: Mon, 13 Sep 2021 01:07:56 +0200
Message-Id: <20210912230757.41096-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
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
X-TUID: +xZy0ttTZLT8

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

---

v8 -> v9:

  - Remove Windows specifics and just comply with SMCCC spec
---
 target/arm/psci.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..bee4aa8825 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -35,7 +35,6 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
      * to EL2 or to EL3).
      */
     CPUARMState *env = &cpu->env;
-    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -52,27 +51,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
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
@@ -194,10 +173,9 @@ void arm_handle_psci_call(ARMCPU *cpu)
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

