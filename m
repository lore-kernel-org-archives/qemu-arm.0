Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z6sm20615438wjv.41.2016.06.06.07.52.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 07:52:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id EDA133E02BF;
	Mon,  6 Jun 2016 15:52:33 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 01/10] lib: xstr: allow multiple args
In-reply-to: <20160606121239.paubfta2c74epgfk@hawk.localdomain>
Date: Mon, 06 Jun 2016 15:52:33 +0100
Message-ID: <878tyiid3i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: RIbt4255H6Km


Andrew Jones <drjones@redhat.com> writes:

> On Mon, Jun 06, 2016 at 11:49:09AM +0100, Alex Bennée wrote:
>>
>> Andrew Jones <drjones@redhat.com> writes:
>>
>> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>> > ---
>> >  lib/libcflat.h | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/lib/libcflat.h b/lib/libcflat.h
>> > index 582e3fc60e287..e5e588c742763 100644
>> > --- a/lib/libcflat.h
>> > +++ b/lib/libcflat.h
>> > @@ -27,8 +27,8 @@
>> >
>> >  #define __unused __attribute__((__unused__))
>> >
>> > -#define xstr(s) xxstr(s)
>> > -#define xxstr(s) #s
>> > +#define xstr(s...) xxstr(s)
>> > +#define xxstr(s...) #s
>>
>> OK my knowledge of stringinfication is still rusty despite having read
>> the QEMU softmmu code. However:
>>
>>                 printf("Unknown subtest:" xstr(foo,ba) "\n");
>>
>> Yields:
>>
>>                 Unknown subtestfoo,ba
>>
>> Is that what you wanted? Or were you aiming for xstr(foo,ba) => fooba
>
> The way I did it (which is like Linux) is what I wanted, see Linux's
> version in include/linux/stringify.h. I can correct $SUBJECT to make
> that more clear if you like.

Linux seems to have multiple local definitions of these stringyfy
operations so it is a little unclear. Any additional clarity in $SUBJECT
is welcome ;-)

>
> Thanks,
> drew
>
>
>
>>
>> As an aside I couldn't actually see xstr being called with multiple
>> arguments in the source tree.
>>
>> >
>> >  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
>> >  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
>>
>>
>> --
>> Alex Bennée
>> --
>> To unsubscribe from this list: send the line "unsubscribe kvm" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
Alex Bennée
