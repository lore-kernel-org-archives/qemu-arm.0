Received: by 10.25.0.147 with SMTP id 141csp1129060lfa;
        Sun, 5 Mar 2017 13:56:33 -0800 (PST)
X-Received: by 10.55.192.195 with SMTP id v64mr6795089qkv.155.1488750993122;
        Sun, 05 Mar 2017 13:56:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si14152527qtb.186.2017.03.05.13.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 13:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cke8k-0008Nu-Fy
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 16:56:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cke8d-0008MP-Ap
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cke8c-0001N3-CP
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:56:23 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cke8X-0001KN-Fu; Sun, 05 Mar 2017 16:56:17 -0500
Received: by mail-qk0-x244.google.com with SMTP id v125so1862579qkh.1;
	Sun, 05 Mar 2017 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7FCOl2x061I4ZaPV8DdyRW/fiapzDZXtUn4DG/sO7Sc=;
	b=O1YHkI/spVB8Mc6Ii+1TT6shmE1o4VwIzkzL2lkJ1366XitH1Dwk3WgZVq1N1mDZwi
	dZLiTJaK9Z2W5Yxc/3tTs0wfsfQaVxkuEqPT4xdWXoczSDsS88WtHhs7cqyB0Pnl3vRf
	DDak+yYQhpTcNXMTwLQ/W5e8qe9qrOM2biVtoKC7yZg82bBy5JGdPBkUHSiWjv9pUdmm
	EOqQer9Dk5+IL5a68jAP1ZuVIJG6ULJMAc6F+qnccK9YQ2U8W4h+/kDL5hqDBQL9GM5y
	GWu9aCAtS5tXXNwAj2KwIVbv+3urInl9e0ItC9wJKjmX12+Xg51E+zGG7Ac+afCr9B6p
	I33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7FCOl2x061I4ZaPV8DdyRW/fiapzDZXtUn4DG/sO7Sc=;
	b=dy6n8lj8seR7H9hMtaOPf/aePitI6ulIguk74WBq4KjdGd78g5RC+cC3uW9pmgV8CW
	J4hOrUiPnf4vinSzsH2c/5BSF1lIPMqJ9yucniOXU0GIgBpjjXDCu0vF9ohmJecEWdfZ
	wZa/0Y9tRQlWNVl0SfJ1l5+iIhvDoPs05nex0vI9j1STz1926fjD1sU7+NgD91rP7xu4
	fGCKiLA63YzfWv734yu2QxxRETnFieD2sEj+6WDEybCxF30kP5IMw6WmG68iUWD1WvKN
	+ls1ccKbgGk5zXj4lKGmSKehh9rANdsquaSBzvSDDjz1jh+oPUVEnMkJazbIVSk3RbnF
	k3hg==
X-Gm-Message-State: AMke39nDWWgT1EqBYCkW5ZrODwCX09HvyAVh+1Y+lpNif6YP3ZO5GuTvLfJrmxXG80j4vg==
X-Received: by 10.200.1.14 with SMTP id e14mr14088891qtg.244.1488750973984;
	Sun, 05 Mar 2017 13:56:13 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	w35sm5005597qtc.55.2017.03.05.13.56.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Mar 2017 13:56:13 -0800 (PST)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170305214857.9510-1-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67b0d01e-219a-9df6-1e46-f763e879e767@amsat.org>
Date: Sun, 5 Mar 2017 18:56:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170305214857.9510-1-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Convert fprintf to
 error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y8q+UOzj1wca

Hi Krzysztof,

On 03/05/2017 06:48 PM, Krzysztof Kozlowski wrote:
> error_report() is preferred over fprintf() for logging errors.  Also
> remove square brackets [] and additional new line characters in printed
> messages.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/arm/exynos4_boards.c   |  6 +++---
>  hw/timer/exynos4210_mct.c |  5 +++--
>  hw/timer/exynos4210_pwm.c | 11 +++++------
>  hw/timer/exynos4210_rtc.c | 16 +++++++---------
>  4 files changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 0efa19405409..5cd94d402b52 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -22,6 +22,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "sysemu/sysemu.h"
> @@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(MachineState *machine,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>
>      if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
> -        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring smp_cpus"
> -                " value.\n",
> -                mc->name, EXYNOS4210_NCPUS);
> +        error_report("%s board supports only %d CPU cores. Ignoring smp_cpus value.",
> +                     mc->name, EXYNOS4210_NCPUS);

ok, to inform the user

>      }
>
>      exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 6069116942a4..48041ab036a6 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -53,6 +53,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu/main-loop.h"
> @@ -1364,8 +1365,8 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>      case L0_TCNTO: case L1_TCNTO:
>      case L0_ICNTO: case L1_ICNTO:
>      case L0_FRCNTO: case L1_FRCNTO:
> -        fprintf(stderr, "\n[exynos4210.mct: write to RO register "
> -                TARGET_FMT_plx "]\n\n", offset);
> +        error_report("exynos4210.mct: write to RO register " TARGET_FMT_plx,
> +                     offset);

no need to annoy the user here, it seems better to use 
qemu_log_mask(LOG_UNIMP, ...

same for following diffs

>          break;
>
>      case L0_INT_CSTAT: case L1_INT_CSTAT:
> diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
> index f5765075c720..f8826e24e63d 100644
> --- a/hw/timer/exynos4210_pwm.c
> +++ b/hw/timer/exynos4210_pwm.c
> @@ -21,6 +21,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu-common.h"
> @@ -252,9 +253,8 @@ static uint64_t exynos4210_pwm_read(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.pwm: bad read offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        error_report("exynos4210.pwm: bad read offset " TARGET_FMT_plx,
> +                     offset);
>          break;
>      }
>      return value;
> @@ -343,9 +343,8 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.pwm: bad write offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        error_report("exynos4210.pwm: bad write offset " TARGET_FMT_plx,
> +                     offset);
>          break;
>
>      }
> diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
> index 1a648c5d9e67..f4548cd555f4 100644
> --- a/hw/timer/exynos4210_rtc.c
> +++ b/hw/timer/exynos4210_rtc.c
> @@ -26,6 +26,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu-common.h"
> @@ -370,9 +371,8 @@ static uint64_t exynos4210_rtc_read(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.rtc: bad read offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        error_report("exynos4210.rtc: bad read offset " TARGET_FMT_plx,
> +                     offset);
>          break;
>      }
>      return value;
> @@ -433,9 +433,8 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
>          if (value > TICNT_THRESHOLD) {
>              s->reg_ticcnt = value;
>          } else {
> -            fprintf(stderr,
> -                    "[exynos4210.rtc: bad TICNT value %u ]\n",
> -                    (uint32_t)value);
> +            error_report("exynos4210.rtc: bad TICNT value %u",
> +                         (uint32_t)value);
>          }
>          break;
>
> @@ -500,9 +499,8 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.rtc: bad write offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        error_report("exynos4210.rtc: bad write offset " TARGET_FMT_plx,
> +                     offset);
>          break;
>
>      }
>
