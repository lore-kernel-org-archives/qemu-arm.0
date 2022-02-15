Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp618483lfl;
        Tue, 15 Feb 2022 14:05:52 -0800 (PST)
X-Received: by 2002:a05:6000:1d93:b0:1e6:8b21:a1af with SMTP id bk19-20020a0560001d9300b001e68b21a1afmr56959wrb.304.1644962752897;
        Tue, 15 Feb 2022 14:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644962752; cv=none;
        d=google.com; s=arc-20160816;
        b=PcUiXLz4iCEogoQM4H391Akv1Zt8xGzfGb0dwfUUsAexetzvHkRhDy9DZmy1AaQu3p
         Vucb2Wpeuw3rzOrP3duNcPd7cZihAgqdFo75FFjSM+4cHED3X2YD8DnTVbmFEbjIltME
         6aHi7l5/52XVkrVuK0Zbwmf+KkI0Zh9fNtg/m3gp02aViBOEfIAapu19n+0A4K86uy1E
         pTV6aZIvGI7dI2eEKBqCn+Qg+jQyZh6mmleaBM9LhLhBTtclsPgqx8v4u+C6qqvi82oV
         P5Yf91fA35uzJQqUbyncxaX80R1OWR4xuKX39kV4HJwaXUSvH63736DiO4hw/8pPBzl7
         vVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjwzavPHuwLQhDLaeCIqve1wOTSq+fSSdSxuL6FgndY=;
        b=MjwJZSbqg1wgA2oqaYcToOvMbDa/Pt1c11NaAqxJnT8z+gOGKyEuaSy9IZG0FTvaNM
         hKP8q3D0qlolyqdyHkz96LNVqFZieV7X2Eofjkp/Bcq2ITDVvu4dExXGFa+gOu8MCjr6
         s/Bz8hfuEiNaCL2zxI00mONMg0IzRvxNDWtfkMG42iukhuePmeT4L5D+wg60qFceZ9R/
         +E/EHwYPEFcTMZQkl+er3HNTVC9hxLLy7OAu/+2EsKgbq/PtACChxRZQaSWSgSckly4H
         dnRs94FhTBAPMYTicu9MNKYKFHC0OwkkCwBQmOZSu6PJAHeWwDiklZ6K/ugLbG/hwsON
         mm8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyLB+Qdg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i6sor4952wrf.9.2022.02.15.14.05.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyLB+Qdg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjwzavPHuwLQhDLaeCIqve1wOTSq+fSSdSxuL6FgndY=;
        b=hyLB+QdgTJkxAQcnPlb1uORvHQNf7bCW7gFZ3rq0q+qUBm6oYmv3rdnP95ES9ZxqcH
         egoy5KXm/XUZ6lz8E0OwECBrioAWEdpIxqIQRH8JRnV1YIRNHDrLRcgB1OfubqeRvOGQ
         EcC6+cnj21qpeJf3N+cza83GPTplGnoj4MXBChj0rGEaa0V7Q0OWrjmiu0EvUTHOMU49
         2NOXl+oI8VK8zD5/LvPL9bB7DK9J963HeWSvBy63LNIuPsfsLwWj/LJ59JtmbiePaQQB
         c6fytC1C938zGJp3Fm3Ld0G3aghvBMiTnVFRzb9osxjY8boHBjmEYU2uRS5r6bQW/VjC
         JEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjwzavPHuwLQhDLaeCIqve1wOTSq+fSSdSxuL6FgndY=;
        b=2vr1pzcj/bSgTWRH0t5dPvWOyxxkuncJvuPJ5ShpYP4MWfCEWocMsOX/yYSZpLDmE0
         HoQMUDqD+rdhLPp9tf9AsTF8gASgjwt1dZ8LPxld55l7RegIbhoTAQQUZSqVjAjbvvUH
         aZ9Wk8eIs6UDBsiI+1cVWvpOEDzS0qT4FM6QxYgrmIV9YDcsx4cZsbdrrmfPGWslI4BI
         08JHmVypLTl2PofVZ8RR+2oZ0I+LMGJKojCPdpjDOjdjavRL87Ek5PuSRqD2+BuT9mn2
         xX9oqNo/Wb0qNbWEYJjMzdMg1Iwwmk8La3PUbA7FFY/WfHMegHn2mAloSMCZ/lwLMQoq
         0l4g==
X-Gm-Message-State: AOAM533bkzlPt5DmE2uxw3noZmrqce12hxnt8Uof+S8nF2I7WN7NrKPC
	nF+A3LG/ODZ50PFJDkbjQxviUdLkFGQv1QZZDyoG08vg
X-Google-Smtp-Source: ABdhPJy9A1echo2ApI0kvDf5CxuPujmHL7vq/P0koavyLj8vSUfuOFNlqBbgnIjJ+0eZbsDQp/jgGkx6gs3BLPUFyrE=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr73224wrr.172.1644962752631; Tue, 15 Feb
 2022 14:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-10-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:05:41 +0000
Message-ID: <CAFEAcA-xbQadTvdYtadfxEYPG_5smfgikJJaOvf2ByjNJg_27g@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] target/arm: Implement FEAT_LVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Inmepf1qvk7C

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature is relatively small, as it applies only to
> 64k pages and thus requires no additional changes to the
> table descriptor walking algorithm, only a change to the
> minimum TSZ (which is the inverse of the maximum virtual
> address space size).
>
> Note that this feature widens VBAR_ELx, but we already
> treat the register as being 64 bits wide.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h | 2 +-
>  target/arm/cpu.h       | 5 +++++
>  target/arm/cpu64.c     | 1 +
>  target/arm/helper.c    | 9 ++++++++-
>  4 files changed, 15 insertions(+), 2 deletions(-)

Need to add FEAT_LVA to the list of emulated features in
docs/system/arm/emulation.rst.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
