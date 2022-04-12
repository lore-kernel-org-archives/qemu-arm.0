Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l10-20020a170906938a00b006e88c811016sm2891249ejx.145.2022.04.12.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 04:20:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6B28D1FFB7;
	Tue, 12 Apr 2022 12:20:47 +0100 (BST)
References: <20220412104519.201655-1-alex.bennee@linaro.org>
 <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
Date: Tue, 12 Apr 2022 12:19:56 +0100
In-reply-to: <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
Message-ID: <87o816zgxc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I2AmYh6D7u4Y


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 12 Apr 2022 at 11:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> When accessing HW via the gdbstub we can't easily figure out what the
>> cpu_index is. The canonical case is current_cpu but for some cases
>> that will be NULL. For debug accesses we can overload requester_id and
>> make the GIC a bit smarter about fishing that out.
>>
>> [AJB: very much a PoC hack for now but interested if this makes sense.
>> We could encode cpu_index in another field but that would grow
>> MxTxAttrs even more.]
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> ---
>>  include/exec/memattrs.h |  2 +-
>>  hw/core/cpu-sysemu.c    | 15 +++++++++++----
>>  hw/intc/arm_gic.c       | 33 +++++++++++++++++++--------------
>>  3 files changed, 31 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 9fb98bc1ef..1333a34cb3 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -43,7 +43,7 @@ typedef struct MemTxAttrs {
>>       * (see MEMTX_ACCESS_ERROR).
>>       */
>>      unsigned int memory:1;
>> -    /* Requester ID (for MSI for example) */
>> +    /* Requester ID (for MSI for example) or cpu_index for debug */
>>      unsigned int requester_id:16;
>
> If we want to provide a requester ID for memory transactions we
> should provide it always, not just for debug. That way gic_get_current_cp=
u()
> and similar code can unconditionally use requester_id and never needs
> to look at current_cpu. (We would also need to figure out how we want
> to parcel out requester_ids in the system, so that PCI requester IDs
> don't clash with CPU requester IDs.)

We could have a requester_type field (0 for CPU, 1 for PCI for now)?

>
> -- PMM


--=20
Alex Benn=C3=A9e
