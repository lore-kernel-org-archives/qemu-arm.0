Received: by 10.28.173.206 with SMTP id w197csp3927828wme;
        Tue, 9 Jan 2018 09:14:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBou58PbGyk2TeeyQPspFRVVcJgt54X1eYLdvWmtDfMBmgZbRYPW30ft/AQo1qbxcNM+bGJNX
X-Received: by 10.98.144.199 with SMTP id q68mr14113239pfk.156.1515518077400;
        Tue, 09 Jan 2018 09:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515518077; cv=none;
        d=google.com; s=arc-20160816;
        b=iL+6wdNr57vGEZqeSnFaqCuEV81/ar5TBg85aTxBepn9EoJ+Bp9JPV/bODm0gTeyDJ
         5vlW9qCgTo7HBkyzI/cuN4adMTjV6BXrGyWahOaQ1xgB3YdbjIhYu8A2Q8dgH71POc4M
         js8+i71R9FWVkqIigGnf8VM5AzjMUrUlkFfgPIfGxNw2yYRLB7oLy/LKbdSe0m7U388f
         gcVP0u7JzZh3wtJTtnOQdusleONk27m+1lv7tNjgf+LiqjZj4wUjv3wmC8VQShZpb12U
         BKVnD6e43TYVMp+NxrH1Iic4S2ZtRrP+J3hd87W30YaqoZmBDR9AWQdS2SbjJxPykZtq
         QPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8gVKvr9yNWxA404feZUsUd5LWsXtq1jzCzroCg9EHIQ=;
        b=FJzKytofWSE3g5L42mFSeb8sfBzMjmlckn5gnlPWQ8E3iLdLPrs66dWTkBJhpfqpPg
         /re1I628hWXJ9CkWITpVKva9+TK7pN9s3WxDsc2U/XUl+MARFIF+APXBxk3ly9pMZmOu
         xguC0EygA8W+Pq+mqVOH8qDryZ9FiKD40CXinlE2QGd5z20sy5wJPeZLEruyCyju1ymQ
         XpxW5W22axe1ACUDwt3l+SdjruXoyOtgqribmdaBQ4nBYKlCSAedoKceZD5ADPFRNtBy
         BE/mqUYtOCwg91iTaECvlhlwGk8QATM9wK1NdU/tgMkqJMWI1kgLk4VGiHS3KvF6eyp9
         EV3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faDK76uY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 68si769360pfe.113.2018.01.09.09.14.37;
        Tue, 09 Jan 2018 09:14:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faDK76uY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752117AbeAIROf (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 9 Jan 2018 12:14:35 -0500
Received: from mail-ot0-f196.google.com ([74.125.82.196]:39955 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751008AbeAIROe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 Jan 2018 12:14:34 -0500
Received: by mail-ot0-f196.google.com with SMTP id d10so11919725oti.7
        for <kvm@vger.kernel.org>; Tue, 09 Jan 2018 09:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8gVKvr9yNWxA404feZUsUd5LWsXtq1jzCzroCg9EHIQ=;
        b=faDK76uY8vGN0+orvb3MlpUBcc9qmRWJeaVUPTyADvR1j/6H3Ug1xr9nyT5FGrbSyi
         LVdIbs5yxxQQ6D2MXQWh41bqY73FSW1tSectW7dEhGwPxfugJR6k3IS90P3CpkZQ/wA9
         mGmbm0VGL5isG3B53+QswOOEnOuHkkKrsArPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=8gVKvr9yNWxA404feZUsUd5LWsXtq1jzCzroCg9EHIQ=;
        b=krXVWbOEzbH/GV40sNNGM+7Nu7b9OJN6K3bmebv/baxvIrIuHS0nmBiE0ULYbu8r9e
         xs/tvaS+2UG2FusBCFlWKe9yCJGaWDR4cN8lERd4Y2S36DLbFZQ9N6DUhI56SedGQi9x
         RiR83GlKNQPfwycvLeYILhJR14ZuYO1/hMGOUiyhYKS8RZBOJ4GDOTZgYFTUbkoJyHyl
         Jmy9p8YUUV84lW9iSUPFxKDl77p2JCNHXBCD8XkI2IGUBnuE/KJqrXB6YoFiZNw7e2iD
         Lso/qIm17zSbvCmodudkOQa7YXeawIx0Ii3uK3odAQrE6Nq0De7TSF+YHeA47allffrN
         rcxw==
X-Gm-Message-State: AKwxytfeOnUOAx+sa+6D/ueeWlMFU+aVu30uwF1Q8P7ZGLvwdhd9pcLM
        jJn7J6uw52l2tut6Dnv4HHazoGqDiFe9SYHokqhW9w==
X-Received: by 10.157.5.196 with SMTP id 62mr8927637otd.110.1515518073370;
 Tue, 09 Jan 2018 09:14:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 09:14:12 -0800 (PST)
In-Reply-To: <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com> <1514440458-10515-10-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 9 Jan 2018 17:14:12 +0000
Message-ID: <CAFEAcA84tR_9e24DqvR9vsNvFBbK86fUTBnQdBjWKDGj4wkTGg@mail.gmail.com>
Subject: Re: [PATCH v14 9/9] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        James Morse <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ON7oLWh/mz3a

On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA which is delivered by host to guest PA, then fill
> this PA to CPER and fill the CPER to guest APEI GHES memory, finally
> notify guest according to the SIGBUS type. There are two kinds of SIGBUS
> that QEMU needs to handle, which are BUS_MCEERR_AO and BUS_MCEERR_AR.
>
> If guest accesses the poisoned memory, it generates Synchronous External
> Abort(SEA). Then host kernel gets an APEI notification and call memory_failure()
> to unmapped the affected page from the guest's stage2, and SIGBUS_MCEERR_AO
> is delivered to Qemu's main thread. If Qemu receives this SIGBUS, it will
> create a new CPER and add it to guest APEI GHES memory, then notify the
> guest with a GPIO-Signal notification.
>
> When guest hits a PG_hwpoison page, it will trap to KVM as stage2 fault, then a
> SIGBUS_MCEERR_AR synchronous signal is delivered to Qemu, Qemu record this error
> into guest APEI GHES memory and notify guest using Synchronous-External-Abort(SEA).
>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address James's comments to record CPER and notify guest for SIGBUS signal handling.
> Shown some discussion in [1].
>
> [1]:
> https://lkml.org/lkml/2017/2/27/246
> https://lkml.org/lkml/2017/9/14/241
> https://lkml.org/lkml/2017/9/22/499
> ---
>  include/sysemu/kvm.h |  2 +-
>  target/arm/kvm.c     |  2 ++
>  target/arm/kvm64.c   | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 3a458f5..90c1605 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -361,7 +361,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
>  /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
>  unsigned long kvm_arch_vcpu_id(CPUState *cpu);
>
> -#ifdef TARGET_I386
> +#if defined(TARGET_I386) || defined(TARGET_AARCH64)

As a general rule we should not introduce new ifdefs with
lists of architectures in them. Instead the targets which support
something should define something suitable in a per-target
header file.

In this case I think you should:
 * move the define KVM_HAVE_MCE_INJECTION to target/i386/cpu.h,
   and have this ifdef be #ifdef KVM_HAVE_MCE_INJECTION
   (that should be in a different patch)
 * have the target-arm patch then just define KVM_HAVE_MCE_INJECTION
   in target/arm/cpu.h (if TARGET_AARCH64) and provide
   kvm_arch_on_sigbus_vcpu()

>  #define KVM_HAVE_MCE_INJECTION 1
>  void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7c17f0d..9d25f51 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -26,6 +26,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "qemu/log.h"
> +#include "exec/ram_addr.h"

Why this #include ?

>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> @@ -182,6 +183,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>
>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>
> +    qemu_register_reset(kvm_unpoison_all, NULL);

Looking at this, I realised that we can do this generically in
kvm_init_vcpu() in kvm-all.c (guarded by #ifdef KVM_HAVE_MCE_INJECTION).
You can move the qemu_register_reset() call from target/i386 into
that common code in the patch where you move the unpoison functions.
Then you can make kvm_unpoison_all be static rather than global.

>      type_register_static(&host_arm_cpu_type_info);
>
>      return 0;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index c00450d..6955d85 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -27,6 +27,9 @@
>  #include "kvm_arm.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "exec/ram_addr.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/hest_ghes.h"
>
>  static bool have_guest_debug;
>
> @@ -944,6 +947,37 @@ int kvm_arch_get_registers(CPUState *cs)
>      return ret;
>  }
>
> +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> +{
> +    ram_addr_t ram_addr;
> +    hwaddr paddr;
> +
> +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> +    if (addr) {

The x86 equivalent of this code has a check that amounts to
"is the guest CPU actually able to accept MCE notifications?".
It looks wrong that we don't have one here.

It's also suspicious that our "send an MCE notification" is
ACPI specific, when not all our aarch64 boards have ACPI,
and even on virt it's optional.

> +        ram_addr = qemu_ram_addr_from_host(addr);
> +        if (ram_addr != RAM_ADDR_INVALID &&
> +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            kvm_hwpoison_page_add(ram_addr);
> +            if (code == BUS_MCEERR_AR) {
> +                kvm_cpu_synchronize_state(c);

This is missing a comment that explains why it's necessary.

> +                ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr);
> +                kvm_inject_arm_sea(c);
> +            } else if (code == BUS_MCEERR_AO) {
> +                ghes_record_errors(ACPI_HEST_NOTIFY_GPIO, paddr);
> +                qemu_hardware_error_notify();
> +            }
> +            return;
> +        }
> +        fprintf(stderr, "Hardware memory error for memory used by "
> +                "QEMU itself instead of guest system!\n");
> +    }
> +
> +    if (code == BUS_MCEERR_AR) {
> +        fprintf(stderr, "Hardware memory error!\n");
> +        exit(1);
> +    }
> +}

I rather suspect we could have this function common, with
the per-architecture interface being "does this guest CPU support
reporting MCEs to it" and "report an MCE to the guest CPU". But
it's not that much code, so I can live with it not being shared for
now.

> +
>  /* C6.6.29 BRK instruction */
>  static const uint32_t brk_insn = 0xd4200000;
>
> --
> 1.8.3.1

thanks
-- PMM
