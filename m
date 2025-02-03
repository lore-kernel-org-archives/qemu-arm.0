Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6edd6acf5sm697886266b.25.2025.02.03.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:29:50 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8B0CC5F8BF;
	Mon,  3 Feb 2025 14:29:49 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  Jared Mauch
 <jared+home@puck.nether.net>,  qemu-arm@nongnu.org,
  devel@lists.libvirt.org
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
In-Reply-To: <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
	(Peter Maydell's message of "Sat, 1 Feb 2025 13:51:21 +0000")
References: <20250201091528.1177-1-philmd@linaro.org>
	<90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
	<CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 03 Feb 2025 14:29:49 +0000
Message-ID: <87ed0fayoy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hd7MZkm8bu/k

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sat, 1 Feb 2025, Philippe Mathieu-Daud=C3=A9 wrote:
>> > - Deprecate the 'raspi4b' machine name, renaming it as
>> >  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
>> > - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
>> >  respectively 4GB and 8GB of DRAM.
>>
>> IMHO (meaning you can ignore it, just my opinion) if the only difference
>> is the memory size -machine raspi4b -memory 4g would be better user
>> experience than having a lot of different machines.
>
> Yes, I think I agree. We have a way for users to specify
> how much memory they want, and I think it makes more sense
> to use that than to have lots of different machine types.

I guess for the Pi we should validate the -memory supplied is on of the
supported grid of devices rather than an arbitrary value?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
