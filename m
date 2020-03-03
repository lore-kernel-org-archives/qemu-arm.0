Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c14sm17655649wro.36.2020.03.03.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 02:53:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 867D31FF87;
	Tue,  3 Mar 2020 10:53:32 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-2-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 01/18] hw/arm: add Allwinner H3 System-on-Chip
In-reply-to: <20200301215029.15196-2-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 10:53:32 +0000
Message-ID: <87v9nl7lqr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 76T+oB8Fw1j4


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> processor cores. Features and specifications include DDR2/DDR3 memory,
> SD/MMC storage cards, 10/100/1000Mbit Ethernet, USB 2.0, HDMI and
> various I/O modules. This commit adds support for the Allwinner H3
> System on Chip.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
