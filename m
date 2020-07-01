Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp812751lfm;
        Wed, 1 Jul 2020 13:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAakiDOUEcQwL8gv/9rDtVnxXg6Yi+quWZ/QqYaBNt4xG33kY0mK+l8vmovsUh0JvaVhpr
X-Received: by 2002:a05:600c:2249:: with SMTP id a9mr27040310wmm.163.1593634131045;
        Wed, 01 Jul 2020 13:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593634131; cv=none;
        d=google.com; s=arc-20160816;
        b=t98V4QtNqwTzP+SaZn8JmiChjbb1yZksEdvLdcnZhORCO0qof/OyF782PhWqplJ3SE
         AF4CBqErBLv0iLsjB51ZH6C3b6ExQtbeyiRS9L2OJ/6M3o6Ie9x9XLd4GoLvXaQ64ahz
         R/DE0zb2A3fwB0dwqC3q7v5qyoszCPFzpQx57VMVb5lDI10F/sK9aA//LBTZOIDIPJwU
         hH2FKVvR0XgGTy2LH7jhDYhW3rBBhi4aHN0tGKgByvOPBA6G0ejxkDiwTmEbMpQnIAFH
         Gf+ARqHeO2vZyyvY04oGN7t+Z8+x7HHCUqXvfnL2hAWw4cx8tZa39k+0aVnmmj3b4EhA
         5rxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=87Bd2G7JErAV7VuB/zp118TFFyq0xCmS/os9wVhf8qc=;
        b=vxmWYK2xcHoFNfuxoNMmee8lzQhr0KQyfT61GniOAV/xuWOcvdHhZg/AsLIjggvo1u
         u085T4Fj8334Gwj4RsrL1LiCL4/Gqiano6xCRXwc32XfYbSPxqQOk36C5f2mtXaXmKH9
         BOGXN7/XYwhKOJyB2IEyWLjFQz+BTQm8/skUsxoZU9phJYkBE8MmmiPXm0dOqQ/zyxBy
         jmXjAwEqbWpM2IQMEVpJsJzFFR3aiMxtvzD6VxZUOb0QDdGlM0b+cLpe2h6Fh6GbFQaJ
         ke+mFxMnZbwfiVHtNKt0OtXkPBgvsYHuvKTzQHJ0bEgeXMnFSfP828DoRBufduvLxIyi
         hd0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [188.138.100.120])
        by mx.google.com with ESMTP id l15si6240681wru.73.2020.07.01.13.08.50;
        Wed, 01 Jul 2020 13:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) client-ip=188.138.100.120;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from server.alex.local (x4d024519.dyn.telefonica.de [77.2.69.25])
	by csgraf.de (Postfix) with ESMTPSA id A80B339002CE;
	Wed,  1 Jul 2020 22:08:49 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: Treat unknown SMC calls as NOP
Date: Wed,  1 Jul 2020 22:08:48 +0200
Message-Id: <20200701200848.26746-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.16.4
X-TUID: yUTyvnp32Yup

We currently treat unknown SMC calls as UNDEF. This behavior is different
from KVM, which treats them as NOP.

Unfortunately, the UNDEF exception breaks running Windows for ARM in QEMU,
as that probes an OEM SMCCC call on boot, but does not expect to receive
an UNDEF exception as response.

So instead, let's follow the KVM path and ignore SMC calls that we don't
handle. This fixes booting the Windows 10 for ARM preview in TCG for me.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/helper.c    |  8 ++++++++
 target/arm/op_helper.c | 13 ++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc9c29f998..bc1bd2e704 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9778,6 +9778,14 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
+    if (cs->exception_index == EXCP_SMC &&
+        !arm_feature(env, ARM_FEATURE_EL3) &&
+        cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
+        /* Treat unknown SMC calls as NOP, just like KVM */
+        qemu_log_mask(CPU_LOG_INT, "...handled as NOP\n");
+        return;
+    }
+
     /*
      * Semihosting semantics depend on the register width of the code
      * that caused the exception, not the target exception level, so
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index b1065216b2..42b1687860 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -823,7 +823,7 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
      *
      *  Conduit SMC, valid call  Trap to EL2         PSCI Call
      *  Conduit SMC, inval call  Trap to EL2         Undef insn
-     *  Conduit not SMC          Undef insn          Undef insn
+     *  Conduit not SMC          nop                 nop
      */
 
     /* On ARMv8 with EL3 AArch64, SMD applies to both S and NS state.
@@ -838,16 +838,11 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
 
     if (!arm_feature(env, ARM_FEATURE_EL3) &&
         cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
-        /* If we have no EL3 then SMC always UNDEFs and can't be
-         * trapped to EL2. PSCI-via-SMC is a sort of ersatz EL3
-         * firmware within QEMU, and we want an EL2 guest to be able
-         * to forbid its EL1 from making PSCI calls into QEMU's
-         * "firmware" via HCR.TSC, so for these purposes treat
-         * PSCI-via-SMC as implying an EL3.
+        /* If we have no EL3 then we simulate KVM behavior which
+         * simply treats every unknown SMC as a nop.
          * This handles the very last line of the previous table.
          */
-        raise_exception(env, EXCP_UDEF, syn_uncategorized(),
-                        exception_target_el(env));
+        return;
     }
 
     if (cur_el == 1 && (arm_hcr_el2_eff(env) & HCR_TSC)) {
-- 
2.16.4
