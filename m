Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c11-20020a056000104b00b002be0b1e556esm11960620wrx.59.2023.03.01.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:59:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 597231FFB7;
	Wed,  1 Mar 2023 10:59:31 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-24-alex.bennee@linaro.org>
 <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
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
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Date: Wed, 01 Mar 2023 10:59:14 +0000
In-reply-to: <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
Message-ID: <87k000d9f0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RKhzB6rxNox3


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>> We need this to be able to run the tuxrun_baseline tests in CI which
>> in turn helps us reduce overhead running other tests.
>> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/dockerfiles/alpine.docker                | 1 +
>>   tests/docker/dockerfiles/centos8.docker               | 3 ++-
>>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>>   tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>>   tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>>   tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>>   tests/lcitool/projects/qemu.yml                       | 1 +
>>   18 files changed, 34 insertions(+), 16 deletions(-)
>
> You simply ran 'lcitool-refresh', right? (not obvious from the
> commit desc).
>
> If #361 got merged, this patch should also change the
> tests/lcitool/libvirt-ci submodule to include it, isn't it?

Yes - I've already done that in my PR branch.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
