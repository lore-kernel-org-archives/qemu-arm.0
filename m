Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86caa8sm4789219f8f.25.2025.02.26.01.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:06:02 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5983B5F87C;
	Wed, 26 Feb 2025 09:06:01 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 4/9] target/arm: Always apply CNTVOFF_EL2 for
 CNTV_TVAL_EL02 accesses
In-Reply-To: <20250204125009.2281315-5-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 4 Feb 2025 12:50:04 +0000")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<20250204125009.2281315-5-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 26 Feb 2025 09:06:01 +0000
Message-ID: <87ikox3wjq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TeEbGw1hPLOt

Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we handle CNTV_TVAL_EL02 by calling gt_tval_read() for the
> EL1 virt timer.  This is almost correct, but the underlying
> CNTV_TVAL_EL0 register behaves slightly differently.  CNTV_TVAL_EL02
> always applies the CNTVOFF_EL2 offset; CNTV_TVAL_EL0 doesn't do so if
> we're at EL2 and HCR_EL2.E2H is 1.
>
> We were getting this wrong, because we ended up in
> gt_virt_cnt_offset() and did the E2H check.
>
> Factor out the tval read/write calculation from the selection of the
> offset, so that we can special case gt_virt_tval_read() and
> gt_virt_tval_write() to unconditionally pass CNTVOFF_EL2.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
