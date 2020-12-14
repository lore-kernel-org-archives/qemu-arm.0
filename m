Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u10sm28839144wmd.43.2020.12.14.03.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:24:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 285731FF7E;
	Mon, 14 Dec 2020 11:24:30 +0000 (GMT)
References: <20201125213617.2496935-1-keithp@keithp.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier
 <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Mon, 14 Dec 2020 11:24:23 +0000
In-reply-to: <20201125213617.2496935-1-keithp@keithp.com>
Message-ID: <873608vde9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mnVOxMyqQ8gd


Keith Packard <keithp@keithp.com> writes:

> This series adds support for RISC-V Semihosting, version 0.2 as
> specified here:
>
> 	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> This specification references the ARM semihosting release 2.0 as specifie=
d here:
>
> 	https://static.docs.arm.com/100863/0200/semihosting.pdf
>
> That specification includes several semihosting calls which were not
> previously implemented. This series includes implementations for the
> remaining calls so that both RISC-V and ARM versions are now complete.
>
> Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
> branch:
>
> 	https://github.com/picolibc/picolibc/tree/semihost-2.0-all
>
> These tests uncovered a bug in the SYS_HEAPINFO implementation for
> ARM, which has been fixed in this series as well.
>
> The series is structured as follows:
>
>  1. Move shared semihosting files
>  2. Change public common semihosting APIs
>  3. Change internal semihosting interfaces
>  4. Fix SYS_HEAPINFO crash on ARM
>  5. Add RISC-V semihosting implementation
>  6-8. Add missing semihosting operations from release 2.0
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
