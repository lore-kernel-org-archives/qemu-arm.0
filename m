Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d5228000000b002c70851bfcasm2792218wra.28.2023.02.22.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:37:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4902B1FFB7;
	Wed, 22 Feb 2023 13:37:37 +0000 (GMT)
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Wed, 22 Feb 2023 13:37:09 +0000
In-reply-to: <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
Message-ID: <871qmhrfby.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1YE2qfOVmS9u


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 22/2/23 12:01, Alex Benn=C3=A9e wrote:
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list.
>
> Split in 2 patches?

Its all pretty much a NOP aside from the comments. I split the isar code
just to check my working.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst |  1 +
>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>   target/arm/cpu_tcg.c          |  2 +-
>>   3 files changed, 28 insertions(+), 4 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
