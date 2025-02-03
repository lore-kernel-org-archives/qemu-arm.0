Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2222898njb;
        Mon, 3 Feb 2025 08:19:04 -0800 (PST)
X-Received: by 2002:a05:6402:2803:b0:5dc:100c:1560 with SMTP id 4fb4d7f45d1cf-5dc5efc5d8fmr59821847a12.18.1738599544518;
        Mon, 03 Feb 2025 08:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738599544; cv=none;
        d=google.com; s=arc-20240605;
        b=QHeUwnKx4XS3ELrw2hpVsPyw0EAJ2hXA8jT2QAoDE8Bt9RxAtUVYJO0TX0H+xea31k
         o/bA1z16pbEgcZzitbN4Q+oPNMVChxzclJa0Ku8cufljZq4NaVo8ePVyQQaiTZ1DTcbF
         kO38gJ1GauKOy1Nt7d+LFvD0khYxa72Pc1ffTjaXWRX1sCcFbEzAiW26KHCHLxQY299e
         uQqWCVUSchMNe33SlrJLSdVENk2B954ngrv6jnoiqPQ+qh16JXB4sdUmY3wn/s+O192m
         Z5hS4X/XbrxxLUqA6xuRTANylRqA5SRrL7khOXyntbPuOXFlR//8ScpAdJTcQbadTnUR
         70sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s6JmQhWYBv/7vKIG7Kne6Qi0XIk2WkTX7JMwwDBl4qQ=;
        fh=Vc1Hgjx38P2vGWkCry98nTJDdjAjyzRuS2F2DcO8qYU=;
        b=LG96TEc1nsoIJN0ltf2XmzDhxRWJFyz07J/lzgkw1bbQ/3D4Jm5+IYc1s1i+OZL05z
         5Aki0ZWdmt6Gi4Yn2ixloN6ZflLemn7ND2CfgKa3lfDglLVfJw7MjHFIAEeVo7J67jml
         W9fmXrIpTxjQNgvnXM/M9CLH5WfpC5d16bAoeeKXDRlRuv8pdlIztBCho79tZiqIsLa+
         LXOzWF0bZCt/0ABzRccAUak6+xz2A0xymwe4YYgaq1q2CFhrZ6ytsVVolDwvEFRiQe/A
         jfOZ5oiXt+OVssgBpkukJ5Dglij2m61r8oYulvgc3C8P/AZilbpKu2wtazS4ff8O3HXo
         IIjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UErB6/x3";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5dc724ca56fsor3828355a12.10.2025.02.03.08.19.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 08:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UErB6/x3";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738599544; x=1739204344; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6JmQhWYBv/7vKIG7Kne6Qi0XIk2WkTX7JMwwDBl4qQ=;
        b=UErB6/x3jyrF44XhlheVgSbcSLA7lUnu5BYQnhy6I/piCSiCu8gDFb/n+qxsEdQIOk
         W6W9vLuVTccSTvh+D/vqJZud2eSwuj0YvW1t36zSJNdsCU5qQZlA/kAX7LQM3js0zHVQ
         2TnL6VgXNH66e6T4Qz1KPWq2N2kzZ1z4ZeTUbHIQYdxvgY1aGvC/ElKOwYo6tMfkogGH
         bjexlKy6+3QGaxxawliL2jXZhuZkcocLKw6S1nIyjGKStcl2EjaoZXgxsgW8G3gkN4qZ
         X4AvjmiT3Qyuy748abnG0RAIsdfsYAUV00OaCSxfTJYWzL+c9W5Wdw/4+AiKXIo2Tnje
         cKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599544; x=1739204344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6JmQhWYBv/7vKIG7Kne6Qi0XIk2WkTX7JMwwDBl4qQ=;
        b=M0VB0cNOfE0TpX7zQx3THwil/MSPMJDCzBYi9SYkcBtwlvmZ3Z3qXwql1k8zVJ0REM
         onMLPpEuII8NCXzpqskJLBMHbBFmhXy3DuxC/tMnrzu8z8XowvoBcHV3D+VTMkcc/qvn
         5fD8E6IsUaEodnUICRPssUwMHL+nPqCREylWg1ZkLfYQYDfa66LGD8F6yYeHRy+mJXNR
         YK9MGT6+3tS/VbRZ9gSx1faXdRU3sQ0F5Kq1GqTkhFd8Ki/Hbtqs0tKShfGh3YSWtPN+
         SdbpJB0UisRwc78N8/XFLyDP6tHtfYfSaMU2xP3AZKa4mKGuFMnp9ppQA9lQjuu2V4yh
         0YoA==
X-Gm-Message-State: AOJu0YxW36XTp01fIzqArrTEDx40fERtzw6tyjYSRUvuT/0NrFlOb556
	6YwYRzFYYhRbWJRd9c02Zm5a3gfJB4yygzF+JGUpBbxg1Fyi1LNJbXPn3I30/yAFMH7lFk5hlB6
	w2X0ftA==
X-Gm-Gg: ASbGncv+nJmjDsFNuOl+Iw/0TrbAPIdPVVyk3hPnWA2aVJY5CLf9J0M6mg4LN8jTUO+
	wyNF1pJUduzymcDoUBjobyvEkn2wqB0KCa3rKEdAcXPowITf0Ii9U+rz8RMZur9ErB7Y785iKA9
	LYTsjgm9g3tq2LBkfHIreRlbM97G4enRIV6BV6g6+A1loxgvGDksWeq/nYTSEJ5nKTVQCDbf8mf
	xGpkqv3+S2NdR1CulnwINdiLPH9eOPNQ/XzCQCBhGaDPCJp2KRLQ8xQX+pi9pjx9OoaoxNB+7+i
	wNLDKLWjJr6DG8PnfBrL8KA29SFxEEOywTwitcgUWXTAlym1ZYmayB4hcU8=
X-Google-Smtp-Source: AGHT+IEhCqGW4p/kPC3C2/4dqKJZ4Emb/N/MU063Ikqk7mo/VIRNc94Pz1I60J8gPBW3czgaDQjHZA==
X-Received: by 2002:a05:6402:13ca:b0:5db:e7eb:1b4c with SMTP id 4fb4d7f45d1cf-5dc5efbf41amr60307893a12.10.1738599543924;
        Mon, 03 Feb 2025 08:19:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf294sm777844466b.41.2025.02.03.08.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 08:19:03 -0800 (PST)
Message-ID: <7f765a75-d02d-450e-b229-3232d16871c3@linaro.org>
Date: Mon, 3 Feb 2025 17:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Jared Mauch <jared+home@puck.nether.net>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org
References: <20250201091528.1177-1-philmd@linaro.org>
 <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
 <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
 <87ed0fayoy.fsf@draig.linaro.org> <Z6DTsdf35ApQ0qLU@redhat.com>
 <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com>
 <Z6DXmN-ROswsaDAi@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6DXmN-ROswsaDAi@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /rcCjt+ftbI6

On 3/2/25 15:50, Daniel P. Berrangé wrote:
> On Mon, Feb 03, 2025 at 02:45:06PM +0000, Peter Maydell wrote:
>> On Mon, 3 Feb 2025 at 14:33, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Mon, Feb 03, 2025 at 02:29:49PM +0000, Alex Bennée wrote:
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>
>>>>> On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>>
>>>>>> On Sat, 1 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>>>> - Deprecate the 'raspi4b' machine name, renaming it as
>>>>>>>   'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
>>>>>>> - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
>>>>>>>   respectively 4GB and 8GB of DRAM.
>>>>>>
>>>>>> IMHO (meaning you can ignore it, just my opinion) if the only difference
>>>>>> is the memory size -machine raspi4b -memory 4g would be better user
>>>>>> experience than having a lot of different machines.
>>>>>
>>>>> Yes, I think I agree. We have a way for users to specify
>>>>> how much memory they want, and I think it makes more sense
>>>>> to use that than to have lots of different machine types.
>>>>
>>>> I guess for the Pi we should validate the -memory supplied is on of the
>>>> supported grid of devices rather than an arbitrary value?
>>>
>>> If the user wants to create a rpi4 with 6 GB RAM why should we stop
>>> them ? It is their choice if they want to precisely replicate RAM
>>> size from a physical model, or use something different when virtualized.
>>
>> The board revision code (reported to the guest via the emulated
>> firmware interface) only supports reporting 256MB, 512MB,
>> 1GB, 2GB, 4GB or 8GB:
>>
>> https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#new-style-revision-codes
> 
> I think it would be valid to report the revision code for the memory
> size that doesn't exceed what QEMU has configured. eg if configured
> with 6 GB, then report code for 4 GB.

We need to distinct between physical machines VS virtual ones.

Guests on virtual machines have some way to figure the virtual
hardware (ACPI tables, DeviceTree blob, fw-cfg, ...).

Guests for physical machines usually expect fixed hardware (not
considering devices on busses).

For the particular case of the Raspberry Pi machines, their
bootloader gets the board layout by reading the
RPI_FWREQ_GET_BOARD_REVISION constant value.


What would be the point of emulating a raspi machine with 6GB
if the FW is not going to consider besides 4GB?
Besides, someone modify a guest to work with 6GB, it won't work
on real HW.

>> For Arm embedded boards we mostly tend to "restrict the user
>> to what you can actually do", except for older boards where
>> we tended not to write any kind of sanity checking on CPU
>> type, memory size, etc.
> 
> If we're going to strictly limit memory size that's accepted I wonder
> how we could information users/mgmt apps about what's permitted ?
> 
> Expressing valid combinations of configs across different args gets
> pretty complicated quickly :-(

I'll try to address Zoltan and Peter request to have a dynamic raspi
machine. It is a bit unfortunate we didn't insisted on that when we
decided to expose a fixed set of existing boards in order to not be
bothered by inconsistent bug reports, back in 2019.

Regards,

Phil.
