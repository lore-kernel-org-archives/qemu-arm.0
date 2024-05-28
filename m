Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8c975sm610976466b.167.2024.05.28.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:51:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A539C5F88D;
	Tue, 28 May 2024 13:51:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Beraldo Leal
 <bleal@redhat.com>,  qemu-s390x@nongnu.org,  John Snow <jsnow@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Richard
 Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
  qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Joel Stanley <joel@jms.id.au>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Aurelien Jarno <aurelien@aurel32.net>,
  Thomas Huth <thuth@redhat.com>,  Cleber Rosa <crosa@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/4] testing/next: purging remaining centos 8 bits
In-Reply-To: <ed69a712-689a-4294-978d-d8d818a12b6f@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 27 May 2024 11:32:17
 +0200")
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
	<ed69a712-689a-4294-978d-d8d818a12b6f@linaro.org>
Date: Tue, 28 May 2024 13:51:15 +0100
Message-ID: <87plt6f6bg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jEZHfbsQONrN

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Alex,
>
> On 21/5/24 14:53, Alex Benn=C3=A9e wrote:
>> There are a few more bits referencing centos8 in the tree which needed
>> cleaning up. After this we can remove the dedicated runner from the
>> gitlab registration. If we want to keep a dedicated Centos runner then
>> we can add back the bits needed to set it up (although arguably we
>> could have a single build-environment setup that handles all distros
>> and integrates with lcitool).
>
> Do you you mean we should generate
> scripts/ci/setup/build-environment.yml with lcitool?
> Otherwise should we update it?

Yes - I've got some WIP patches which I'll post soon.

>
>> Alex.
>> Alex Benn=C3=A9e (4):
>>    ci: remove centos-steam-8 customer runner
>>    docs/devel: update references to centos to later version
>>    tests/vm: update centos.aarch64 image to 9
>>    tests/vm: remove plain centos image
>>   docs/devel/ci-jobs.rst.inc                    |   7 -
>>   docs/devel/testing.rst                        |   8 +-
>>   .gitlab-ci.d/custom-runners.yml               |   1 -
>>   .../custom-runners/centos-stream-8-x86_64.yml |  24 ---
>>   .../org.centos/stream/8/build-environment.yml |  82 --------
>>   .../ci/org.centos/stream/8/x86_64/configure   | 198 ------------------
>>   .../org.centos/stream/8/x86_64/test-avocado   |  65 ------
>>   scripts/ci/org.centos/stream/README           |  17 --
>>   tests/vm/Makefile.include                     |   1 -
>>   tests/vm/centos                               |  51 -----
>>   tests/vm/centos.aarch64                       |  10 +-
>>   11 files changed, 9 insertions(+), 455 deletions(-)
>>   delete mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.=
yml
>>   delete mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
>>   delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
>>   delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
>>   delete mode 100644 scripts/ci/org.centos/stream/README
>>   delete mode 100755 tests/vm/centos
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
