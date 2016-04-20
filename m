Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f204sm11221677wmf.22.2016.04.20.12.51.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 12:51:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E35AD3E0323;
	Wed, 20 Apr 2016 20:51:12 +0100 (BST)
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org> <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org> <87k2jsv0pv.fsf@linaro.org> <57179B80.9050800@twiddle.net> <87ega0uolz.fsf@linaro.org> <5717D130.8090100@twiddle.net>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
In-reply-to: <5717D130.8090100@twiddle.net>
Date: Wed, 20 Apr 2016 20:51:12 +0100
Message-ID: <878u08uki7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: KOI+R8XBEyLV


Richard Henderson <rth@twiddle.net> writes:

> On 04/20/2016 11:22 AM, Alex Bennée wrote:
>>
>> Richard Henderson <rth@twiddle.net> writes:
>>
>>> On 04/20/2016 07:01 AM, Alex Bennée wrote:
>>>>
>>>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>>>
>>>>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>>>>
>>>>> Ensure direct jump patching in AArch64 is atomic by using
>>>>> atomic_read()/atomic_set() for code patching.
>>>>>
>>>>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>>>>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>>>>> ---
>>>>>    tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
>>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
>>>>> index 0ed10a974121..15fdebec921f 100644
>>>>> --- a/tcg/aarch64/tcg-target.inc.c
>>>>> +++ b/tcg/aarch64/tcg-target.inc.c
>>>>> @@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>>>>        *code_ptr = deposit32(*code_ptr, 0, 26, offset);
>>>>>    }
>>>>>
>>>>> +static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
>>>>> +                                     tcg_insn_unit *target)
>>>>> +{
>>>>> +    ptrdiff_t offset = target - code_ptr;
>>>>> +    tcg_insn_unit insn;
>>>>> +    assert(offset == sextract64(offset, 0, 26));
>>>>> +    /* read instruction, mask away previous PC_REL26 parameter contents,
>>>>> +       set the proper offset, then write back the instruction. */
>>>>
>>>> This comment could be moved from here and reloc_pc26 and made common for
>>>> the two following functions.
>>>
>>> There's a significant amount of cleanup that ought to happen here, now that
>>> we're not re-translating TBs.  I don't know if Sergey should be gated
>>> on that.
>>
>> Is this stuff already in the works? Otherwise we are trying to get
>> pre-cursors to MTTCG into the code (once the tree re-opens) to keep the
>> main diff down. This also is beneficial for linux-user stuff.
>
> We're talking past one another.
>
> No, it's not yet in the works.  I'm saying that this patch set should not wait
> for it.  Thus I don't care if what he adds here is a little messy; we'll clean
> it all up at once later.  Thus don't bother refactoring reloc_pc26 and
> reloc_pc26_atomic.

Ahh OK, cool ;-)

>
>
> r~


--
Alex Bennée
