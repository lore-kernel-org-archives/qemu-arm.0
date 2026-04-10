Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07E4F459F7
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 16:20:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBEaE-0006bs-Hp; Fri, 10 Apr 2026 12:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wBEaD-0006bd-4r
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 12:19:49 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wBEaB-0003Fr-3V
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 12:19:48 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b9382e59c0eso404152866b.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775837984; x=1776442784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTvj91MVW/gP6WB+cyPJwfwtUy3rygvyysw1CRWnss4=;
 b=iGqpY6wCl2sjaCI0HAFtYsCGS7JGnAuB91E4qXmoTB9KfsFvkBN5rZ8WXs2MuMr8tr
 3V6lYDDOm1NxiTZYxspGv2EJoJbav9CZ6q9Mg+raPOxfflqO9npA12/JGR6ETid2QOkn
 HTJscYow9fyQ4Q9hOtaLr38iIZNlteMWnxBAgH+bCc6FTdrpnITqRgIvsU0RSsrIsF+n
 zf5Y10dpimS7kVvo0GXYOTUrPHVBPTpYDlUDSGdpyHD8D5O+uOEYCxDu9gYTX7Adgh84
 aFmi2e4gEOleDo3qyCfxU+Fh8rvi6mzq2sTdaQ0s/Gl7XkkzNuJCnLPNOdXSahFY79+5
 wm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775837984; x=1776442784;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTvj91MVW/gP6WB+cyPJwfwtUy3rygvyysw1CRWnss4=;
 b=SRzDlMJkmo7U2ijx3jhuGZNyHPZpdCWal5aY38JHUXgl8uzuyuo/CPe5HJHYSeClwS
 EpfYG0qCOJZ6zDo6N4aGS8KZ3cm+knMBzSpkysyaQuHO5fhDA4Uy1/Z4MNp/ocRn4sxp
 aCri0DxqoHOmSO/wE68Ekxte9BK78Slc//4iBPd40Ie9imJdORSM9EwDCeB9VQNPF/uR
 ZOZrhvm0W7zMMQJbxaLF5zfgqKLIvaqrSvtxV8LuIGY1jKSQr9dH98s/BwAvBG7FKKhU
 /VqNvzdujp8oZKtZGLtSx3vX+RHF3AmxpsnW8KlFNiz2T5El5fXvpIrX5byJlhmvvzOV
 HR+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj1t8wwqTHamDjKrbC0zw8NXy6vqhJkIjM3Eu5+g+Zy7ZDuQr03+zghhxRk5Qy4tMCc5rcMdrAjA==@nongnu.org
X-Gm-Message-State: AOJu0Yxk0w0ZseDz0TR+0KmGGj8JKV0ilIAchMsmA0uRgP+DYMJuKa1S
 QsUGNxoQBtAkJIMS+1VGUyd7DMRaGZX61sCPAD5rusr1U9Og297JDvHL7I8j6nbrcnY=
X-Gm-Gg: AeBDietOdEFUUn9F6MK74BWJO4MFtY22SMuJLGo1/GadI2hlyZH73+NL0H6vzXsK0qw
 OYEUQXk9V2HKuhNRMeAgzcirM1gC+9jGFIWnFODbSNSsMOBo+Bxk8rr7B0h+5ccPoNAShRCpRz/
 mnJUE3PBeibmpyuSpnP+swybIrjLr1GTUWCk9+GVEzAQGe6su1DNOz6MB3Yb+9OS9bh1phC7RlY
 YmoeCmkNAX7ear92aZ887cRQ06rfHeQBkjBXMxJ+7YojBOwLLERBR3dWSXL/d208WBTkYC+VBHw
 jIjya2VEr4DRjKdu+vVV/MYv2o7/lkss4XVbfDHb3EYz4V9zbaJtndNW84fQI3y5ZRzn9xiASIl
 YehrHMzuqpSdKw5jJiAIsZj+C1k/scEKEuRQTvI9hH2C9jOMunlywMbLYkNkJl+wEBXYgDS8V+e
 e11CDOtsDLpZQqjq6mJ/ivEkevkwlZOQv9/A==
X-Received: by 2002:a17:907:7256:b0:b9c:281f:d196 with SMTP id
 a640c23a62f3a-b9d7265d256mr247348666b.27.1775837984398; 
 Fri, 10 Apr 2026 09:19:44 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6dfd77c2sm94584766b.24.2026.04.10.09.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 09:19:43 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B5BB65F7A1;
 Fri, 10 Apr 2026 17:19:42 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org,  Pedro Barbuda <pbarbuda@microsoft.com>,  Mohamed
 Mediouni <mohamed@unpredictable.fr>
Subject: Re: [RFC PATCH 24/35] target/arm: remove event_register check from
 arm_cpu_has_work
In-Reply-To: <87h5pjjgyj.fsf@draig.linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9?=
 =?utf-8?Q?e=22's?= message of "Fri, 10 Apr 2026 10:35:32 +0100")
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
 <20260320130607.2071996-25-alex.bennee@linaro.org>
 <CAFEAcA83X2v6iTQO-r-xp-sRku+KNQb56QhLtvgiCMpOxqFCyw@mail.gmail.com>
 <87h5pjjgyj.fsf@draig.linaro.org>
User-Agent: mu4e 1.14.1-pre1; emacs 30.1
Date: Fri, 10 Apr 2026 17:19:42 +0100
Message-ID: <87y0iuiy8x.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Fri, 20 Mar 2026 at 13:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>> The generation of events are not indications of work to be done and
>>> importantly for the case of WFI instructions not a reason to wake up.
>>> Remove the check.
>>
>> But an event *is* a reason for WFE to wake up, which is why this
>> check is here. In particular, the thing that tells accel/tcg
>> that the CPU should come out of halt (via cpu_handle_halt())
>> is whether cpu_exec_halt / cpu_has_work returns true. If we
>> don't check the event register here then another CPU setting
>> the event register won't cause this one to come out of WFE.
>
> So for the same-CPU case we do because we signal cpu_interrupt(cs,
> CPU_INTERRUPT_EXITTB) which is enough for has_work to return true but I
> can see the failure mode for cross-cpu SEV's when we kick all vCPUs in
> the helper would get stuck.
>
>> If we want to have WFE and WFI wakeup events to be separated
>> such that only WFE wakeup events resume a WFE and only
>> WFI wakeup events resume a WFI then we need to do something
>> more clever here, so that we track whether we're halted for
>> WFI, WFE, PSCI-power-off or whatever and our has_work function
>> can check the right condition.
>
> I guess we can add a cpu->halt_reason? I've already had to add a
> cpu->waiting_for_event for arm_wfxt_timer_cb and I guess it would be
> better to generalise that.
>
>> (Side question: are the only
>> cases where our arm CPUs halt WFE, WFI, power-off, or are
>> there any others I forgot about?)
>
> The only others I can find are debug events which all have their own
> logic (and we don't have "external" debug events modelled). YIELD is
> still a NOP and not really a sleep.
>
>> Incidentally, looking at the code above it will need fixing
>> for A-profile anyway, because a CPU in PSCI-power-off should
>> not be woken up by a WFE event. We get away with doing the
>> WFE event register check first because M-profile doesn't use
>> the PSCI powerdown stuff.
>
> Ok, that seals it.

I'm thinking something like this:

--8<---------------cut here---------------start------------->8---
modified   =EF=83=BD target/arm/cpu.h
@@ -257,6 +257,19 @@ typedef enum ARMFPStatusFlavour {
 } ARMFPStatusFlavour;
 #define FPST_COUNT  10
=20
+/**
+ * ARMHaltReason - the reason we have entered halt state
+ *
+ * To be able to correctly wake up via arm_cpu_has_work() we need to
+ * track the reason we went to sleep.
+ */
+typedef enum {
+    NOT_HALTED =3D 0,
+    HALT_PSCI,
+    HALT_WFI,
+    HALT_WFE
+} ARMHaltReason;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -760,6 +773,9 @@ typedef struct CPUArchState {
     /* Optional fault info across tlb lookup. */
     ARMMMUFaultInfo *tlb_fi;
=20
+    /* Reason the CPU is halted */
+    ARMHaltReason halt_reason;
+
     /*
      * The event register is shared by all ARM profiles (A/R/M),
      * so it is stored in the top-level CPU state.
modified   =EE=98=9E target/arm/arm-powerctl.c
@@ -78,6 +78,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cp=
u_state,
=20
     /* Finally set the power status */
     assert(bql_locked());
+    target_cpu->env.halt_reason =3D NOT_HALTED;
     target_cpu->power_state =3D PSCI_ON;
 }
=20
@@ -240,6 +241,7 @@ static void arm_set_cpu_off_async_work(CPUState *target=
_cpu_state,
=20
     assert(bql_locked());
     target_cpu->power_state =3D PSCI_OFF;
+    target_cpu->env.halt_reason =3D HALT_PSCI;
     target_cpu_state->halted =3D 1;
     target_cpu_state->exception_index =3D EXCP_HLT;
 }
modified   =EE=98=9E target/arm/cpu.c
@@ -144,18 +144,36 @@ static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu =3D ARM_CPU(cs);
=20
-    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
-        if (cpu->env.event_register) {
-            return true;
-        }
+    /*
+     * Only another PSCI call can wake the CPU up in which case the
+     * power_state would be set by reset.
+     */
+    if (cpu->power_state =3D=3D PSCI_OFF) {
+        g_assert(cpu->env.halt_reason =3D=3D HALT_PSCI);
+        return false;
+    }
+
+    /*
+     * A wake-up event should only wake us if we are halted on a WFE
+     */
+    if (cpu->env.halt_reason =3D=3D HALT_WFE && cpu->env.event_register) {
+        cpu->env.halt_reason =3D NOT_HALTED;
+        return true;
+    }
+
+    /*
+     * Otherwise pretty much any IRQ would wake us up
+     */
+    if (cpu_test_interrupt(cs,
+                           CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
+                           | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VINMI | CPU=
_INTERRUPT_VFNMI
+                           | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU=
_INTERRUPT_VSERR
+                           | CPU_INTERRUPT_EXITTB)) {
+        cpu->env.halt_reason =3D NOT_HALTED;
+        return true;
     }
=20
-    return (cpu->power_state !=3D PSCI_OFF)
-        && cpu_test_interrupt(cs,
-               CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-               | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VINMI | CPU_INTERRUPT_V=
FNMI
-               | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_V=
SERR
-               | CPU_INTERRUPT_EXITTB);
+    return false;
 }
 #endif /* !CONFIG_USER_ONLY */
=20
modified   =EE=98=9E target/arm/tcg/op_helper.c
@@ -403,6 +403,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
                         target_el);
     }
=20
+    env->halt_reason =3D HALT_WFI;
     cs->exception_index =3D EXCP_HLT;
     cs->halted =3D 1;
     cpu_loop_exit(cs);
@@ -464,6 +465,7 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
     } else {
         timer_mod(cpu->wfxt_timer, nexttick);
     }
+    env->halt_reason =3D HALT_WFI;
     cs->exception_index =3D EXCP_HLT;
     cs->halted =3D 1;
     cpu_loop_exit(cs);
@@ -508,6 +510,7 @@ void HELPER(wfe)(CPUARMState *env)
             return;
         }
=20
+        env->halt_reason =3D HALT_WFE;
         cs->exception_index =3D EXCP_HLT;
         cs->halted =3D 1;
         cpu_loop_exit(cs);
--8<---------------cut here---------------end--------------->8---


>
>>
>> thanks
>> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

