Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904084e7sm173320705e9.6.2025.01.21.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:19:59 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 845935F937;
	Tue, 21 Jan 2025 10:19:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-devel@nongnu.org,  Tyrone Ting <kfting@nuvoton.com>,  Fabiano Rosas
 <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
In-Reply-To: <CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com>
	(Hao Wu's message of "Tue, 21 Jan 2025 07:52:22 +0800")
References: <20250120150049.3611864-1-alex.bennee@linaro.org>
	<CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 21 Jan 2025 10:19:58 +0000
Message-ID: <87ed0wpiy9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sYEX4Qyht3rD

Hao Wu <wuhaotsh@google.com> writes:

> Have you tried that the test can pass with this? If I remember correctly,=
 interrupt won't trigger properly if not advancing the
> timer

Yes but the IRQ has yet to be enabled at this point.

>
> If the test passes it's probably fine to remove that.

Of course.

>
> On Mon, Jan 20, 2025 at 11:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
>
>  Until there are timers enabled the semantics of clock_step_next() will
>  fail. Since d524441a36 (system/qtest: properly feedback results of
>  clock_[step|set]) we will signal a FAIL if time doesn't advance.
>
>  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  ---
>   tests/qtest/npcm7xx_timer-test.c | 1 -
>   1 file changed, 1 deletion(-)
>
>  diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_time=
r-test.c
>  index 58f58c2f71..43711049ca 100644
>  --- a/tests/qtest/npcm7xx_timer-test.c
>  +++ b/tests/qtest/npcm7xx_timer-test.c
>  @@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer te=
st_data)
>       int i;
>
>       tim_reset(td);
>  -    clock_step_next();
>
>       tim_write_ticr(td, count);
>       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
>  --=20
>  2.39.5

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
