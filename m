Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t4sm23344458wmf.4.2020.06.29.05.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:54:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 553E61FF7E;
	Mon, 29 Jun 2020 13:54:39 +0100 (BST)
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-27-alex.bennee@linaro.org>
 <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
 cota@braap.org, aurelien@aurel32.net, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3 26/30] gitlab: enable check-tcg for linux-user tests
In-reply-to: <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
Date: Mon, 29 Jun 2020 13:54:39 +0100
Message-ID: <87k0zqrq0g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9UywMcKq9dCH


Thomas Huth <thuth@redhat.com> writes:

> On 26/06/2020 20.13, Alex Benn=C3=A9e wrote:
>> Switch to building in the new debian-all-test-cross image which has
>> most of the cross compilers inline.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.yml | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 5ae8130bd1a..17c3349dd9e 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -140,10 +140,9 @@ build-tcg-disabled:
>>   build-user:
>>     <<: *native_build_job_definition
>>     variables:
>> -    IMAGE: ubuntu2004
>> -    CONFIGURE_ARGS: --disable-system --disable-guest-agent
>> -      --disable-capstone --disable-slirp --disable-fdt
>> -    MAKE_CHECK_ARGS:  run-tcg-tests-i386-linux-user run-tcg-tests-x86_6=
4-linux-user
>> +    IMAGE: debian-all-test-cross
>> +    CONFIGURE_ARGS: --disable-tools --disable-system
>> +    MAKE_CHECK_ARGS: check-tcg
>
> The pipeline is failing for me now:
>
> https://gitlab.com/huth/qemu/-/jobs/615345144#L2654
>
> qemu-arm: /builds/huth/qemu/linux-user/elfload.c:2321: pgb_reserved_va:=20
> Assertion `addr =3D=3D test' failed.
>
> Is that a known bug already?

Yes - that's one of the problems that seems to be a unique failure on
GitLab's infrastructure.

>
>   Thomas


--=20
Alex Benn=C3=A9e
