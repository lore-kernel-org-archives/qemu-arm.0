Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j2sm6626781wrp.46.2020.08.06.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 04:44:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B1D311FF7E;
	Thu,  6 Aug 2020 12:44:43 +0100 (BST)
References: <20200806104453.30393-1-peter.maydell@linaro.org>
 <20200806104453.30393-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] target/arm: Replace A64 get_fpstatus_ptr() with
 generic fpstatus_ptr()
In-reply-to: <20200806104453.30393-2-peter.maydell@linaro.org>
Date: Thu, 06 Aug 2020 12:44:43 +0100
Message-ID: <87lfisknh0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: T6YLTRkYaqZJ


Peter Maydell <peter.maydell@linaro.org> writes:

> We currently have two versions of get_fpstatus_ptr(), which both take
> an effectively boolean argument:
>  * the one for A64 takes "bool is_f16" to distinguish fp16 from other ops
>  * the one for A32/T32 takes "int neon" to distinguish Neon from other ops
>
> This is confusing, and to implement ARMv8.2-FP16 the A32/T32 one will
> need to make a four-way distinction between "non-Neon, FP16",
> "non-Neon, single/double", "Neon, FP16" and "Neon, single/double".
> The A64 version will then be a strict subset of the A32/T32 version.
>
> To clean this all up, we want to go to a single implementation which
> takes an enum argument with values FPST_FPCR, FPST_STD,
> FPST_FPCR_F16, and FPST_STD_F16.  We rename the function to
> fpstatus_ptr() so that unconverted code gets a compilation error
> rather than silently passing the wrong thing to the new function.
>
> This commit implements that new API, and converts A64 to use it:
>  get_fpstatus_ptr(false) -> fpstatus_ptr(FPST_FPCR)
>  get_fpstatus_ptr(true) -> fpstatus_ptr(FPST_FPCR_F16)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

How many more can they add ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
