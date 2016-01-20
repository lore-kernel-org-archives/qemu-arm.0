Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e77sm26667088wma.18.2016.01.20.11.29.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2016 11:29:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 10A983E05AE;
	Wed, 20 Jan 2016 19:29:55 +0000 (GMT)
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com> <1453297780-12514-2-git-send-email-edgar.iglesias@gmail.com>
User-agent: mu4e 0.9.15; emacs 25.0.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v1 1/3] target-arm: Apply S2 MMU startlevel table size check to AArch64
In-reply-to: <1453297780-12514-2-git-send-email-edgar.iglesias@gmail.com>
Date: Wed, 20 Jan 2016 19:29:54 +0000
Message-ID: <87bn8gcaml.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: XyDOltm2Zggz


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The S2 starting level table size check applies to both AArch32
> and AArch64. Move it to common code.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index f956b67..8aedce9 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6581,11 +6581,19 @@ typedef enum {
>  static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
>                                  int inputsize, int stride)
>  {
> +    const int grainsize = stride + 3;
> +    int startsizecheck;
> +
>      /* Negative levels are never allowed.  */
>      if (level < 0) {
>          return false;
>      }
>
> +    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
> +    if (startsizecheck < 1 || startsizecheck > stride + 4) {
> +        return false;
> +    }
> +
>      if (is_aa64) {
>          unsigned int pamax = arm_pamax(cpu);
>
> @@ -6609,20 +6617,12 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
>              g_assert_not_reached();
>          }
>      } else {
> -        const int grainsize = stride + 3;
> -        int startsizecheck;
> -
>          /* AArch32 only supports 4KB pages. Assert on that.  */
>          assert(stride == 9);
>
>          if (level == 0) {
>              return false;
>          }
> -
> -        startsizecheck = inputsize - ((3 - level) * stride + grainsize);
> -        if (startsizecheck < 1 || startsizecheck > stride + 4) {
> -            return false;
> -        }
>      }
>      return true;
>  }

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
