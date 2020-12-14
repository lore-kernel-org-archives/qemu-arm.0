Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h5sm33111170wrp.56.2020.12.14.02.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 02:42:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3BFE01FF7E;
	Mon, 14 Dec 2020 10:42:34 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org, Bin Meng
 <bin.meng@windriver.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/3] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Date: Mon, 14 Dec 2020 10:40:43 +0000
In-reply-to: <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
Message-ID: <878sa0vfc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: M/uln4hd6Wlb


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present, when booting U-Boot on QEMU sabrelite, we see:
>
>   Net:   Board Net Initialization Failed
>   No ethernet found.
>
> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> board, the Ethernet PHY is at address 6. Adjust this by updating the
> "fec-phy-num" property of the fsl_imx6 SoC object.
>
> With this change, U-Boot sees the PHY but complains MAC address:
>
>   Net:   using phy at 6
>   FEC [PRIME]
>   Error: FEC address not set.
>
> This is due to U-Boot tries to read the MAC address from the fuse,
> which QEMU does not have any valid content filled in. However this
> does not prevent the Ethernet from working in QEMU. We just need to
> set up the MAC address later in the U-Boot command shell, by:
>
>   =3D> setenv ethaddr 00:11:22:33:44:55
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

As you are giving this board some attention is there any chance you
could be persuaded to add an entry in docs/system/arm (linked from
docs/system/target-arm.rst) to briefly describe the board and what is
known to work and boot on it?

--=20
Alex Benn=C3=A9e
