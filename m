Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w10sm618030wrr.67.2019.05.28.02.36.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 02:36:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2DD1A1FF87;
	Tue, 28 May 2019 10:36:44 +0100 (BST)
References: <20190523102532.10486-1-alex.bennee@linaro.org> <20190523102532.10486-5-alex.bennee@linaro.org> <0426116b-6141-34ef-a6aa-a269c6d624d3@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 04/28] semihosting: enable chardev backed output for console
In-reply-to: <0426116b-6141-34ef-a6aa-a269c6d624d3@linaro.org>
Date: Tue, 28 May 2019 10:36:44 +0100
Message-ID: <87blzmsyxf.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DzYwVjI3Q2nd


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/23/19 6:25 AM, Alex Benn=C3=A9e wrote:
>>  int qemu_semihosting_log_out(const char *s, int len)
>>  {
>> -    return write(STDERR_FILENO, s, len);
>> +    Chardev *chardev =3D semihosting_get_chardev();
>> +    if (chardev) {
>> +        return qemu_chr_write_all(chardev, (uint8_t *) s, len);
>> +    } else {
>> +        return write(STDERR_FILENO, s, len);
>> +    }
>>  }
>
> Can we not create a default chardev that outputs to stderr, so that the
> conditional is not required?  Or does that somehow interfere with how this
> connects up for linux-user/?

The one linux-user case does it's own thing which uses the same API but
has a dumb implementation without a chardev. I'm unsure how you go about
creating a plain chardev backend programatically although I'll probably
want to do that for the plugins as well so I'll look into it.

I'll merge this as is for now though.

--
Alex Benn=C3=A9e
