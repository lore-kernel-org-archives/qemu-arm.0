Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc63bcaafsm30626415e9.28.2025.03.03.11.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:56:48 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 857CF5F938;
	Mon,  3 Mar 2025 19:56:47 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Troy Lee <leetroy@gmail.com>,
  Paolo Bonzini <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Steven Lee <steven_lee@aspeedtech.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Niek Linnenbank
 <nieklinnenbank@gmail.com>,  Alistair Francis <alistair@alistair23.me>,
  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH] tests/functional: add boot error detection for RME tests
In-Reply-To: <20250303185745.2504842-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Mon, 3 Mar 2025 10:57:45 -0800")
References: <20250303185745.2504842-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 03 Mar 2025 19:56:47 +0000
Message-ID: <875xkp7urk.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gX6YVohxFqOr

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> It was identified that those tests randomly fail with a synchronous
> exception at boot (reported by EDK2).
> While we solve this problem, report failure immediately so tests don't
> timeout in CI.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Queued to maintainer/for-10.0-softfreeze, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
