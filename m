Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j10-20020adfc68a000000b0020c635ca28bsm2399115wrg.87.2022.05.13.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:08:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 99C241FFB7;
	Fri, 13 May 2022 16:08:56 +0100 (BST)
References: <20220513131801.4082712-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.20; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Date: Fri, 13 May 2022 16:08:51 +0100
In-reply-to: <20220513131801.4082712-1-peter.maydell@linaro.org>
Message-ID: <87zgjlqxkn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I1jg2OhRAxFN


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 88ce6c6ee85d we switched from directly fishing the number
> of breakpoints and watchpoints out of the ID register fields to
> abstracting out functions to do this job, but we forgot to delete the
> now-obsolete comment in define_debug_regs() about the relation
> between the ID field value and the actual number of breakpoints and
> watchpoints.  Delete the obsolete comment.
>
> Reported-by: CHRIS HOWARD <cvz185@web.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
