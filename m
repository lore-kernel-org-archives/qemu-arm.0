Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id m25-20020a05600c3b1900b003d9ed49ee2bsm28754146wms.1.2023.01.15.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 14:50:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3BF161FFB7;
	Sun, 15 Jan 2023 22:50:41 +0000 (GMT)
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
Date: Sun, 15 Jan 2023 22:50:17 +0000
In-reply-to: <20230114161302.94595-2-fcagnin@quarkslab.com>
Message-ID: <871qnvcszj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4RtVMIhSmXpP


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>


Haven't I reviewed this already? Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
