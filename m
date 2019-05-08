Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u11sm33738623wrg.35.2019.05.08.10.45.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 10:45:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 300701FF87;
	Wed,  8 May 2019 18:45:22 +0100 (BST)
References: <20190430165234.32272-1-alex.bennee@linaro.org> <20190430165234.32272-4-alex.bennee@linaro.org> <83e4f91b-a590-2a2a-bf5f-14b99c5aa0fc@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Subject: Re: [Qemu-devel] [PATCH v5 03/15] tests/tcg/aarch64: add system boot.S
In-reply-to: <83e4f91b-a590-2a2a-bf5f-14b99c5aa0fc@linaro.org>
Date: Wed, 08 May 2019 18:45:22 +0100
Message-ID: <87sgto4z7x.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Y1EVmGSvBLam


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/30/19 9:52 AM, Alex Benn=C3=A9e wrote:
>> +.error:
>> +	.string "Terminated by exception.\n"
>
> Put it in .rodata just because we can?
>
>> +        /* Page table setup (identity mapping).  */
>> +	adrp	x0, ttb
>> +	add	x0, x0, :lo12:ttb
>
> You are in control of the layout of the executable,
> and adr has a 1MB range.  Why use adrp+add?

Well I have to now as I've aligned .data with:

    /* align r/w section to next 2mb */
    . =3D ALIGN(1 << 21);

>
>> +        /* Create some (big) pages */
>> +	adr	x1, .				/* phys address */
>> +	bic	x1, x1, #(1 << 30) - 1		/* 1GB block alignment */
>
> Do you really want 1GB pages?  You'll pretty much only be able to test va=
lid
> memory operations with that.  Which is also true until there's something =
other
> than an exit for the exception vector... but ya know what I mean.

Not using it for testing but I'm trying to set-up a 2 stage translation
so we get:

  1gb->1gb+2mb =3D .text/.rodata
  1gb+2mb->1gb+4mb =3D .data/.bss

>
>> +        /* Setup some stack space and enter the test code.
>> +         * Assume everthing except the return value is garbage when we
>> +	 * return, we won't need it.
>> +         */
>> +	adrp	x0, stack
>> +	add	x0, x0, :lo12:stack
>> +        mov      sp, x0
>
> You need a pointer to the end of the stack, not the beginning.
> Again, I think this could be just
>
> 	adr	sp, stack_end
>
> Also, there's tab/space confusion all through this file.
> IMO, this is assembly, so it *should* be tabs.

I'm adding an entry to editorconfig and fixing up the damage.

>
>> @@ -0,0 +1,22 @@
>> +ENTRY(__start)
>> +
>> +SECTIONS
>> +{
>> +    /* virt machine, RAM starts at 1gb */
>> +    . =3D (1 << 30);
>> +    .text : {
>> +        *(.text)
>> +    }
>> +    .data : {
>> +        *(.data)
>> +    }
>> +    .rodata : {
>> +        *(.rodata)
>> +    }
>
> If you ever wanted to make this read-only, swap .rodata before .data, so =
that
> it's next to .text.

done.

>
>
> r~


--
Alex Benn=C3=A9e
