Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t81sm146938wmg.6.2020.02.06.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 09:00:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 545E31FF87;
	Thu,  6 Feb 2020 17:00:42 +0000 (GMT)
References: <20200110161626.31943-1-alex.bennee@linaro.org>
 <20200110161626.31943-3-alex.bennee@linaro.org>
 <CAFEAcA9H8oNBX4QcKjSB3jFqDq==6tr392yEzJwF2Dxnw9EFcw@mail.gmail.com>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] tests/tcg: add a vtimer test for aarch64
In-reply-to: <CAFEAcA9H8oNBX4QcKjSB3jFqDq==6tr392yEzJwF2Dxnw9EFcw@mail.gmail.com>
Date: Thu, 06 Feb 2020 17:00:42 +0000
Message-ID: <874kw38xc5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VYne2Wnv6DQD


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Jan 2020 at 16:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Bug: https://bugs.launchpad.net/bugs/1859021
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/aarch64/system/vtimer.c         | 80 +++++++++++++++++++++++
>>  tests/tcg/aarch64/Makefile.softmmu-target |  4 ++
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 tests/tcg/aarch64/system/vtimer.c
>>
>> diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/syste=
m/vtimer.c
>> new file mode 100644
>> index 00000000000..2f6299b5d2c
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/system/vtimer.c
>> @@ -0,0 +1,80 @@
>> +/*
>> + * Simple Virtual Timer Tests
>> + *
>> + * Note: kvm-unit-tests has a much more comprehensive exercising of
>> + * the timer sub-system. However this test case can tweak _EL2 values
>> + * to trigger bugs which can't be done with that.
>> + *
>> + * Copyright (c) 2020 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <inttypes.h>
>> +#include <minilib.h>
>> +
>> +/* grabbed from Linux */
>> +#define __stringify_1(x...) #x
>> +#define __stringify(x...)   __stringify_1(x)
>
> Code 'grabbed from Linux' is unlikely to be GPL-2-or-later...
>
> QEMU already has a stringify() macro in compiler.h.

Hmm I don't think I can include compiler.h in a system mode test. I can
certainly copy and paste our local version though ;-)

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
