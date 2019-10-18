Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p68sm3167756wme.0.2019.10.18.10.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 10:58:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 567891FF87;
	Fri, 18 Oct 2019 18:58:23 +0100 (BST)
References: <20191017044232.27601-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH 0/4] target/arm vector improvements
In-reply-to: <20191017044232.27601-1-richard.henderson@linaro.org>
Date: Fri, 18 Oct 2019 18:58:23 +0100
Message-ID: <87sgnqndfk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LskgmE9ElLwJ


Richard Henderson <richard.henderson@linaro.org> writes:

> The first patch has been seen before.
>
>   https://patchwork.ozlabs.org/patch/1115039/
>
> It had a bug and I didn't fix it right away and then forgot.
> Fixed now; I had mixed up the operand ordering for aarch32.
>
> The next 3 are something that I noticed while doing other stuff.
>
> In particular, pmull is used heavily during https transfers.
> While cloning a repository, the old code peaks at 27% of the
> total runtime, as measured by perf top.  The new code does
> not quite reach 3% repeating the same clone.
>
> In addition, the new helper functions are in the form that
> will be required for the implementation of SVE2.
>
> The comment in patch 2 about ARMv8.4-DIT is perhaps a stretch,
> but re-reading the pmull instruction description in the current
> ARM ARM brought it to mind.
>
> Since TCG is officially not in the security domain, it's
> probably not a bug to just claim to support DIT without
> actually doing anything to ensure the algorithms used are in
> fact timing independent of the data.
>
> On the other hand, I expect the bit distribution of stuff
> going through these sort of hashing algorithms to approach
> 50% 1's and 0's, so I also don't think we gain anything on
> average to terminate the loop early.
>
> Thoughts on DIT specifically?

It would be an interesting academic exercise to see if someone could
exploit the JIT from the guest but as you say not a security domain
so....

>
>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Vectorize USHL and SSHL
>   target/arm: Convert PMUL.8 to gvec
>   target/arm: Convert PMULL.64 to gvec
>   target/arm: Convert PMULL.8 to gvec
>
>  target/arm/helper-sve.h    |   2 +
>  target/arm/helper.h        |  21 ++-
>  target/arm/translate.h     |   6 +
>  target/arm/neon_helper.c   | 117 -------------
>  target/arm/translate-a64.c |  83 ++++-----
>  target/arm/translate.c     | 350 ++++++++++++++++++++++++++++++++-----
>  target/arm/vec_helper.c    | 211 ++++++++++++++++++++++
>  7 files changed, 562 insertions(+), 228 deletions(-)


--
Alex Benn=C3=A9e
