Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7656d5d5asm77162866b.48.2025.02.05.06.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:40:48 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 686F35F90B;
	Wed,  5 Feb 2025 14:40:47 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 07/14] target/arm: Honour SDCR.TDCC and SCR.TERR in
 AArch32 EL3 non-Monitor modes
In-Reply-To: <20250130182309.717346-8-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 30 Jan 2025 18:23:02 +0000")
References: <20250130182309.717346-1-peter.maydell@linaro.org>
	<20250130182309.717346-8-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 14:40:47 +0000
Message-ID: <87seos8nf4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jUvm+VdLSGhB

Peter Maydell <peter.maydell@linaro.org> writes:

> There are not many traps in AArch32 which should trap to Monitor
> mode, but these trap bits should trap not just lower ELs to Monitor
> mode but also the non-Monitor modes running at EL3 (i.e.  Secure
> System, Secure Undef, etc).
>
> We get this wrong because the relevant access functions implement the
> AArch64-style logic of
>    if (el < 3 && trap_bit_set) {
>        return CP_ACCESS_TRAP_EL3;
>    }
> which won't trap the non-Monitor modes at EL3.
>
> Correct this error by using arm_is_el3_or_mon() instead, which
> returns true when the CPU is at AArch64 EL3 or AArch32 Monitor mode.
> (Since the new callsites are compiled also for the linux-user mode,
> we need to provide a dummy implementation for CONFIG_USER_ONLY.)
>
> This affects only:
>  * trapping of ERRIDR via SCR.TERR
>  * trapping of the debug channel registers via SDCR.TDCC
>  * trapping of GICv3 registers via SCR.IRQ and SCR.FIQ
>    (which we already used arm_is_el3_or_mon() for)
>
> This patch changes the handling of SCR.TERR and SDCR.TDCC. This
> patch only changes guest-visible behaviour for "-cpu max" on
> the qemu-system-arm binary, because SCR.TERR
> and SDCR.TDCC (and indeed the entire SDCR register) only arrived
> in Armv8, and the only guest CPU we support which has any v8
> features and also starts in AArch32 EL3 is the 32-bit 'max'.
>
> Other uses of CP_ACCESS_TRAP_EL3 don't need changing:
>
>  * uses in code paths that can't happen when EL3 is AArch32:
>    access_trap_aa32s_el1, cpacr_access, cptr_access, nsacr_access
>  * uses which are in accessfns for AArch64-only registers:
>    gt_stimer_access, gt_cntpoff_access, access_hxen, access_tpidr2,
>    access_smpri, access_smprimap, access_lor_ns, access_pauth,
>    access_mte, access_tfsr_el2, access_scxtnum, access_fgt
>  * trap bits which exist only in the AArch64 version of the
>    trap register, not the AArch32 one:
>    access_tpm, pmreg_access, access_dbgvcr32, access_tdra,
>    access_tda, access_tdosa (TPM, TDA and TDOSA exist only in
>    MDCR_EL3, not in SDCR, and we enforce this in sdcr_write())
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
