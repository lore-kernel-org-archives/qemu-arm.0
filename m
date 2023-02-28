Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s8-20020a5d4ec8000000b002c704271b05sm9927071wrv.66.2023.02.28.06.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:00:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3D4751FFB7;
	Tue, 28 Feb 2023 14:00:04 +0000 (GMT)
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
 <Y/4C74k7QTuIwz7v@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal
 <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, Ed Maste
 <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, Aurelien
 Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, John Snow
 <jsnow@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>, Bandan
 Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Date: Tue, 28 Feb 2023 13:57:28 +0000
In-reply-to: <Y/4C74k7QTuIwz7v@redhat.com>
Message-ID: <87cz5tgaaj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: l2cQnF/TKcDZ


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 28/2/23 13:58, Daniel P. Berrang=C3=A9 wrote:
>> > On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> > > On 24/2/23 19:08, Alex Benn=C3=A9e wrote:
>> > > > This series attempts to remove our dependence on the docker.py scr=
ipt
>> > > > and build things directly with the appropriate tool. I've been
>> > > > noodling around with how we build images on gitlab to see if they =
can
>> > > > cache better because the normal case should be we don't need to
>> > > > rebuild everything if the upstream distro hasn't updated its packa=
ge
>> > > > list.
>> > > >=20
>> > > > Anyway what do people think?
>> > >=20
>> > > Removing dind limitation is interesting.
>> > >=20
>> > > Unrelated, can we tag registry.gitlab.com/qemu-project's
>> > > docker images along with releases?
>> >=20
>> > Can you elaborate on this ?
>> >=20
>> > We're only using the images for CI purposes and they must always refle=
ct
>> > the current state of git master. We're using a fixed docker tag 'lates=
t',
>> > as that avoids the container registry growing arbitrarily large.
>> >=20
>> > Our CI rules should prevent the pipelines running on stable branches,
>> > so we shouldn't need container tags for stable.
>>=20
>> I'm not suggesting keeping jobs to build, but doing a snapshot of the
>> released containers.
>>=20
>> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
>> it again. This is useful when bisecting pre-v8, but also to build pre-v8
>> and do performance comparison. One shouldn't have to upgrade such
>> container (in particular when package mirror disappear), since it
>> already contains all we need.
>
> The main risk with this is the impact on our storage quota. With the
> OSS Program membership IIUC we get Ultimate level features which
> is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
> container registry.
>
> Currently they have no way to enforce that since their accounting of
> usage is not accurate enough. They're working on fixing that so at
> somepoint we'll be subject to the 250 GB limit.
>
> What I don't know is how much storage we're currently using across
> the /qemu-project namespace, and what extra is implied by taking
> a snapshot of our container registry 3 times a year. I'm expecting
> it to probably be in the high 10's of GB though for the container
> registry.

Currently we are using:

86.6 Gb of artefacts
28.5 Gb of containers
220 Mb of file uploads
24.8Mb of git repo

We could probably cut down a lot of usage of artefacts by either not
building full fat ones with debug symbols and passing between layers or
tweaking the build system to prevent re-building of object files if the
final binary is present in the file system.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
