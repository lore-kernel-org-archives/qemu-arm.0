Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4148000000b002bdd21f25ebsm19504595wrq.71.2023.01.19.08.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:39:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D04B91FFB7;
	Thu, 19 Jan 2023 16:39:00 +0000 (GMT)
References: <20230119155646.50503-1-philmd@linaro.org>
 <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu, 19 Jan 2023 16:38:31 +0000
In-reply-to: <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
Message-ID: <87wn5ixyvv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: os1XFbnnP0FF


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 16:56, Philippe Mathieu-Daud=C3=A9 wrote:
>> gitlab-ci: Add KVM-only aarch64 cross-build job
>> Add a new job to cross-build the aarch64 target with
>> only the KVM accelerator enabled (in particular, no TCG).
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>> Based-on: <20230118193518.26433-1-farosas@suse.de>
>>            target/arm: CONFIG_TCG=3Dn part 1
>> Successful job:
>>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>>    Duration: 15 minutes 25 seconds
>
> Alternatively we could move it to the custom aarch64 runner
> in the qemu-project namespace...

Lets do that because we are under utilisied on that beefy box anyway and
it will save us shared CI minutes.

>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> diff --git a/.gitlab-ci.d/crossbuilds.yml
>> b/.gitlab-ci.d/crossbuilds.yml
>> index 8dbbb8f881..fc78d36b31 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -210,3 +210,12 @@ cross-arm64-xen-only:
>>       IMAGE: debian-arm64-cross
>>       ACCEL: xen
>>       EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +
>> +cross-arm64-kvm-only:
>> +  extends: .cross_accel_build_job
>> +  needs:
>> +    job: arm64-debian-cross-container
>> +  variables:
>> +    IMAGE: debian-arm64-cross
>> +    ACCEL: kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default=
-devices

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
