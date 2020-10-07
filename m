Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l3sm2179504wmh.27.2020.10.07.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 04:00:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 19FDD1FF7E;
	Wed,  7 Oct 2020 12:00:50 +0100 (BST)
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org>
 <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
 <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Schneider <74cmonty@gmail.com>
Cc: Paul Zimmerman <pauldzim@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com>
Date: Wed, 07 Oct 2020 12:00:50 +0100
Message-ID: <87blhe1esd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lFRBoiMqtjGb


Thomas Schneider <74cmonty@gmail.com> writes:

> Hi,
>
> I already considered the host CPU power.
> However I have this=20
> <https://ark.intel.com/content/www/us/en/ark/products/33924/intel-core-2-=
quad-processor-q9550-12m-cache-2-83-ghz-1333-mhz-fsb.html>=20
> CPU
> Intel Core 2 Quad Q9550 2,83 GHz
> and assumed this should be powerful enough for RPi emulation.

For each emulated instruction you can be running between 6-10 host
instructions on average. We have certainly improved the performance of
the emulation over time and take advantage of multiple threads but in
the end system emulation will always be fairly expensive.

> But maybe my assumption was too optimistic.

You can use perf to record your boot and analyse where QEMU is spending
it's time. Unless there is a major outlier though it's unlikely to be
easy to optimise.

>
>
> Am 07.10.2020 um 08:50 schrieb Paul Zimmerman:
>> On Tue, Oct 6, 2020 at 11:28 PM Thomas <74cmonty@gmail.com> wrote:
>>> Hello!
>>>
>>> Many thanks for your support.
>>>
>>> I managed to get emulated RPi starting.
>>>
>>> However there's one question I want to ask:
>>> How can I accelerate the startup sequence?
>>> I mean booting the emulated RPi takes more than 3 minutes.
>>>
>>> Regards
>>> Thomas
>> Get a faster computer? ;)
>>
>> On my Intel i7 desktop it takes about 40 seconds to boot to the login:
>> prompt on the serial console, and about 1 min 8 seconds before the
>> GUI is up. On my 5 year old laptop it's probably twice that. I don't know
>> of any way to make it go faster.
>>
>> - Paul
>>
>>> Am 06.10.20 um 11:58 schrieb Alex Benn=C3=A9e:
>>>> Thomas Schneider <74cmonty@gmail.com> writes:
>>>>
>>>>> Hello Paul,
>>>>>
>>>>> many thanks for sharing this info.
>>>>>
>>>>> Can you confirm that the emulated RPi with your command will use
>>>>> "internal QEMU" network, means the client cannot be accessed from any
>>>>> other device in LAN?
>>>> The support for user-mode and TAP networking is orthogonal to the
>>>> emulated device. However if you only want a few ports it's quite easy =
to
>>>> use port forwarding, e.g:
>>>>
>>>>    -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22
>>>>
>>>> which forwards 2222 to port 22 on the device. I have an alias in
>>>> .ssh/config for accessing my QEMU devices.
>>>>
>>>>> If yes, what is required to setup a TAP connected to host's network
>>>>> bridge?
>>>> I'll defer to others for this but generally when I want proper bridged
>>>> networking for a VM I use virt-manager/libvirt to configure it because
>>>> it can be quite fiddly to do by hand.
>>>>


--=20
Alex Benn=C3=A9e
