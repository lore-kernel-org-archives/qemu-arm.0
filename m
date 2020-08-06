Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o30sm6317412wra.67.2020.08.06.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 04:47:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ED7811FF7E;
	Thu,  6 Aug 2020 12:47:40 +0100 (BST)
References: <20200806104453.30393-1-peter.maydell@linaro.org>
 <20200806104453.30393-4-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/4] target/arm: Implement FPST_STD_F16 fpstatus
In-reply-to: <20200806104453.30393-4-peter.maydell@linaro.org>
Date: Thu, 06 Aug 2020 12:47:40 +0100
Message-ID: <87ft90knc3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Q/rDDjAJFyJF


Peter Maydell <peter.maydell@linaro.org> writes:

> Architecturally, Neon FP16 operations use the "standard FPSCR" like
> all other Neon operations.  However, this is defined in the Arm ARM
> pseudocode as "a fixed value, except that FZ16 (and AHP) follow the
> FPSCR bits". In QEMU, the softfloat float_status doesn't include
> separate flush-to-zero for FP16 operations, so we must keep separate
> fp_status for "Neon non-FP16" and "Neon fp16" operations, in the
> same way we do already for the non-Neon "fp_status" vs "fp_status_f16".
>
> Add the extra float_status field to the CPU state structure,
> ensure it is correctly initialized and updated on FPSCR writes,
> and make fpstatus_ptr(FPST_STD_F16) return a pointer to it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
