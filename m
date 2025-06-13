Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48a8bf8sm1155699a12.11.2025.06.13.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:46:07 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CB1A55F827;
	Fri, 13 Jun 2025 13:46:06 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org,
  Corentin GENDRE <cocotroupe20@gmail.com>
Subject: Re: [PATCH] hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions
In-Reply-To: <20250605141801.1083266-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 5 Jun 2025 15:18:01 +0100")
References: <20250605141801.1083266-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 13 Jun 2025 13:46:06 +0100
Message-ID: <87y0tvhks1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eHDVna+eh7iN

Peter Maydell <peter.maydell@linaro.org> writes:

> The AN500 application note documents that it configures the Cortex-M7
> CPU to have 16 MPU regions. We weren't doing this in our emulation,
> so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
> property to 16 for this board.
>
> This bug doesn't affect any of the other board types we model in
> this source file, because they all use either the Cortex-M3 or
> Cortex-M4. Those CPUs do not have an RTL configurable number of
> MPU regions, and always provide 8 regions if the MPU is built in.


With the typo fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
