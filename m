Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp130932ejb;
        Mon, 13 Feb 2023 03:53:38 -0800 (PST)
X-Received: by 2002:a17:90b:350b:b0:233:fdfd:710c with SMTP id ls11-20020a17090b350b00b00233fdfd710cmr3062451pjb.37.1676289218036;
        Mon, 13 Feb 2023 03:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676289218; cv=none;
        d=google.com; s=arc-20160816;
        b=eXYYvNO7CG46OVC2btgKs0faW05Xqx8tc5kxQgvvy0bJAnAZDwNHtu2uykrgPH0Q7j
         e9TXZqCx3zNuJ2q4Et3lq5sl9vhSE/jB0w9WghgezrWol8lYpQD3L82tEHZwjV+smJXR
         MQUo9Vz5Wmhsu4yUsETm0RA2MFwfmc8r8zt9UsssphtEkC5I4NOsV8v17rlUeQzsR4E0
         xeus5xE2yuyFq7XPgdH8x+/V6FdYUS+eqp5Gebl239InkyjRflOgoaVR8jl6byzZyE+X
         KsJBsxTKl554DsHQedLdLv3rdrbAghsq8YQOYxwdFLMeWrHiSxBYyjH+/MCLY8eEYBRR
         nUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VOMnHnZV05OyCaYg6SIuHfWB0UqvI5cp8FxIA8KHZxU=;
        b=vd1GhLakAfQg72ZSh2pu7q5lEmfi9BWrew4uJBovyKg998rLfxs3wB0bLcuqAqw1M6
         I8bRBfkO0BaUNMhy/5bZbXB+oonOuHunn7h2rplHMP6Y+hkRe7hYzG6RvZMvfMeLWczv
         e/RXkZlvAiEY5KCY54bzvIhIghnhder/u8rTlsd/XA+75onZFoRQi0ne3VUaiFL9wM9I
         u0u9wd1bX8Xc4OeRX+o7lXhScCTJGnh8BsvcCjojoXKrDHEL1qYjRmS5MIKdvjwVII2p
         sT2f/XybwNe1lujuagKDws5YEg5YLStNKjnpDPBtAm1lzsmMBv2GyOjjebLmdJ3q2ka5
         QqZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kHwWuGr8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s18-20020a17090aad9200b0022c46bf4ccbsor1671837pjq.4.2023.02.13.03.53.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 03:53:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kHwWuGr8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VOMnHnZV05OyCaYg6SIuHfWB0UqvI5cp8FxIA8KHZxU=;
        b=kHwWuGr8Mx2CU5vbfYgdalvaCEziMyBlanw2dSHtKFNH9WQ2//QlygOQGI85r+ounH
         C9KY4Em6dohEsyWn61j2eOGOpt2OPb8Lz+p6MW2XIJcyGnxXsWG1nZNXKq52DCXXTvgn
         BzyKj75VzAs629hCksIZiAk9UZZz51zTZQUkiH5NXxUIx/S3yRIhLZlOf40wyCo0J5YR
         gPHPV5uhrg+2t9rZeMtLx+oOzog7CJRTQV1crC72baCpJgBhlmd13wM4/cL7tFo/Nqct
         oiuFIzevoWUXOYWPnicf4EEvDB+tlWY8uTVpXcZOpNSO9bcaSxYGo2baIHwpzjCRyeR0
         OJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOMnHnZV05OyCaYg6SIuHfWB0UqvI5cp8FxIA8KHZxU=;
        b=FmCymRxGDQJ4tG89jv6imLgrBPoXa8AmCipFvXkFAzPcpwdCWOP1XJcxTQcx9CBi9F
         eLHOmf2zWlCq0pEuCukLnh61XsFAzusTKARVWJby+nOi9p3OlTHFfgSAbk9zj9ywZOiq
         CHWaysKcBCQYoW2sRungaFTzYDTuO1DbXoHVn51KOekZsECiL5rSMV2j7q+GAajMU6bQ
         6K07dWC6X11b4wzbGCS4P9gBuqQjRSRMrBonMnoNZ/L+W6HJRV6JoCR2/RzYPDGvz9lk
         cqKU9t+Satt8YhqP+ksO1xmuyylC0rPV5gm/tVHbJh+63IasWQE8yhnTs6vaVtQ+uFEV
         HX1g==
X-Gm-Message-State: AO0yUKVJVd+s0OLsjpPdXfSK1qYqMU/Ho9gtaw9RBUiLbkEZ6ABUwn0w
	30zfJlq8kUCBDH5V4HKwZsbPS9XmC3c3/c7HGj5ExW9+
X-Google-Smtp-Source: AK7set/dxy3IV9azT8RoogHKIgnqP83c8vLrYcnQzU2eZtyAq5FTKdUPUlOY9mO0d3FVP/Ue4BwcyDvlqVFLZqZmjPg=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr3349984pjn.89.1676289217626; Mon, 13 Feb
 2023 03:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-4-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-4-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 11:53:26 +0000
Message-ID: <CAFEAcA8F4hScdDbaGNJtuu+1LwV+QkLCfcN2zUqOveNKjufoGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hvf: handle singlestepping over instructions which
 trigger a VM exit
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: uW9xVvm7tZtd

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index c63e8da6a5..87c531508e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1807,6 +1807,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>          pc += 4;
>          r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
>          assert_hvf_ok(r);
> +
> +        if (cpu->singlestep_enabled) {
> +            ret = EXCP_DEBUG;
> +        }
>      }
>
>      return ret;

I think this is probably best folded into patch 2 rather than
being a separate patch.

thanks
-- PMM
