Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g7-20020adfe407000000b003232d122dbfsm9791415wrm.66.2023.10.09.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:54:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 58B021FFBB;
	Mon,  9 Oct 2023 14:54:00 +0100 (BST)
References: <20230927120050.210187-1-marcin.juszkiewicz@linaro.org>
 <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Cleber Rosa
 <crosa@redhat.com>
Subject: Re: [PATCH v2 1/1] tests/avocado: update firmware to enable OpenBSD
 test on sbsa-ref
Date: Mon, 09 Oct 2023 14:53:37 +0100
In-reply-to: <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
Message-ID: <87ttqzq4uf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VSOoCILtZZDg


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Update prebuilt firmware images:
> - Neoverse V1/N2 cpu support
> - non-secure EL2 virtual timer
> - XHCI controller in DSDT
>
> With those changes we can now run OpenBSD as part of sbsa-ref tests.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Queued to maintainer/october-omnibus, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
