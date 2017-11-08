Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d125sm1841609wmd.2.2017.11.08.03.02.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 03:02:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D34C23E009E;
	Wed,  8 Nov 2017 11:02:15 +0000 (GMT)
References: <20171107150558.22131-1-alex.bennee@linaro.org> <20171108103630.GB8971@e103592.cambridge.arm.com>
User-agent: mu4e 1.0-alpha0; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell\@linaro.org" <peter.maydell@linaro.org>, "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm\@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 00/10] Initial support for SVE
In-reply-to: <20171108103630.GB8971@e103592.cambridge.arm.com>
Date: Wed, 08 Nov 2017 11:02:15 +0000
Message-ID: <87mv3xqbig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xPn3o2++VnX6


Dave Martin <Dave.Martin@arm.com> writes:

> On Tue, Nov 07, 2017 at 03:05:48PM +0000, Alex Benn=C3=A9e wrote:
>> Hi,
>>
>> These patches apply on-top of the last clean-up series:
>>
>>   Subject: [RISU PATCH 0/7] Add @Group support and some aarch64.risu cle=
anups
>>   Date: Tue, 31 Oct 2017 14:54:37 +0000
>>   Message-Id: <20171031145444.13766-1-alex.bennee@linaro.org>
>>
>> This series adds support for SVE to RISU. Most of the initial patches
>> are plumbing changes to better support arch specific option flags
>> (cleaning up a TODO in the process). I also needed to ensure configure
>> actually honoured CPPFLAGS so it could be passed yet to be released
>> headers.
>
> Should there be a getauxval(AT_HWCAP) & HWCAP_SVE check in this series
> somewhere?
>
> I don't know enough about how RISU is structured to know whether/where
> this is needed.

That would be a saner runtime check to do but it's a balance as RISU is
a fairly specialist tool which kind of assumes people know what they are
doing.

The current check is on SVE_MAGIC in the header files which does mean a
binary compiled on an SVE headered system is now carrying about a much
larger register dump even when run without the --test-sve flag.

Whether it makes sense to be more flexible is a call I'll leave up to
Peter.

>
> [...]
>
> Cheers
> ---Dave


--
Alex Benn=C3=A9e
