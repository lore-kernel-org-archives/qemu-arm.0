Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36557sm15926486f8f.24.2024.12.03.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:22:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 68D665F89C;
	Tue,  3 Dec 2024 17:22:50 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-devel@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Richard
 Henderson
 <richard.henderson@linaro.org>,  Andrew Melnychenko <andrew@daynix.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Fabiano Rosas
 <farosas@suse.de>,  Kevin Wolf <kwolf@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Eric Blake <eblake@redhat.com>,
  qemu-arm@nongnu.org,  Yuri Benditovich <yuri.benditovich@daynix.com>,
  manos.pitsidianakis@linaro.org,  qemu-block@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,
  gustavo.romero@linaro.org
Subject: Re: [PATCH 5/7] docs: add a codebase section
In-Reply-To: <CAFEAcA-UkmPvyNW_6o22-WhaLxnnji55UsBp3UcPA-gYH7kvVg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 3 Dec 2024 15:53:42 +0000")
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
	<20241118172357.475281-6-pierrick.bouvier@linaro.org>
	<CAFEAcA-UkmPvyNW_6o22-WhaLxnnji55UsBp3UcPA-gYH7kvVg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 17:22:50 +0000
Message-ID: <87zflcbs0l.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4HabrlV3zLZ9

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Present the various parts of QEMU and organization of codebase.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>
> I like this; it's something I've thought for a while would
> be good to have, but which I never got round to trying to
> put together. Thanks for doing this!
>
> Mostly my comments below are spelling/typo nits and
> other minor stuff.
>
>> ---
>>  docs/about/emulation.rst               |   2 +
>>  docs/codebase/index.rst                | 211 +++++++++++++++++++++++++
>>  docs/devel/decodetree.rst              |   2 +
>>  docs/devel/ebpf_rss.rst                |   2 +
>>  docs/devel/index-internals.rst         |   2 +
>>  docs/devel/migration/main.rst          |   2 +
>>  docs/devel/qapi-code-gen.rst           |   1 +
>>  docs/devel/testing/main.rst            |   9 +-
>>  docs/devel/testing/qtest.rst           |   2 +
>>  docs/index.rst                         |   3 +
>>  docs/interop/qemu-ga.rst               |   2 +
>>  docs/system/qemu-block-drivers.rst.inc |   2 +
>>  docs/tools/qemu-storage-daemon.rst     |   2 +
>>  docs/user/main.rst                     |   6 +
>>  14 files changed, 247 insertions(+), 1 deletion(-)
>>  create mode 100644 docs/codebase/index.rst
>>
<snip>
>> +  Block devices and `image formats<disk images>` implementation.
>> +* `bsd-user <https://gitlab.com/qemu-project/qemu/-/tree/master/bsd-use=
r>`_:
>> +  `BSD User mode<bsd-user-mode>`.
>> +* build: Where the code built goes!
>
> The built code doesn't have to be in 'build'. We could say:
>
>  * build: You can tell the QEMU build system to put the built code
>    anywhere you like. By default it will go into a directory named
>    ``build``. Sometimes documentation will assume this default
>    for convenience when describing command lines; you can always
>    replace it with the path to your build tree.
>
> ?

I always recommend creating a builds directory and having multiple build
trees under it:

  =F0=9F=95=9917:22:02 alex@draig:qemu.git  on =EE=82=A0 testing/next [$!?]=
=20
  =E2=9E=9C  tree -L 1 builds
  builds
  =E2=94=9C=E2=94=80=E2=94=80 all
  =E2=94=9C=E2=94=80=E2=94=80 all.clang
  =E2=94=9C=E2=94=80=E2=94=80 all.disabled
  =E2=94=9C=E2=94=80=E2=94=80 arm64-system.crossbuild
  =E2=94=9C=E2=94=80=E2=94=80 arm.afl
  =E2=94=9C=E2=94=80=E2=94=80 arm.all
  =E2=94=9C=E2=94=80=E2=94=80 arm.debug
  =E2=94=9C=E2=94=80=E2=94=80 arm.gcovr
  =E2=94=9C=E2=94=80=E2=94=80 arm.user.32bit
  =E2=94=9C=E2=94=80=E2=94=80 bisect
  =E2=94=9C=E2=94=80=E2=94=80 debug
  =E2=94=9C=E2=94=80=E2=94=80 debug.clang
  =E2=94=9C=E2=94=80=E2=94=80 deprecated
  =E2=94=9C=E2=94=80=E2=94=80 disable-misc
  =E2=94=9C=E2=94=80=E2=94=80 disable.plugins
  =E2=94=9C=E2=94=80=E2=94=80 disable-tcg
  =E2=94=9C=E2=94=80=E2=94=80 disable-user
  =E2=94=9C=E2=94=80=E2=94=80 extra.libs
  =E2=94=9C=E2=94=80=E2=94=80 gcov
  =E2=94=9C=E2=94=80=E2=94=80 gcov2
  =E2=94=9C=E2=94=80=E2=94=80 lto
  =E2=94=9C=E2=94=80=E2=94=80 profiling
  =E2=94=9C=E2=94=80=E2=94=80 qemu-system-arm
  =E2=94=9C=E2=94=80=E2=94=80 rust
  =E2=94=9C=E2=94=80=E2=94=80 sanitisers
  =E2=94=9C=E2=94=80=E2=94=80 sanitizer.clang
  =E2=94=9C=E2=94=80=E2=94=80 system
  =E2=94=9C=E2=94=80=E2=94=80 system.i386
  =E2=94=9C=E2=94=80=E2=94=80 system.nodefaults
  =E2=94=9C=E2=94=80=E2=94=80 system.threadsan
  =E2=94=9C=E2=94=80=E2=94=80 tcg
  =E2=94=9C=E2=94=80=E2=94=80 tci
  =E2=94=9C=E2=94=80=E2=94=80 tools-and-docs
  =E2=94=9C=E2=94=80=E2=94=80 trs.debug
  =E2=94=9C=E2=94=80=E2=94=80 tsan
  =E2=94=9C=E2=94=80=E2=94=80 user
  =E2=94=9C=E2=94=80=E2=94=80 user.static
  =E2=94=9C=E2=94=80=E2=94=80 virtio-gpu
  =E2=94=94=E2=94=80=E2=94=80 xen


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
