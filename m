Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e8sm3421973wrr.69.2020.02.26.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 06:13:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 751801FF87;
	Wed, 26 Feb 2020 14:13:11 +0000 (GMT)
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <20200226101948.786be4b0@redhat.com>
 <CAFEAcA80K+h-nkiHrh15mmgomBaqDpdhRwb34zwKqF31dp3KDw@mail.gmail.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, Howard
 Spoelstra <hsp.cat7@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: Sudden slowdown of ARM emulation in master
In-reply-to: <CAFEAcA80K+h-nkiHrh15mmgomBaqDpdhRwb34zwKqF31dp3KDw@mail.gmail.com>
Date: Wed, 26 Feb 2020 14:13:11 +0000
Message-ID: <87k149xwqw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1BRXc9YKlNdy


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 26 Feb 2020 at 09:19, Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> On Wed, 26 Feb 2020 00:07:55 +0100
>> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> > Hello Igor and Paolo,
>>
>> does following hack solves issue?
>>
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index a08ab11f65..ab2448c5aa 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t tb_=
size)
>>          /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
>>             static buffer, we could size this on RESERVED_VA, on the text
>>             segment size of the executable, or continue to use the defau=
lt.  */
>> -        tb_size =3D (unsigned long)(ram_size / 4);
>> +        tb_size =3D MAX_CODE_GEN_BUFFER_SIZE;
>>  #endif
>>      }
>>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
>
> Cc'ing Richard to ask: does it still make sense for TCG
> to pick a codegen buffer size based on the guest RAM size?

Arguably you would never get more than ram_size * tcg gen overhead of
active TBs at any one point although you can come up with pathological
patterns where only a subset of pages are flushed in and out at a time.

However the backing for the code is mmap'ed anyway so surely the kernel
can work out the kinks here. We will never allocate more than the code
generator can generate jumps for anyway.

Looking at the SoftMMU version of alloc_code_gen_buffer it looks like
everything now falls under the:

  # if defined(__PIE__) || defined(__PIC__)

leg so there is a bunch of code to be deleted there. The remaining
question is what to do for linux-user because there is a bit more logic
to deal with some corner cases on the static code generation buffer.

I'd be tempted to rename DEFAULT_CODE_GEN_BUFFER_SIZE to
SMALL_CODE_GEN_BUFFER_SIZE and only bother with a static allocation for
32 bit linux-user hosts. Otherwise why not default to
MAX_CODE_GEN_BUFFER_SIZE on 64 bit systems and let the kernel deal with
it?

> (We should fix the regression anyway, but it surprised me
> slightly to find a config detail of the guest machine being
> used here.)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
