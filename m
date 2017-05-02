Received: by 10.25.0.198 with SMTP id 189csp516189lfa;
        Tue, 2 May 2017 15:25:00 -0700 (PDT)
X-Received: by 10.157.50.200 with SMTP id u66mr13661005otb.121.1493763900421;
        Tue, 02 May 2017 15:25:00 -0700 (PDT)
Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id b50si7170761otb.209.2017.05.02.15.25.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2017 15:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-oi0-x244.google.com with SMTP id h4so1501002oib.0;
        Tue, 02 May 2017 15:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=y/NkQjH69q9r22J/x6SP+CNMC1B6A47lKk3zdMpJKr0=;
        b=PtTk6iNMqIDH6SyBLd464QbEoR0wOMr2ap7hgEDBcvTCXkl1eTlOYD0jlTZ2mDGeq9
         teiK9yRfECGiDJmTVufTGmQbe1ZfHJNWpuquFlDOO9n0102cRb9TiEx5MLa0bbElIPO3
         K9tKpFMZGlnKLd+MNH4aAuPMc9EQsyQJkHh4n/AVgAw5ZvMU6m7hNYDyLfbH7foZxQ9s
         4g44g/3aie0SKjA2PwP+oVpVT5dPa/Mf67aTW/2hZGAB373SciF5CxK7S/oLPxPbKOhK
         8SoFprETxlGWpcB/sGM7AyJnWM7r56BxR91GuzBYRSwWmoqwSiQBpf4T3WViDKWf6Mp0
         r2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=y/NkQjH69q9r22J/x6SP+CNMC1B6A47lKk3zdMpJKr0=;
        b=Y7sNHyg1clg+iZq963O9q8CMs5Dzq8C1Y9AZ7riS3fi3iqiP2drr6ztDcjgaNtdsRT
         M2tkEGi4rPNmJ3oLmmiMdcvCkI2DrePJcPBuzYDt9NEP8vq89Q64kmyUuIdlRFrJTZHS
         3H9/Nlld15/tXluhTRqajFaANQvYP/nxYX8674yX8Eql9W/Sg7O0Br2TRkAGMcVq2omS
         1EdIdcdV6nrj9D35mYBOPeBDIOUX1dnew6ed7IjVIOJp8NttQE5eBliGOrW6FBHvkKqO
         PS8gej2YJ/iVrXZlxZtkjwSvy4bJEWNas89KOCyOkjsIjZjUAvFEEs7yNOHAkQereXe1
         23WQ==
X-Gm-Message-State: AN3rC/5+Bo6pr9R43lEqn4C733ZNJpBokz3+dXvKPulCejiDpdDjqwLY
	i/ZXC5pzV1DLjTaSY/FrLrnEg/OIZg==
X-Received: by 10.157.4.113 with SMTP id 104mr12659824otc.137.1493763899907;
 Tue, 02 May 2017 15:24:59 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.72.162 with HTTP; Tue, 2 May 2017 15:24:29 -0700 (PDT)
In-Reply-To: <1493122030-32191-6-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <1493122030-32191-6-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 2 May 2017 15:24:29 -0700
X-Google-Sender-Auth: Uzu9wKyvrR00E9Ppe8gjekbdzYA
Message-ID: <CAKmqyKMwVY_wtUnwd5HggMzxrRGKwCSyad8eWPF4FoPFSqZ38g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/13] arm: Don't clear ARM_FEATURE_PMSA for
 no-mpu configs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@xilinx.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: eZkBBGSWSR68

On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Fix the handling of QOM properties for PMSA CPUs with no MPU:
>
> Allow no-MPU to be specified by either:
>  * has-mpu = false
>  * pmsav7_dregion = 0
> and make setting one imply the other. Don't clear the PMSA
> feature bit in this situation.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/cpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f17e279..8e57498 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -757,8 +757,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_pfr1 &= ~0xf000;
>      }
>
> +    /* MPU can be configured out of a PMSA CPU either by setting has-mpu
> +     * to false or by setting pmsav7-dregion to 0.
> +     */
>      if (!cpu->has_mpu) {
> -        unset_feature(ARM_FEATURE_PMSA);
> +        cpu->pmsav7_dregion = 0;
> +    }
> +    if (cpu->pmsav7_dregion == 0) {
> +        cpu->has_mpu = false;
>      }
>
>      if (arm_feature(env, ARM_FEATURE_PMSA) &&
> --
> 2.7.4
>
>
