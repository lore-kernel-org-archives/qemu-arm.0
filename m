Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w67-v6sm5653509wmw.0.2018.06.14.01.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jun 2018 01:34:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C4ECC3E0112;
	Thu, 14 Jun 2018 09:34:53 +0100 (BST)
References: <20180613125601.14371-1-alex.bennee@linaro.org> <20180613125601.14371-6-alex.bennee@linaro.org> <a24ec09d-9bf8-ea12-092f-9df1d4ad7786@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RISU PATCH v3 05/22] risu: add zlib indication to help text
In-reply-to: <a24ec09d-9bf8-ea12-092f-9df1d4ad7786@linaro.org>
Date: Thu, 14 Jun 2018 09:34:53 +0100
Message-ID: <871sd922c2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: n37ZHClJ4sn/


Richard Henderson <richard.henderson@linaro.org> writes:

> On 06/13/2018 02:55 AM, Alex Benn=C3=A9e wrote:
>> This is a simple aide-memoir as it can be tricky to determine this
>> with a simple statically compiled binary.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  risu.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> Eh, sure.  Or we could simply require zlib...
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I would be some cross compilers (or more correctly multiarch setups) are
broken in this regard. There was a time before I moved to 18.04 that I
couldn't have multiple zlib1g-dev packages installed due to clashing
files.

As risu accepts stdin/stdout for trace files you can work around this
with pipes and native gzip so a non-zlib enabled risu is still usable.
But I'm happy to defer to Peter on this one.

--
Alex Benn=C3=A9e
