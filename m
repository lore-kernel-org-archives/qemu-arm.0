Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b002c56179d39esm10698375wro.44.2023.02.28.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:55:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7C5681FFB7;
	Tue, 28 Feb 2023 21:55:16 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
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
Date: Tue, 28 Feb 2023 21:55:05 +0000
In-reply-to: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
Message-ID: <87a60xe9q3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EgK7GXwCWo28


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
>
> This is still kludging the fact that 'make check-qtest' rebuild
> the world even if QEMU binaries are present. Still an improvement, so
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Is something being missed by:

    # Avoid recompiling by hiding ninja with NINJA=3D":"
    - make NINJA=3D":" $MAKE_CHECK_ARGS

?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
