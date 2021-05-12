Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y5sm657691wrp.5.2021.05.12.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 12:33:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A97E61FF7E;
	Wed, 12 May 2021 20:33:55 +0100 (BST)
References: <20210512182337.18563-1-rebecca@nuviainc.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Rebecca Cran <rebecca@nuviainc.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
Date: Wed, 12 May 2021 20:32:40 +0100
In-reply-to: <20210512182337.18563-1-rebecca@nuviainc.com>
Message-ID: <875yzng318.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: l4gsLKmTWEJx


Rebecca Cran <rebecca@nuviainc.com> writes:

> Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.
>
> Changes from v8 to v9:
>
> Dropped patch 1/4, because Richard's=20
> 'accel/tcg: Add tlb_flush interface for a range of pages'
> patch replaces it.

But it's needed right? It's perfectly fine to pull someone elses patch
into your series if it's needed for the review. The alternative is to
add a "Based-on" tag to your cover letter so it's easy to find the patch
or series we need to apply before yours.

--=20
Alex Benn=C3=A9e
