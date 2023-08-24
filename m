Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d5146000000b00315af025098sm21499901wrt.46.2023.08.24.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 00:54:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 75BC71FFBB;
	Thu, 24 Aug 2023 08:54:50 +0100 (BST)
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <CAFEAcA8YSsByEUkVK7gWM51eoLR4JZV3P_GDakc3NaLAw=QwSA@mail.gmail.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Thu, 24 Aug 2023 08:54:38 +0100
In-reply-to: <CAFEAcA8YSsByEUkVK7gWM51eoLR4JZV3P_GDakc3NaLAw=QwSA@mail.gmail.com>
Message-ID: <87a5ugho39.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8Q3O8BdcLC+q


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 22 Feb 2023 at 11:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list. While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/system/arm/emulation.rst |  1 +
>>  target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>  target/arm/cpu_tcg.c          |  2 +-
>>  3 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.r=
st
>> index 2062d71261..2c4fde5eef 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>  - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>  - FEAT_BF16 (AArch64 BFloat16 instructions)
>>  - FEAT_BTI (Branch Target Identification)
>> +- FEAT_CRC32 (CRC32 instruction)
>>  - FEAT_CSV2 (Cache speculation variant 2)
>>  - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>  - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>
> Would you mind resubmitting a version of this patch that just
> fixes this documentation error and doesn't also do the other
> stuff that caused this patch to not get through code review?

Sent 20230824075406.1515566-1-alex.bennee@linaro.org

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
