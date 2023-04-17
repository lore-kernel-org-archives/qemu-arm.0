Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1771920ejm;
        Mon, 17 Apr 2023 05:21:50 -0700 (PDT)
X-Received: by 2002:aa7:cd06:0:b0:506:8eef:c58f with SMTP id b6-20020aa7cd06000000b005068eefc58fmr6634213edw.28.1681734110717;
        Mon, 17 Apr 2023 05:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681734110; cv=none;
        d=google.com; s=arc-20160816;
        b=atI5t/ph4Ja5Y0jO98/IxPf3SmXauRwQFLb15jyfcoLd2YNpUuem/nIOQ45tgQY4Kg
         u1GzAzvM6BT8BDPovbZiSbeiXAqhhd7jLtmHPA7Wv4q/o5shwNldEbzU/YtAB8Fol+bS
         /bFpNblrYFlAzY019A7HFokRw//r6/9d13I4hmsK1pJGxYs9z3TrRCzfXHkraKjLg9vt
         0u8yhLmjbjHQDgKrYqbcpsoBov7vrxIE88/N9OpjZP7tk+O+YRMSOzWm5E4KfDvFJyXo
         6sfsGpZBKDTSghJ3UmW+RZ2/M8Pos0U6IDGjI49EbqqZl22t8EI8to27WftzvnRlW+zZ
         B/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=htAPw8sASkbP8CSe9RqSCM40t3CsDS9ksk0jby1dFjc=;
        b=te8XijoH2pgO0sC19YoeWueGsQ1RUQ+/LPHLE+XWKItm5u7uroCw7hFmHgVDJtqmsT
         JuxdwKsrVILrb6GFlZKyqUHR3TnggPhRHVqrNVbW6tf5v6v790aooA5T/byeuihqlQ8q
         qwNdbTrlJwDH9nYTaHxTxYE8i8mgNjlNab7dHhYdX9z0OQKh3vS06vtpoRwAS2Mn9TmK
         XzE9gojKxAsKVO4SEpBaVDB0xY6N+jRUfKe1XFZ7iyFqic6TBN0PNoL0Q2HV40+83voc
         tnFcBUkc70xQrpksJYhRLeQ9ryrUNECzSLHlezSlucJN/9ceS9OobjCY4dlbmZADWdWp
         ZN/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8E+7LoH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bq12-20020a056402214c00b00504b18a53c1sor5569160edb.61.2023.04.17.05.21.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Apr 2023 05:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8E+7LoH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681734110; x=1684326110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htAPw8sASkbP8CSe9RqSCM40t3CsDS9ksk0jby1dFjc=;
        b=V8E+7LoHTrqqnDpJ7FCRZvmJCWDgynmlxuwz9gFkZDUUrvTaujDhthBOZysqNzMhYR
         Wvg9xe4Q0UBi0bHLJ9sLOOAf2mZyShoZO1WZFqo0RWcEH19mNavVbz2bfYbYqNoVXk5X
         VoYX5sAdAdwSmFkskg79+Ts3hBEuOC3lYSFetbg2ztm4m694T6tAPfKxVXRZvP2csPl8
         D+L4QGixBSgcR4BXQBQBYQM9hKlI5hEizAy6dia12Dizqi/ADG/ViY3oelJBZ9LPTOCU
         FSrKA+1Z4+QDSTyscuzFcemAxzcv1W4R4icUqxXj1eMCJ8brZjYKs4/7H8YnNSrD3vl2
         2TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734110; x=1684326110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htAPw8sASkbP8CSe9RqSCM40t3CsDS9ksk0jby1dFjc=;
        b=K9hQxr6DWuVp/wi67Mm+djwMVELx8x5iWVKOnT0uzwTYmN2+umMX+mY8H2gGKq6GYr
         M20vD8rvlcxwZqJZNapfeLVuLGNx9ErDDbeyhNjJ0O9YTM5rSHWvocYm4BVxx3aEp9Mt
         8RckR1bkqY2T6dJR+ILIEbb78Fkmk2fkO551l27AKYvZQvv0LgGsntadjmfyrrbE3kfo
         m7OZAsBAIH2IgaBIe8r2NKcrJTZuktZZNd4zeIQQwjX8Bv5Qi0FedfdmKCxViru+uf75
         i0CHSQI00l5B5XiVVk+CXMoGKX2GKcdN3DhRhFbOhY/6W7VSi4fufNinEo6ZHXHnJdmv
         2AiQ==
X-Gm-Message-State: AAQBX9eSjUm+py47mZ2byilfgTebHD2zRor1NpoAZ6faZzpWIzjpyT8I
	8KK+TAVIIkK1qCiXyDfKj1kR7lyP8nCQUPGrVOgnFE66nT4pzDqoz8c=
X-Google-Smtp-Source: AKy350bJ17KNGWt9uKT+XD1WaldGuMxtrq5jjohaBoizE6+D7vACK7DjU4mslYErN9xzdU8Yzd5kLewKnMnjKmF5y+0=
X-Received: by 2002:a50:8d43:0:b0:4fc:fc86:5f76 with SMTP id
 t3-20020a508d43000000b004fcfc865f76mr7055601edt.6.1681734110239; Mon, 17 Apr
 2023 05:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com> <20230403191600.43487-3-fcagnin@quarkslab.com>
In-Reply-To: <20230403191600.43487-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Apr 2023 13:21:39 +0100
Message-ID: <CAFEAcA_CfbuvbL+yuMTcZwF_PUCPiWJ43eaKOJjZ6DJiQUiFQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iyiGjT3sFbds

On Mon, 3 Apr 2023 at 20:17, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

> +static void hvf_arm_init_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +
> +    max_hw_bps = arm_num_brps(arm_cpu);
> +    hw_breakpoints =
> +        g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
> +
> +    max_hw_wps = arm_num_wrps(arm_cpu);
> +    hw_watchpoints =
> +        g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
> +}

This function gets called per-CPU but it allocates
memory that is per-VM because it's stored in a global.
That means that in an SMP guest the function gets called
multiple times and leaks all but one of the allocations.

The fix for this is to have the function be called
from a general initialization function, not from the
vcpu init function. Compare this (not yet in master)
patch which fixes the same bug for KVM:
https://lore.kernel.org/qemu-devel/20230405153644.25300-1-akihiko.odaki@daynix.com/

Other than that, the structure of the patch looks OK, but
I think you need to identify the cause of the problems
with SMP setups that you mention in the cover letter,
since they suggest that there's a bug lurking in here
somewhere.

thanks
-- PMM
