Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id gb25-20020a170907961900b006ce423d43e1sm4352335ejc.13.2022.02.28.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:37:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F35321FFB7;
	Mon, 28 Feb 2022 12:37:46 +0000 (GMT)
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-3-crosa@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, Fabien Chouteau
 <chouteau@adacore.com>, Antony Pavlov <antonynpavlov@gmail.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org, Eric
 Auger
 <eric.auger@redhat.com>, Michael Rolnik <mrolnik@gmail.com>, Greg Kurz
 <groug@kaod.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Wainer
 dos Santos
 Moschetta <wainersm@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Gibson
 <david@gibson.dropbear.id.au>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Beraldo Leal
 <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Alexandre Iooss <erdnaxe@crans.org>,
 qemu-s390x@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 2/9] Avocado tests: use logging namespace that is
 preserved in test logs
Date: Mon, 28 Feb 2022 12:37:40 +0000
In-reply-to: <20220225210156.2032055-3-crosa@redhat.com>
Message-ID: <874k4jnp45.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: N/kCUFdrkvFa


Cleber Rosa <crosa@redhat.com> writes:

> Since Avocado 92.0[1], there's no universal preservation of logged
> content via Python's "logging" APIs into the test log files.  This
> changes were motivated by the fact that doing so is intrusive as it
> touches on Python's root logger.
>
> Test writers are now expected to use "avocado." as a namespace prefix
> for everything that Avocado should collect/preserve, and other
> prefixes for logged content that should be handled differently.
>
> [1] - https://avocado-framework.readthedocs.io/en/94.0/releases/92_0.html=
#users-test-writers
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
