Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b2sm24425200wri.88.2022.02.11.09.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:58:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 367731FFB7;
	Fri, 11 Feb 2022 17:58:54 +0000 (GMT)
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-3-alex.bennee@linaro.org>
 <YgaNZyojexpreBWj@redhat.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Date: Fri, 11 Feb 2022 17:51:25 +0000
In-reply-to: <YgaNZyojexpreBWj@redhat.com>
Message-ID: <87o83dcmjl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dlaK8fKCh/7Q


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Feb 11, 2022 at 04:03:00PM +0000, Alex Benn=C3=A9e wrote:
>> The alpine image doesn't have a standard useradd binary so disable
>> this convenience feature for it.
>
> Hmm, can you elaborate on the problem here ?
>
> IIUC, the NOUSER env was just about controlling what docker
> flags we added. I didn't know it had a dependancy on stuff
> inside the image ?

The docker.py script expands the dockerfiles with a:

  "RUN id %s 2>/dev/null || useradd -u %d -U %s"

when they are built so when they are invoked for building TCG tests they
won't mess up permissions of the final files. It is a useful convenience
for the other images as well so you can access compilers and tools with
something like:

  docker run --rm -it -u (id -u) -v $HOME:$HOME -w (pwd) qemu/debian-arm64-=
cross /bin/bash

however it's not required for the normal cross-compile tests as they are
all done inside the docker image. The alpine image being slim doesn't
have this nicety although there is an adduser binary. However given we
don't use alpine for TCG tests I demurred from adding more complexity to
docker.py to handle it.

>
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/Makefile.include | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 0ec59b2193..286f0ac5b5 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=3D
>>  docker-image-debian10: NOUSER=3D1
>>  docker-image-debian11: NOUSER=3D1
>>=20=20
>> +# alpine has no adduser
>> +docker-image-alpine: NOUSER=3D1
>> +
>>  #
>>  # The build rule for hexagon-cross is special in so far for most of
>>  # the time we don't want to build it. While dockers caching does avoid
>> --=20
>> 2.30.2
>>=20
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e
