Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b002d6f285c0a2sm4427526wrt.42.2023.04.21.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 06:16:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8B8821FFB7;
	Fri, 21 Apr 2023 14:16:25 +0100 (BST)
References: <20230421110345.1294131-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 14:16:20 +0100
In-reply-to: <20230421110345.1294131-1-thuth@redhat.com>
Message-ID: <87ttx9bck6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Dm1lRwdXdzPU


Thomas Huth <thuth@redhat.com> writes:

> Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
> See the patch description of the second patch for details.
> Also add the test to the MAINTAINERS file (third patch).
>
> Thomas Huth (3):
>   tests/avocado: Make ssh_command_output_contains() globally available
>   tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
>   MAINTAINERS: Cover tests/avocado/machine_aspeed.py
>
>  MAINTAINERS                            |  2 +-
>  tests/avocado/avocado_qemu/__init__.py |  8 +++++++
>  tests/avocado/linux_ssh_mips_malta.py  |  8 -------
>  tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
>  4 files changed, 27 insertions(+), 22 deletions(-)

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
