Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y200sm6246933wmc.20.2020.03.11.06.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:58:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 037BD1FF7E;
	Wed, 11 Mar 2020 13:58:59 +0000 (GMT)
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-13-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v7 12/18] hw/arm/allwinner: add RTC device support
In-reply-to: <20200310213203.18730-13-nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 13:58:59 +0000
Message-ID: <878sk7gfh8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iYO/Qf/vzZTv


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> Allwinner System-on-Chips usually contain a Real Time Clock (RTC)
> for non-volatile system date and time keeping. This commit adds a generic
> Allwinner RTC device that supports the RTC devices found in Allwinner SoC
> family sun4i (A10), sun7i (A20) and sun6i and newer (A31, H2+, H3, etc).
> The following RTC functionality and features are implemented:
>
>  * Year-Month-Day read/write
>  * Hour-Minute-Second read/write
>  * General Purpose storage
>
> The following boards are extended with the RTC device:
>
>  * Cubieboard (hw/arm/cubieboard.c)
>  * Orange Pi PC (hw/arm/orangepi.c)
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
