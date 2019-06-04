Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b8sm13159786wrr.88.2019.06.04.02.43.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 02:43:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9D83C1FF87;
	Tue,  4 Jun 2019 10:43:59 +0100 (BST)
References: <20190603150120.29255-1-alex.bennee@linaro.org> <201906031835.13420.randrianasulu@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 1830872@bugs.launchpad.net, Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] cputlb: use uint64_t for interim values for unaligned load
In-reply-to: <201906031835.13420.randrianasulu@gmail.com>
Date: Tue, 04 Jun 2019 10:43:59 +0100
Message-ID: <87zhmxsn1c.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: F7g8ZGJJ3FxL


Andrew Randrianasulu <randrianasulu@gmail.com> writes:

> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 Monday 03 June 2019 18:01:20 Alex Benn=C3=A9e =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB(=D0=B0):
>> When running on 32 bit TCG backends a wide unaligned load ends up
>> truncating data before returning to the guest. We specifically have
>> the return type as uint64_t to avoid any premature truncation so we
>> should use the same for the interim types.
>>
>> Hopefully fixes #1830872
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  accel/tcg/cputlb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index cdcc3771020..b796ab1cbea 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, =
TCGMemOpIdx oi,
>>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>>                      >=3D TARGET_PAGE_SIZE)) {
>>          target_ulong addr1, addr2;
>> -        tcg_target_ulong r1, r2;
>> +        uint64_t r1, r2;
>>          unsigned shift;
>>      do_unaligned_access:
>>          addr1 =3D addr & ~(size - 1);
>
> Unfortunatly, this doesn't fix 32-bit qemu-system-x86_64 .... so, my
> bug is separate from #1830872 ?

I think you've hit two - one of which we have just fixed. With my
expanded memory test on i386 I'm seeing a hang but it's ok @
pull-demacro-softmmu-100519-1. Unfortunately bisecting through the slirp
move and other i386 Werror stuff is proving painful.

>
> I also was unable to convince qemu to use my kernel-only x86_64 gcc 6.5.0=
 cross-compiler ..
> probably x86-64 testing on i686 requires either docker (I don't have this
> ) or 'real' cross-compiler (build with glibc support).


--
Alex Benn=C3=A9e
