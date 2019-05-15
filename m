Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x22sm2670420wmi.4.2019.05.15.06.11.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 06:11:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7A3431FF87;
	Wed, 15 May 2019 14:11:03 +0100 (BST)
References: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>, "peter.maydell\@linaro.org" <peter.maydell@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, "richard.henderson\@linaro.org" <richard.henderson@linaro.org>, "alistair23\@gmail.com" <alistair23@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/1] target/arm: Fix vector operation segfault
In-reply-to: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
Date: Wed, 15 May 2019 14:11:03 +0100
Message-ID: <87tvdvn9qw.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jOV3k1iQzkfG


Alistair Francis <Alistair.Francis@wdc.com> writes:

> Commit 89e68b575 "target/arm: Use vector operations for saturation"
> causes this abort() when booting QEMU ARM with a Cortex-A15:

You may want to check your email settings because when I tried to apply
this patch it failed because the message is base64 encoded which choked git=
-am:

  Content-Type: text/plain; charset=3D"utf-8"
  Content-Transfer-Encoding: base64

--
Alex Benn=C3=A9e
