Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a22sm1893612wme.19.2021.11.23.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 10:28:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7CC541FF96;
	Tue, 23 Nov 2021 18:28:19 +0000 (GMT)
References: <20211123171031.975367-1-peter.maydell@linaro.org>
 <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
Date: Tue, 23 Nov 2021 18:27:56 +0000
In-reply-to: <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
Message-ID: <87k0gyg20s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fXVFBiSWTbNg


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Nov 2021 at 17:10, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
>> new highest priority pending LPI after changing the requested LPI
>> pending bit.  However the overall highest priority pending interrupt
>> information won't be updated unless we call gicv3_redist_update().
>> We do that from the callsite in gicv3-redist_process_lpi(), but not
>> from the callsite in icc_activate_irq().  The effect is that when the
>> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
>> pending in the data structure but still leave it in cs->hppi so will
>> offer it to the guest again.
>>
>> The effect is that if we are using an emulated GICv3 and ITS and
>> using devices which use LPIs (ie PCI devices) then Linux will
>> complain "irq 54: nobody cared" and then hang (probably because the
>> stale bogus interrupt info meant we never tried to deliver some other
>> real interrupt).
>
> Hmm; this is definitely a bug, but maybe it's not the cause of
> the symptoms listed above -- I've just seen them again even
> with this fix. I'll keep digging...

Hmm interesting - does this affect the kvm-unit-tests for GICv3?

>
> -- PMM


--=20
Alex Benn=C3=A9e
