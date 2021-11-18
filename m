Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l124sm10048418wml.8.2021.11.18.10.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:51:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 002051FF96;
	Thu, 18 Nov 2021 18:51:27 +0000 (GMT)
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <CAFEAcA8+U-9OKYhGSm57dip-AhKpJq3AN7+aHoW9+b7NmTPaOA@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
Subject: Re: DSB does not seem to wait for TLBI completion
Date: Thu, 18 Nov 2021 18:50:32 +0000
In-reply-to: <CAFEAcA8+U-9OKYhGSm57dip-AhKpJq3AN7+aHoW9+b7NmTPaOA@mail.gmail.com>
Message-ID: <87bl2huwk0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UpBG0OGOjcKR


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 18 Nov 2021 at 15:46, Idan Horowitz <idan.horowitz@gmail.com> wro=
te:
>>
>> Hey, I'm running a bare-metal image on QEMU 6.1 and I've encountered the=
 following scenario:
>> After receiving a data abort and mapping in the correct page I try to in=
validate the corresponding TLB entry using the following assembly sequence:
>>
>> dsb ish
>> tlbi vaae1is, x0
>> dsb sy
>
> Do you have a repro case you can give us ?
> Does your setup involve SMP, or is this all on a single CPU ?

I had started on writing an explicit test case for all of this in:

  https://github.com/stsquad/kvm-unit-tests/blob/712eb3a287df24cdeff00ef966=
d68aef6ff2b8eb/arm/tlbflush-data.c

but it's been a while and I need to debug what I was thinking when I
wrote it. However if we can get a test case for kvm-unit-tests that
would be great.

>
>> Unfortunately this does not seem to have any immediate effect, as
>> upon returning back to the source of the exception I immediately hit
>> the same Data Abort. This cycle of receiving a Data Abort and then
>> updating the mapping continues for 100s of times, until the TLB
>> finally updates to the correct mapping.
>
> Note that the architecture says that the DSB will guarantee the
> TLB maintenance operation to be finished for *other* processors,
> but that if you want to guarantee it to be finished for the
> processor which executed the TLBI then you must do a DSB followed
> by a "context synchronization event", eg a ISB insn, or return
> from exception. (See the v8 Arm ARM DDI0487G.b page D5-2833.)
> It sounds from your description as if a return-from-exception
> is done on the CPU that executed the TLBI, though...
>
> -- PMM


--=20
Alex Benn=C3=A9e
