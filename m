Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u6sm4528041wro.75.2021.02.03.07.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 07:34:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 513EE1FF7E;
	Wed,  3 Feb 2021 15:34:50 +0000 (GMT)
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
 <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
 <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
 <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
Date: Wed, 03 Feb 2021 15:33:12 +0000
In-reply-to: <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
Message-ID: <87bld1rwpx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QC1DEtI1dZ10


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/2/21 4:40 PM, Richard Henderson wrote:
>> Well, here's the thing: this appears to be v3, reposted.
>>=20
>> All of the work I did for v4 has gone missing.  I went to go fix the sin=
gle use
>> of current_cpu, and it wasn't where I expected it to be, and that's when=
 I
>> noticed.  I'm grepping blobs now, but I must have made some horrible git=
 error.
>>  :-(
>
> It's not quite that bad.  About half of the changes are here.
> But e.g. patch 11 had been split into at least 4, and those are all missi=
ng.  I
> presume all of the r-b that I collected before that point got lost at the=
 same
> time.

b4 is a great tool for finding tags from the archive automatically. You
can either use it to build your next branch iteration or use something
like the tooling I recently posted for emacs to pull the tags and apply
to the commit. This only works if you track the message-ids from your
last post.

--=20
Alex Benn=C3=A9e
