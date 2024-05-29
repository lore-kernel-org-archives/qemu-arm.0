Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d0d5aba4sm4758485a12.71.2024.05.29.11.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:12:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 092405F760;
	Wed, 29 May 2024 19:12:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Cleber Rosa <crosa@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Leif Lindholm <quic_llindhol@quicinc.com>,  John Snow <jsnow@redhat.com>,
  Markus Armbruster <armbru@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Paolo Bonzini <pbonzini@redhat.com>,
  Jiaxun Yang <jiaxun.yang@flygoat.com>,  qemu-arm@nongnu.org,  Joel
 Stanley <joel@jms.id.au>,  Aurelien Jarno <aurelien@aurel32.net>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Marcin
 Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-s390x@nongnu.org,  Radoslaw Biernacki
 <rad@semihalf.com>
Subject: Re: [PATCH 07/10] tests/lcitool: bump to latest version
In-Reply-To: <8a71fea1-9446-458a-a30e-4b98ab75c410@redhat.com> (Thomas Huth's
	message of "Wed, 29 May 2024 19:23:15 +0200")
References: <20240529160934.982373-1-alex.bennee@linaro.org>
	<20240529160934.982373-8-alex.bennee@linaro.org>
	<8a71fea1-9446-458a-a30e-4b98ab75c410@redhat.com>
Date: Wed, 29 May 2024 19:12:01 +0100
Message-ID: <87cyp4ebda.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Q7tiZjYxTX99

Thomas Huth <thuth@redhat.com> writes:

> On 29/05/2024 18.09, Alex Benn=C3=A9e wrote:
>> We have to simultaneously update a few bits on our side as lcitool has
>> already deprecated fedora-38, alpine-3.18 and centos-8-stream. However
>> there is no change to the package list yet.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Have you tried a CI run with these changes? I don't think this will
> work yet. There are various issues with Fedora 40 that we need to
> solve first. Some of them are addressed with patches in my pull
> request from today, but others need more work first:
>
> - Avocado v88 is broken on Fedora 40 due to the missing "imp" package.
>   I've got a pull request for lci-tool pending, but it is not merged yet:
>   https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/489
>
> - The "clang-system" jobs are failing due to the new -fsanitize=3Dundefin=
ed
>   errors that it discovers. Question is whether we want to fix all of the=
m,
>   or whether we disable the error detection instead.
>
> - build-oss-fuzz job was failing, but that should get fixed with the
>   patches from my PR from today (thanks to Alexander Bulekov for the
>   patches)
>
> So unless I missed something, you've got to postpone this patch a
> little bit.

Ahh yes I see failures for:

  build-oss-fuzz
  clang-system

https://gitlab.com/stsquad/qemu/-/pipelines/1310569965/failures

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
