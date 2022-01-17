Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2015596lfj;
        Mon, 17 Jan 2022 04:21:47 -0800 (PST)
X-Received: by 2002:a5d:6e90:: with SMTP id k16mr19712642wrz.112.1642422107510;
        Mon, 17 Jan 2022 04:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642422107; cv=none;
        d=google.com; s=arc-20160816;
        b=AFRWsEz0gLDxBTjA6E+JwaapZ/zjyyQZ3M4WEZC6xc5apdaUYVv9uSoFB5+SpFEWsL
         fekdN7DfTUjDOhqx5/3i8bu/zAD+pENxP51u5iB4poQhSjNh9KMo/JOPeykuqe4zzjr9
         4jcRpjiSXFKxEhRz3ZKLUJFe+X2YKmVCppzqqwYX4h10znnipfpmzq9ZT9kdWYiEFSw8
         wtuy2yn37hoUDHaKEpXnz65VyvDrWDVfRkw8k/aBAKqn9Z9M6EcKI9d+EPeGF+g7f6lN
         tZ76GH7eb7Sis1I0a7Ffa+Vu2FAiYtsIuinotu7X+ITHDYHKwJIJk7lVX8evUGKQLCMC
         pavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=rK9Fe1fH7RSzwBZFU+10CX2jXM+Nqy46itEBsEjO1Aw=;
        b=aWl938KT0RQrnaGyMoL4I7nalNTkS391vGt2EL6iWku/uK82jAx06ExD/LVJ3TXAhr
         tb+2wOUciEbV7sIqUzw/BQMbp149fOfROFgU9PC/OXFOY11PzB2fuf61dMSJ3IM+2Niu
         eRdkVJ3ehJ3EDJzYoaEoB2ZqHJ+XsUq/ztZgaF1qxJNhl4R8Hme2irh5dqe+j3L/7Hux
         funVJJzXHpZhKR6mHoyZ/b9eAlA4QT67kzuuP6Yq8LktKuCVrMdhipdtnoV4bThuRulP
         sqsBUOsuCV/k6uUx8RjWj7AmJgmGey1wH1iIMn7e6bMjKTtQgsobmbPjHVVeybh4X1qg
         /tNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmhbTD0e;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay9sor8007439wmb.29.2022.01.17.04.21.47
        (Google Transport Security);
        Mon, 17 Jan 2022 04:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmhbTD0e;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rK9Fe1fH7RSzwBZFU+10CX2jXM+Nqy46itEBsEjO1Aw=;
        b=FmhbTD0eT+2xV4/TmGf++4f3LETUvpoQgXvSId3fErMQ9RlS5nSrYFO//cnmzFMZxo
         I99tURXQo7n048dkyS2cn6rRF6Ig3HGOOp680gaIuxIXrD6aPgQH6d7CYng2H+WPYPCw
         NzMghbjsnu7hoVlDjz1sxaFEuwSL1+gP+bP8imYE9bzjpYE9w8OytlJp80FyZ1Ck9SXg
         tgAlqjFRcG+kcCGWk7NWheHZORmOMGxJxn32uatXZ7BhemZQYSJ2dzrud3i6QqedKmfl
         MKMtWX8fexFmov3oGuANemD10pImC2TyqBwSPC8cr9dUk7JLCwbOJcwnHpQ9hfCio8Ec
         /tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rK9Fe1fH7RSzwBZFU+10CX2jXM+Nqy46itEBsEjO1Aw=;
        b=BQx0j/EE6Psz5RcOdY7j5FFahrrhGOxgxFirP3jq/wzmsHleJfbWeVsIslVZN99YOB
         53IoPJnyCn3YEIG7k9fbMR8vX8jAmMiE/1t7PTEJFl8TJIfk+2i/BZMQ5zqsg/JLfmeN
         KmgCedri10GWsAPvCmgaXiOK1qxS8pNQNnIYn03eNaOW5rBglbxC5g9tSjCcfR3NY6PO
         9zgx9lBoBNGwEW8mlbGlKbA+Rybn0umDpQ8wAnxHjogy4fUk8/Y4iLxlRhC/yNL0FoAC
         /KCHAbLxfJI9MuVrheHs+vUFo1Za6FoBzvu65Lbzy6Vg/SDinWqX8H8F1U6W/K8yPIzJ
         DMAA==
X-Gm-Message-State: AOAM531SnOCmIjNu4fq5ZM+mzLjBLXTvBYWv+ipTzwaweYdyUAJVtpTF
	4jnrgZxad5A45BN3gBJ1fGfeBJwAXk6JgyNs
X-Google-Smtp-Source: ABdhPJxE6jfL3Oggewo+M/AR9DQ1ixElG1rH6NlXoFQK6BoSp/kBkOdXy+qX+O9ZScvtHvFGDygFRg==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr26746922wmc.58.1642422106918;
        Mon, 17 Jan 2022 04:21:46 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id a24sm13186756wrc.114.2022.01.17.04.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 04:21:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <f0d75702-1ebf-f896-335f-9bbbd8dbfbfd@amsat.org>
Date: Mon, 17 Jan 2022 13:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 1/6] hw/arm: arm initial boilerplate for RP2040 SoC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110175104.2908956-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DSoe+0A1HqMZ

On 1/10/22 18:50, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configs/devices/arm-softmmu/default.mak |  1 +
>  include/hw/arm/rp2040.h                 | 32 ++++++++++
>  hw/arm/rp2040.c                         | 79 +++++++++++++++++++++++++
>  hw/arm/Kconfig                          |  3 +
>  hw/arm/meson.build                      |  1 +
>  5 files changed, 116 insertions(+)
>  create mode 100644 include/hw/arm/rp2040.h
>  create mode 100644 hw/arm/rp2040.c

> +static void rp2040_realize(DeviceState *dev, Error **errp)
> +{
> +    RP2040State *s = RP2040(dev);
> +    Object *obj = OBJECT(dev);
> +    int n;
> +
> +    for (n = 0; n < RP2040_NCPUS; n++) {
> +        Object *cpuobj = OBJECT(&s->armv7m[n]);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(cpuobj), errp)) {
> +            return;

Could we ever have the first CPU initialized and the 2nd failing?
Because the error path wouldn't be clean (leaking CPU#0). Maybe
ignore errp and use error_fatal?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        }
> +    }
> +}
