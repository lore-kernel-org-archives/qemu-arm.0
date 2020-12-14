Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p15sm22151900wrt.15.2020.12.14.02.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 02:24:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0358E1FF7E;
	Mon, 14 Dec 2020 10:24:56 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org, Bin Meng
 <bin.meng@windriver.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/3] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
Date: Mon, 14 Dec 2020 10:23:54 +0000
In-reply-to: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87eejsvg5k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2rmgFjtRS1lV


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> boot on QEMU sabrelite machine.

Are there any public build artefacts for u-boot on saberlite that could
be used for an acceptance test?

> This fixes several issues to improve emulation fidelity of the i.MX6
> sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> command shell.
>
>
> Bin Meng (3):
>   hw/misc: imx6_ccm: Update PMU_MISC0 reset value
>   hw/msic: imx6_ccm: Correct register value for silicon type
>   hw/arm: sabrelite: Connect the Ethernet PHY at address 6
>
>  hw/arm/sabrelite.c | 4 ++++
>  hw/misc/imx6_ccm.c | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)


--=20
Alex Benn=C3=A9e
