Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b002c559def236sm12011646wrq.57.2023.03.01.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:02:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1D3331FFB7;
	Wed,  1 Mar 2023 10:02:07 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Date: Wed, 01 Mar 2023 10:01:55 +0000
In-reply-to: <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
Message-ID: <87sfeodc2o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8V287Zgvqp+F


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>> To avoid lots of copy and paste lets deal with artefacts in a
>> template. This way we can filter out most of the pre-binary object and
>> library files we no longer need as we have the final binaries.
>> build-system-alpine also saved .git-submodule-status so for
>> simplicity
>> we bring that into the template as well.
>> As an example the build-system-ubuntu artefacts before this patch
>> where around 1.3 GB, after dropping the object files it comes to 970
>> MB.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>   2 files changed, 46 insertions(+), 51 deletions(-)
>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>> b/.gitlab-ci.d/buildtest-template.yml
>> index cb96b55c3f..a6cfe9be97 100644
>> --- a/.gitlab-ci.d/buildtest-template.yml
>> +++ b/.gitlab-ci.d/buildtest-template.yml
>> @@ -25,6 +25,22 @@
>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>>         fi
>>   +# We jump some hoops in common_test_job_template to avoid
>> +# rebuilding all the object files we skip in the artifacts
>> +.native_build_artifact_template:
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
>> +      - .git-submodule-status
>> +    exclude:
>> +      - build/**/*.p
>> +      - build/**/*.a.p
>> +      - build/**/*.fa.p
>> +      - build/**/*.c.o
>> +      - build/**/*.c.o.d
>> +      - build/**/*.fa
>> +
>>   .common_test_job_template:
>>     extends: .base_job_template
>>     stage: test
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 43f9e4a81d..44b8275299 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -2,7 +2,9 @@ include:
>>     - local: '/.gitlab-ci.d/buildtest-template.yml'
>>     build-system-alpine:
>> -  extends: .native_build_job_template
>> +  extends:
>> +    - .native_build_job_template
>> +    - .native_build_artifact_template
>
> I'm confused... Apparently this doesn't work:
> https://gitlab.com/stsquad/qemu/-/jobs/3847747681/artifacts/browse

Nope you are one run behind ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
