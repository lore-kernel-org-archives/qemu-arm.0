Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id h17-20020adff191000000b0022cd0c8c696sm12207965wro.103.2022.10.04.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:33:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B48E1FFBA;
	Tue,  4 Oct 2022 14:33:21 +0100 (BST)
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Date: Tue, 04 Oct 2022 14:32:12 +0100
In-reply-to: <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
Message-ID: <87r0znlnmm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: w5ONV2JCDyAu


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 28 Sept 2022 at 17:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/27/22 07:14, Alex Benn=C3=A9e wrote:
>> > --- a/hw/misc/tz-msc.c
>> > +++ b/hw/misc/tz-msc.c
>> > @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwa=
ddr addr, uint64_t *pdata,
>> >           return MEMTX_OK;
>> >       case MSCAllowSecure:
>> >           attrs.secure =3D 1;
>> > -        attrs.unspecified =3D 0;
>> > +        attrs.requester_type =3D MTRT_CPU;
>> >           break;
>> >       case MSCAllowNonSecure:
>> >           attrs.secure =3D 0;
>> > -        attrs.unspecified =3D 0;
>> > +        attrs.requester_type =3D MTRT_CPU;
>> >           break;
>>
>> This is surely incomplete.  You can't just set "cpu" without saying wher=
e it's from.
>>
>> Since this device is only used by the ARMSSE machine, I would hope that =
attrs.unspecified
>> should never be set before the patch, and thus MTRT_CPU should be set af=
terward.
>
> The MSC is in the address map like most other stuff, and thus there is
> no restriction on whether it can be accessed by other things than CPUs
> (DMAing to it would be silly but is perfectly possible).
>
> The intent of the code is "pass this transaction through, but force
> it to be Secure/NonSecure regardless of what it was before". That
> should not involve a change of the requester type.

Should we assert (or warn) when the requester_type is unspecified?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
