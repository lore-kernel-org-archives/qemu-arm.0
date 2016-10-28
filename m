Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l19sm7893833wmg.5.2016.10.28.02.17.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Oct 2016 02:17:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 068EE3E01C6;
	Fri, 28 Oct 2016 10:17:09 +0100 (BST)
References: <20161027151030.20863-1-alex.bennee@linaro.org> <20161027151030.20863-31-alex.bennee@linaro.org> <fa288bec-8178-590a-db42-abb4c6986db4@twiddle.net> <87bmy498bg.fsf@linaro.org> <CAFEAcA9Nrm9P=RHti1L_HkSvG1PkoOypbJ82Jgo_bLV7Cdy_WQ@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.1.50.12
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini
 <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, MTTCG
 Devel <mttcg@greensocs.com>, KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?=
 <fred.konrad@greensocs.com>, Alvise Rigo <a.rigo@virtualopensystems.com>,
 "Emilio G. Cota" <cota@braap.org>, Pranith Kumar <bobby.prani@gmail.com>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Mark Burton
 <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@siemens.com>, Fedorov
 Sergey <serge.fdrv@gmail.com>, Claudio Fontana
 <claudio.fontana@huawei.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v5 30/33] target-arm/cpu: don't reset TLB structures, use cputlb to do it
In-reply-to: <CAFEAcA9Nrm9P=RHti1L_HkSvG1PkoOypbJ82Jgo_bLV7Cdy_WQ@mail.gmail.com>
Date: Fri, 28 Oct 2016 10:17:08 +0100
Message-ID: <87a8do96jv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: UjjIqimnIyUl


Peter Maydell <peter.maydell@linaro.org> writes:

> On 28 October 2016 at 09:38, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Richard Henderson <rth@twiddle.net> writes:
>>> And don't we (or if not, shouldn't we)
>>> handle the tlb_flush generically for reset?
>>
>> Probably. tlb_flush seems to be one of those things liberally sprinkled
>> in the arch code for all sorts of things but certainly cpu_reset is one
>> we could make the call from generic code.
>
> I think the theory I formed last time I looked at it is that
> if your CPU has no state which would require you to flush the
> TLB when it changes, then there's no need to flush the TLB
> on reset -- any entries still in the TLB from before reset are
> still valid after reset. For ARM a CPU reset will reset state
> like the ASID and the MMU-enabled bit which require a TLB flush
> on change, so we have to call tlb_flush here.
>
> You could argue that the set of CPUs which don't require a
> tlb flush on reset are not worth trying to optimise for
> like this and we should just do it generically.

Well it can't harm anyone. It would just mean all CPUs whatever their
semantics would have to re-fill the TLBs after a reset. I guess that
might be a concern for reset latency under TCG but I doubt anyone would
notice.

--
Alex Bennée
