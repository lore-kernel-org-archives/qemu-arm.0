Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id qw28sm5064900ejb.0.2022.02.09.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 10:15:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 49F3B1FFB7;
	Wed,  9 Feb 2022 18:15:31 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org>
 <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 09 Feb 2022 18:14:41 +0000
In-reply-to: <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
Message-ID: <87k0e3ewjg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tkK4IcPu5kt5


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> This allows us to check our new SYS_HEAPINFO implementation generates
>> >> sane values.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> ---
>> >>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++=
++
>> >>  1 file changed, 74 insertions(+)
>> >>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>> >> +    /*
>> >> +     * We don't check our local variables are inside the reported
>> >> +     * stack because the runtime may select a different stack area (=
as
>> >> +     * our boot.S code does). However we can check we don't clash wi=
th
>> >> +     * the heap.
>> >> +     */
>> >> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limi=
t) {
>> >> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n=
",
>> >> +               ptr_to_info, info.heap_base, info.heap_limit);
>> >
>> > I'm not sure this test is valid -- the 'struct info' is on our stack,
>> > so it could be anywhere in RAM, including possibly in the big
>> > range we got back from SYS_HEAPINFO.
>>
>> It should be in this case because boot.S sets stack to be inside out
>> data segment.
>
> So what you mean is
>
>  /*
>   * boot.S put our stack somewhere inside the text segment of the
>   * ELF file, and we know that SYS_HEAPINFO won't pick a range
>   * that overlaps with part of a loaded ELF file. So the info
>   * struct (on the stack) should not be inside the reported heap.
>   */
>
> ?

Well the data segment (but not the bss). So as long as the ELF loader
includes that in the calculation (which it should I think) then we are
ok.

>
> -- PMM


--=20
Alex Benn=C3=A9e
