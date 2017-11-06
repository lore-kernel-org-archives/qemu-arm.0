Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u5sm2774694wmf.44.2017.11.06.08.10.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Nov 2017 08:10:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 5B6263E040E;
	Mon,  6 Nov 2017 16:10:10 +0000 (GMT)
References: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 1.0-alpha0; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] arm: check regime, not current state, for ATS write PAR format
In-reply-to: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 06 Nov 2017 16:10:10 +0000
Message-ID: <87375rs80t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ug7+Ti154Gfw


Peter Maydell <peter.maydell@linaro.org> writes:

> In do_ats_write(), rather than using extended_addresses_enabled() to
> decide whether the value we get back from get_phys_addr() is a 64-bit
> format PAR or a 32-bit one, use arm_s1_regime_using_lpae_format().
>
> This is not really the correct answer, because the PAR format
> depends on the AT instruction being used, not just on the
> translation regime. However getting this correct requires a
> significant refactoring, so that get_phys_addr() returns raw
> information about the fault which the caller can then assemble
> into a suitable FSR/PAR/syndrome for its purposes, rather than
> get_phys_addr() returning a pre-formatted FSR.
>
> However this change at least improves the situation by making
> the PAR work correctly for address translation operations done
> at AArch64 EL2 on the EL2 translation regime. In particular,
> this is necessary for Xen to be able to run in our emulation,
> so this seems like a safer interim fix given that we are in freeze.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

As far as it goes it seems reasonable:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> I guess I should have a go at the "correct answer" I sketch
> above, but no promises about when I'll get time for that :-(
>
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96113fe..37af750 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint=
64_t value,
>
>      ret =3D get_phys_addr(env, value, access_type, mmu_idx,
>                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi=
);
> -    if (extended_addresses_enabled(env)) {
> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>          /* fsr is a DFSR/IFSR value for the long descriptor
>           * translation table format, but with WnR always clear.
>           * Convert it to a 64-bit PAR.


--
Alex Benn=C3=A9e
