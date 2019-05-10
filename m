Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j46sm10386129wre.54.2019.05.09.23.55.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 23:55:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 00FE01FF87;
	Fri, 10 May 2019 07:55:03 +0100 (BST)
References: <20190509165912.10512-1-alex.bennee@linaro.org> <20190509165912.10512-6-alex.bennee@linaro.org> <252a5c4b-6ba7-6fa7-8792-fe597e766757@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1 05/23] semihosting: enable chardev backed output
In-reply-to: <252a5c4b-6ba7-6fa7-8792-fe597e766757@linaro.org>
Date: Fri, 10 May 2019 07:55:03 +0100
Message-ID: <87pnoq4x4o.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mKZGsC4r2LTl


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/9/19 9:58 AM, Alex Benn=C3=A9e wrote:
>> @@ -51,12 +51,18 @@ static inline const char *semihosting_get_cmdline(vo=
id)
>>  {
>>      return NULL;
>>  }
>> +
>> +static inline Chardev *semihosting_get_chardev(void)
>> +{
>> +    return NULL;
>> +}
>
> Isn't the point of this function to avoid...

Yes... but...

>
>> -                return write(STDERR_FILENO, &c, 1);
>> +#ifdef CONFIG_SOFTMMU
>> +              Chardev *chardev =3D semihosting_get_chardev();
>> +              if (chardev) {
>> +                  return qemu_chr_write_all(chardev, (uint8_t *) &c,
>1);

The qemu_chr device stuff doesn't have such stubs and is softmmu only as
well. *sigh*

I guess stub it out in the header as well?

>> +              } else
>> +#endif
>> +              {
>> +                  return write(STDERR_FILENO, &c, 1);
>> +              }
>
> ... this ifdef?
>
> Better to change
>
> - char c;
> + uint8_t c;
>
> above to avoid the cast in the call to qemu_chr_write_all?
> Or perhaps we should adjust qemu_chr_write_all to take void*?
>
>
> r~


--
Alex Benn=C3=A9e
