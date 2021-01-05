Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i18sm97400899wrp.74.2021.01.05.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:22:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1EB201FF7E;
	Tue,  5 Jan 2021 09:22:53 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2 2/4] hw/msic: imx6_ccm: Correct register value for
 silicon type
Date: Tue, 05 Jan 2021 09:22:47 +0000
In-reply-to: <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87r1mz3fgy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: A8y0CCNu8JbI


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Currently when U-Boot boots, it prints "??" for i.MX processor:
>
>   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>
> The register that was used to determine the silicon type is
> undocumented in the latest IMX6DQRM (Rev. 6, 05/2020), but we
> can refer to get_cpu_rev() in arch/arm/mach-imx/mx6/soc.c in
> the U-Boot source codes that USB_ANALOG_DIGPROG is used.
>
> Update its reset value to indicate i.MX6Q.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
