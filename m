Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id hp7sm473895ejc.144.2022.02.21.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 14:45:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ADDDE1FFB7;
	Mon, 21 Feb 2022 22:45:18 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
 <87h78sm9oo.fsf@linaro.org>
 <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Andrew Strauss
 <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Mon, 21 Feb 2022 22:45:04 +0000
In-reply-to: <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
Message-ID: <87czjfn8jl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ixw6D9MWojWu


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 21 Feb 2022 at 17:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The previous numbers were a guess at best and rather arbitrary without
>> >> taking into account anything that might be loaded. Instead of using
>> >> guesses based on the state of registers implement a new function that:
>> >>
>> >>  a) scans the MemoryRegions for the largest RAM block
>> >>  b) iterates through all "ROM" blobs looking for the biggest gap
>> >>
>> >> The "ROM" blobs include all code loaded via -kernel and the various
>> >> -device loader techniques.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Andrew Strauss <astrauss11@gmail.com>
>> >> Cc: Keith Packard <keithp@keithp.com>
>> >> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>> >>
>> >
>> >
>> >> +/*
>> >> + * Sort into address order. We break ties between rom-startpoints
>> >> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>> >> + * transition before the 1->0 transition. Either way round would
>> >> + * work, but this way saves a little work later by avoiding
>> >> + * dealing with "gaps" of 0 length.
>> >> + */
>> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> >> +{
>> >> +    RomSec *ra =3D (RomSec *) a;
>> >> +    RomSec *rb =3D (RomSec *) b;
>> >> +
>> >> +    if (ra->base =3D=3D rb->base) {
>> >> +        return ra->se - rb->se;
>> >> +    }
>> >> +    return ra->base > rb->base ? 1 : -1;
>> >> +}
>> >
>> > This sort comparator still doesn't report the equality
>> > case as actually equal.
>>
>> When ra->se and rb->se are the same it returns 0. Is that not what you w=
ant?
>
> Oops, yes it does. I misread it because I was expecting it to be
> structured differently. (AFAIK there is no "standard" way to
> structure a comparator-function that works with multiple fields,
> so the way you have it is fine.)

The other options were all ugly ;-)

--=20
Alex Benn=C3=A9e
