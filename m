Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040e7306f655sm5408490wmo.22.2024.01.15.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:45:11 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0BC495F78A;
	Mon, 15 Jan 2024 11:45:11 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Tyrone Ting <kfting@nuvoton.com>,  Hao Wu
 <wuhaotsh@google.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/qtest/npcm7xx_watchdog_timer: Only test the
 corner cases by default
In-Reply-To: <cfdbf6d2-404c-4a63-9ee6-24f3d12d8a59@redhat.com> (Thomas Huth's
	message of "Mon, 15 Jan 2024 12:36:54 +0100")
References: <20240115070223.30178-1-thuth@redhat.com>
	<87r0iikf1o.fsf@draig.linaro.org>
	<cfdbf6d2-404c-4a63-9ee6-24f3d12d8a59@redhat.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 15 Jan 2024 11:45:10 +0000
Message-ID: <87fryykegp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TsF0yX/gK4Bp

Thomas Huth <thuth@redhat.com> writes:

> On 15/01/2024 12.32, Alex Benn=C3=A9e wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> The test_prescaler() part in the npcm7xx_watchdog_timer test is quite
>>> repetive, testing all possible combinations of the WTCLK and WTIS
>>> bitfields. Since each test spins up a new instance of QEMU, this is
>>> rather an expensive test, especially on loaded host systems.
>> I'm not against the change but I do not my home machine runs these
>> tests
>> in:
>>    1/1 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test        OK
>> 0.18s   180 subtests passed
>
> That's a different test, I think. Look for "watchdog" in its name,
> please.

Ahh -ETOOMANYNPCMS...

So yes I get a drop in time by half:

  1/1 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test        O=
K             10.35s   15 subtests passed

to

  1/1 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test        O=
K              4.68s   15 subtests passed


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>> so I do wonder how the system load can cause such a dramatic increase
>> for a comparatively simple test.
>
> The watchdog test is executing a new QEMU instance for each test in
> the loop, and that can be quite expensive on a loaded system, I think.
>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
