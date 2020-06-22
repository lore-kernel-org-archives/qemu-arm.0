Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a15sm19106868wrh.54.2020.06.22.01.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:57:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AC2171FF7E;
	Mon, 22 Jun 2020 09:57:31 +0100 (BST)
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: qemu-arm@nongnu.org
Subject: Re: Role of qemu-arm
In-reply-to: <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
Date: Mon, 22 Jun 2020 09:57:31 +0100
Message-ID: <87o8pba35w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vrfjLDPaOtaL


vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:

> Hello,
>
>     I am using qemu for doing simulations of code, and currently find
> qemu-system-arm convienient.
>
>     But, I cannot understand how to use qemu-arm. In fact, what I am
> searching for is a way of simulating only the ARM core, not any
> peripherals.

There are two modes:

  - system emulation (CPU + board and peripherals)
  - linux-user (CPU but with a Linux syscall interface)

> I can work with qemu-system-arm, and could not find a way
> to use qemu-arm.

If you are installing via your distros package manager you probably want
a package called qemu-user. You can build the only the user-mode
packages by issuing --disable-system to the configure script.

The closest thing to being a "pure" just the CPU is probably a
standalone usermode binary that uses semihosting calls rather than a
libc/syscall interface.

>
>     Would anyone have any pointers to a documentation or a tutorial
> using this tool ?
>
>     Best regards,
>
>         Vincent.


--=20
Alex Benn=C3=A9e
