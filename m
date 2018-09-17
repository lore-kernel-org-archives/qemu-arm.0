Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4135849wrd;
        Mon, 17 Sep 2018 09:31:16 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda+W0I4E+9oezpk2bVwvmzjrB2hyidOkq2JmPvpAc5fcS9KJrkWLfyfhSxztCW6hNnRMakx
X-Received: by 2002:a62:5ec3:: with SMTP id s186-v6mr26913432pfb.146.1537201875961;
        Mon, 17 Sep 2018 09:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537201875; cv=none;
        d=google.com; s=arc-20160816;
        b=evVR3eDtd3Z11AABId3i0k8+EDcdKdq5LCaUI6GgraTgi9U/By290I5K5bKHJsJEr6
         QdDQKdHOalubxThyZu+zVcSuGYiZPI+khs9/Dhossj5CkqRSj9gugklDrzfWQXNAGQEr
         qJraJbw0aVfVpSvVbt78L7qsVv65Fba45buQ75fBIeHg2fd8sMbHHuKwz8hR1Szw+oKF
         iAGE8sWAUDe2eukdkU/ybg2mAdjcK+GPAcWSDAwRWRwkjl/XLT6HATqrkyV2aRh1i5+o
         yIpd4e/TU86IWqhHCxCFcsgccsPn+QN6xAJYi2Bo3V/qyzaotzKpliIRWHuOHGlfPnrE
         OinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:dkim-signature;
        bh=hP3BNXg9fUYlH9mrXcVwqXX3Jxaadm+2okW5WxgMl58=;
        b=MHQEB+dz/yxxQx0zH27B3WqkLLAoTQuhDiSNJVlugMlJeiRmbrBK21VZa3izZsXCD9
         PP1MUCZOjHS6IEudmgvBz77bxHJyNWFAAlMrQMmnvPcR/w6u/yiSCI5KXKUj0vP8EVYF
         0vYwKwXoRor6mX2isEIbSJlVsTJTadMDOIJ0E7DgCTMIZvCvillJWthWOZK6KsvHGp4f
         MJutGvAYqFC/QcMz9fKBxTLVgcWDjFxrWZxyOoRY7fdqis34ktKYTXxsZ/ulxLlmeu6I
         8YYtmM2FAeKhXtBWFcmi9jAlUvVx/a2Ib/GegPc9fEuhuIJ9Cj9iaomGXCTZ5fcgYU3R
         RbIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=t0k38ogx;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SmlTA+CQ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 184-v6si15838464pgi.614.2018.09.17.09.31.15;
        Mon, 17 Sep 2018 09:31:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=t0k38ogx;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=SmlTA+CQ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbeIQV7U (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Mon, 17 Sep 2018 17:59:20 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54359 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728547AbeIQV7U (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 17 Sep 2018 17:59:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5FB7D21C08;
        Mon, 17 Sep 2018 12:31:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 17 Sep 2018 12:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=hP3BNXg9fUYlH9
        mrXcVwqXX3Jxaadm+2okW5WxgMl58=; b=t0k38ogxl8BXY3m2tREnHvB25lJWSx
        g7zD1EqEH2hkI/NKCUwrakORm783Rps0I45j5wns6R49X48sUQJ3hZbond7xAnLf
        qL07P//HmjW35o6l33xGtF5FyBMvVCeLHeQRqTwnKb/qr81BtmQDfXTNX0+zt1zC
        uh9twUe6DNil0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=hP3BNXg9fUYlH9mrXcVwqXX3Jxaadm+2okW5WxgMl58=; b=SmlTA+CQ
        rAfSw6VLqvmOKbJubMF5E4CKJC//QJYrNksBWjBGbfw9zjAxmenfbkPFcOOiHxX+
        /O5wOFm9kQ0QPvVIatmAW1+M4brmrmYOQ5SzHLr5TMEhhTYa55atqT1ofm22nuvV
        cTDkf/r4TG++b/N63ZDp9atkxQWtxa3FxNAAMtOcxeVWKhxrrZ6qRIvJq8+tr2Sg
        RaOK4TkdyyFcb+LH5eiwXtYH3wVkmF1Qxk2gvnQPIofvpzK3NuhkGhkg0UzTiXaL
        TSoy27LT51X8/8erpZr7jlajZamvoOEP0FPeNeE4KHqvA17kPazQaGtNz7Su9hDx
        eb/ii1gbjnRQXg==
X-ME-Proxy: <xmx:0dafW19-MtkJ73on-el3dapQ5WJ7gGbrYOiY9-hAyV9E3KRUCBruvQ>
    <xmx:0dafW9biO1CDbU_-gTXfT_7mp3ATXycRg8JlevwzPKhRv9eUL-h9Hw>
    <xmx:0dafW-Hm5Z5dMKtiBycK6x1xsxE1_57bgsdBEQhtWw3PlIueYxjAMQ>
    <xmx:0dafW25TNuZZqg_1rV-P803cP1wErXA8h_SpbIZG8J9McZWoDBgrEw>
    <xmx:0dafW_t2tsWJbOkFVxSjaA3fMsB4tgcbBMT9x0pzcuZikXpzn3Q14g>
    <xmx:0dafW5MxeW7ZHwt9F90EuU6wRcd5aXSzPXY3pZaIQz025wB3WA44uA>
X-ME-Sender: <xms:0dafWyPgal4wl-Owgid7NJ8Tb4UQicl1cH9jQ00JhQCeZ4-woyhqaA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
        by mail.messagingengine.com (Postfix) with ESMTPA id D5505E49EC;
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
Subject: [PATCH 35/35] exec: push BQL down to cpu->cpu_exec_interrupt
Date:   Mon, 17 Sep 2018 12:31:03 -0400
Message-Id: <20180917163103.6113-36-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180917163103.6113-1-cota@braap.org>
References: <20180917163103.6113-1-cota@braap.org>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ssEZngsGY6yM

From: Paolo Bonzini <pbonzini@redhat.com>

Most interrupt requests do not need to take the BQL, and in fact
most architectures do not need it at all. Push the BQL acquisition
down to target code.

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
 docs/devel/multi-thread-tcg.txt |  7 +++++--
 accel/tcg/cpu-exec.c            |  9 +--------
 target/arm/cpu.c                | 15 ++++++++++++++-
 target/i386/seg_helper.c        |  3 +++
 target/ppc/excp_helper.c        |  2 ++
 target/s390x/excp_helper.c      |  3 +++
 6 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.txt b/docs/devel/multi-thread-tcg.txt
index 782bebc28b..422de4736b 100644
--- a/docs/devel/multi-thread-tcg.txt
+++ b/docs/devel/multi-thread-tcg.txt
@@ -231,8 +231,11 @@ BQL. Currently ARM targets serialise all ARM_CP_IO register accesses
 and also defer the reset/startup of vCPUs to the vCPU context by way
 of async_run_on_cpu().
 
-Updates to interrupt state are also protected by the BQL as they can
-often be cross vCPU.
+The CPUClass callbacks cpu_exec_interrupt and do_interrupt are invoked
+without BQL protection.  Accesses to the interrupt controller from
+the vCPU thread, for example while processing CPU_INTERRUPT_HARD, must
+either call qemu_mutex_lock_iothread/qemu_mutex_unlock_iothread or use
+a separate mutex.
 
 Memory Consistency
 ==================
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index b649e3d772..f5e08e79d1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -524,7 +524,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
 
     if (unlikely(atomic_read(&cpu->interrupt_request))) {
         int interrupt_request;
-        qemu_mutex_lock_iothread();
+
         interrupt_request = atomic_read(&cpu->interrupt_request);
         if (unlikely(cpu->singlestep_enabled & SSTEP_NOIRQ)) {
             /* Mask out external interrupts for this step. */
@@ -533,7 +533,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
         if (interrupt_request & CPU_INTERRUPT_DEBUG) {
             cpu_reset_interrupt(cpu, CPU_INTERRUPT_DEBUG);
             cpu->exception_index = EXCP_DEBUG;
-            qemu_mutex_unlock_iothread();
             return true;
         }
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
@@ -543,7 +542,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             cpu_reset_interrupt(cpu, CPU_INTERRUPT_HALT);
             cpu->halted = 1;
             cpu->exception_index = EXCP_HLT;
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #if defined(TARGET_I386)
@@ -554,14 +552,12 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
             do_cpu_init(x86_cpu);
             cpu->exception_index = EXCP_HALTED;
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #else
         else if (interrupt_request & CPU_INTERRUPT_RESET) {
             replay_interrupt();
             cpu_reset(cpu);
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #endif
@@ -585,9 +581,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
                the program flow was changed */
             *last_tb = NULL;
         }
-
-        /* If we exit via cpu_loop_exit/longjmp it is reset in cpu_exec */
-        qemu_mutex_unlock_iothread();
     }
 
     /* Finally, check if we need to exit to the main loop.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e2c492efdf..246ea13d8f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -347,7 +347,8 @@ static void arm_cpu_reset(CPUState *s)
     hw_watchpoint_update_all(cpu);
 }
 
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+/* call with the BQL held */
+static bool arm_cpu_exec_interrupt_locked(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
@@ -401,6 +402,16 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return ret;
 }
 
+bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    bool ret;
+
+    qemu_mutex_lock_iothread();
+    ret = arm_cpu_exec_interrupt_locked(cs, interrupt_request);
+    qemu_mutex_unlock_iothread();
+    return ret;
+}
+
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -409,6 +420,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUARMState *env = &cpu->env;
     bool ret = false;
 
+    qemu_mutex_lock_iothread();
     /* ARMv7-M interrupt masking works differently than -A or -R.
      * There is no FIQ/IRQ distinction. Instead of I and F bits
      * masking FIQ and IRQ interrupts, an exception is taken only
@@ -422,6 +434,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cc->do_interrupt(cs);
         ret = true;
     }
+    qemu_mutex_unlock_iothread();
     return ret;
 }
 #endif
diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
index 0dd85329db..2fdfbd3c37 100644
--- a/target/i386/seg_helper.c
+++ b/target/i386/seg_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
@@ -1324,7 +1325,9 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 #if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_POLL);
+        qemu_mutex_lock_iothread();
         apic_poll_irq(cpu->apic_state);
+        qemu_mutex_unlock_iothread();
         /* Don't process multiple interrupt requests in a single call.
            This is required to make icount-driven execution deterministic. */
         return true;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8b2cc48cad..57acba2a80 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -885,10 +885,12 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUPPCState *env = &cpu->env;
 
     if (interrupt_request & CPU_INTERRUPT_HARD) {
+        qemu_mutex_lock_iothread();
         ppc_hw_interrupt(env);
         if (env->pending_interrupts == 0) {
             cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
         }
+        qemu_mutex_unlock_iothread();
         return true;
     }
     return false;
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 931c0103c8..f2a93abf01 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -480,10 +480,13 @@ bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
                the parent EXECUTE insn.  */
             return false;
         }
+        qemu_mutex_lock_iothread();
         if (s390_cpu_has_int(cpu)) {
             s390_cpu_do_interrupt(cs);
+            qemu_mutex_unlock_iothread();
             return true;
         }
+        qemu_mutex_unlock_iothread();
         if (env->psw.mask & PSW_MASK_WAIT) {
             /* Woken up because of a floating interrupt but it has already
              * been delivered. Go back to sleep. */
-- 
2.17.1
