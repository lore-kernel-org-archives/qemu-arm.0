Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c459300b0040e42391a12sm15483372wmo.13.2024.01.15.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:32:36 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A906E5F756;
	Mon, 15 Jan 2024 11:32:35 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Tyrone Ting <kfting@nuvoton.com>,  Hao Wu
 <wuhaotsh@google.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/qtest/npcm7xx_watchdog_timer: Only test the
 corner cases by default
In-Reply-To: <20240115070223.30178-1-thuth@redhat.com> (Thomas Huth's message
	of "Mon, 15 Jan 2024 08:02:23 +0100")
References: <20240115070223.30178-1-thuth@redhat.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 15 Jan 2024 11:32:35 +0000
Message-ID: <87r0iikf1o.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QmCYdQAir9vL

Thomas Huth <thuth@redhat.com> writes:

> The test_prescaler() part in the npcm7xx_watchdog_timer test is quite
> repetive, testing all possible combinations of the WTCLK and WTIS
> bitfields. Since each test spins up a new instance of QEMU, this is
> rather an expensive test, especially on loaded host systems.

I'm not against the change but I do not my home machine runs these tests
in:

  1/1 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test        OK        =
      0.18s   180 subtests passed

so I do wonder how the system load can cause such a dramatic increase
for a comparatively simple test.

> For the normal quick test mode, it should be sufficient to test the
> corner settings of these fields (i.e. 0 and 3), so we can speed up
> this test in the default mode quite a bit.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/npcm7xx_watchdog_timer-test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm=
7xx_watchdog_timer-test.c
> index 4773a673b2..981b853c99 100644
> --- a/tests/qtest/npcm7xx_watchdog_timer-test.c
> +++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
> @@ -172,9 +172,10 @@ static void test_reset_action(gconstpointer watchdog)
>  static void test_prescaler(gconstpointer watchdog)
>  {
>      const Watchdog *wd =3D watchdog;
> +    int inc =3D g_test_quick() ? 3 : 1;
>=20=20
> -    for (int wtclk =3D 0; wtclk < 4; ++wtclk) {
> -        for (int wtis =3D 0; wtis < 4; ++wtis) {
> +    for (int wtclk =3D 0; wtclk < 4; wtclk +=3D inc) {
> +        for (int wtis =3D 0; wtis < 4; wtis +=3D inc) {
>              QTestState *qts =3D qtest_init("-machine quanta-gsj");
>=20=20
>              qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
