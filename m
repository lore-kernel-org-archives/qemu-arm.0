Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f3sm10231418wme.26.2021.02.11.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 02:25:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 198791FF7E;
	Thu, 11 Feb 2021 10:25:46 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-11-alex.bennee@linaro.org>
 <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Eduardo
 Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>, Michael Walle
 <michael@walle.cc>, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, Guan Xuetao <gxt@mprc.pku.edu.cn>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 10/21] exec: Move TranslationBlock typedef to
 qemu/typedefs.h
Date: Thu, 11 Feb 2021 10:24:19 +0000
In-reply-to: <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
Message-ID: <87zh0aucie.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xUyKfm11pfGZ


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 2/10/21 11:10 PM, Alex Benn=C3=A9e wrote:
>> From: Richard Henderson <richard.henderson@linaro.org>
>>=20
>> This also means we don't need an extra declaration of
>> the structure in hw/core/cpu.h.
>>=20
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>
>
> I'd say this one matters ^,
>
>> Message-Id: <20210209182749.31323-2-alex.bennee@linaro.org>
>
> but this one less.

My general approach to Message-Id's is to keep the one from where I
snarfed the patch and the last Message-Id from whichever iteration of
posting it's had. IOW the second one will be replaced by whatever the ID
is of the parent post here.

>
>> ---
>>  include/exec/tb-context.h     | 1 -
>>  include/hw/core/cpu.h         | 4 +---
>>  include/hw/core/tcg-cpu-ops.h | 3 +--
>>  include/qemu/typedefs.h       | 1 +
>>  target/arm/internals.h        | 3 +--
>>  target/cris/translate.c       | 2 +-
>>  target/lm32/translate.c       | 2 +-
>>  target/moxie/translate.c      | 2 +-
>>  target/unicore32/translate.c  | 2 +-
>>  9 files changed, 8 insertions(+), 12 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--=20
Alex Benn=C3=A9e
