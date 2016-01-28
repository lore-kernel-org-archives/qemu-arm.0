Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v82sm3145800wmv.12.2016.01.28.06.30.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2016 06:30:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6D7093E0192;
	Thu, 28 Jan 2016 14:30:14 +0000 (GMT)
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com> <1453932970-14576-3-git-send-email-edgar.iglesias@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.50.8
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v4 2/3] target-arm: Rename check_s2_startlevel to check_s2_mmu_setup
In-reply-to: <1453932970-14576-3-git-send-email-edgar.iglesias@gmail.com>
Date: Thu, 28 Jan 2016 14:30:14 +0000
Message-ID: <871t91ixop.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: EtK9YdUHkPUP


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Rename check_s2_startlevel to check_s2_mmu_setup in preparation
> for additional checks.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target-arm/helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 5d6f297..13e9933 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6763,17 +6763,18 @@ typedef enum {
>  } MMUFaultType;
>
>  /*
> - * check_s2_startlevel
> + * check_s2_mmu_setup
>   * @cpu:        ARMCPU
>   * @is_aa64:    True if the translation regime is in AArch64 state
>   * @startlevel: Suggested starting level
>   * @inputsize:  Bitsize of IPAs
>   * @stride:     Page-table stride (See the ARM ARM)
>   *
> - * Returns true if the suggested starting level is OK and false otherwise.
> + * Returns true if the suggested S2 translation parameters are OK and
> + * false otherwise.
>   */
> -static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
> -                                int inputsize, int stride)
> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> +                               int inputsize, int stride)
>  {
>      const int grainsize = stride + 3;
>      int startsizecheck;
> @@ -7013,8 +7014,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          }
>
>          /* Check that the starting level is valid. */
> -        ok = check_s2_startlevel(cpu, va_size == 64, level,
> -                                 inputsize, stride);
> +        ok = check_s2_mmu_setup(cpu, va_size == 64, level, inputsize, stride);
>          if (!ok) {
>              /* AArch64 reports these as level 0 faults.
>               * AArch32 reports these as level 1 faults.


--
Alex Bennée
