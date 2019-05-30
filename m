Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w185sm2230078wma.39.2019.05.30.05.35.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 05:35:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5B2D11FF87;
	Thu, 30 May 2019 13:35:15 +0100 (BST)
References: <20190528094953.14898-1-alex.bennee@linaro.org> <20190528094953.14898-7-alex.bennee@linaro.org> <CAFEAcA8Azc9g7MfWE1_WbRQCMejHXpE62bYojRw+B9maAX=+hQ@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PULL 06/28] target/arm: use the common interface for WRITE0/WRITEC in arm-semi
In-reply-to: <CAFEAcA8Azc9g7MfWE1_WbRQCMejHXpE62bYojRw+B9maAX=+hQ@mail.gmail.com>
Date: Thu, 30 May 2019 13:35:15 +0100
Message-ID: <87zhn43yt8.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 50zcCl/tXAxj


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 May 2019 at 10:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Now we have a common semihosting console interface use that for our
>> string output. However ARM is currently unique in also supporting
>> semihosting for linux-user so we need to replicate the API in
>> linux-user. If other architectures gain this support we can move the
>> file later.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Hi; Coverity points out an issue in this function (CID 1401700):
>
>
>> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, =
int len)
>> +{
>> +    void *s =3D lock_user_string(addr);
>> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
>> +    unlock_user(s, addr, 0);
>> +    return len;
>> +}
>
> We call lock_user_string(), which can fail and return NULL
> if the memory pointed to by addr isn't actually readable.
> But we don't check for the error, so we can pass a NULL
> pointer to write().

Mea culpa - I'd avoided the nastiness of the lock string stuff in the
softmmu case but reverted to a naive implementation for linux-user after
the fact. I'll send a fix for that.

> Also it looks a bit dodgy that we are passed in a
> specific length value but we then go and look at the length
> of the string, but we trust the specific length value over
> the length of the string. If len is larger than the real
> length of the string (including terminating NUL) then the
> write() will read off the end of the string.

It is an admittedly in-elegant hack to deal with the fact we call the
same function for outputting a character as well as a string. None of
the guests actually give us the length:

 * @len: length of string or 0 (string is null terminated)

We could formalise it by making s/len/is_char/ and making it a bool or
just add some more text to the description.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
