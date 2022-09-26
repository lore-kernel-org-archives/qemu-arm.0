Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d52cb000000b0022a293ab1e9sm15289166wrv.11.2022.09.26.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:24:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 738FC1FFB7;
	Mon, 26 Sep 2022 16:24:50 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
 <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Date: Mon, 26 Sep 2022 16:09:56 +0100
In-reply-to: <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
Message-ID: <87h70u40ql.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5wm++w5+va1y


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> We currently have hacks across the hw/ to reference current_cpu to
>> work out what the current accessing CPU is. This breaks in some cases
>> including using gdbstub to access HW state. As we have MemTxAttrs to
>> describe details about the access lets extend it to mention if this is
>> a CPU access and which one it is.
>>
>> There are a number of places we need to fix up including:
>>
>>   CPU helpers directly calling address_space_*() fns
>>   models in hw/ fishing the data out of current_cpu
>>   hypervisors offloading device emulation to QEMU
>>
>> I'll start addressing some of these in following patches.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - use separate field cpu_index
>>   - bool for requester_is_cpu
>> v3
>>   - switch to enum MemTxRequesterType
>>   - move helper #define to patch
>>   - revert to overloading requester_id
>>   - mention hypervisors in commit message
>>   - drop cputlb tweaks, they will move to target specific code
>
> I still don't see anything in this patchset that updates
> the code which currently assumes requester_id to be a PCI
> index to check that it hasn't been handed a MemTxAttrs
> that uses requester_id as a CPU number.

OK I'll update so all the existing cases setting requester_id also set
the type to MEMTXATTRS_MSI.

I also noticed the GIC ITS code checks requester ID. Should we assert
(or hw_error?) if it's not the case?

> I also still need to go and look up how hardware does this,
> so please don't queue this patchset yet. In particular, we
> should think about whether we want this to be:
>  * a CPU number, but only set opt-in by some target archs

Given a whole bunch of arches currently use MEMTXATTRS_UNSPECIFIED I
think for now it's worth confining to just ARM where we know we have
devices that care about the cpu_index and have tagged the various paths
with the correct data.

>  * a CPU number, valid for all target archs
>  * a unique-within-the-machine identifier of the transaction
>    master (i.e. which can be set by DMA controllers, etc,
>    not just CPUs)

That would require something to keep a map of requester_id's to
source/index right?

> I would also like some input from Edgar since I know Xilinx
> have some more extensive out-of-tree uses of requester_id.
> We aren't obligated to not break out-of-tree code, but that
> seems like a bunch of experience and knowledge about how
> real hardware works that would be useful for informing
> how we design this.

His comment against the last iteration was:

"CPU's can also have a Master-IDs (Requester IDs) which are unrelated to
the Clusters CPU index. This is used for example in the Xilinx ZynqMP
and Xilinx Versal and the XMPU (Memory Protection Units).

Anyway, I think this approach is an improvement from the current state
but would rather see a new separate field from requester_id. Overloading
requester_id will break some of our use-cases (in the Xilinx tree)...

IIRC a real GIC differentiates between the connected CPU's through
different ports, not by looking at master-ids but I'm not 100% sure..."

at the same time Richard's not keen about adding extra fields
(especially as some arches have INT32_MAX bounds for cpu_index). However
one approach would be to expand the requester_id field and you could
then expand MemTxRequesterType to and have a multiplexed type although I
admit it's hard to imagine HW that cares about both the CPU and bus id
at the same time.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
