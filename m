Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id xx3sm2021736wjc.32.2016.01.21.07.54.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 07:54:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E7F223E0257;
	Thu, 21 Jan 2016 15:54:54 +0000 (GMT)
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com> <1453375108-25229-3-git-send-email-edgar.iglesias@gmail.com>
User-agent: mu4e 0.9.15; emacs 25.0.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v2 2/3] target-arm: Make pamax an argument to check_s2_startlevel
In-reply-to: <1453375108-25229-3-git-send-email-edgar.iglesias@gmail.com>
Date: Thu, 21 Jan 2016 15:54:54 +0000
Message-ID: <8760ync4hd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: M5vmalF6A91t


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Make pamax an argument to check_s2_startlevel in preparation
> for future reuse.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8aedce9..4abeb4d 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6579,7 +6579,8 @@ typedef enum {
>   * Returns true if the suggested starting level is OK and false otherwise.
>   */
>  static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
> -                                int inputsize, int stride)
> +                                int inputsize, int stride,
> +                                unsigned int pamax)
>  {

If you fix the docstring above you can have my:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


>      const int grainsize = stride + 3;
>      int startsizecheck;
> @@ -6595,8 +6596,6 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
>      }
>
>      if (is_aa64) {
> -        unsigned int pamax = arm_pamax(cpu);
> -
>          switch (stride) {
>          case 13: /* 64KB Pages.  */
>              if (level == 0 || (level == 1 && pamax <= 42)) {
> @@ -6808,6 +6807,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>           * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
>           */
>          int startlevel = extract32(tcr->raw_tcr, 6, 2);
> +        unsigned int pamax = arm_pamax(cpu);
>          bool ok;
>
>          if (va_size == 32 || stride == 9) {
> @@ -6820,7 +6820,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>
>          /* Check that the starting level is valid. */
>          ok = check_s2_startlevel(cpu, va_size == 64, level,
> -                                 inputsize, stride);
> +                                 inputsize, stride, pamax);
>          if (!ok) {
>              /* AArch64 reports these as level 0 faults.
>               * AArch32 reports these as level 1 faults.


--
Alex Bennée
