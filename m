Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u41sm20368884wrc.24.2017.03.20.03.59.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2017 03:59:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8924B3E018C;
	Mon, 20 Mar 2017 10:59:54 +0000 (GMT)
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org> <1487616072-9226-4-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.10
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 3/4] arm: Enforce should-be-1 bits in MRS decoding
In-reply-to: <1487616072-9226-4-git-send-email-peter.maydell@linaro.org>
Date: Mon, 20 Mar 2017 10:59:54 +0000
Message-ID: <87o9wwnrh1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: dUwO9FkrCY6W


Peter Maydell <peter.maydell@linaro.org> writes:

> The MRS instruction requires that bits [19..16] are all 1s, and for
> A/R profile also that bits [7..0] are all 0s.  At this point in the
> decode tree we have checked all of the rest of the instruction but
> were allowing these to be any value.  If these bits are not set then
> the result is architecturally UNPREDICTABLE, but choosing to UNDEF is
> more helpful to the user and avoids unexpected odd behaviour if the
> encodings are used for some purpose in future architecture versions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


> ---
>  target/arm/translate.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 0f8548f..9090356 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10498,6 +10498,14 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                              break;
>                          }
>
> +                        if (extract32(insn, 16, 4) != 0xf) {
> +                            goto illegal_op;
> +                        }
> +                        if (!arm_dc_feature(s, ARM_FEATURE_M) &&
> +                            extract32(insn, 0, 8) != 0) {
> +                            goto illegal_op;
> +                        }
> +
>                          /* mrs cpsr */
>                          tmp = tcg_temp_new_i32();
>                          if (arm_dc_feature(s, ARM_FEATURE_M)) {
> @@ -10525,6 +10533,12 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
>                              goto illegal_op;
>                          }
> +
> +                        if (extract32(insn, 16, 4) != 0xf ||
> +                            extract32(insn, 0, 8) != 0) {
> +                            goto illegal_op;
> +                        }
> +
>                          tmp = load_cpu_field(spsr);
>                          store_reg(s, rd, tmp);
>                          break;


--
Alex Bennée
