Received: by 10.182.158.201 with SMTP id ww9csp533168obb;
        Fri, 20 Nov 2015 07:05:37 -0800 (PST)
X-Received: by 10.129.91.214 with SMTP id p205mr13915371ywb.308.1448031937264;
        Fri, 20 Nov 2015 07:05:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x235.google.com (mail-yk0-x235.google.com. [2607:f8b0:4002:c07::235])
        by mx.google.com with ESMTPS id t67si10851299ywd.421.2015.11.20.07.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2015 07:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::235 as permitted sender) client-ip=2607:f8b0:4002:c07::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by ykfs79 with SMTP id s79so167077684ykf.1
        for <alex.bennee@linaro.org>; Fri, 20 Nov 2015 07:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=KowpW4NCMjdAzuKpIUzzcx/UlREGFdVpUgeQefLxb+g=;
        b=RxQ4GqHsXrfVnH7pDwUt8lniObBfmP2Xdu0o83QCdEqEd7fPFxVoNp2wCW/mwJHm3c
         jfnrqdlLEYd166a7bzDCB0+PqyiNAnsIJW6o7Pw0UGSoom5Ymk3ee9iwmcIYn+Mwvpq4
         aegK8dKCQUZtvUPuWSIYl+MkFJld8LLE5ORI8IEbWvC8Ja0nNmnNtMx4ghxovqMDiS2B
         GZuAuQVlG4S1sqFbgApLgRy5ff6fqqOAOCC4zAT6APng5Ussoi5lMq0kMiFJKjXLWOJI
         Zg9EOuiwCEHI0+f8TLYJOhwsMzCOh1jbTRnPBfLb1u3qa7lZg8P77sZQxoKdxxyfrlhh
         bztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=KowpW4NCMjdAzuKpIUzzcx/UlREGFdVpUgeQefLxb+g=;
        b=QGAbeUZ5PZ2X4L1uV/5bwSha9JF9kAEx1H+NOB5/2p/NGTBe9IBc+o7PxyGYupNpj6
         SqZjSsFp3awvi97AoWZ9YT7XXJrNAobGjEdb1/CaLlr+AoPXFmKT2r4VyL2ZignHKKDr
         UP3QzrSPhqaJB01rEP4zHxhdQPlGiVmh3j5ZfPC0BDIQcPmHlgVcgzMzitsq0rmR82QS
         uKaoQujBozKqyNGr79IIF875LWtwbolOy7fF8AJyMK989ANynLJeuQt0Xa/WBnxpvQkh
         II+35RryTE9k/Kons8QxRsn7JHpYvi5Q+VV6MAnz2WYBFPr2ul/uFRqrcUF0FTsdEJMY
         dznA==
X-Gm-Message-State: ALoCoQmGB6ITWdUI5Lc3YzZLmL/wWzsSfW+Z6jThrFO5OI4a8fqGQBNDzOCZ2TT61BnZyf8GfpFK
X-Received: by 10.129.17.214 with SMTP id 205mr15015989ywr.284.1448031936679;
 Fri, 20 Nov 2015 07:05:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 07:05:17 -0800 (PST)
In-Reply-To: <1447345251-22625-2-git-send-email-alex.bennee@linaro.org>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-2-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 15:05:17 +0000
Message-ID: <CAFEAcA-u3ACj=99NkTRsEL=2KA6LETeAmEf+5Vo03gz0GMh5Zw@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] target-arm: kvm64 - introduce kvm_arm_init_debug()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1Oc7T5vj2QwX

On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> As we haven't always had guest debug support we need to probe for it.
> Additionally we don't do this in the start-up capability code so we
> don't fall over on old kernels.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target-arm/kvm64.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
> index ceebfeb..d087794 100644
> --- a/target-arm/kvm64.c
> +++ b/target-arm/kvm64.c
> @@ -25,6 +25,22 @@
>  #include "internals.h"
>  #include "hw/arm/arm.h"
>
> +static bool have_guest_debug;
> +
> +/**
> + * kvm_arm_init_debug()
> + * @cs: CPUState
> + *
> + * Check for guest debug capabilities.
> + *
> + */
> +static void kvm_arm_init_debug(CPUState *cs)
> +{
> +    have_guest_debug =3D kvm_check_extension(cs->kvm_state,
> +                                           KVM_CAP_SET_GUEST_DEBUG);
> +    return;
> +}
> +
>  static inline void set_feature(uint64_t *features, int feature)
>  {
>      *features |=3D 1ULL << feature;
> @@ -121,6 +137,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      cpu->mp_affinity =3D mpidr & ARM64_AFFINITY_MASK;
>
> +    kvm_arm_init_debug(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }

I assume in practice the kernel guarantees that either all
CPUs have the SET_GUEST_DEBUG cap, or none do :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
