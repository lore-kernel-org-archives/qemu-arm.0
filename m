Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y6sm29947898wmy.0.2020.06.29.05.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:55:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 81C381FF7E;
	Mon, 29 Jun 2020 13:55:37 +0100 (BST)
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-27-alex.bennee@linaro.org>
 <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
 <24628d83-9d1a-395b-4bb4-f7363c26f675@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, fam@euphon.net,
 berrange@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@redhat.com>, cota@braap.org, aurelien@aurel32.net, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 26/30] gitlab: enable check-tcg for linux-user tests
In-reply-to: <24628d83-9d1a-395b-4bb4-f7363c26f675@redhat.com>
Date: Mon, 29 Jun 2020 13:55:37 +0100
Message-ID: <87h7uurpyu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2AZeomI/R38G


Laurent Vivier <lvivier@redhat.com> writes:

> On 29/06/2020 13:03, Thomas Huth wrote:
>> On 26/06/2020 20.13, Alex Benn=C3=A9e wrote:
>>> Switch to building in the new debian-all-test-cross image which has
>>> most of the cross compilers inline.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.yml | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 5ae8130bd1a..17c3349dd9e 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -140,10 +140,9 @@ build-tcg-disabled:
>>>   build-user:
>>>     <<: *native_build_job_definition
>>>     variables:
>>> -    IMAGE: ubuntu2004
>>> -    CONFIGURE_ARGS: --disable-system --disable-guest-agent
>>> -      --disable-capstone --disable-slirp --disable-fdt
>>> -    MAKE_CHECK_ARGS:  run-tcg-tests-i386-linux-user
>>> run-tcg-tests-x86_64-linux-user
>>> +    IMAGE: debian-all-test-cross
>>> +    CONFIGURE_ARGS: --disable-tools --disable-system
>>> +    MAKE_CHECK_ARGS: check-tcg
>>=20
>> The pipeline is failing for me now:
>>=20
>> https://gitlab.com/huth/qemu/-/jobs/615345144#L2654
>>=20
>> qemu-arm: /builds/huth/qemu/linux-user/elfload.c:2321: pgb_reserved_va:
>> Assertion `addr =3D=3D test' failed.
>>=20
>
> Never seen, but perhaps it has been introduced by the latest series from
> Alex that modifies elfload.c?

It's certainly related to the new layout code but I don't know why it
only occurs on gitlab. Maybe it's a proc thing?

--=20
Alex Benn=C3=A9e
