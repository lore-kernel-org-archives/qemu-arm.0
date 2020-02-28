Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f1sm13929798wro.85.2020.02.28.11.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 11:20:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C053C1FF87;
	Fri, 28 Feb 2020 19:20:39 +0000 (GMT)
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org>
 <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
 <87pne0w6rt.fsf@linaro.org>
 <56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
 <CAPan3WrSRm986EfwJdXV2MduNLE5BS+QmCv0Bo5-BD+QfT-=dg@mail.gmail.com>
 <20200228084729.3bb8bf11@redhat.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
In-reply-to: <20200228084729.3bb8bf11@redhat.com>
Date: Fri, 28 Feb 2020 19:20:39 +0000
Message-ID: <875zfqwmbc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: O2rfcXzwXqqw


Igor Mammedov <imammedo@redhat.com> writes:

> On Thu, 27 Feb 2020 20:07:24 +0100
> Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
>> Hi Richard,
>>=20
>> On Thu, Feb 27, 2020 at 1:57 PM Richard Henderson <
>> richard.henderson@linaro.org> wrote:=20=20
>>=20
>> > On 2/27/20 4:31 AM, Alex Benn=C3=A9e wrote:=20=20
>> > >> It does not make sense for a linux-user chroot, running make -jN, o=
n=20=20
>> > just about=20=20
>> > >> any host.  For linux-user, I could be happy with a modest increase,=
 but=20=20
>> > not all=20=20
>> > >> the way out to 2GiB.
>> > >>
>> > >> Discuss.=20=20
>> > >
>> > > Does it matter that much? Surely for small programs the kernel just
>> > > never pages in the used portions of the mmap?=20=20
>> >
>> > That's why I used the example of a build under the chroot, because the
>> > compiler
>> > is not a small program.
>> >
>> > Consider when the memory *is* used, and N * 2GB implies lots of paging,
>> > where
>> > the previous N * 32MB did not.
>> >
>> > I agree that a lower default value probably is safer until we have mor=
e=20=20
>> proof that a larger value does not give any issues.
>>=20
>>=20
>> > I'm saying that we should consider a setting more like 128MB or so, si=
nce
>> > the
>> > value cannot be changed from the command-line, or through the environm=
ent.
>> >=20=20
>>=20
>> Proposal: can we then introduce a new command line parameter for this?
>> Maybe in a new patch?
>
> linux-user currently uses 32Mb static buffer so it probably fine to
> leave it as is or bump it to 128Mb regardless of the 32/64bit host.
>
> for system emulation, we already have tb-size option to set user
> specified buffer size.
>
> Issue is with system emulation is that it sizes buffer to 1/4 of
> ram_size and dependency on ram_size is what we are trying to get
> rid of. If we consider unit/acceptance tests as main target/user,
> then they mostly use default ram_size value which varies mostly
> from 16Mb to 1Gb depending on the board. So used buffer size is
> in 4-256Mb range.
> Considering that current CI runs fine with max 256Mb buffer,
> it might make sense to use it as new heuristic which would not
> regress our test infrastructure and might improve performance
> for boards where smaller default buffer was used.

I've dropped it from 2gb to 1gb for system emulation. For the acceptance
tests I doubt we'll even fill the buffer but the mmap memory should
overcommit fine.

>
>
>> Since the size of the code generation buffer appears to have an impact on
>> performance,
>> in my opinion it would make sense to make it configurable by the user.
>>=20
>> Regards,
>>=20
>>=20
>> >
>> >
>> > r~
>> >
>> >=20=20
>>=20


--=20
Alex Benn=C3=A9e
