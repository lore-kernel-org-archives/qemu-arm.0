Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 138sm1029274wms.20.2016.12.05.09.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 09:04:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4988E3E019C;
	Mon,  5 Dec 2016 17:04:45 +0000 (GMT)
References: <20161202173454.19179-1-alex.bennee@linaro.org> <8737i21vl8.fsf@linaro.org> <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
User-agent: mu4e 0.9.18; emacs 25.1.90.2
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: stefanha@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, cota@braap.org, "open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
In-reply-to: <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
Date: Mon, 05 Dec 2016 17:04:45 +0000
Message-ID: <87twaiz4r6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Y8AvyvhcF7Wq


Richard Henderson <rth@twiddle.net> writes:

> On 12/05/2016 03:09 AM, Alex Bennée wrote:
>>
>> Alex Bennée <alex.bennee@linaro.org> writes:
>>
>>> While testing rth's latest TCG patches with risu I found ldaxp was
>>> broken. Investigating further I found it was broken by 1dd089d0 when
>>> the cmpxchg atomic work was merged.
>>
>> CC'ing Paolo/Richard
>>
>> Do you guys have any final TCG fixes planned for 2.8 that can take this
>> fix for the ldaxp regression?
>
> I don't have any pending patchs for 2.8, no.
>
>>> As part of that change the code
>>> attempted to be clever by doing a single 64 bit load and then shuffle
>>> the data around to set the two 32 bit registers.
>
> It's not trying to be "clever", it's trying to be correct, giving an atomic
> 64-bit load.

Ahh right I see. What happens if the backend is 32bit, will it issue two
loads anyway?

>
> The fact that we didn't attempt an atomic 128-bit load here for the 64-bit pair
> is a bug.  We have support for that in helper_atomic_ldo_le_mmu; I'm not sure
> why I didn't use that here.
>
>>> As I couldn't quite follow the endian magic I've simply partially
>>> reverted the change to the original code gen_load_exclusive code. This
>>> doesn't affect the cmpxchg functionality as that is all done on in
>>> gen_store_exclusive part which is untouched.
>
> We'll have to fix it properly eventually.  But perhaps 2.9 is soon enough,
> since that's when mttcg will go in.

I guess the easiest way would be to punt these paired loads to a helper?

However regardless of the atomicity the actual values loaded into
the registers are wrong so that behaviour is a regression vs 2.7.

I don't know how often these load-exclusive paired operations are used
in real code but I think we should at least fix it so the values are
loaded properly for 2.8 and do the proper atomic fix for 2.9.

>
>
> r~


--
Alex Bennée
