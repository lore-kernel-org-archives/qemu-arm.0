Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4135837wrd;
        Mon, 17 Sep 2018 09:31:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbKbHTY1xiwariDZN3VIn8N9jGvfCh0G44fllb6yOBVJGFvowZ2lQEkaS8W56hIIcShLV96
X-Received: by 2002:a17:902:724c:: with SMTP id c12-v6mr25175818pll.326.1537201875331;
        Mon, 17 Sep 2018 09:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537201875; cv=none;
        d=google.com; s=arc-20160816;
        b=VZmMBfDA1DlXOu05jypS8HDTAs0NdT8ic/dRZCMk9g4PNTZFGcz2GxGKoMfpNniC3X
         rHHi/2FZOKCfwmOQBIvIUPZCAWF+lCp6yCuUFhQxAELcV0QoCa7HOQKd4kfxhNPrUoqP
         /sHcUyas1yZOIrqwhFFkcVwsAhA7er5ZRXfFvpMV+vylx6TFQ8mgoEqkv1+iu+EdXcbE
         DJhsiTFb+ddNEI2JDPF73hB+M+pfTCLYUhfaCk0esTuui7qyjoHiwo/j1D2tf2H71FA6
         KbWPyLRKxWR9Goj4G3gCpHmSTeS1RpTCfhXBmuMIqVDzWT1pFecRO4ganFPHCiYrrcDH
         ab+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Ut/+pHtOZtdCXdOQp4BVjkn7ndqIM1yGLNjjk5kK6wE=;
        b=sIqBnlCFjJbsRzs7GxbdD56ixyAabp5jaVPGCkEzoxw7uwKWdMh/6C4dWfJKywFvLb
         +Au1pkLZSC3K40y6FxCn4YjEX5jImYEPNWd3H7cI0WeDlJhgNbAPnAIyMLCpNHif63G8
         NBVHLyMCexZY+gzAcwn35SuGF3y1phozdbYSGNie9GCADFkjQNFp15WzLFG5biFucTaC
         NtAkGXYCfsBNFbBv//peOB8KzsDZTSf3tCtXNfmUDUD84ju4ZIJnGyJek82Q0UxXBHoH
         J0qHzHu2jIqIjWjsojZy6hERkf8d3lpWSfb/6siHo5gBh5hy8x0J+Np4OIH3QvFdzFaF
         yAWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=V9xJKZ+K;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=blCjPF1q;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 184-v6si15838464pgi.614.2018.09.17.09.31.15;
        Mon, 17 Sep 2018 09:31:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=V9xJKZ+K;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=blCjPF1q;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbeIQV7T (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Mon, 17 Sep 2018 17:59:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45765 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726979AbeIQV7T (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 17 Sep 2018 17:59:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1E43121C24;
        Mon, 17 Sep 2018 12:31:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 17 Sep 2018 12:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=Ut/+pHtOZtdCXd
        OQp4BVjkn7ndqIM1yGLNjjk5kK6wE=; b=V9xJKZ+KIRZ2qhbEe8Z35JXNwS70bf
        ihMynnnPvtNn4mMDE/WzldoLF1+si747gYnSNuWcrn3ulRVLLM5wk8H/D8og8CMc
        JNw98COFXRVWiaDYdmcAGHkSFozrH1BSdCaMzB2s/rcDzAnxJyyhf4lEgkf5YM/f
        tv4TpuZvqhaVI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Ut/+pHtOZtdCXdOQp4BVjkn7ndqIM1yGLNjjk5kK6wE=; b=blCjPF1q
        pbW5cP9HSa1oAanCd19N/U3YRVSlGC3w8Nxoe5VaujABETrxwd9gw0zpgmJkq47M
        D0EW5cT4TJSANefVqsZFL/7yDp4sa/iGFAD6oX1GZIKt61Hcpf8P0dhxKfhkX7S2
        6xCZDrLM0/2IRiSfRPmkwBsU/KiZsPibWv8kICa4ZswHXFv2DQ2PItXV6ZO5ruom
        HG5Hez/8/B5z/VF9bCFNvMN0x3Tw7uhMG/9vw0tGfM6qGJWghIZWTR8kDVdvzh2H
        A9+f/mbsNCTNm47a19uBGwXIOTtEnZdHehpUsouWt8fi2HqjHaXPHnUWIi3W4OA2
        GZP184DyfDk01A==
X-ME-Proxy: <xmx:0NafW6ciR82rRyDtelorZrPbW6rL_QcsDqFCLQX8g8jSnn_yvmVvpw>
    <xmx:0NafW_Xw23q4h_ERh81uF8BcObz5GHi9jFC8JTvHFrHPYWpz9rghyw>
    <xmx:0NafWw7Rh6wo3kqcu94GqAV3DQjTlrxhboP_C_s7UXMPycHupJITCw>
    <xmx:0NafW3xW1FgS2_lZI7glSdFpTTwt5vplYvP1Wlqc_z-ksVBh0FdJjQ>
    <xmx:0NafWx5bNHaLdxM22MWQfXVSS2MW--WmGkTK46L9ONIVpo-akIJPjw>
    <xmx:0dafW8rMmrpIv0vm7Ga2Jjss_EH6kXCHcg2wTp-JVdzko5WN-nfg1w>
X-ME-Sender: <xms:0NafW6Wz8nm6YkRaxelCiLjst2EMupGNSsaQOstbXAyHFZIRn4mmIA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
        by mail.messagingengine.com (Postfix) with ESMTPA id 84AC2E49C7;
        Mon, 17 Sep 2018 12:31:12 -0400 (EDT)
From:   "Emilio G. Cota" <cota@braap.org>
To:     qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        David Hildenbrand <david@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
Subject: [PATCH 34/35] exec: push BQL down to cpu->do_interrupt
Date:   Mon, 17 Sep 2018 12:31:02 -0400
Message-Id: <20180917163103.6113-35-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180917163103.6113-1-cota@braap.org>
References: <20180917163103.6113-1-cota@braap.org>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: fh0edV0ne5kJ

From: Paolo Bonzini <pbonzini@redhat.com>

cpu->do_interrupt can now be called with BQL held (from
cpu->cpu_exec_interrupt) or without (from cpu_handle_exception).

Only a few targets rely on global device state in cc->do_interrupt;
add checks to those targets to acquire the BQL if not already held.

Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Anthony Green <green@moxielogic.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: David Hildenbrand <david@redhat.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: James Hogan <jhogan@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael Walle <michael@walle.cc>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 accel/tcg/cpu-exec.c       |  2 --
 target/arm/helper.c        | 28 ++++++++++++++++++++++++++--
 target/ppc/excp_helper.c   |  8 +++++++-
 target/s390x/excp_helper.c | 14 +++++++++++++-
 target/sh4/helper.c        | 14 +++++++++++++-
 target/xtensa/helper.c     | 16 ++++++++++++++--
 6 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2383763f9b..b649e3d772 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -497,9 +497,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
 #else
         if (replay_exception()) {
             CPUClass *cc = CPU_GET_CLASS(cpu);
-            qemu_mutex_lock_iothread();
             cc->do_interrupt(cpu);
-            qemu_mutex_unlock_iothread();
             cpu->exception_index = -1;
         } else if (!replay_has_interrupt()) {
             /* give a chance to iothread in replay mode */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22dbc42305..548278da14 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7644,7 +7644,8 @@ gen_invep:
     return false;
 }
 
-void arm_v7m_cpu_do_interrupt(CPUState *cs)
+/* call with the BQL held */
+static void arm_v7m_cpu_do_interrupt_locked(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -7828,6 +7829,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
 }
 
+void arm_v7m_cpu_do_interrupt(CPUState *cs)
+{
+    if (qemu_mutex_iothread_locked()) {
+        arm_v7m_cpu_do_interrupt_locked(cs);
+    } else {
+        qemu_mutex_lock_iothread();
+        arm_v7m_cpu_do_interrupt_locked(cs);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 /* Function used to synchronize QEMU's AArch64 register set with AArch32
  * register set.  This is necessary when switching between AArch32 and AArch64
  * execution state.
@@ -8482,8 +8494,9 @@ static inline bool check_for_semihosting(CPUState *cs)
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
+ * Call with the BQL held.
  */
-void arm_cpu_do_interrupt(CPUState *cs)
+static void arm_cpu_do_interrupt_locked(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -8534,6 +8547,17 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 }
 
+void arm_cpu_do_interrupt(CPUState *cs)
+{
+    if (qemu_mutex_iothread_locked()) {
+        arm_cpu_do_interrupt_locked(cs);
+    } else {
+        qemu_mutex_lock_iothread();
+        arm_cpu_do_interrupt_locked(cs);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 70ac10e23b..8b2cc48cad 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -742,7 +742,13 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
 
-    powerpc_excp(cpu, env->excp_model, cs->exception_index);
+    if (qemu_mutex_iothread_locked()) {
+        powerpc_excp(cpu, env->excp_model, cs->exception_index);
+    } else {
+        qemu_mutex_lock_iothread();
+        powerpc_excp(cpu, env->excp_model, cs->exception_index);
+        qemu_mutex_unlock_iothread();
+    }
 }
 
 static void ppc_hw_interrupt(CPUPPCState *env)
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index f2b92d7cbc..931c0103c8 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -378,7 +378,8 @@ static void do_mchk_interrupt(CPUS390XState *env)
     load_psw(env, mask, addr);
 }
 
-void s390_cpu_do_interrupt(CPUState *cs)
+/* call with the BQL held */
+static void s390_cpu_do_interrupt_locked(CPUState *cs)
 {
     QEMUS390FLICState *flic = QEMU_S390_FLIC(s390_get_flic());
     S390CPU *cpu = S390_CPU(cs);
@@ -457,6 +458,17 @@ try_deliver:
     }
 }
 
+void s390_cpu_do_interrupt(CPUState *cs)
+{
+    if (qemu_mutex_iothread_locked()) {
+        s390_cpu_do_interrupt_locked(cs);
+    } else {
+        qemu_mutex_lock_iothread();
+        s390_cpu_do_interrupt_locked(cs);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index c699b8c0a1..6c508cd006 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -79,7 +79,8 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
 #define MMU_DADDR_ERROR_READ     (-12)
 #define MMU_DADDR_ERROR_WRITE    (-13)
 
-void superh_cpu_do_interrupt(CPUState *cs)
+/* call with the BQL held */
+static void superh_cpu_do_interrupt_locked(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
@@ -211,6 +212,17 @@ void superh_cpu_do_interrupt(CPUState *cs)
     }
 }
 
+void superh_cpu_do_interrupt(CPUState *cs)
+{
+    if (qemu_mutex_iothread_locked()) {
+        superh_cpu_do_interrupt_locked(cs);
+    } else {
+        qemu_mutex_lock_iothread();
+        superh_cpu_do_interrupt_locked(cs);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 static void update_itlb_use(CPUSH4State * env, int itlbnb)
 {
     uint8_t or_mask = 0, and_mask = (uint8_t) - 1;
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index c9a6132700..ecafecdd3f 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
@@ -251,8 +252,8 @@ static void handle_interrupt(CPUXtensaState *env)
     }
 }
 
-/* Called from cpu_handle_interrupt with BQL held */
-void xtensa_cpu_do_interrupt(CPUState *cs)
+/* Call with the BQL held */
+static void xtensa_cpu_do_interrupt_locked(CPUState *cs)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
@@ -305,6 +306,17 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
+
+void xtensa_cpu_do_interrupt(CPUState *cs)
+{
+    if (qemu_mutex_iothread_locked()) {
+        xtensa_cpu_do_interrupt_locked(cs);
+    } else {
+        qemu_mutex_lock_iothread();
+        xtensa_cpu_do_interrupt_locked(cs);
+        qemu_mutex_unlock_iothread();
+    }
+}
 #else
 void xtensa_cpu_do_interrupt(CPUState *cs)
 {
-- 
2.17.1
