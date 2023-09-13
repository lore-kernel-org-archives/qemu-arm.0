Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z7-20020a7bc7c7000000b003fef60005b5sm1390175wmk.9.2023.09.13.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:49:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 154621FFBB;
	Wed, 13 Sep 2023 09:49:27 +0100 (BST)
References: <20230912184130.3056054-1-berrange@redhat.com>
 <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com>
User-agent: mu4e 1.11.17; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
Date: Wed, 13 Sep 2023 09:48:34 +0100
In-reply-to: <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com>
Message-ID: <87ledatq3s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1afI0lD+0Xc3


Thomas Huth <thuth@redhat.com> writes:

> On 12/09/2023 20.41, Daniel P. Berrang=C3=A9 wrote:
>> This addresses
>>    https://gitlab.com/qemu-project/qemu/-/issues/1882
>> Which turned out to be a genuine flaw which we missed during merge
>> as the patch hitting master co-incided with the FreeBSD CI job
>> having an temporary outage due to changed release image version.
>> Daniel P. Berrang=C3=A9 (4):
>>    microbit: add missing qtest_quit() call
>>    qtest: kill orphaned qtest QEMU processes on FreeBSD
>>    gitlab: make Cirrus CI timeout explicit
>>    gitlab: make Cirrus CI jobs gating
>>   .gitlab-ci.d/cirrus.yml       | 4 +++-
>>   .gitlab-ci.d/cirrus/build.yml | 2 ++
>>   tests/qtest/libqtest.c        | 7 +++++++
>>   tests/qtest/microbit-test.c   | 2 ++
>>   4 files changed, 14 insertions(+), 1 deletion(-)
>>=20
>
> Series
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> Alex, will you pick these up or shall I take them for my next PR?

Queued to testing/next, thanks.

Do you have a patch to disable the borked avacado tests? Or maybe I
should just include Philippe's fix?

> Or Stefan, do you want to apply these directly as a CI fix?
>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
