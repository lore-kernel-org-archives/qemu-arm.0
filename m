Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g124sm3070135wme.28.2021.11.30.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 12:11:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 872F91FF96;
	Tue, 30 Nov 2021 20:11:05 +0000 (GMT)
References: <20211130173257.1274194-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Rebecca Cran <rebecca@nuviainc.com>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Correct calculation of tlb range invalidate
 length
Date: Tue, 30 Nov 2021 20:10:28 +0000
In-reply-to: <20211130173257.1274194-1-peter.maydell@linaro.org>
Message-ID: <875ys9z9nq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 72xU0fezRV7+


Peter Maydell <peter.maydell@linaro.org> writes:

> The calculation of the length of TLB range invalidate operations
> in tlbi_aa64_range_get_length() is incorrect in two ways:
>  * the NUM field is 5 bits, but we read only 4 bits
>  * we miscalculate the page_shift value, because of an
>    off-by-one error:
>     TG 0b00 is invalid
>     TG 0b01 is 4K granule size =3D=3D 4096 =3D=3D 2^12
>     TG 0b10 is 16K granule size =3D=3D 16384 =3D=3D 2^14
>     TG 0b11 is 64K granule size =3D=3D 65536 =3D=3D 2^16
>    so page_shift should be (TG - 1) * 2 + 12
>
> Thanks to the bug report submitter Cha HyunSoo for identifying
> both these errors.
>
> Fixes: 84940ed82552d3c

Fixes: 84940ed825 (target/arm: Add support for FEAT_TLBIRANGE)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
