Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c310d00b003a2f2bb72d5sm8149292wmo.45.2022.11.30.11.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 11:12:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C4C21FFB7;
	Wed, 30 Nov 2022 19:12:46 +0000 (GMT)
References: <166982763526.10484.9925072056712598801-0@git.sr.ht>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: ~axelheider <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 daniel.thompson@linaro.org, ~axelheider <axelheider@git.sr.ht>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
Date: Wed, 30 Nov 2022 19:11:21 +0000
In-reply-to: <166982763526.10484.9925072056712598801-0@git.sr.ht>
Message-ID: <87o7socl3l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5BAkmpVTJaYG


~axelheider <axelheider@git.sr.ht> writes:

> This is a follow-up on older attempts to make a second UART
> available for the arm-virt machine in normal world. The use case
> is, that this give a simple I/O channel in addition to stdout, as this
> simplifies various test scenarios. Especially for non-Linux operating
> system,s (e.g. seL4) where arm-virt is handy as a generic machine
> for testing purposes.
>
> There are existing discussions about this topic at:
> - https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
> - https://lists.nongnu.org/archive/html/qemu-
> discuss/2018-11/msg00001.html
> - https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01613.html
>
> This patch tries to address the concerns raised there and also
> avoid breaking compatibility with existing setups.
>
> Axel Heider (1):
>   hw/arm/virt: make second UART available
>
>  hw/arm/virt-acpi-build.c | 12 ++++-----
>  hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++----------
>  include/hw/arm/virt.h    |  4 +--
>  3 files changed, 49 insertions(+), 22 deletions(-)

It would also be worth updating ./docs/system/arm/virt.rst to document
this feature.=20

--=20
Alex Benn=C3=A9e
