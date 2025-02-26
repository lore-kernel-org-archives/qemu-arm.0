Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532d7asm13929045e9.13.2025.02.26.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:07:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 94F305F87C;
	Wed, 26 Feb 2025 09:07:16 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 5/9] target/arm: Refactor handling of timer offset
 for direct register accesses
In-Reply-To: <20250204125009.2281315-6-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 4 Feb 2025 12:50:05 +0000")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<20250204125009.2281315-6-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 26 Feb 2025 09:07:16 +0000
Message-ID: <87cyf53whn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yT9Is2Cuj9CX

Peter Maydell <peter.maydell@linaro.org> writes:

> When reading or writing the timer registers, sometimes we need to
> apply one of the timer offsets.  Specifically, this happens for
> direct reads of the counter registers CNTPCT_EL0 and CNTVCT_EL0 (and
> their self-synchronized variants CNTVCTSS_EL0 and CNTPCTSS_EL0).  It
> also applies for direct reads and writes of the CNT*_TVAL_EL*
> registers that provide the 32-bit downcounting view of each timer.
>
> We currently do this with duplicated code in gt_tval_read() and
> gt_tval_write() and a special-case in gt_virt_cnt_read() and
> gt_cnt_read().  Refactor this so that we handle it all in a single
> function gt_direct_access_timer_offset(), to parallel how we handle
> the offset for indirect accesses.
>
> The call in the WFIT helper previously to gt_virt_cnt_offset() is
> now to gt_direct_access_timer_offset(); this is the correct
> behaviour, but it's not immediately obvious that it shouldn't be
> considered an indirect access, so we add an explanatory comment.
>
> This commit should make no behavioural changes.
>
> (Cc to stable because the following bugfix commit will
> depend on this one.)
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
