Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp3841600pjq;
        Tue, 2 Jul 2019 07:01:19 -0700 (PDT)
X-Received: by 2002:aca:ea0b:: with SMTP id i11mr2951067oih.102.1562076079493;
        Tue, 02 Jul 2019 07:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562076079; cv=none;
        d=google.com; s=arc-20160816;
        b=NI/gKFjpkzNXfCLMSCtx3sUwQKNGXfFqb5zspHvEv5wIrF+s8ok6gnWHy13ZMVL66C
         zCIIHA2CPwarkwDvE2jvOLR43W/nMRf/2weoqXRaevLkSCI30KcwnNdy5SJv8P1iZ/Ks
         QqQF8cjjAtf/leFZCMpWYXEeNxD2eCmhVzKsjzgrde7vHZc52YAytKCShmtj4smikpHN
         bWnUy8ZMAxvsUuyuykP6XieDabcHcAPUs06PaHWnEAcqEHQckGucALoIh9mkCtV5ZQNY
         cNO4yRNF9QKXyiMAQN1ubSErHKJbHPlMdIj/6czP/Bi+uvIAG0yii9iVoWYDJIdYMuiO
         zBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqwgMTTgDEm/b0NIbMgi8rNGvxIw/MePJRH6fknCQjk=;
        b=KUfGqi7uofDD//J7hWm+2rFyptaiWiTfjtvCS4mHWbk4VZ3sJNVmpIr3qYSHnS88l8
         HMCWTXLN/d8VJCT+GPqO+ZHZBGxD8c8928uEwcSRwkDCrZ+t7z1F0mD8bWv6z1k3AfUs
         5n1KoFb+C7eeYx3RjYGH4p/Kvz6T3ZtYHFweWnKbUwR62OFYQy1C8PkX1p1nyGX2Vkjt
         xBqgRLUxz/g5vTBQZbyWQfNacstgv1t2w32hdPvM+Ko7XGF7uyL0xbt6D77XM8BpZ8Sy
         tj9jm0Dr80Bw/eKiCzsMwpwkRfx1SRm/A3S4U6ZhOLXaGyBkOijmMF0GUioHxPxFDnk3
         bJXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMGRcftJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r131sor6431815oif.20.2019.07.02.07.01.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 07:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMGRcftJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cqwgMTTgDEm/b0NIbMgi8rNGvxIw/MePJRH6fknCQjk=;
        b=zMGRcftJCYDyiMy3dVyGKxG6vha9EQTuQfKvNTea6EUz8hU9bKKL8c0amR4N+Wy8Zc
         1WzLYrk77wWjW0T361oAmNDy8sNLU+DMlFSJmGp+Ndg+N/KvDmtu0OmM3EGmf9jhS12Y
         FPu4AGFw7r0CpBERfkgKbRIno7pjPJCa68e5dU2GX5sz5StXQCNweIAzuC/cAJ4MzlgL
         btgtqNGfhXsyUEjLfgd7rWogBRdZhWKMoPUZULR09iiWN9H8c4qTq6mKtOzYehVD6cXQ
         DXpeID+ekFPVlpV8ulLnadtlvQ7gm/xyFydPW5TLNIp6FfXLdxuWVyH1H88omAIW7JY7
         V7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cqwgMTTgDEm/b0NIbMgi8rNGvxIw/MePJRH6fknCQjk=;
        b=ZqkDeLauXy9OUQ2xbOSfM66ncD0cSXzU3xm94cABZnQ6qqvXnh7Eo3E26WslL3FOu9
         e4eSwbvE35cr1fmhElxTFv08zuowc3qD/eM5vHsurf27+R7YB/+KcnqdJh/QgUQyAJFs
         R+Cm9xmcpgCvtCLeseF1OtJnYiVzK6PnFy/W/eYuahyB8pC5z+U/Mo2gyBLXjiOR/IDu
         VuDyvZyTKa2On2ns8EU+4vKypGbKiFp4/9UB0inr5/9EJX01oPxMd8E3VSPGpPZv9Mnj
         UxOoDzJn64bKasxpskZEEZ2aJ37zDm1barCdsdMn5QOBQQc6wzfBMvJVOV6nBzZ4OwjJ
         lXbQ==
X-Gm-Message-State: APjAAAUXUS/C9hGqH7Hk0VCZsfWIONEX/Y6NDopExYyJcHzhmp0azagU
	79LVvuyc6x+AHPCCB69hube7tyW3CCwE6OxV8xiZIXdWGbVAQg==
X-Google-Smtp-Source: APXvYqzcqBiLEx5yGkdB6sw872UZ3nETBgJKOfoap4Iuaxqr0qdqfzzu4MncEGbDi8xz80l/QMGIZhkFx0nmnHu5eo0=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr2988956oij.98.1562076079127;
 Tue, 02 Jul 2019 07:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190701194942.10092-1-philmd@redhat.com> <20190701194942.10092-4-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 15:01:08 +0100
Message-ID: <CAFEAcA99QK7u+Rev5C9Xb_vmnGSZvx9EO+8D_fFB1qFmiMejcA@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] target/arm/helper: Move M profile routines to m_helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Andrew Jones <drjones@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /Mhhrj3fQaNB

On Mon, 1 Jul 2019 at 20:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> In preparation for supporting TCG disablement on ARM, we move most
> of TCG related v7m/v8m helpers and APIs into their own file.
>
> Note: It is easier to review this commit using the 'histogram'
>       diff algorithm:
>
>     $ git diff --diff-algorithm=3Dhistogram ...
>   or
>     $ git diff --histogram ...
>
> Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> patch generated with git diff --histogram.
>
> v4: rebased
> ---
>  target/arm/Makefile.objs |    1 +
>  target/arm/helper.c      | 2661 +------------------------------------
>  target/arm/m_helper.c    | 2676 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2681 insertions(+), 2657 deletions(-)
>  create mode 100644 target/arm/m_helper.c

This patch doesn't compile:

>
> -hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
> -                                         MemTxAttrs *attrs)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    hwaddr phys_addr;
> -    target_ulong page_size;
> -    int prot;
> -    bool ret;
> -    ARMMMUFaultInfo fi =3D {};
> -    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> -
> -    *attrs =3D (MemTxAttrs) {};
> -
> -    ret =3D get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
> -                        attrs, &prot, &page_size, &fi, NULL);
> -
> -    if (ret) {
> -        return -1;
> -    }
> -    return phys_addr;
> -}
> -

...it deletes the definition of arm_cpu_get_phys_page_attrs_debug(),
which should stay where it is.

thanks
-- PMM
