Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r1sm7343933wrx.11.2020.02.27.04.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 04:19:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A5F5F1FF87;
	Thu, 27 Feb 2020 12:19:43 +0000 (GMT)
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
 <CAPan3WqTdC9+Vc3SvUEs+KUW7Ow-MuyJ0PewUH6aPNs44LdJsg@mail.gmail.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, Richard Henderson
 <rth@twiddle.net>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
In-reply-to: <CAPan3WqTdC9+Vc3SvUEs+KUW7Ow-MuyJ0PewUH6aPNs44LdJsg@mail.gmail.com>
Date: Thu, 27 Feb 2020 12:19:43 +0000
Message-ID: <87tv3cw7c0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NWSrvk65TOkM


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> Hi Alex,
>
> On Wed, Feb 26, 2020 at 7:13 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>> While 32mb is certainly usable a full system boot ends up flushing the
>> codegen buffer nearly 100 times. Increase the default on 64 bit hosts
>> to take advantage of all that spare memory. After this change I can
>> boot my tests system without any TB flushes.
>>
>
> That great, with this change I'm seeing a performance improvement when
> running the avocado tests for cubieboard.
> It runs about 4-5 seconds faster. My host is Ubuntu 18.04 on 64-bit.
>
> I don't know much about the internals of TCG nor how it actually uses the
> cache,
> but it seems logical to me that increasing the cache size would improve
> performance.
>
> What I'm wondering is: will this also result in TCG translating larger
> chunks in one shot, so potentially
> taking more time to do the translation? If so, could it perhaps affect mo=
re
> latency sensitive code?

No - the size of the translation blocks is governed by the guest code
and where it ends a basic block. In system mode we also care about
crossing guest page boundaries.

>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
>
>> ---
>>  accel/tcg/translate-all.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 4ce5d1b3931..f7baa512059 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -929,7 +929,11 @@ static void page_lock_pair(PageDesc **ret_p1,
>> tb_page_addr_t phys1,
>>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>>  #endif
>>
>> +#if TCG_TARGET_REG_BITS =3D=3D 32
>>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>> +#else
>> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2 * GiB)
>> +#endif
>>
>
> The qemu process now takes up more virtual memory, about ~2.5GiB in my
> test, which can be expected with this change.
>
> Is it very likely that the TCG cache will be filled quickly and completel=
y?
> I'm asking because I also use Qemu to do automated testing
> where the nodes are 64-bit but each have only 2GiB physical RAM.

Well so this is the interesting question and as ever it depends.

For system emulation the buffer will just slowly fill-up over time until
exhausted and which point it will flush and reset. Each time the guest
needs to flush a page and load fresh code in we will generate more
translated code. If the guest isn't under load and never uses all it's
RAM for code then in theory the pages of the mmap that are never filled
never need to be actualised by the host kernel.

You can view the behaviour by running "info jit" from the HMP monitor in
your tests. The "TB Flush" value shows the number of times this has
happened along with other information about translation state.

>
> Regards,
> Niek
>
>
>>
>>  #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>>    (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
>> --
>> 2.20.1
>>
>>
>>


--=20
Alex Benn=C3=A9e
