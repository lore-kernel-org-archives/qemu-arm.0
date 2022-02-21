Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c6sm5234970ejs.130.2022.02.21.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 07:43:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 227971FFB7;
	Mon, 21 Feb 2022 15:43:55 +0000 (GMT)
References: <20220221140750.514557-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <f4bug@amsat.org>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH] hw/input/tsc210x: Don't abort on bad SPI word widths
Date: Mon, 21 Feb 2022 15:43:50 +0000
In-reply-to: <20220221140750.514557-1-peter.maydell@linaro.org>
Message-ID: <87sfscmdhg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WCdO+PyjDI0l


Peter Maydell <peter.maydell@linaro.org> writes:

> The tsc210x doesn't support anything other than 16-bit reads on the
> SPI bus, but the guest can program the SPI controller to attempt
> them anyway. If this happens, don't abort QEMU, just log this as
> a guest error.
>
> This fixes our machine_arm_n8x0.py:N8x0Machine.test_n800
> acceptance test, which hits this assertion.
>
> The reason we hit the assertion is because the guest kernel thinks
> there is a TSC2005 on this SPI bus address, not a TSC210x.  (The n810
> *does* have a TSC2005 at this address.) The TSC2005 supports the
> 24-bit accesses which the guest driver makes, and the TSC210x does
> not (that is, our TSC210x emulation is not missing support for a word
> width the hardware can handle).  It's not clear whether the problem
> here is that the guest kernel incorrectly thinks the n800 has the
> same device at this SPI bus address as the n810, or that QEMU's n810
> board model doesn't get the SPI devices right.  At this late date
> there no longer appears to be any reliable information on the web
> about the hardware behaviour, but I am inclined to think this is a
> guest kernel bug.  In any case, we prefer not to abort QEMU for
> guest-triggerable conditions, so logging the error is the right thing
> to do.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/736
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
