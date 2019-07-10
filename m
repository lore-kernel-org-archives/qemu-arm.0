Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p4sm1494168wrs.35.2019.07.10.01.38.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 01:38:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B2DC31FF87;
	Wed, 10 Jul 2019 09:38:54 +0100 (BST)
References: <20190705160421.19015-1-alex.bennee@linaro.org> <20190705160421.19015-4-alex.bennee@linaro.org> <b42c405b-1b20-28b4-07c0-24df9a183e16@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH v1 3/5] tests/tcg: fix diff-out pass to properly report failure
In-reply-to: <b42c405b-1b20-28b4-07c0-24df9a183e16@linaro.org>
Date: Wed, 10 Jul 2019 09:38:54 +0100
Message-ID: <87pnmie129.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gUZSVPttepQG


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/5/19 6:04 PM, Alex Benn=C3=A9e wrote:
>> +diff-out =3D $(call quiet-command, diff -q $1.out $2 || \
>> +				 (diff -u $1.out $2 | head -n 10 && false), \
>
> What about (set -o pipefail; diff ... | head) ?
> I think we already rely on bash, right?

I don't think so - we assume POSIX shell for configure and AFAICT we
don't do anything special in the make system to set the shell type to
bash.

--
Alex Benn=C3=A9e
