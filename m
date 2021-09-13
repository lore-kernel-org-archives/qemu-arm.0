Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3645887lfb;
        Mon, 13 Sep 2021 06:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkFvJUo0dekihKcr/1I3vhE/OxJKPoiVGRPyq/LL4W9iAmGgN4j8S3Opv67MnC2z0X+Cbm
X-Received: by 2002:a9f:35ca:: with SMTP id u10mr4941943uad.82.1631538049699;
        Mon, 13 Sep 2021 06:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631538049; cv=none;
        d=google.com; s=arc-20160816;
        b=Przg+vRDZd7sdTD6Vp+HC2HwCU9a+jTOlTxkh5EVdVgSKfGgfUqWPZa+VB2mQk7L3g
         P9XxtExyk+25gWr4/tEVnVRw1TsMaBdNfD8jxv82lEhTXScMzgNOo+WnRFFpKE/I625j
         rczNLk3TxTCK1rkkHK0vf7RSCMfT2J/xvIPOPhXPjVLIPSemhgaZML5kSvGACONXLv84
         cpLpxLRL6cM3wUiKZvJsrxXAcSRvzed8noF6ORCo6fx8ds6Ip/nLQA5/6CTZ9Al4s/FX
         +U9MpE5mPVTP/eWaQyER1svIcuzZ9xp7TISCbFzvzAqu3f5hDwK1JgJX6GLKJBe8TgV6
         5CKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=k55uPKKggWpSbIkqO6kQ56FRTRjSzzsIwTMrSgrTtAk=;
        b=vcJTb2SyaTtXMXH20GyB49Kd8AnhQ5HVMJ4pWw3pe3Gs0isG1P6nKz3GqIolIZlmMx
         RMS8JxIEbqL/+CuBJRo/yfaLA06l2yn6N4lOJTc+NT/YLz/FZUKfOQ5bFWmQpLnE0cam
         0xopMEs3EuaOTToGgtJWRMJ3qmTRQTIGzKZLJwruvIpsJMJ0vntTsJ8+bqVjkWx4/bYA
         qVVo75zA6x+cfG5Mkbpy9vVTX1r0UBK5dyh9Mf9inagR7jUsDt69aFkLvdP8liyi9kG8
         DFfVENb119E69acjddkgUiM/SLgoy2t1lDL+kGw59y7DV+1xj5aIYU4WuMW06lB5Z9xN
         BYfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g145si1423637vke.19.2021.09.13.06.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 06:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPlZo-0007U2-PR
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 09:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPklt-00031s-MQ; Mon, 13 Sep 2021 08:09:13 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44112 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklr-0004mY-Te; Mon, 13 Sep 2021 08:09:13 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 37392608038B;
 Mon, 13 Sep 2021 14:08:50 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
Date: Mon, 13 Sep 2021 14:08:42 +0200
Message-Id: <20210913120842.62116-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
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
X-TUID: k+gzAbbm06Jf

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

