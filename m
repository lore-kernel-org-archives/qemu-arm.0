Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v204sm5009967wma.20.2019.07.11.06.43.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 06:43:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 48FBE1FF87;
	Thu, 11 Jul 2019 14:43:47 +0100 (BST)
References: <20190710131325.21442-1-alex.bennee@linaro.org> <20190710131325.21442-2-alex.bennee@linaro.org> <CAFEAcA8gZ5+tQMXRHG=YwK3ht1F7x2SDp4neLtfjcbveLfyC-Q@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH for semihosting-tests 2/2] semihosting tests: add v7m tests
In-reply-to: <CAFEAcA8gZ5+tQMXRHG=YwK3ht1F7x2SDp4neLtfjcbveLfyC-Q@mail.gmail.com>
Date: Thu, 11 Jul 2019 14:43:47 +0100
Message-ID: <87bly0elf0.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fkgKY2Nram+g


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 10 Jul 2019 at 14:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> M-profile has yet another way of triggering semihosting calls using
>> the BKPT instruction. To support this we need to add a M-profile setup
>> so we use the nice and simple microbit model which has a Cortex-M0 in
>> it.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> This generally looks good. One issue: when linking the
> compiler prints this warning:
>
> arm-none-eabi-gcc -mcpu=3Dcortex-m0 -mfloat-abi=3Dsoft -DUSE_BKPT -o
> systest-t32-bkpt.axf microbit.lds start-microbit.S string.c usertest.c
> semihosting.c semicall.S printf/printf.c -nostdlib -lgcc -Xlinker
> --script=3Dmicrobit.lds -Xlinker --build-id=3Dnone
> /usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/bin/ld:
> warning: cannot find entry symbol exc_reset_thumb; defaulting to
> 0000000000000000
>
>> +ENTRY(exc_reset_thumb)
>
> I guess this should say "reset_thumb" to match the
> actual definition:

oops missed that.

>
>
>> +        /* declare as a function so pointers are appropriatley "thumbed=
" */
>> +        .type reset_thumb, function
>> +reset_thumb:
>
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> PS: are you deliberately sending these to qemu-arm only
> and not qemu-devel ?

yes.. given they were ARM testcase specific. I can include qemu-devel on
the next iteration if you wish.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
