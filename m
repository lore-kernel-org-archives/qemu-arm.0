Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp453437lfq;
        Fri, 8 Jan 2021 04:33:03 -0800 (PST)
X-Received: by 2002:a05:6402:610:: with SMTP id n16mr5004749edv.172.1610109182994;
        Fri, 08 Jan 2021 04:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610109182; cv=none;
        d=google.com; s=arc-20160816;
        b=Lax/iubh7oT9QhDP/xHV23p60M/fnb73nMPuA0Vn+oTpl1A/yKX/zO8K7VgEu00ZFM
         BGJKyZov9CydhfxKnVKN4FzUvjxqa87No7CBJt0Y2+hMkaxFBUF+ohkwkqFAGCjqWRon
         nl8IM/T+cv8Tz31r0BJo/V7/PMtvspuh+zYOERrSGEHTwAq0eqRWBQ8aGbT/DdpGI6tr
         olTd9pifCNyyNJUZq6gk3DI1ApQgc5Rj8+aAZ0cVW0wfFzaKgLN0xVxn/M6o1HH3dz/X
         +rHvhusGK+bhgQr4ZH+FOnz8Kbi3x4B8t63GQuHyruzYvYj+5hwVry+gnV4vz//qJ5Bu
         +MVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m/b6wFjDIupbvlkZPrdivnWfIEm3/ToydQnfE+0PcQs=;
        b=pzoaUUGPU5F4DdYFXNIB1dF9szQA4bqzTKMv+WV9bdUi8gg+JI700XHs0LhqsfV/ea
         kIyZ+AwOjR3H5x/Px316ND91zXD2kmeaz1dwDAWaD97FbgLAKPGVBY1fTK1zd0e/9PuT
         dqbDXXeOyvxNioS4hNua+1BXp7RV2TS5Cfvbih++k64ItGvit7ZuMypI15M25yc3x7Pc
         0RQqIBRydPpNhVEfkwRYHLOreNGEBnzhQXuoqp3FfIOenW+tF/K5FW8E3pgy0qxyUY22
         5B4DI09n15U6S/gTkuKIsSkLTKthKI8PpLnf08uJA20zsNH7RkKMqB2ltQxpxcDnAiC+
         kQaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbP7y+UN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r21sor5812474eja.83.2021.01.08.04.33.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jan 2021 04:33:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbP7y+UN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/b6wFjDIupbvlkZPrdivnWfIEm3/ToydQnfE+0PcQs=;
        b=sbP7y+UNhg+POmULDcnPoum1OYT/C6sh/crty3KndnYnIrliusB/PmDl/ublCagdQ1
         Wmo2B7JCeIzKWU3Db7HKIkIhyS21m5QI8WJ+I5INzP02LSInjFal28vVJW/bOGJEFwyZ
         et9finAzmVb49pzzsl4h/yh5xSIxIZghEJZ4wGKeXAPei44wD2IzDP0VndKGrbkz6Lfd
         YFxLYd15HeNN45+oBA3uZFRW7icBgXKZ80WYbJPJ2jzJyE8LvGZi9THAzZAQf/WraiLp
         hMYulIwV+XYPMruiuIiw9svoJiizbyMeq5JrmdKQeHrmXFz7gm1jIcPu4kMnKXImLYCA
         JHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/b6wFjDIupbvlkZPrdivnWfIEm3/ToydQnfE+0PcQs=;
        b=XPTQ16K8urkNr+MuD72swwAvX6tvzHcv/JyBNe8SkcAaLvYw8UYuksyQWdohTzPi00
         2ybrYsF5ojNJlhrHXH/3nd5275hFiZw1TWJqfG2p/zJmb9f/5OwErFmOmRLF2FcwbKuR
         jFdE973UQdPxBLpnwml3btO4U3eluYmTmEqFGNkKvgVvWGQo8q9vA4a3KLzxcoYpLL2E
         JjVPTqLYNALQcYX8B+UvubyH+iMQUO/9o9J6XngOGP7CYFS90GzksZGTuDXxEzqFz38s
         wlSbF5jog0acZnH6/E5Cg4hYde5oQ5eYZf9KyOHldXES6gvoQ1UWpXoRxQb/yD6nT6m/
         k1gA==
X-Gm-Message-State: AOAM530y9XLW4ELe16pfIL6sMew7NrXdB9jGFzHKy03vFMPbC1af7RpI
	QqBQQxicVoNFXGdkpjWZSOBtZFQbGI36AekcrvCcBQ13
X-Google-Smtp-Source: ABdhPJwdiwLyWAAOJ20aWYX2VCXY1kCBN6OWt2ziwddP5UDIl3Y0FJIhLCzEVn1f8CAsNx1WJOpGwcsX180fT71QgWs=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5037337edw.52.1610109182722;
 Fri, 08 Jan 2021 04:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 12:32:51 +0000
Message-ID: <CAFEAcA_FdQBSQkr5z7PFnC7TzWkaA92w4Msy4bCrB2qUbXWLMA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KYqWTC46tVEy

On Wed, 6 Jan 2021 at 06:35, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
>
> At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> boot on QEMU sabrelite machine.
>
> This fixes several issues to improve emulation fidelity of the i.MX6
> sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> command shell. While we are here, add a target guide for this board
> to help people run Linux kernel and U-Boot on QEMU.
>
> Changes in v3:
> - correct 2 typos in sabrelite.rst
>
> Changes in v2:
> - new patch: add sabrelite target guide
>
> Bin Meng (4):
>   hw/misc: imx6_ccm: Update PMU_MISC0 reset value
>   hw/msic: imx6_ccm: Correct register value for silicon type
>   hw/arm: sabrelite: Connect the Ethernet PHY at address 6
>   docs/system: arm: Add sabrelite board description


Applied to target-arm.next, thanks.

-- PMM
