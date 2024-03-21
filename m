Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp695861ejv;
        Thu, 21 Mar 2024 11:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZhTysJkyDJC4YVQzJNrAKcqepxyXRJYeGNfSQEVKUOYrasUzAkLP6szmtSS4tLv2dk3NWdD67iYV1b9sI8cS6aepdmZCx
X-Google-Smtp-Source: AGHT+IFZenMvfyKOIBlDHfTa3Anxv5tNFT9fVd+VCXGclaB6K6JbvrfhBg+tKUCc7m8IfLw7cBPP
X-Received: by 2002:a05:6808:158d:b0:3c3:96f5:d265 with SMTP id t13-20020a056808158d00b003c396f5d265mr57068oiw.5.1711045765546;
        Thu, 21 Mar 2024 11:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711045765; cv=none;
        d=google.com; s=arc-20160816;
        b=aPFhgQYrkLNFgm/J5OkWFljyriKkiFtRxhfOg1eszTeasNhX2Gw6EOsPtsJcz2mPXj
         LrFb0evZV3UJUTigsWyec1kRritiJK19bGKSF1GqG3yzEz0p+pJVA2ej8XPwwzqqeklM
         3s2tsXNdptFfXPrP4srZLaEVGgoluqd39xfWV5qGh/nzQrn+XW4nC5On5BOxHEaswK80
         sh3+SOEChvQOQE/xco0FwspgDCOesE3tLWeMLdVarzfJOwpD90ihUwbMxxtxYRLOcmcj
         +sQH97ksVza9ZoAIzNWIewc1j4WFjrGFdhPZnEkFsovw45d/6wfubg2rP2HSfeCyMfUt
         W1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pCZe9c97mSPduNcttPxhwF3ZnoIb0Wd8cTRIAbH1CTg=;
        fh=0hs5X+TAdnuGVMl2gB3VWRDQteho7zrW/wI8EqBwbC4=;
        b=TGOwWCwvn4wkjj+TRSlG/gGfkhMGQWsF3AmGOhd8aoBFG8L70OgX03h1zWz2NgT39h
         eBut6H3HkIFF1RMB9S6G6sgFiXYtPDQe8SHAX/hrS7ay4WacXQZ79L3+rzh5NNmKUPji
         2tMa8TTDLMQJfUbwWzT6i+/99pc7qkq1LYlelSDuU5gXDkQUzOluM84z+Mgq6Hpb1h3J
         Bt5XTUUIEKYTvOHHx41dYUibDg4kEAg/qsaGO90tni3Uth3KCSr8CWmciuV+5eluQZfv
         xMqE8HRoz2P1UaVrVXIGiCE0Z50avxcdHGIpksooRkmkI68RQa/04ZgxVpXx2Z/IKdtI
         L78A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPrfS9cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85943000000b0042f1e480117si309063qtz.158.2024.03.21.11.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 11:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPrfS9cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnNA3-0007bq-BN; Thu, 21 Mar 2024 14:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnN9z-0007aK-Lg
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 14:29:03 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnN9x-0003t0-II
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 14:29:03 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56b85146589so2314125a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711045740; x=1711650540; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pCZe9c97mSPduNcttPxhwF3ZnoIb0Wd8cTRIAbH1CTg=;
 b=dPrfS9cdPoknkoInZTVL8P+IcgrWyF+4GRxWo+NCwRXs9fYaooMnz/Q53APBtHX3Bh
 q5NiwYGYVz3mOXJnMZe3/UdLFSGcB/+wexIqsF2pUG8KmbVP5HQt3dc41eTs6yD4jeC0
 EAwaH3S+2vQhCGwzt1PoEuRLp4owcymcYSCjrw8FyriT9V1X6Jil4a5VjTff2M0odqmN
 IKhzhZi615X/8jE9cbW77aRTZ3omsz+5rXvfJBTEdcwGuhkecwQQ8nQ5FobJSg6CrH/M
 m7HntkO26IL8z9m2AKJ/m6fY+A4mMOEWHtiVdNj9qv38RYqxGRcTs9b3q5fDMx0PmJLg
 SH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711045740; x=1711650540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCZe9c97mSPduNcttPxhwF3ZnoIb0Wd8cTRIAbH1CTg=;
 b=qJJr0ttsMBuY0IRVKCR60/Fwn0ASO5g3pLvJ19gip82a/4oH1t1Lj/PuF2kCwRa2gb
 Ny4Jwk5eire/BAPkOpCHqDiC0g2EStZWB5r82oN3B+T1iIEA0MYKUr0529HmdPQEcn/C
 AEKNgvgkd5NsBlh9QKEXMnd5g41VLefBYqfs6LvcS+c6qbUxwX3qaPvOrz82iYB/sQCQ
 /6UF8pVVJ5xbABESoUw8wlJd0+HQRnbTEDPDZMSjUeNl3QGcHyi/sNc96In/VW+MswwB
 lP5XGvEJ0xEoy3mVw1A8y2Y0JAuX1MHg9OBDFwur3We4qie1ftVzU2LMAwDkrSbsvXbH
 hZ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXcXc2/BAl75ZWS2OdChrWcS1nXP2Yp/mhxoblfNfoNuqljg1OFxY8bsco0/MgUSZym0C8Sgs2WpGPsOSOfDJOjTvb
X-Gm-Message-State: AOJu0Ywq1t3u932Uh+5mMIf0Thn9U1nQp106Q4CGrY2TN4ozTYe+4OlN
 dI54uV966qQOjLH0a9VN0nO2OFTK63TBNre201EcFhuVqICNi7ezdEqxhztIQsM6l2HrKFsZ8zk
 0ncUAcoz5tzg9DgmQhJEZfr/keX2qVQL44cpujQ==
X-Received: by 2002:a50:d508:0:b0:56b:d1c6:66a5 with SMTP id
 u8-20020a50d508000000b0056bd1c666a5mr1397813edi.6.1711045739781; Thu, 21 Mar
 2024 11:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
 <20240321130812.2983113-7-ruanjinjie@huawei.com>
 <CAFEAcA-SO3akirm+jgKGRvKH1bcsf1bLJE2uOCOoXi1h78WwFA@mail.gmail.com>
In-Reply-To: <CAFEAcA-SO3akirm+jgKGRvKH1bcsf1bLJE2uOCOoXi1h78WwFA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 18:28:48 +0000
Message-ID: <CAFEAcA8+9Xd-GDNzBqGfDxoc7Bg-+wK59vcsyyNmrXrvAitAuQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0a9rdB6ZCpg+

On Thu, 21 Mar 2024 at 15:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> Something somewhere needs to implement "if SCTLR_ELx.NMI is 0 then
> we don't take EXCP_VINMI etc but instead (maybe) EXCP_VIRQ etc".
> At the moment nothing does that:
>  * arm_cpu_update_vinmi() doesn't look at the NMI bit before
>    deciding whether to set CPU_INTERRUPT_VINMI
>  * in arm_excp_unmasked() if NMI is 0 then allIntMask takes its
>    default value of false and so arm_excp_unmasked() returns true,
>    so VINMI is not masked
>  * arm_cpu_exec_interrupt() doesn't look at the NMI bit before
>    deciding whether to check the CPU_INTERRUPT_VINMI bit in interrupt_request
>
> So even if SCTLR_ELx.NMI is 0 we'll still try to take a VINMI
> if it's set up in the HCR_EL2 bits.
>
> However we do this the required behaviour is that if NMI is 0
> then it is as if the interrupt doesn't have superpriority and
> it falls back to being handled as an ordinary IRQ, VIRQ, VFIQ etc.
> I think the best place to do this is probably here in
> arm_cpu_exec_interrupt() -- if SCTLR_ELx.NMI isn't set then
> treat the VFNMI bit like VFIQ, the VINMI bit like VIRQ, and
> the NMI bit like IRQ.

Folding in something like this I think will work:

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 91c2896de0f..797ae3eb805 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -837,7 +837,8 @@ static bool arm_cpu_exec_interrupt(CPUState *cs,
int interrupt_request)

     /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */

-    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env)) &&
+        (arm_sctlr(env, cur_el) & SCTLR_NMI)) {
         if (interrupt_request & CPU_INTERRUPT_NMI) {
             excp_idx = EXCP_NMI;
             target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
@@ -862,7 +863,22 @@ static bool arm_cpu_exec_interrupt(CPUState *cs,
int interrupt_request)
                 goto found;
             }
         }
+    } else {
+        /*
+         * NMI disabled: interrupts with superpriority are handled
+         * as if they didn't have it
+         */
+        if (interrupt_request & CPU_INTERRUPT_NMI) {
+            interrupt_request |= CPU_INTERRUPT_HARD;
+        }
+        if (interrupt_request & CPU_INTERRUPT_VINMI) {
+            interrupt_request |= CPU_INTERRUPT_VIRQ;
+        }
+        if (interrupt_request & CPU_INTERRUPT_VFNMI) {
+            interrupt_request |= CPU_INTERRUPT_VFIQ;
+        }
     }
+
     if (interrupt_request & CPU_INTERRUPT_FIQ) {
         excp_idx = EXCP_FIQ;
         target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);


> What semantics do we intend for the VINMI/VFNMI bits in interrupt_request
> and for the incoming IRQ, FIQ, NMI lines? The GIC spec suggests
> (but doesn't mandate) that NMI could be signalled by asserting
> both NMI and IRQ, and plain IRQ by asserting just IRQ (table 4-6
> in the GIC spec). I think the GIC changes in this patchset assert
> only the NMI line for an IRQNMI, and not both NMI and IRQ. That's OK
> and I think makes more sense for QEMU than signalling both lines,
> but it's not the same as what we wind up doing with the handling
> of the HCR_EL2 bits in these functions, because you don't change
> the existing arm_cpu_update_virq() so that it only sets the
> CPU_INTERRUPT_VIRQ bit if this is a VIRQ and not a VIRQNMI.
> So if the guest sets HCR_EL2.VI and HCRX_EL2.VINMI then
> arm_cpu_update_virq() will say "this is a VIRQ" and also
> arm_cpu_update_vinmi() will say "This is a VINMI" and so both bits
> get set in the interrupt_request field.
>
> I think the fix for this is probably to have arm_cpu_update_virq()
> and arm_cpu_update_vfiq() check that this is not a VINMI/VFNMI,
> so we only set 1 bit in interrupt_request, not 2.

And for this a change like:

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 03a48a41366..91c2896de0f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -926,7 +926,8 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);

-    bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
+    bool new_state = ((arm_hcr_el2_eff(env) & HCR_VI) &&
+                      !(arm_hcrx_el2_eff(env) & HCRX_VINMI)) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);

     if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
@@ -947,7 +948,8 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);

-    bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
+    bool new_state = ((arm_hcr_el2_eff(env) & HCR_VF) &&
+                      !(arm_hcrx_el2_eff(env) & HCRX_VFNMI)) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);

     if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {


thanks
-- PMM
