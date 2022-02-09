Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u4sm5414462ejn.216.2022.02.09.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:26:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E88CC1FFB7;
	Wed,  9 Feb 2022 17:26:06 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 09 Feb 2022 17:25:29 +0000
In-reply-to: <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
Message-ID: <87o83gdk9d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cQYF7gXdSYDi


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This allows us to check our new SYS_HEAPINFO implementation generates
>> sane values.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>>
>> diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/sys=
tem/semiheap.c
>> new file mode 100644
>> index 0000000000..d5613dca59
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/system/semiheap.c
>> @@ -0,0 +1,74 @@
>> +/*
>> + * Semihosting System HEAPINFO Test
>> + *
>> + * Copyright (c) 2021 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <inttypes.h>
>> +#include <stddef.h>
>> +#include <minilib.h>
>> +
>> +#define SYS_HEAPINFO    0x16
>> +
>> +uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
>> +{
>> +    register uintptr_t t asm("x0") =3D type;
>> +    register uintptr_t a0 asm("x1") =3D arg0;
>> +    asm("hlt 0xf000"
>> +        : "=3Dr" (t)
>> +        : "r" (t), "r" (a0));
>
> You should include "memory" in the clobbers list here, or the compiler
> has license to assume that the semihosting call doesn't actually
> write to the struct info.
>
>> +
>> +    return t;
>> +}
>> +
>> +int main(int argc, char *argv[argc])
>> +{
>> +    struct {
>> +        void *heap_base;
>> +        void *heap_limit;
>> +        void *stack_base;
>> +        void *stack_limit;
>> +    } info;
>> +    void *ptr_to_info =3D (void *) &info;
>> +
>> +    ml_printf("Semihosting Heap Info Test\n");
>> +
>> +    /* memset(&info, 0, sizeof(info)); */
>
> Why is this here but commented out ? (If you want to zero initialize
> the struct, using "=3D { }" when you define it above is simpler.)
>
>> +    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
>> +
>> +    if (info.heap_base =3D=3D NULL || info.heap_limit =3D=3D NULL) {
>> +        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_li=
mit);
>> +        return -1;
>> +    }
>> +
>> +    /* Error if heap base is above limit */
>> +    if ((uintptr_t) info.heap_base >=3D (uintptr_t) info.heap_limit) {
>> +        ml_printf("heap base %p >=3D heap_limit %p\n",
>> +               info.heap_base, info.heap_limit);
>> +        return -2;
>> +    }
>> +
>> +    if (info.stack_base =3D=3D NULL) {
>> +        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack=
_limit);
>> +        return -3;
>> +    }
>> +
>> +    /*
>> +     * We don't check our local variables are inside the reported
>> +     * stack because the runtime may select a different stack area (as
>> +     * our boot.S code does). However we can check we don't clash with
>> +     * the heap.
>> +     */
>> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
>> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
>> +               ptr_to_info, info.heap_base, info.heap_limit);
>
> I'm not sure this test is valid -- the 'struct info' is on our stack,
> so it could be anywhere in RAM, including possibly in the big
> range we got back from SYS_HEAPINFO.

It should be in this case because boot.S sets stack to be inside out
data segment.

>
> You could if you liked check that for instance the address of 'main'
> is not inside the heap (assuming that you load this test case with
> the ELF loader, it should be in a rom blob and thus excluded from
> the heap range.)
>
>> +        return -4;
>> +    }
>> +
>> +    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
>> +    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
>> +    ml_printf("Passed HeapInfo checks\n");
>> +    return 0;
>> +}
>
> It would also be useful to check that you can write to the memory and
> read back the value written (ie that we have not been given
> back a range that's read-only or which is not backed by anything).
> (You might need to jump through a hoop or two to check where your
> current stack is before potentially stomping on it...)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
