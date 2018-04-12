Received: by 10.28.71.155 with SMTP id m27csp2117207wmi;
        Thu, 12 Apr 2018 09:39:17 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+MPrmsxE6gFCDnP7KGy8rM+wav8jhYmxNn3lm1U7aUbYoScJSQcHBuibNF+eadYOxmSLaU
X-Received: by 10.200.40.156 with SMTP id i28mr2309798qti.64.1523551156928;
        Thu, 12 Apr 2018 09:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551156; cv=none;
        d=google.com; s=arc-20160816;
        b=LprUBAEWFIl3dMgHACqbPENMMm5u5YSeIGqJy7+lVSype0X5B21AZOnw6GV0trW1Q1
         nY0zfHz/KnTrNqL3b4gP8V2ES8gBnEGkfviUvN1Jt7nxSc+TWA9g2AH1lZkThT3Eldce
         U08bhl+SefrcOX9JESs66CE/YNFWg+e1fAYUIgyJBzYZLwo6NRIinHafXMOJrJY1A5P4
         2lF/OMfu8zv542H10kP3ETuSohvHtifCJgU/jSVDgsEQMnBys7DG6Cru3OFZoB5hpYl8
         j2sI9jKNnHpqFHxZmVGVpZYPdxLh9Owrvg9fSJ4pdCFCeb4IXXWu0og2z+ieIVv1yVRa
         oagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gvpqay1wgd2Yq0BiCGrfmbITapb+CLXvnPiJ3PNYIDI=;
        b=G4wZVBi//dRMcgE7KgJsnhZYxloViOEyIIle+hV20KtrJrdpBbfdeZ3VDCD3u80uXC
         jkfkweTxA7Vx7px+xo/DOF7bj6a+N9Q9pbK+2frcrvzsGpI796xc/hP19jqx/O6IG7By
         IKAbpTOG8GHfjCo5FJJ3yOlgg6SOYY7Mlh4JFzDkuFU48fELcQD0Vm0lOJZ6dhYSSFY8
         dzgu2wMFyZ0kOdxW9ke+0qsEYihhguSqbE5408m6LBmbkVF8B7oautW/+mGhCC3uEChG
         nrerHhTM1BhV3ZAYI3X9DXySNBTtDCFANjKOCMScO0OPNtaHF9N66+H5nbn38tSC6Ks2
         HbLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DUuOToZ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h136si5313949qka.343.2018.04.12.09.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DUuOToZ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fFk-0002eF-G3
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:39:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fDO-0001LN-DP
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fDN-0005Fm-7u
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:36:50 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fDM-0005FI-Vd
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 12:36:49 -0400
Received: by mail-oi0-x241.google.com with SMTP id 188-v6so5755085oih.8
	for <qemu-devel@nongnu.org>; Thu, 12 Apr 2018 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gvpqay1wgd2Yq0BiCGrfmbITapb+CLXvnPiJ3PNYIDI=;
	b=DUuOToZ7SoUheypB+JKWBlM1VGLjTOl+4+jbdkX2ILEP+S4CSQnUEkpF/lY0MUTPkc
	R8p/f03dKVaRE9HsMmLGxVBMvGbX8N6hX5KCfgYDKEIt1OZhFttn0W8tNaWZDtiFXbAy
	x7ZWJVEGKG598xAMxlhnxY3un1mSmCqiR7E+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gvpqay1wgd2Yq0BiCGrfmbITapb+CLXvnPiJ3PNYIDI=;
	b=OZLi+6DviaBDbTT/AW1hSUe91oVZeJhZGsAQSkFnCC1DtRZ5BBduwl9x91H+CAdWyG
	SmNl4CELuUo5Fbe44rmTAw+EkEZOUU/P0JFjrcmVF1kh0CQg4aYKmXVCWF6Vo8dotX97
	K42LvgLdDgQBvhHhQFLaKbheUtDGdIIkij+MmNiRWBr4PBWNLK7KbDSuVNoEG5jvL8+O
	s5XV2SuXccOrUTlSgA5QamYRkC8QC5tXNDmYEIRKLsv4LonWWgTAqbo/Hx/e+/q+gmS1
	lmFQfjwSaxZida6Jt5UPRgfLEblH7FPR7pt4QQrLhUfLFK8ZchTeDaXTuIGRnlBiko2P
	Ufmg==
X-Gm-Message-State: ALQs6tC7VV0Ib2t7c6ZuWySP1m3kWolBkEHGctV1NHe5oglGmCqy/ofN
	Mk+BDlxmKOWqyCjW/PFLrZtvmwmyFxXe7WAgV/eadA==
X-Received: by 2002:aca:3f55:: with SMTP id
	m82-v6mr6386727oia.252.1523551008103; 
	Thu, 12 Apr 2018 09:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:36:27
	-0700 (PDT)
In-Reply-To: <1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:36:27 +0100
Message-ID: <CAFEAcA8cMNUQ9Tj+ft93Yv5fEnV-kGnhZoiTRZBnHKs=wfTz=A@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v3 08/22] target/arm: Support multiple EL
 change hooks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rDmw1j4vg0zH

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c       | 15 ++++++++++-----
>  target/arm/cpu.h       | 23 ++++++++++++-----------
>  target/arm/internals.h |  7 ++++---
>  3 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 072cbbf..5f782bf 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -55,13 +55,16 @@ static bool arm_cpu_has_work(CPUState *cs)
>           | CPU_INTERRUPT_EXITTB);
>  }
>
> -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque)
>  {
> -    /* We currently only support registering a single hook function */
> -    assert(!cpu->el_change_hook);
> -    cpu->el_change_hook = hook;
> -    cpu->el_change_hook_opaque = opaque;
> +    ARMELChangeHook *entry;
> +    entry = g_malloc0(sizeof (*entry));

g_new0(ARMELChangeHook, 1) is nicer for initializing a thing of
known size.

> +
> +    entry->hook = hook;
> +    entry->opaque = opaque;
> +
> +    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
>  }
>
>  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
> @@ -744,6 +747,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    QLIST_INIT(&cpu->el_change_hooks);
> +

If you put this in arm_cpu_initfn() you don't have to wonder
whether anybody's calling arm_register_el_change_hook() after
the CPU object has been created but before it is realized...

>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          set_feature(env, ARM_FEATURE_V7);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f17592b..3b45d3d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -633,11 +633,17 @@ typedef struct CPUARMState {
>
>  /**
>   * ARMELChangeHook:
> - * type of a function which can be registered via arm_register_el_change_hook()
> - * to get callbacks when the CPU changes its exception level or mode.
> + * Support registering functions with ARMELChangeHookFn's signature via
> + * arm_register_el_change_hook() to get callbacks when the CPU changes its
> + * exception level or mode.
>   */

This is supposed to be the doc comment for the type,
which I think was fine as it is, apart from the name change.
If you want to also have a doc comment for the struct type
that's fine but would be something different (and is less
necessary, because the struct type is internal to the CPU
whereas the function type is part of its API to the rest of
the system).

> -typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
> -
> +typedef void ARMELChangeHookFn(ARMCPU *cpu, void *opaque);
> +typedef struct ARMELChangeHook ARMELChangeHook;
> +struct ARMELChangeHook {
> +    ARMELChangeHookFn *hook;
> +    void *opaque;
> +    QLIST_ENTRY(ARMELChangeHook) node;
> +};
>
>  /* These values map onto the return values for
>   * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
> @@ -826,8 +832,7 @@ struct ARMCPU {
>       */
>      bool cfgend;
>
> -    ARMELChangeHook *el_change_hook;
> -    void *el_change_hook_opaque;
> +    QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>
>      int32_t node_id; /* NUMA node this CPU belongs to */
>
> @@ -2895,12 +2900,8 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
>   * CPU changes exception level or mode. The hook function will be
>   * passed a pointer to the ARMCPU and the opaque data pointer passed
>   * to this function when the hook was registered.
> - *
> - * Note that we currently only support registering a single hook function,
> - * and will assert if this function is called twice.
> - * This facility is intended for the use of the GICv3 emulation.
>   */
> -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque);
>
>  /**
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 47cc224..7df3eda 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -727,11 +727,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                     int mmu_idx, MemTxAttrs attrs,
>                                     MemTxResult response, uintptr_t retaddr);
>
> -/* Call the EL change hook if one has been registered */
> +/* Call any registered EL change hooks */
>  static inline void arm_call_el_change_hook(ARMCPU *cpu)
>  {
> -    if (cpu->el_change_hook) {
> -        cpu->el_change_hook(cpu, cpu->el_change_hook_opaque);
> +    ARMELChangeHook *hook, *next;
> +    QLIST_FOREACH_SAFE(hook, &cpu->el_change_hooks, node, next) {
> +        hook->hook(cpu, hook->opaque);
>      }
>  }
>

thanks
-- PMM
