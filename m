Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w8sm11337389wjx.21.2016.01.28.06.31.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2016 06:31:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A469E3E0192;
	Thu, 28 Jan 2016 14:31:49 +0000 (GMT)
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com> <1453932970-14576-4-git-send-email-edgar.iglesias@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.50.8
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v4 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
In-reply-to: <1453932970-14576-4-git-send-email-edgar.iglesias@gmail.com>
Date: Thu, 28 Jan 2016 14:31:49 +0000
Message-ID: <87zivphj1m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 8frZUTP/ehio


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Implement the inputsize > pamax check for Stage 2 translations.
> This is CONSTRAINED UNPREDICTABLE and we choose to fault.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Much cleaner now, thanks.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target-arm/helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 13e9933..9f75840 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6790,6 +6790,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>      }
>
>      if (is_aa64) {
> +        CPUARMState *env = &cpu->env;
>          unsigned int pamax = arm_pamax(cpu);
>
>          switch (stride) {
> @@ -6811,6 +6812,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>          default:
>              g_assert_not_reached();
>          }
> +
> +        /* Inputsize checks.  */
> +        if (inputsize > pamax &&
> +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> +            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
> +            return false;
> +        }
>      } else {
>          /* AArch32 only supports 4KB pages. Assert on that.  */
>          assert(stride == 9);


--
Alex Bennée
