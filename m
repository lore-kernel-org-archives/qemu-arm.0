Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l68sm4450414wrc.12.2017.07.21.01.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 01:56:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id CCD383E0145;
	Fri, 21 Jul 2017 09:56:23 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-4-alex.bennee@linaro.org> <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net> <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix all files
In-reply-to: <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com>
Date: Fri, 21 Jul 2017 09:56:23 +0100
Message-ID: <87ziby6udk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kPsQ+6RfOTsd


Thomas Huth <thuth@redhat.com> writes:

> On 20.07.2017 20:59, Richard Henderson wrote:
>> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>>> This is a massive but mechanical patch, the result of:
>>>
>>>    (cd fpu/softfloat3c; and find . | xargs dos2unix)
>>>    (cd include/fpu/softfloat3c; and dos2unix *)
>>>
>>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>>> ---
>>
>> Really shouldn't this have been part of the import?
>
> +1
> It's only a whitespace change, so please squash it in the previous patch
> instead. (You could mention this in the patch description that line
> endings have been changed to unix mode)

Sure - I just wanted to be clear of the steps I took should I want to do
it from scratch again.

One thing playing in my mind against moving to SoftFloat3c is the
inscrutability of the upstream. It's nice there has been a new release
with new features but there isn't a source repository or as far as I can
tell a development list. It is basically as far as I can tell a one man
project albeit backed by academic funding.

That said the license change in 3 does mean it would be a lot easier to
incorporate fixes and updates if and when upstream release new versions.

--
Alex Bennée
