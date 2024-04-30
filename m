Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bb6-20020a1709070a0600b00a55b020a821sm11403279ejc.13.2024.04.30.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 10:08:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D54E45F7A7;
	Tue, 30 Apr 2024 18:08:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>,  "Konrad, Frederic"
 <Frederic.Konrad@amd.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  sdl.qemu@linuxtesting.org
Subject: Re: [PATCH v4] fix endianness bug
In-Reply-To: <20240428181156.24071-1-adiupina@astralinux.ru> (Alexandra
	Diupina's message of "Sun, 28 Apr 2024 21:11:56 +0300")
References: <20240428181156.24071-1-adiupina@astralinux.ru>
Date: Tue, 30 Apr 2024 18:08:04 +0100
Message-ID: <87y18u3hjf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pQLYh/R68Em3

Alexandra Diupina <adiupina@astralinux.ru> writes:

As the subject is what ends up in the shortlog it is useful to prefix
the subsystem to make it easier to see what was touched when reviewing
log files. So maybe:

xlnx_dpdma: fix endianness bug

or even:

xlnx_dpdma: fix descriptor endianness bug

as we have space within the 60 or so chars recommended for subject lines ;-)

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
