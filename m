Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z2sm3009676wmf.45.2020.11.04.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:54:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4F0551FF7E;
	Wed,  4 Nov 2020 16:54:53 +0000 (GMT)
References: <20201103104710.27150-1-alex.bennee@linaro.org>
 <20201103112339.GP1664@vanye>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Leif Lindholm <leif@nuviainc.com>
Cc: qemu-devel@nongnu.org, Graeme Gregory <graeme@nuviainc.com>, Hongbo
 Zhang <hongbo.zhang@linaro.org>, Shashi Mallela
 <shashi.mallela@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] docs: add some notes on the sbsa-ref machine
In-reply-to: <20201103112339.GP1664@vanye>
Date: Wed, 04 Nov 2020 16:54:53 +0000
Message-ID: <87sg9pawpu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /i+PwCckPJlD


Leif Lindholm <leif@nuviainc.com> writes:

> On Tue, Nov 03, 2020 at 10:47:10 +0000, Alex Benn=C3=A9e wrote:
>> We should at least document what this machine is about.
>
> Thanks!
> (comments below)
>
>> Cc: Graeme Gregory <graeme@nuviainc.com>
>> Cc: Leif Lindholm <leif@nuviainc.com>
>> Cc: Hongbo Zhang <hongbo.zhang@linaro.org>
>> Cc: Shashi Mallela <shashi.mallela@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/system/arm/sbsa.rst   | 30 ++++++++++++++++++++++++++++++
>>  docs/system/target-arm.rst |  1 +
>>  2 files changed, 31 insertions(+)
>>  create mode 100644 docs/system/arm/sbsa.rst
>>=20
>> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
>> new file mode 100644
>> index 0000000000..a47c9360de
>> --- /dev/null
>> +++ b/docs/system/arm/sbsa.rst
>> @@ -0,0 +1,30 @@
>> +Arm Server Base System Architecture Reference board (``sbsa-ref``)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +While the `virt` board is a generic board platform that doesn't match
>> +any real hardware the `sbsa-ref` board intends to look like real
>> +hardware. The `Server Base System Architecture
>> +<https://developer.arm.com/documentation/den0029/latest>` defines a
>> +minimum base line of hardware support and importantly how the firmware
>> +reports that to any operating system. It is a static system that
>> +reports a very minimal DT to the firmware for command line input to
>> +the firmware.
>
> I think you mean the right thing, but ...
> "a very minimal DT to the firmware for non-discoverable information
>  about components affected by the qemu command line"
>  (i.e. cpus and memory)
>
>> As a result it must have a firmware specifically built
>> +to expect a certain hardware layout (as you would in a real machine).
>> +
>> +It is intended to be a machine for developing firmware and testing
>> +standards compliance with operating systems.
>> +
>> +Supported devices
>> +"""""""""""""""""
>> +
>> +The sbsa-ref board supports:
>> +
>> +  - A configurable number of Cortex-A57 cpus
>> +  - GIC version 3
>
> The intent was always for sbsa-ref to be tracking SBSA development, so
> I wonder whether we should be documenting specific versions of cpu and
> gic (and then keep remembering to update the docs).
> My short-term plan was to swap the a57 for "max", but
> documentation-wise, could we just say "number of aarch64 cpus"?
> Could we refer to the gic as "latest supported emulated"?

I'm not sure we want a movable feast... shouldn't we at least provide
compatibility for older variations? -cpu max is useful but you can get
new features coming out of the blue.

--=20
Alex Benn=C3=A9e
