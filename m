Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda8f98sm725508366b.218.2024.05.29.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 08:34:40 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8B75B5F760;
	Wed, 29 May 2024 16:34:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Radoslaw Biernacki <rad@semihalf.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Cleber Rosa
 <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
In-Reply-To: <20240528182917.91027-1-marcin.juszkiewicz@linaro.org> (Marcin
	Juszkiewicz's message of "Tue, 28 May 2024 20:29:17 +0200")
References: <20240528182917.91027-1-marcin.juszkiewicz@linaro.org>
Date: Wed, 29 May 2024 16:34:39 +0100
Message-ID: <87r0dkeink.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cFwSuFvG1dcs

Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Partial support for NUMA setup:
> - cpu nodes
> - memory nodes
>
> Used versions:
>
> - Trusted Firmware v2.11.0
> - Tianocore EDK2 stable202405
> - Tianocore EDK2 Platforms code commit 4bbd0ed
>
> Firmware is built using Debian 'bookworm' cross toolchain (gcc
> 12.2.0).

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
