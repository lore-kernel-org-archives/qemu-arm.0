Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2446363njb;
        Mon, 3 Feb 2025 15:20:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoxazZ+Gh5WlplewYjtxOo2nfkp36kDCZapa8MIxgMe9b9oWvyG8Mz5nEzitBOaoQDL9kUn3qQz7CuMw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLo8zkRYg4i0rtx1gKBX41wtXo1+KexBffguP0FI9+C7sgH9VDfUNrW2rbc9fWN9JHPh7n
X-Received: by 2002:a5d:47c8:0:b0:38b:e32a:10ab with SMTP id ffacd0b85a97d-38c51934f02mr16264015f8f.9.1738624808942;
        Mon, 03 Feb 2025 15:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738624808; cv=none;
        d=google.com; s=arc-20240605;
        b=Uvkh5uBLuWdhvT4vox6T6ZCJfWiZ3f5WWgXkSVhByH2EuzWIg7Zam8poDWcWrUelBt
         X+cjwhVRzYKHnbchkwgZjooR6OrK3kNqoT2ezYeN8BbqI+orZu2QcWGzYcq34ntgouCo
         mqCk7aotbxI5ajGmjRuASKlj8fdBBHN7MJRpPwLIu6IpjZ/66nDux+WVmIdHxdc2pYNg
         KOyAR0/qMLw8iZn+LyIWDYlTspteGkSqAyIaOm8/Ek36zq4SQYopyZmqN8V8cAgiXFhO
         ZTpEh9c9MWN5naONE+NgOz/M/tbiR3nmcI0ZN+/ZSvKLmhWKeoRT3Ix9m/WOWJH2Xw3A
         LGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=XOZbURGqTdtTcXQlh2phGp7R1cs7X/ODep7twv1rrhQ=;
        fh=ihM5l46MEyAbhHaGH2Dxn8CQES9WbIwYsd12DAlwR3c=;
        b=fxZ5XpOc97VJycY+Kn+mlbB0PY3c3npDy9pevSUOCYRb/wQRrlwnzir4NGZdlw2bi7
         Xu0JJvcQsZvfCgvzx8G/qfis4rQxu4iQNprwDOwcqvc8z/zJh7PtJwqwpDz1cU5jeMyA
         i0aWOtlCC7zius0ZE19G2MXzMqYsaYMq7HSe7Zm7rWeXM84hgly0GFiABfS149b1iQYg
         WH+jHloaQpFYiTzLpPIuYJIgtkT+ua+uAHYmdEpnP0TbwrBC4n21MFXYmEpxlxijLhfB
         Tm+XdcGGwMc/bn5diDh0PUH4pRwOIsW2A27v/9oIsfDqzIXQwsGUu19y2WSvwZyKVhDX
         4mHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [2001:738:2001:2001::2001])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-438e245fe52si78928685e9.177.2025.02.03.15.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) client-ip=2001:738:2001:2001::2001;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id ED7554E6010;
	Tue, 04 Feb 2025 00:20:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id pKSBRQrVEwqf; Tue,  4 Feb 2025 00:20:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id ACE834E600E; Tue, 04 Feb 2025 00:20:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id A7CB574577D;
	Tue, 04 Feb 2025 00:20:05 +0100 (CET)
Date: Tue, 4 Feb 2025 00:20:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>, 
    qemu-arm@nongnu.org, devel@lists.libvirt.org
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of
 DRAM
In-Reply-To: <7f765a75-d02d-450e-b229-3232d16871c3@linaro.org>
Message-ID: <816f46cb-ad10-e5bc-1ba1-45cf991c0347@eik.bme.hu>
References: <20250201091528.1177-1-philmd@linaro.org> <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu> <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com> <87ed0fayoy.fsf@draig.linaro.org> <Z6DTsdf35ApQ0qLU@redhat.com>
 <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com> <Z6DXmN-ROswsaDAi@redhat.com> <7f765a75-d02d-450e-b229-3232d16871c3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-441919731-1738624805=:61971"
X-TUID: rKFD1bUbGPBJ

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-441919731-1738624805=:61971
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 3 Feb 2025, Philippe Mathieu-Daudé wrote:
> On 3/2/25 15:50, Daniel P. Berrangé wrote:
>> On Mon, Feb 03, 2025 at 02:45:06PM +0000, Peter Maydell wrote:
>>> On Mon, 3 Feb 2025 at 14:33, Daniel P. Berrangé <berrange@redhat.com> 
>>> wrote:
>>>> 
>>>> On Mon, Feb 03, 2025 at 02:29:49PM +0000, Alex Bennée wrote:
>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>> 
>>>>>> On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>>> 
>>>>>>> On Sat, 1 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>>>>> - Deprecate the 'raspi4b' machine name, renaming it as
>>>>>>>>   'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
>>>>>>>> - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
>>>>>>>>   respectively 4GB and 8GB of DRAM.
>>>>>>> 
>>>>>>> IMHO (meaning you can ignore it, just my opinion) if the only 
>>>>>>> difference
>>>>>>> is the memory size -machine raspi4b -memory 4g would be better user
>>>>>>> experience than having a lot of different machines.
>>>>>> 
>>>>>> Yes, I think I agree. We have a way for users to specify
>>>>>> how much memory they want, and I think it makes more sense
>>>>>> to use that than to have lots of different machine types.
>>>>> 
>>>>> I guess for the Pi we should validate the -memory supplied is on of the
>>>>> supported grid of devices rather than an arbitrary value?
>>>> 
>>>> If the user wants to create a rpi4 with 6 GB RAM why should we stop
>>>> them ? It is their choice if they want to precisely replicate RAM
>>>> size from a physical model, or use something different when virtualized.
>>> 
>>> The board revision code (reported to the guest via the emulated
>>> firmware interface) only supports reporting 256MB, 512MB,
>>> 1GB, 2GB, 4GB or 8GB:
>>> 
>>> https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#new-style-revision-codes
>> 
>> I think it would be valid to report the revision code for the memory
>> size that doesn't exceed what QEMU has configured. eg if configured
>> with 6 GB, then report code for 4 GB.
>
> We need to distinct between physical machines VS virtual ones.
>
> Guests on virtual machines have some way to figure the virtual
> hardware (ACPI tables, DeviceTree blob, fw-cfg, ...).
>
> Guests for physical machines usually expect fixed hardware (not
> considering devices on busses).
>
> For the particular case of the Raspberry Pi machines, their
> bootloader gets the board layout by reading the
> RPI_FWREQ_GET_BOARD_REVISION constant value.
>
>
> What would be the point of emulating a raspi machine with 6GB
> if the FW is not going to consider besides 4GB?
> Besides, someone modify a guest to work with 6GB, it won't work
> on real HW.

Usually the point of such non-standard configs would be running Linux via 
-kernel which could use whatever is configured if it has a way to detect 
it or maybe for memory it could even be specified on the kernel command 
line. But maybe this is not a common enough config to support so reporting 
error for memory size that's not on the list of valid sizes might be 
enough. This is similar to qemu-system-ppc -machine sam460ex which has a 
memory controller register that can only describe existing DIMM sizes. 
Originally I allowed users to specify whatever memory size and only warn 
for sizes not matching a DIMM size because Linux only looks at the device 
tree which QEMU can generate when booting with -kernel so it works but the 
firmware detects RAM from the SPD data and can only support certain sizes 
so only less RAM that could be convered with SPD data would be visible for 
guests. But then others thought it's better to return error for such cases 
and changed it and removed the support for arbitrary memory size so now it 
returns error when non power of 2 memory size is specified.

Regards,
BALATON Zoltan

>>> For Arm embedded boards we mostly tend to "restrict the user
>>> to what you can actually do", except for older boards where
>>> we tended not to write any kind of sanity checking on CPU
>>> type, memory size, etc.
>> 
>> If we're going to strictly limit memory size that's accepted I wonder
>> how we could information users/mgmt apps about what's permitted ?
>> 
>> Expressing valid combinations of configs across different args gets
>> pretty complicated quickly :-(
>
> I'll try to address Zoltan and Peter request to have a dynamic raspi
> machine. It is a bit unfortunate we didn't insisted on that when we
> decided to expose a fixed set of existing boards in order to not be
> bothered by inconsistent bug reports, back in 2019.
>
> Regards,
>
> Phil.
>
>
--3866299591-441919731-1738624805=:61971--
