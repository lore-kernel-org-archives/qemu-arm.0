Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d4207000000b002c552c6c8c2sm788966wrq.87.2023.02.16.00.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 00:04:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A34821FFB7;
	Thu, 16 Feb 2023 08:03:59 +0000 (GMT)
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-6-alex.bennee@linaro.org>
 <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, Alexander
 Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Darren Kenny
 <darren.kenny@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan
 Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>, Ed Maste
 <emaste@freebsd.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
Date: Thu, 16 Feb 2023 08:02:58 +0000
In-reply-to: <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
Message-ID: <87k00i82a8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y8V/0dmLRO9T


Thomas Huth <thuth@redhat.com> writes:

> On 15/02/2023 20.25, Alex Benn=C3=A9e wrote:
>> We also truncate the echoing of the test log if we fail. Ideally we
>> would want the build aretefact to be available to gitlab but so far
>> how to do this eludes me.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>   .gitlab-ci.d/cirrus/build.yml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/.gitlab-ci.d/cirrus/build.yml
>> b/.gitlab-ci.d/cirrus/build.yml
>> index 7ef6af8d33..6563ff3c7a 100644
>> --- a/.gitlab-ci.d/cirrus/build.yml
>> +++ b/.gitlab-ci.d/cirrus/build.yml
>> @@ -32,6 +32,6 @@ build_task:
>>       - $MAKE -j$(sysctl -n hw.ncpu)
>>       - for TARGET in $TEST_TARGETS ;
>>         do
>> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=3D1
>> -        || { cat meson-logs/testlog.txt; exit 1; } ;
>> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
>> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>>         done
>
> I think it should be OK to publish the artifacts on cirrus-ci.com
> instead - you have to click a little bit more often, but you can still
> get the artifacts there, see:
>
>  https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.c=
om/

But dropping the V=3D1 also helps by reducing those chatty softfloat
tests. If we could merge that with yours. Are you sending a PR soon or
should I pull your patch into this series?

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
