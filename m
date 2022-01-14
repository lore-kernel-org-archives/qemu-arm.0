Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u16sm4360101wmq.41.2022.01.14.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 07:50:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BA3041FFB7;
	Fri, 14 Jan 2022 15:50:34 +0000 (GMT)
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb
 range flush
Date: Fri, 14 Jan 2022 15:48:54 +0000
In-reply-to: <20220110164754.1066025-1-idan.horowitz@gmail.com>
Message-ID: <87ilum8gfp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SvpP7Yk1eDIa


Idan Horowitz <idan.horowitz@gmail.com> writes:

> When the length of the range is large enough, clearing the whole cache is
> faster than iterating over the (possibly extremely large) set of pages
> contained in the range.
>
> This mimics the pre-existing similar optimization done on the flush of the
> tlb itself.
>
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

For multi-patch series please include a cover letter which is the parent
of all the patches. This is the default for git-send-email.

The code itself looks fine but what sort of improvements are we talking
about here? What measurements have you taken and under what conditions?

--=20
Alex Benn=C3=A9e
