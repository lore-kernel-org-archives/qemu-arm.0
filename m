Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x203sm59070961wmd.11.2018.02.21.08.35.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2018 08:35:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8C2CD3E019C;
	Wed, 21 Feb 2018 16:35:37 +0000 (GMT)
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-4-alex.bennee@linaro.org> <CAFEAcA-=Oh=MgSGoheP70o9dy0hgo64PBtRH5u1u51bjqUAh7A@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 03/32] target/arm/cpu64: allow fp16 to be disabled
In-reply-to: <CAFEAcA-=Oh=MgSGoheP70o9dy0hgo64PBtRH5u1u51bjqUAh7A@mail.gmail.com>
Date: Wed, 21 Feb 2018 16:35:37 +0000
Message-ID: <87lgfm9u7a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZJRuEorE9G7v


Peter Maydell <peter.maydell@linaro.org> writes:

> On 8 February 2018 at 17:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> While for CONFIG_USER_ONLY it is policy for the "cpu" to be the most
>> capable is can be this does cause problems. For example legacy RISU
>> runs would fail as there are a bunch of implemented instructions which
>> would have caused failures that now trigger actual calculations.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>>  static void aarch64_cpu_initfn(Object *obj)
>>  {
>>      object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
>> @@ -283,6 +303,13 @@ static void aarch64_cpu_initfn(Object *obj)
>>                                      "Set on/off to enable/disable aarch=
64 "
>>                                      "execution state ",
>>                                      NULL);
>> +#ifdef CONFIG_USER_ONLY
>> +    object_property_add_bool(obj, "fp16", aarch64_cpu_get_fp16,
>> +                             aarch64_cpu_set_fp16, NULL);
>> +    object_property_set_description(obj, "fp16",
>> +                                    "Set on/off to enable/disable FP16 =
extensions ",
>> +                                    NULL);
>> +#endif
>>  }
>
> Good news everybody -- this is an opportunity for a naming bikeshed
> discussion!

Everyone's favourite kind of discussion ;-)

> The property names we use here are effectively ABI because they'll
> be available to the user on the command line, so we want to get the
> right names. This is the first of these, but we can reasonably
> assume we'll have more feature switches in the future for various
> other optional instruction set extensions.
>
> There are two obvious choices here:
>  * use the architecture extension names from the Arm ARM A1.7.4
>    (in this case that's "ARMv8.2-FP16", which we could reasonably
>    abbreviate to fp16)

So since I last tested this stuff I noticed upstream broke my RISU
testing with the addition of the crypto instructions. The reason being
the RISU test set does exercise UNDEF's which get used in later revs.

However I realised I could use -cpu cortex-a57 to achieve the same thing
and avoid enabling features for later specs. Maybe it would be simpler
just to add cpu types for the baseline architecture profiles?

  -cpu armv8.0
  -cpu armv8.1
  -cpu armv8.2

Defaulting of course to the most capable CPU type for linux-user.

That said FP16 is an optional feature so it is perfectly legitimate to
have:

  -cpu armv8.2+fp16

In fact the manual goes further in allowing any v8.x+1 feature to be
snarfed into a v8.x confirming CPU.

That said *my* use case is turning features off, maybe that is enough to
expose a plain v8.0 on the command line for now until someone comes up
with a useful for case for building these franken-CPUs?

>  * use the hwcaps names that Linux defines and prints in /proc/cpuinfo
>    (in this case that would be a combination of "fphp" and "asimdhp",
>    since hwcaps reflects the ID register setup that allows a CPU
>    to report support for one and not the other)

In naming I favour the Arm ARM over whatever Linux-ism /proc came up
with.

>
> Whatever we do, we should have a comment describing our naming
> conventions, so we can follow it next time we add one of these...
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
