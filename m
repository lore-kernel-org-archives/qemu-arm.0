Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788a2sm187715225e9.11.2024.11.19.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 03:08:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E380F5F769;
	Tue, 19 Nov 2024 11:08:12 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-devel@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Richard
 Henderson
 <richard.henderson@linaro.org>,  Andrew Melnychenko <andrew@daynix.com>,
  Jason Wang <jasowang@redhat.com>,  Thomas Huth <thuth@redhat.com>,
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Fabiano Rosas
 <farosas@suse.de>,  Kevin Wolf <kwolf@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Eric Blake <eblake@redhat.com>,
  qemu-arm@nongnu.org,  Yuri Benditovich <yuri.benditovich@daynix.com>,
  manos.pitsidianakis@linaro.org,  qemu-block@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,
  gustavo.romero@linaro.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/7] docs/devel: add information on how to setup build
 environments
In-Reply-To: <ZzxZRwXAIlMt6SNA@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
	"Tue, 19 Nov 2024 09:24:23 +0000")
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
	<20241118172357.475281-5-pierrick.bouvier@linaro.org>
	<ZzxZRwXAIlMt6SNA@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 19 Nov 2024 11:08:12 +0000
Message-ID: <87mshvqy5f.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y7Su8PXyntpp

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 18, 2024 at 09:23:54AM -0800, Pierrick Bouvier wrote:
>> MacOS and Linux are straightforward, but Windows needs a bit more
>> details.
>>=20
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>  docs/about/build-platforms.rst   |   4 +-
>>  docs/devel/build-environment.rst | 114 +++++++++++++++++++++++++++++++
>>  docs/devel/index-build.rst       |   1 +
>>  3 files changed, 118 insertions(+), 1 deletion(-)
>>  create mode 100644 docs/devel/build-environment.rst
>>=20
<snip>
>> +Fedora
>> +++++++
>> +
>> +::
>> +
>> +    sudo dnf update && sudo dnf builddep qemu
>> +
>> +Debian/Ubuntu
>> ++++++++++++++
>> +
>> +You first need to enable `Sources List <https://wiki.debian.org/Sources=
List>`_.
>> +Then, use apt to install dependencies:
>> +
>> +::
>> +
>> +    sudo apt update && sudo apt build-dep qemu
>> +
>> +MacOS
>> +-----
>> +
>> +You first need to install `Homebrew <https://brew.sh/>`_. Then, use it =
to
>> +install dependencies:
>> +
>> +::
>> +
>> +    brew update && brew install $(brew deps --include-build qemu)
>
>
> The downside in recommending the 'build dep' approach is that it misses
> out on deps that have been newly introduced in qemu.git, since whatever
> old version of QEMU the distros are shipping.  It also misses deps for
> any features the distro vendor has decided to exclude.
>
> Can we put a caveat describing this limitation at the top, so that users
> have pointer if things don't quite go the way we expected.

At a recent QEMU workshop I presented I pointed to lcitool as a way to
list the minimal dependencies QEMU needs:

  ./tests/lcitool/libvirt-ci/bin/lcitool variables -f yaml debian-12 ./test=
s/lcitool/projects/qemu-minimal.yml

It wouldn't be the hardest thing to extend lcitool to generate a pkg
install line instead of a list. Although I notice it fails with the full
set of dependancies:

  =E2=9C=97  ./tests/lcitool/libvirt-ci/bin/lcitool -d tests/lcitool variab=
les -f shell debian-12 ./tests/lcitool/projects/qemu.yml
  Package generic name resolution error: Package libcbor not present in map=
pings

I note there is already an "install" action but I'm wary of what it does.

>
>> +
>> +Windows
>> +-------
>> +
>> +You first need to install `MSYS2 <https://www.msys2.org/>`_.
>> +MSYS2 offers `different environments <https://www.msys2.org/docs/enviro=
nments/>`_.
>> +x86_64 environments are based on GCC, while aarch64 is based on Clang.
>> +
>> +We recommend to use MINGW64 for windows-x86_64 and CLANGARM64 for windo=
ws-aarch64
>> +(only available on windows-aarch64 hosts).
>
> Does CLANGARM64 really work with QEMU ?   We go out of our way to actively
> block the use of CLang for Windows because of its lack of support for
> 'gcc_struct' attributes, so I would have expected it to fail
>
>> +
>> +Then, you can open a windows shell, and enter msys2 env using:
>> +
>> +::
>> +
>> +    c:/msys64/msys2_shell.cmd -defterm -here -no-start -mingw64
>> +    # Replace -ucrt64 by -clangarm64 or -ucrt64 for other environments.
>> +
>> +MSYS2 package manager does not offer a built-in way to install build
>> +dependencies. You can start with this list of packages using pacman:
>> +
>
> With regards,
> Daniel

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
