Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003c6b9749505sm22440681wmq.30.2022.11.22.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:06:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D9D181FFB7;
	Tue, 22 Nov 2022 10:06:46 +0000 (GMT)
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v2 1/3] arm: move KVM breakpoints helpers
Date: Tue, 22 Nov 2022 10:06:21 +0000
In-reply-to: <20221116174749.65175-2-fcagnin@quarkslab.com>
Message-ID: <87o7szb8w9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pAyg+QDYDHYx


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Peter,

I assume as this is all in target/arm you'll take it via your tree?

--=20
Alex Benn=C3=A9e
