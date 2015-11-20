Received: by 10.182.158.201 with SMTP id ww9csp571705obb;
        Fri, 20 Nov 2015 08:15:01 -0800 (PST)
X-Received: by 10.31.48.149 with SMTP id w143mr140856vkw.5.1448036101456;
        Fri, 20 Nov 2015 08:15:01 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com. [2607:f8b0:400c:c05::234])
        by mx.google.com with ESMTPS id l140si117461vke.214.2015.11.20.08.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2015 08:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) client-ip=2607:f8b0:400c:c05::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by vkha189 with SMTP id a189so557250vkh.2
        for <alex.bennee@linaro.org>; Fri, 20 Nov 2015 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=TJXP8quzg4YSQAyt6y8hNxBCJG2HqafGCZZDrABftnk=;
        b=VOIDEI4Kq2uLlqrEpI72+dHlJlP38eDZTYr64V99zDxBmf9gjOKOMY1fZ1GOsLd6PM
         tpb42l+Da4dzXqul8FImrFiZ5A7aMx3Zbwp07VZZjNDsWtoWO5oFFfOH2Kf6rYTm03C9
         2MBFaYeOh31sMLZQhaZCKJZyDLAYKLxDCcbyvnFZmkO44L4ahWNR4lGqokEiDpuBvknu
         SifIDfGNHo/5+ufbGNVCdbLTbsoLn2U9YOsAJy03SJOiRIXwZSlB+uWE6lImTG/ZT00e
         8xETZQfFzw4vE7gbUi9mRH6gaQE+w4wEmdy0ttlMNHpA+4w6nSg1U5fBVL7/RrM22d9Q
         xm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=TJXP8quzg4YSQAyt6y8hNxBCJG2HqafGCZZDrABftnk=;
        b=bTnhbQRG6OhOg8pues/v1qkc4cLx+Yf+sSvwmnGAhCAkv6ae+7CqXIM4uwFBHMCIJv
         C448DX39j3kNc2lNzRH5VIsgw2QgftB2205lovG6xyx16GiUF1zkIjHoc9AAsHfb25f3
         wqM6BX1s0EK27zuHl7eg1Z2k82bVlvDs+ynvP78r3vbMF+A2JKlrlaJxeIxstEQX7aLT
         m0SDJnKQ7e4M3jo+H3DiggDYSKIWLetaoUw2mUoo9JDlmYcTi0/j72Tui+Vl+2L5fkoC
         tvxptWwacOuhz5E7i72PZs9aOzWvd57iMjM704HGyjisPJKHof26VIcEDVDsFG52lYzi
         YPbw==
X-Gm-Message-State: ALoCoQn7RxK6GpgEL3tpRdpQBiEC7VbiuYi9R8WTC4cTzTgDVMwY1q+OODMbiMnhh63UpGLyfI6t
X-Received: by 10.31.52.211 with SMTP id b202mr135905vka.82.1448036101194;
 Fri, 20 Nov 2015 08:15:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 08:14:41 -0800 (PST)
In-Reply-To: <1447345251-22625-6-git-send-email-alex.bennee@linaro.org>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-6-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 16:14:41 +0000
Message-ID: <CAFEAcA9xXULtmcq7n353gZEyObUx+ZafsfNKUep8_CWNmLzdcA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] target-arm: kvm - re-inject guest debug exceptions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex@bennee.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QrvftS0XbEs1

On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> From: Alex Benn=C3=A9e <alex@bennee.com>
>
> If we can't find details for the debug exception in our debug state
> then we can assume the exception is due to debugging inside the guest.
> To inject the exception into the guest state we re-use the TCG exception
> code (do_interupt).

"do_interrupt".

>
> However while guest debugging is in effect we currently can't handle the
> guest using single step which is heavily used by GDB.

Can you expand this to be clearer about what the problem is here?
Is this a thing fixed by this commit or a remaining issue after it?

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v5:
>   - new for v5
> ---
>  target-arm/helper-a64.c | 12 ++++++++++--
>  target-arm/kvm.c        | 27 +++++++++++++++++++--------
>  2 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
> index deb8dbe..fc3ccdf 100644
> --- a/target-arm/helper-a64.c
> +++ b/target-arm/helper-a64.c
> @@ -25,6 +25,7 @@
>  #include "qemu/bitops.h"
>  #include "internals.h"
>  #include "qemu/crc32c.h"
> +#include "sysemu/kvm.h"
>  #include <zlib.h> /* For crc32 */
>
>  /* C2.4.7 Multiply and divide */
> @@ -469,7 +470,8 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>                    new_el);
>      if (qemu_loglevel_mask(CPU_LOG_INT)
>          && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%" PRIx32 "\n",
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
>                        env->exception.syndrome);
>      }
>
> @@ -535,6 +537,12 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>      aarch64_restore_sp(env, new_el);
>
>      env->pc =3D addr;
> -    cs->interrupt_request |=3D CPU_INTERRUPT_EXITTB;
> +
> +    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\=
n",
> +                  new_el, env->pc, pstate_read(env));
> +
> +    if (!kvm_enabled()) {
> +        cs->interrupt_request |=3D CPU_INTERRUPT_EXITTB;
> +    }
>  }
>  #endif
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index 1f57e92..4ac177a 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -529,9 +529,10 @@ static int kvm_handle_debug(CPUState *cs, struct kvm=
_run *run)
>      struct kvm_debug_exit_arch *arch_info =3D &run->debug.arch;
>      int hsr_ec =3D arch_info->hsr >> ARM_EL_EC_SHIFT;
>      ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUClass *cc =3D CPU_GET_CLASS(cs);
>      CPUARMState *env =3D &cpu->env;
>
> -    /* Ensure PC is synchronised */
> +    /* Ensure all state is synchronised */

You might as well have just written the comment like that to start with :-)

>      kvm_cpu_synchronize_state(cs);
>
>      switch (hsr_ec) {
> @@ -539,7 +540,14 @@ static int kvm_handle_debug(CPUState *cs, struct kvm=
_run *run)
>          if (cs->singlestep_enabled) {
>              return true;
>          } else {
> -            error_report("Came out of SINGLE STEP when not enabled");
> +            /*
> +             * The kernel should have supressed the guests ability to

"suppressed". "guest's".

> +             * single step at this point so something has gone wrong.
> +             */
> +            error_report("%s: guest single-step while debugging unsuppor=
ted"
> +                         " (%"PRIx64", %"PRIx32")\n",
> +                         __func__, env->pc, arch_info->hsr);
> +            return false;

Why didn't we just write the error_report this way to start with?

>          }
>          break;
>      case EC_AA64_BKPT:
> @@ -564,14 +572,17 @@ static int kvm_handle_debug(CPUState *cs, struct kv=
m_run *run)
>      default:
>          error_report("%s: unhandled debug exit (%"PRIx32", %"PRIx64")\n"=
,
>                       __func__, arch_info->hsr, env->pc);
> +        return false;

Might as well put this "return false;" in the original code that
adds the default case, rather than changing the control flow in this
patch.

>      }
>
> -    /* If we don't handle this it could be it really is for the
> -       guest to handle */
> -    qemu_log_mask(LOG_UNIMP,
> -                  "%s: re-injecting exception not yet implemented"
> -                  " (0x%"PRIx32", %"PRIx64")\n",
> -                  __func__, hsr_ec, env->pc);
> +    /* If we are not handling the debug exception it must belong to
> +     * the guest. Let's re-use the existing TCG interrupt code to set
> +     * everything up properly

Missing trailing ".".

> +     */
> +    cs->exception_index =3D EXCP_BKPT;
> +    env->exception.syndrome =3D arch_info->hsr;
> +    env->exception.vaddress =3D arch_info->far;

You need to set env->exception.target_el to 1 as well.

> +    cc->do_interrupt(cs);
>
>      return false;
>  }
> --
> 2.6.3
>

thanks
-- PMM
