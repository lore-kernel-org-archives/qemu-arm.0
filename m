Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ee21-20020a056402291500b00410d4261313sm6150000edb.24.2022.02.28.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:46:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C3291FFB7;
	Mon, 28 Feb 2022 16:46:15 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-4-alex.bennee@linaro.org>
 <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
Date: Mon, 28 Feb 2022 16:44:19 +0000
In-reply-to: <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
Message-ID: <87ee3nlz1k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nPx+AIhC4JaP


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We will need an update shortly for some new images.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
>> ---
>>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>>  tests/lcitool/libvirt-ci                      | 2 +-
>>  4 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docke=
r/dockerfiles/opensuse-leap.docker
>> index 1b78d8369a..e1ad9434a3 100644
>> --- a/tests/docker/dockerfiles/opensuse-leap.docker
>> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
>> @@ -127,8 +127,7 @@ RUN zypper update -y && \
>>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>>
>> -RUN pip3 install \
>> -         meson=3D=3D0.56.0
>> +RUN pip3 install meson=3D=3D0.56.0
>
> Why are these formatting changes to the dockerfiles in this commit ?

The latest lcitool I assume didn't see the need for the continuation
line. I ran:

  make lcitool-refresh

when I updated.

--=20
Alex Benn=C3=A9e
