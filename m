Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id a23-20020a5d4577000000b00228cbac7a25sm7524177wrc.64.2022.11.07.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:19:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2736E1FFB7;
	Mon,  7 Nov 2022 14:19:29 +0000 (GMT)
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com, Francesco
 Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
Date: Mon, 07 Nov 2022 14:15:21 +0000
In-reply-to: <20221104184101.6923-2-fcagnin@quarkslab.com>
Message-ID: <87a652hmoe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DdeYcsXv2ljB


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
>  target/arm/internals.h    |  50 +++++++

Moving out of kvm64.c seems fine to me but I wonder if debug_helper.c is
the best location. debug_helpers is currently very focused on just
handling the TCG emulation case where as we are doing this tracking just
for the VMM cases or KVM and now HVF.

We are (slowly) trying to clean up the code in target/arm so we can
support builds like --disable-tcg and to do that we want to avoid too
much ifdef hackery in the individual compilation units.

Peter, what do you think?


>  target/arm/kvm64.c        | 276 --------------------------------------
>  3 files changed, 291 insertions(+), 276 deletions(-)
<snip>

--=20
Alex Benn=C3=A9e
