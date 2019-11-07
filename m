Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z189sm3213392wmc.25.2019.11.07.08.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 08:57:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 324681FF87;
	Thu,  7 Nov 2019 16:57:21 +0000 (GMT)
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-3-beata.michalska@linaro.org>
 <5c75bd31-213f-88a4-2eee-0046f99f65fe@linaro.org>
 <CADSWDztHetgmbUOp4WyRAkR0daAG6kkwhUTcyKWiCTWHQ1XB=w@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Beata Michalska <beata.michalska@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 pbonzini@redhat.com, quintela@redhat.com, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, eric.auger@redhat.com,
 shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 2/4] Memory: Enable writeback for given memory region
In-reply-to: <CADSWDztHetgmbUOp4WyRAkR0daAG6kkwhUTcyKWiCTWHQ1XB=w@mail.gmail.com>
Date: Thu, 07 Nov 2019 16:57:21 +0000
Message-ID: <87lfsrhbf2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TS3bhMUU2Yc/


Beata Michalska <beata.michalska@linaro.org> writes:

> On Wed, 6 Nov 2019 at 12:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/6/19 12:40 AM, Beata Michalska wrote:
>> > +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t=
 length)
>> > +{
>> > +    void *addr =3D ramblock_ptr(block, start);
>> > +
>> > +    /*
>> > +     * The requested range might spread up to the very end of the blo=
ck
>> > +     */
>> > +    if ((start + length) > block->used_length) {
>> > +        qemu_log("%s: sync range outside the block boundaries: "
>> > +                     "start: " RAM_ADDR_FMT " length: " RAM_ADDR_FMT
>> > +                     " block length: " RAM_ADDR_FMT " Narrowing down =
..." ,
>> > +                     __func__, start, length, block->used_length);
>> > +        length =3D block->used_length - start;
>> > +    }
>>
>> qemu_log_mask w/ GUEST_ERROR?  How do we expect the length to overflow?
>
> In theory it shouldn't, at least with current usage.
> I guess the probe_access will make sure of that.
> This was more of a precaution to enable catching potential/future misuses
> aka debugging purpose. I can get rid of that it that's playing too
> safe.

If the internal code might get it wrong and that would be a bug then the
g_assert(), if the values are ultimately from the guest then log with
GUEST_ERROR as Richard suggests.

<snip>

--
Alex Benn=C3=A9e
