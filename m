Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d4sm3722529wra.14.2020.02.26.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:29:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 07C4F1FF87;
	Wed, 26 Feb 2020 15:29:17 +0000 (GMT)
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <20200226101948.786be4b0@redhat.com>
 <CAFEAcA80K+h-nkiHrh15mmgomBaqDpdhRwb34zwKqF31dp3KDw@mail.gmail.com>
 <87k149xwqw.fsf@linaro.org> <20200226154525.5c4c0ac9@redhat.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Howard Spoelstra
 <hsp.cat7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Sudden slowdown of ARM emulation in master
In-reply-to: <20200226154525.5c4c0ac9@redhat.com>
Date: Wed, 26 Feb 2020 15:29:16 +0000
Message-ID: <87blplxt83.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Zzm8Q5jF7Ilg


Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 26 Feb 2020 14:13:11 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>> > On Wed, 26 Feb 2020 at 09:19, Igor Mammedov <imammedo@redhat.com> wrot=
e:=20=20
>> >>
>> >> On Wed, 26 Feb 2020 00:07:55 +0100
>> >> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>> >>=20=20
>> >> > Hello Igor and Paolo,=20=20
>> >>
>> >> does following hack solves issue?
>> >>
>> >> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> >> index a08ab11f65..ab2448c5aa 100644
>> >> --- a/accel/tcg/translate-all.c
>> >> +++ b/accel/tcg/translate-all.c
>> >> @@ -944,7 +944,7 @@ static inline size_t size_code_gen_buffer(size_t =
tb_size)
>> >>          /* ??? If we relax the requirement that CONFIG_USER_ONLY use=
 the
>> >>             static buffer, we could size this on RESERVED_VA, on the =
text
>> >>             segment size of the executable, or continue to use the de=
fault.  */
>> >> -        tb_size =3D (unsigned long)(ram_size / 4);
>> >> +        tb_size =3D MAX_CODE_GEN_BUFFER_SIZE;
>> >>  #endif
>> >>      }
>> >>      if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {=20=20
>> >
>> > Cc'ing Richard to ask: does it still make sense for TCG
>> > to pick a codegen buffer size based on the guest RAM size?=20=20
>>=20
>> Arguably you would never get more than ram_size * tcg gen overhead of
>> active TBs at any one point although you can come up with pathological
>> patterns where only a subset of pages are flushed in and out at a time.
>>=20
>> However the backing for the code is mmap'ed anyway so surely the kernel
>> can work out the kinks here. We will never allocate more than the code
>> generator can generate jumps for anyway.
>>=20
>> Looking at the SoftMMU version of alloc_code_gen_buffer it looks like
>> everything now falls under the:
>>=20
>>   # if defined(__PIE__) || defined(__PIC__)
>>=20
>> leg so there is a bunch of code to be deleted there. The remaining
>> question is what to do for linux-user because there is a bit more logic
>> to deal with some corner cases on the static code generation buffer.
>>=20
>> I'd be tempted to rename DEFAULT_CODE_GEN_BUFFER_SIZE to
>> SMALL_CODE_GEN_BUFFER_SIZE and only bother with a static allocation for
>> 32 bit linux-user hosts. Otherwise why not default to
>> MAX_CODE_GEN_BUFFER_SIZE on 64 bit systems and let the kernel deal with
>> it?
>
> *-user call
>   tcg_exec_init(0);
> which in in the end results in
>   DEFAULT_CODE_GEN_BUFFER_SIZE -> DEFAULT_CODE_GEN_BUFFER_SIZE_1
>
> so for *-user cases we can just always call
>    code_gen_alloc(DEFAULT_CODE_GEN_BUFFER_SIZE)
<snip>

I've gone for a variation of that, coming to a mailing list near you
real soon now ;-)

--=20
Alex Benn=C3=A9e
