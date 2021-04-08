Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d5sm25528330wrx.0.2021.04.08.04.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:35:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 372D51FF7E;
	Thu,  8 Apr 2021 12:35:47 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] target/arm: Remove log2_esize parameter to
 gen_mte_checkN
Date: Thu, 08 Apr 2021 12:35:40 +0100
In-reply-to: <20210406174031.64299-12-richard.henderson@linaro.org>
Message-ID: <875z0xt3e4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8uACONZw1Yly


Richard Henderson <richard.henderson@linaro.org> writes:

> The log2_esize parameter is not used except trivially.
> Drop the parameter and the deferral to gen_mte_check1.
>
> This fixes a bug in that the parameters as documented
> in the header file were the reverse from those in the
> implementation.  Which meant that translate-sve.c was
> passing the parameters in the wrong order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
