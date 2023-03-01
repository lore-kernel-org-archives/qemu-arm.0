Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c348200b003e8f0334db8sm19191177wmq.5.2023.03.01.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:01:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4DBC31FFB7;
	Wed,  1 Mar 2023 10:01:11 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
 <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Aurelien Jarno
 <aurelien@aurel32.net>, Markus Armbruster <armbru@redhat.com>, Darren
 Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>, Ed Maste
 <emaste@freebsd.org>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Date: Wed, 01 Mar 2023 10:00:12 +0000
In-reply-to: <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
Message-ID: <87wn40dc48.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1+BJ/ji0MmWu


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 1/3/23 07:51, Thomas Huth wrote:
>> On 28/02/2023 22.41, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>>>> To avoid lots of copy and paste lets deal with artefacts in a
>>>> template. This way we can filter out most of the pre-binary object and
>>>> library files we no longer need as we have the final binaries.
>>>>
>>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>>> we bring that into the template as well.
>>>>
>>>> As an example the build-system-ubuntu artefacts before this patch
>>>> where around 1.3 GB, after dropping the object files it comes to 970
>>>> MB.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>> =C2=A0 .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>> =C2=A0 .gitlab-ci.d/buildtest.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 81 +++++++++++------------------
>>>> =C2=A0 2 files changed, 46 insertions(+), 51 deletions(-)
>>>
>>> This is still kludging the fact that 'make check-qtest' rebuild
>>> the world even if QEMU binaries are present.
>> Did you try? ... if so, that would kill even more CI minutes, i.e.
>> it would IMHO be a show-stopper for this patch.
>
> I remember we had to pass all build/ otherwise calling 'make
> check-qtest check-tcg' would rebuild the same binaries, it it
> was pointless to split the jobs in 2 stages. I might have missed
> when that was fixed.
>
> I haven't tried, however I see in Alex job:
>
> $ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=3D/ s/.*=3D//
> p' build/config-host.mak)
> sed: can't read build/config-host.mak: No such file or directory
> $ cd build
> /bin/bash: line 144: cd: build: No such file or directory
> ERROR: Job failed: exit code 1
>
> https://gitlab.com/stsquad/qemu/-/jobs/3847747769

That was an older run of the job where I thought the skip path would
merge from the template. In the end I've just include git-submodules in
all the build aretfacts instead of just for alpine.

It ran fine:

  https://gitlab.com/stsquad/qemu/-/jobs/3849512854

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
