Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z25sm1634632wmf.38.2019.07.03.03.50.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 03:50:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 968581FF87;
	Wed,  3 Jul 2019 11:50:15 +0100 (BST)
References: <20190703102208.10086-1-alex.bennee@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
In-reply-to: <20190703102208.10086-1-alex.bennee@linaro.org>
Date: Wed, 03 Jul 2019 11:50:15 +0100
Message-ID: <87o92bwfx4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +07yolf0uf4Y


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> M-profile has yet another way of triggering semihosting calls using
> the BKPT instruction. To support this we need to add a M-profile setup
> so we use the nice and simple microbit model which has a Cortex-M0 in
> it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
<snip>
> --- a/Makefile
> +++ b/Makefile
> @@ -40,6 +40,7 @@
>
<snip>
>
> -QEMU_BUILDDIR :=3D ~/linaro/qemu-from-laptop/qemu/build/x86
> +AV7MLINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dmicrobit.lds -Xlin=
ker --build-id=3Dnone
> +
> +QEMU_BUILDDIR :=3D ~/lsrc/qemu.git/builds/arm.all

Obviously without including my local devel hack for QEMU_BUILDDIR

--
Alex Benn=C3=A9e
