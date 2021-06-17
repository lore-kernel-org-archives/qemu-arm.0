Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r3sm5301204wmq.8.2021.06.17.11.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 11:02:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D3AD01FF7E;
	Thu, 17 Jun 2021 19:02:31 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
 <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
Date: Thu, 17 Jun 2021 19:01:43 +0100
In-reply-to: <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
Message-ID: <87v96ce5e0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t8UJ9GYJ4ldx


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana<cfontana@suse.de>
>> Cortex-A15 is the only ARM cpu class we need in KVM too.
>> We will be able to move it to tcg/ once the board code and
>> configurations
>> are fixed.
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   target/arm/cpu32.h   |  4 +++
>>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>>   3 files changed, 77 insertions(+), 67 deletions(-)
>
> I don't follow this one.  Why would kvm, which is 64-bit only, require
> a 32-bit only cpu?
>
> I guess I can accept that our board configurations are old and
> fragile, and I realize there are already 99 bottles of beer on^W^W^W^W
> patches here, but what needs to happen to fix this properly?

I'll drop this and fix whatever we need to. 32 bit ARM KVM is listed in
removed-features so I think we are good.

>
> I guess I can give it an
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
> if it helps us move forward.
>
>
> r~


--=20
Alex Benn=C3=A9e
