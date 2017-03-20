Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d42sm20376491wrd.37.2017.03.20.03.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2017 03:47:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3E4903E018C;
	Mon, 20 Mar 2017 10:48:12 +0000 (GMT)
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org> <1487616072-9226-2-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.10
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 1/4] arm: HVC and SMC encodings don't exist for M profile
In-reply-to: <1487616072-9226-2-git-send-email-peter.maydell@linaro.org>
Date: Mon, 20 Mar 2017 10:48:12 +0000
Message-ID: <87r31sns0j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: wsB7xxYq69H8


Peter Maydell <peter.maydell@linaro.org> writes:

> M profile doesn't have the HVC or SMC encodings, so make them always
> UNDEF rather than generating calls to helper functions that assume
> A/R profile.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 9fded03..895b399 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10365,6 +10365,9 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                      goto illegal_op;
>
>                  if (insn & (1 << 26)) {
> +                    if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +                        goto illegal_op;
> +                    }
>                      if (!(insn & (1 << 20))) {
>                          /* Hypervisor call (v7) */
>                          int imm16 = extract32(insn, 16, 4) << 12


--
Alex Bennée
