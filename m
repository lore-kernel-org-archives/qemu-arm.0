Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc17e278bsm4443919f8f.48.2025.02.07.10.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:29:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C224E5F76B;
	Fri,  7 Feb 2025 18:29:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>,  Florian Lugou
 <florian.lugou@provenrun.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
In-Reply-To: <5ee77b8c-e6a4-421b-b729-a6535fdf1e6d@linaro.org> (Richard
	Henderson's message of "Fri, 7 Feb 2025 09:22:17 -0800")
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
	<CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
	<20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
	<CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
	<20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401>
	<CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
	<20240820113024.53tmzejw2omm6bbx@flugou-latitude5401>
	<CAFEAcA9X0w5QW2qnnhF2k72ZrS8SALWiXV7uNr1e=jQnZvrQ7Q@mail.gmail.com>
	<CAFEAcA-MrouAPdwpsyojMC-bx4aFtuL=tYZD=2pBS1vP5iicaw@mail.gmail.com>
	<5ee77b8c-e6a4-421b-b729-a6535fdf1e6d@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 07 Feb 2025 18:29:27 +0000
Message-ID: <87a5axr4l4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v4vvZ02GuyFe

Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/7/25 07:45, Peter Maydell wrote:
>> This is where things go wrong -- icount_start_warp_timer()
>> notices that all CPU threads are currently idle, and
>> decides it needs to warp the timer forwards to the
>> next deadline, which is at the end of time -- INT64_MAX.
>> But once timer_mod_ns() returns, the generic timer code
>> is going to raise an interrupt (this goes through the GIC
>> code and comes back into the CPU which calls cpu_interrupt()),
>> so we don't want to warp the timer at all. The clock should
>> stay exactly at the value it has and the CPU is going to
>> have more work to do.
>> How is this supposed to work? Shouldn't we only be doing
>> the "start moving the icount forward to the next deadline"
>> once we've completed all the "run timers and AIO stuff" that
>> icount_handle_deadline() triggers, not randomly in the middle
>> of that when this timer callback or some other one might do
>> something to trigger an interrupt?
>
> I don't understand timer warping at all.  And you're right, it doesn't
> seem like this should happen outside of a specific point in the main
> loop.

This has come up before - and the conclusion was we don't know what
sleep=3Don/off is meant to mean. If the processor is asleep and there are
no timers to fire then nothing will happen.

It was off-list though:

  Subject: Re: qemu-system-aarch64 & icount behavior
  Date: Wed, 22 Jul 2020 at 11:21
  From: Kumar Gala <kumar.gala@linaro.org>
  Subject: Fwd: qemu-system-aarch64 & icount behavior
  Message-ID: <CAFEAcA9DnBQFnOc1HJav2DyLwsQu+YYE5RyZp5wrLxyc1gZqOQ@mail.gma=
il.com>
  Date: Fri, 24 Jul 2020 17:25:51 +0100
  From: Peter Maydell <peter.maydell@linaro.org>

>> ... But I don't think there's any reason why
>> timer callbacks should be obliged to reprogram their timers
>> last, and in any case you can imagine scenarios where there
>> are multiple timer callbacks for different timers and it's
>> only the second timer that raises an interrupt...
>
> Agreed.
>
>
> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
