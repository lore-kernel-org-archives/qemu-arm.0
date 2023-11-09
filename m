Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d530e000000b0032daf848f68sm7449604wrv.59.2023.11.09.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 05:37:21 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 415565F756;
	Thu,  9 Nov 2023 13:37:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  qemu-stable@nongnu.org,  Anders Roxell
 <anders.roxell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
In-Reply-To: <f7f5288a-c2dd-4831-8bac-31286f53f394@tls.msk.ru> (Michael
	Tokarev's message of "Thu, 9 Nov 2023 16:20:13 +0300 (16 minutes, 30
	seconds ago)")
References: <20231031143215.29764-1-richard.henderson@linaro.org>
	<874jhv86a4.fsf@draig.linaro.org>
	<f7f5288a-c2dd-4831-8bac-31286f53f394@tls.msk.ru>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Thu, 09 Nov 2023 13:37:21 +0000
Message-ID: <87y1f76oa6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MITsToOJ+SjB

Michael Tokarev <mjt@tls.msk.ru> writes:

> 09.11.2023 15:23, Alex Benn=C3=A9e:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> The previous change missed updating one of the increments and
>>> one of the MemOps.  Add a test case for all vector lengths.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in
>>> gen_sve_{ld, st}r")
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> This was Cd'd for stable but didn't make it in. There is a trivial
>> re-base conflict but I can re-send the patch if that helps.
>
> Nope, I picked it up, here:
>
>  https://gitlab.com/mjt0k/qemu/-/commits/staging-8.1/?ref_type=3Dheads
>
> commit eabe320b, committed 5 days ago, - about the time when it has
> been committed to master.

Awesome, I shall try to remember to check that branch first ;-)

Have a Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the branch fix.

> I want to send announce for the next 8.1 release, just haven't decided
> when to do that, - usually there's quite a few fixes coming during the
> freeze. Maybe the best is to get 8.1.3 now and 8.1.4 together with 8.2.0.
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
