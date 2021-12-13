Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k187sm7344987wme.0.2021.12.13.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:52:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 03F311FF96;
	Mon, 13 Dec 2021 11:52:41 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-9-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse
 GITS_TYPE_PHYSICAL define
Date: Mon, 13 Dec 2021 11:52:35 +0000
In-reply-to: <20211211191135.1764649-9-peter.maydell@linaro.org>
Message-ID: <87bl1kn2lz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pNaKINiTwa69


Peter Maydell <peter.maydell@linaro.org> writes:

> The GITS_TYPE_PHYSICAL define is the value we set the
> GITS_TYPER.Physical field to -- this is 1 to indicate that we support
> physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
> field.) We also use this define as the *value* that we write into an
> interrupt translation table entry's INTTYPE field, which should be 1
> for a physical interrupt and 0 for a virtual interrupt.  Finally, we
> use it as a *mask* when we read the interrupt translation table entry
> INTTYPE field.
>
> Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
> ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
> field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
> use of the FIELD() macro to define the fields of an ITE and the
> FIELD_EX64() and FIELD_DP64() macros to read and write them.
> We use ITE in the new setup, rather than ITE_ENTRY, because
> ITE stands for "Interrupt translation entry" and so the extra
> "entry" would be redundant.
>
> We take the opportunity to correct the name of the field that holds
> the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
> GICv3, which is why we were calling it the 'spurious' field).
>
> The GITS_TYPE_PHYSICAL define is then used in only one place, where
> we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
> essentially a boolean, hiding the '1' value behind a macro is more
> confusing than helpful, so expand out the macro there and remove the
> define entirely.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
