Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b199sm13061956wmb.13.2017.03.20.03.56.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2017 03:56:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4D67B3E018C;
	Mon, 20 Mar 2017 10:57:01 +0000 (GMT)
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org> <1487616072-9226-3-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.10
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 2/4] arm: Don't decode MRS(banked) or MSR(banked) for M profile
In-reply-to: <1487616072-9226-3-git-send-email-peter.maydell@linaro.org>
Date: Mon, 20 Mar 2017 10:57:01 +0000
Message-ID: <87pohcnrlu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: QpA75yze2Uqw


Peter Maydell <peter.maydell@linaro.org> writes:

> M profile doesn't have the MSR(banked) and MRS(banked) instructions
> and uses the encodings for different kinds of M-profile MRS/MSR.
> Guard the relevant bits of the decode logic to make sure we don't
> accidentally fall into them by accident on M-profile.

The ARMv7-A documentation talks about banked registers being a feature
of application processors with Virtualisation Extensions which make the
sense of the test a bit weird. But I guess they are functionally
equivalent. Are there in practice any -A cores without virt?

>
> (The bit being checked for this (bit 5) is part of the SYSm field on
> M-profile, but since no currently allocated system registers have
> encodings with bit 5 of SYSm set, this hasn't been a problem in
> practice.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Anyway digressions aside:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 895b399..0f8548f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10488,7 +10488,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          gen_exception_return(s, tmp);
>                          break;
>                      case 6: /* MRS */
> -                        if (extract32(insn, 5, 1)) {
> +                        if (extract32(insn, 5, 1) &&
> +                            !arm_dc_feature(s, ARM_FEATURE_M)) {
>                              /* MRS (banked) */
>                              int sysm = extract32(insn, 16, 4) |
>                                  (extract32(insn, 4, 1) << 4);
> @@ -10509,7 +10510,8 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          store_reg(s, rd, tmp);
>                          break;
>                      case 7: /* MRS */
> -                        if (extract32(insn, 5, 1)) {
> +                        if (extract32(insn, 5, 1) &&
> +                            !arm_dc_feature(s, ARM_FEATURE_M)) {
>                              /* MRS (banked) */
>                              int sysm = extract32(insn, 16, 4) |
>                                  (extract32(insn, 4, 1) << 4);


--
Alex Bennée
