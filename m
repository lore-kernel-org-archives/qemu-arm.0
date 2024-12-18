Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad21b7sm5532071a12.36.2024.12.18.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:07:55 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DBDED5F796;
	Wed, 18 Dec 2024 17:07:53 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Radoslaw Biernacki <rad@semihalf.com>,
  qemu-stable@nongnu.org,  Andrei Homescu <ahomescu@google.com>,  Arve
 =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@google.com>,  =?utf-8?Q?R=C3=A9mi?=
 Denis-Courmont
 <remi.denis.courmont@huawei.com>
Subject: Re: [PATCH 3/3] target/arm: implement SEL2 physical and virtual timers
In-Reply-To: <CAFEAcA_AgkVcVm5nfCNb=PjB5qnYahTUuQxi-U=um92BFokccw@mail.gmail.com>
	(Peter Maydell's message of "Tue, 17 Dec 2024 13:34:49 +0000")
References: <20241206160239.3229094-1-alex.bennee@linaro.org>
	<20241206160239.3229094-4-alex.bennee@linaro.org>
	<CAFEAcA_AgkVcVm5nfCNb=PjB5qnYahTUuQxi-U=um92BFokccw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 17:07:53 +0000
Message-ID: <877c7w5386.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mgjd21V059Ia

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
>> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
>> actual implementation utilises the same logic as the rest of the
>> timers so all we need to do is:
>>
>>   - define the timers and their access functions
>>   - conditionally add the correct system registers
>>   - create a new accessfn as the rules are subtly different to the
>>     existing secure timer
>
>> diff --git a/include/hw/arm/bsa.h b/include/hw/arm/bsa.h
>> index 8eaab603c0..b4ecca1b1c 100644
>> --- a/include/hw/arm/bsa.h
>> +++ b/include/hw/arm/bsa.h
>> @@ -22,6 +22,8 @@
>>  #define QEMU_ARM_BSA_H
>>
>>  /* These are architectural INTID values */
>> +#define ARCH_TIMER_S_VIRT_EL2_IRQ  19
>
> Can we call this ARM_TIMER_S_EL2_VIRT_IRQ please?

I'm going to assume you mean ARCH_TIMER_S_EL2_VIRT_IRQ ;-)

> We currently have ARCH_TIMER_NS_EL2_VIRT_IRQ
> so we should be consistent about where in
> the name we put the "VIRT" bit.
>
>> +#define ARCH_TIMER_S_EL2_IRQ       20
>>  #define VIRTUAL_PMU_IRQ            23
>>  #define ARCH_GIC_MAINT_IRQ         25
>>  #define ARCH_TIMER_NS_EL2_IRQ      26
>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
