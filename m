Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003cfa80443a0sm1677446wmc.35.2022.11.17.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:57:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8DED81FFB7;
	Thu, 17 Nov 2022 16:57:19 +0000 (GMT)
References: <20221117111628.911686-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
Date: Thu, 17 Nov 2022 16:57:14 +0000
In-reply-to: <20221117111628.911686-1-peter.maydell@linaro.org>
Message-ID: <871qq18qog.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: s73wQVlGq211


Peter Maydell <peter.maydell@linaro.org> writes:

> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
>
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout
> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.
>
> Push the timeout up to 720s so that the test definitely has
> enough time to complete.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/avocado/boot_linux.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 571d33882ae..32adae6ff6a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
>      :avocado: tags=3Dmachine:virt
>      :avocado: tags=3Dmachine:gic-version=3D2
>      """
> -    timeout =3D 240
> +    timeout =3D 720
>=20=20
>      def add_common_args(self):
>          self.vm.add_args('-bios',

Queued to for-7.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
