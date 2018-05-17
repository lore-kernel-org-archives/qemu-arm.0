Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l53-v6sm10840218wrc.80.2018.05.17.14.24.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 14:24:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 453483E0CE5;
	Thu, 17 May 2018 22:24:51 +0100 (BST)
References: <20180517174718.10107-1-alex.bennee@linaro.org> <20180517174718.10107-30-alex.bennee@linaro.org> <9b8a5a71-2071-ef5c-07b2-3797883ed22e@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: cota@braap.org, famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 29/49] tests/tcg/arm: disable -p 32768 mmap test
In-reply-to: <9b8a5a71-2071-ef5c-07b2-3797883ed22e@linaro.org>
Date: Thu, 17 May 2018 22:24:51 +0100
Message-ID: <87muwydlgc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +oVMftWr2ZM1


Richard Henderson <richard.henderson@linaro.org> writes:

> On 05/17/2018 10:46 AM, Alex Benn=C3=A9e wrote:
>> Broken since I updated to 18.04
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/arm/Makefile.target | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> Meh.  Most of these fail for hosts with 64k pages.
> So, sure, disable this one, but I don't think that
> the others are useful either.

I'm not entirely sure what the point of -p is meant to be. Is it just a
performance hack for linux-user to have bigger pages? We are not using
softmmu but I guess it affects the PageDesc structures?

--
Alex Benn=C3=A9e
