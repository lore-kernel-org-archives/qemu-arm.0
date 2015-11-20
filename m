Received: by 10.182.158.201 with SMTP id ww9csp547773obb;
        Fri, 20 Nov 2015 07:30:54 -0800 (PST)
X-Received: by 10.129.117.86 with SMTP id q83mr13243824ywc.250.1448033454231;
        Fri, 20 Nov 2015 07:30:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x232.google.com (mail-yk0-x232.google.com. [2607:f8b0:4002:c07::232])
        by mx.google.com with ESMTPS id t21si75078ywg.76.2015.11.20.07.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2015 07:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::232 as permitted sender) client-ip=2607:f8b0:4002:c07::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by ykdv3 with SMTP id v3so167660339ykd.0
        for <alex.bennee@linaro.org>; Fri, 20 Nov 2015 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=4t5B4sn3AKX2p21k1JCYXyRQKfvd3Zqf8SJ4iQGQlVg=;
        b=hWOuOuAmb7LFMQz+gpxZ4CebBWgxfTxMwexu7y+x//dPjeZo91HJWPuRbKKGBAcO6z
         xSa2iNvU/AW8VJjNFKO/K7d1lCvdS5tV83m2OnL92pkKzTARVJGWB9ywuAPGizD9yhL9
         RprtP79lD8WcNDU8NCfhKiOGJnZiaYo15jhRNF3po/KsrNFIih9n6HTFEeSrNWOw9KJl
         hUrbXWGSgt7ONC4ITd1To5D2RnAXtKvqesA2IF+bwK/+F4KrMPxyDL3B3vaZd2lIKuL3
         E4GNWuoM+oDM8admIZ5wK+/5QTCUf9QWxgpRKerUljt6vRF7jo3VAqIYqAIgkt5Na7kS
         1TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=4t5B4sn3AKX2p21k1JCYXyRQKfvd3Zqf8SJ4iQGQlVg=;
        b=VZblPQAgcRJjg9Lz2saPiB6ZawKhi/uMzkEfytzWakhj4L+Wj2SU8kRQ7zz5NVfEgT
         kZbW+iy2z+hxOd0PXHUmJDhQzwKbXA2qj8RUrwJ5J/O6lM/wsrdKatbm/204a8IRZAKV
         UPf2CIXgF3ujhEoDuxK3uMxVzMhsati2gIB5hjzmVIoJqO7ztZOPhehZGU1xhFsfTNzb
         ayTma8qL0R2W9O7VZjldLPsC+F13HANXrz/HMNG8ClgT/ATzedUmOoG3Nn24SSz7j7gY
         WfvUMxxK9fGvDJPQhfn2FMSNhZK9KQZPmQFcfyA2bPOwdv3qVg09FbCCJTlA957IlHu2
         RuMw==
X-Gm-Message-State: ALoCoQkLia/FOfWhmpVsY1FkzocLWIGTuXC7UEhByPdJt0B+x5EYZPaQ/HOapoLaplRIbOYK9abB
X-Received: by 10.13.235.135 with SMTP id u129mr14953296ywe.48.1448033453550;
 Fri, 20 Nov 2015 07:30:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 07:30:34 -0800 (PST)
In-Reply-To: <1447345251-22625-4-git-send-email-alex.bennee@linaro.org>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-4-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 15:30:34 +0000
Message-ID: <CAFEAcA-YQ384sY1OWLaV9YAjzTZSyWqVLHx2moH-sCa+O6FvOw@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] target-arm: kvm - support for single step
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: oCDqTXl/3ooV

On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> This adds support for single-step. There isn't much to do on the QEMU
> side as after we set-up the request for single step via the debug ioctl
> it is all handled within the kernel.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - convert to using HSR_EC
> v3
>   - use internals.h definitions
> ---
>  target-arm/kvm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index 50f70ef..d505a7e 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -535,6 +535,13 @@ static int kvm_handle_debug(CPUState *cs, struct kvm=
_run *run)
>      kvm_cpu_synchronize_state(cs);
>
>      switch (hsr_ec) {
> +    case EC_SOFTWARESTEP:
> +        if (cs->singlestep_enabled) {
> +            return true;
> +        } else {
> +            error_report("Came out of SINGLE STEP when not enabled");
> +        }
> +        break;
>      case EC_AA64_BKPT:
>          if (kvm_find_sw_breakpoint(cs, env->pc)) {
>              return true;
> @@ -595,6 +602,9 @@ int kvm_arch_on_sigbus(int code, void *addr)
>
>  void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *d=
bg)
>  {
> +    if (cs->singlestep_enabled) {
> +        dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
> +    }

Doesn't kvm_update_guest_debug() already set these bits, or am
I misreading it?

>      if (kvm_sw_breakpoints_active(cs)) {
>          dbg->control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
>      }
> --
> 2.6.3

thanks
-- PMM
