Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t7-20020adff047000000b0022e57e66824sm2298574wro.99.2022.11.11.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:00:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F1E481FFB7;
	Fri, 11 Nov 2022 14:00:01 +0000 (GMT)
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
 <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
 <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Date: Fri, 11 Nov 2022 13:58:04 +0000
In-reply-to: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
Message-ID: <87mt8xd21q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rpXZN6OdKy3/


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 31/10/22 14:03, Peter Maydell wrote:
>> On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
>>>
>>> On 4/10/22 16:54, Peter Maydell wrote:
>>>> On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>>
>>>>>
>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>>> The MSC is in the address map like most other stuff, and thus there =
is
>>>>>> no restriction on whether it can be accessed by other things than CP=
Us
>>>>>> (DMAing to it would be silly but is perfectly possible).
>>>>>>
>>>>>> The intent of the code is "pass this transaction through, but force
>>>>>> it to be Secure/NonSecure regardless of what it was before". That
>>>>>> should not involve a change of the requester type.
>>>>>
>>>>> Should we assert (or warn) when the requester_type is unspecified?
>>>>
>>>> Not in the design of MemTxAttrs that's currently in git, no:
>>>> in that design it's perfectly fine for something generating
>>>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
>>>> to meaning a bunch of things including "not secure").
>>>
>>> In tz_mpc_handle_block():
>>>
>>> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
>>> attrs)
>>> {
>>>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
>>>       if (!s->int_stat) {
>>>
>>>           s->int_info1 =3D addr;
>>>           s->int_info2 =3D 0;
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>>>                                     attrs.requester_id & 0xffff);
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>>>                                     ~attrs.secure);
>>>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>>>                                     tz_mpc_cfg_ns(s, addr));
>>>
>>>
>>> Should we check whether the requester is MTRT_CPU?
>> That code is basically assuming that the requester_id is the AMBA
>> AHB
>> 'HMASTER' field (i.e. something hopefully unique to all things that
>> send out transactions, not necessarily limited only to CPUs), which is a
>> somewhat bogus assumption given that it isn't currently any such thing...
>> I'm not sure if/how this patchset plans to model generic "ID of
>> transaction
>> generator".
>
> Does your 'generic "ID of transaction generator"' fit into
> MTRT_MACHINE described as "for more complex encoding":
>
>   'MACHINE indicates a machine specific encoding which needs further
>    processing to decode into its constituent parts.'
>
> ?

Yes - I've just done something similar to model the IOAPIC on x86.
Currently that uses a magic number of requester_id that is unique to the
"machine bus" but it could multiplex multiple bits of data on more
complex topologies.

I'll post v5 soon now I have x86 working.

--=20
Alex Benn=C3=A9e
