Received: by 10.25.77.4 with SMTP id a4csp1302958lfb;
        Mon, 13 Mar 2017 12:26:53 -0700 (PDT)
X-Received: by 10.237.43.69 with SMTP id p63mr33139093qtd.68.1489433213617;
        Mon, 13 Mar 2017 12:26:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si1164823qtc.331.2017.03.13.12.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnVcJ-0001Fo-2C
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:26:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVcE-0001EN-Jf
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVcD-0005Te-GO
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:26:46 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVc7-0005QC-HF; Mon, 13 Mar 2017 15:26:39 -0400
Received: by mail-qk0-x241.google.com with SMTP id v125so38229898qkh.1;
	Mon, 13 Mar 2017 12:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xoKh7knih7BbpHjMY1KMQ3oTqPCIN4UWb/8NH9lgi2k=;
	b=rmtEuOTO0UwhwmViEZtP6JhES0/Eu4f9JlRQKfxqW/gWPZl8w/5E/hr/RWI88xwoMD
	13ANqJN/Pzca5JhHGGOblWE9ZaQ137MNrcaLDDNCQS9eyhBE5w158XrDiVebXQq/yj+M
	+x/XlY1JiZAZ3wpIqmpGTJR2mqVC+naEOHT4sAkC/2wpILnmZmCj6B35849bz8gt9MVJ
	rFsBvKL7/SPzsAHWDHuMO+cm/mL6B0S//37ugGDvzP6sGlv5+5ht9ELNnaUHFbo8W5Rx
	4dEq/2CVPcfjboSFkh1/o1ASsWks4q8+h/YB2ndi9RPTJcsDv2w12vMUTbCthEykzrzA
	B1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xoKh7knih7BbpHjMY1KMQ3oTqPCIN4UWb/8NH9lgi2k=;
	b=VwrqHDwKWWqds/LiHvf47Hlb+4haGLzha1e9ric8+MvvzDK9dQQDb0CqfN/07gRKpN
	Btsnb4a6U411052gZWD9xdWTovEuVTFuwibbFoMmCmLoVWctWTVjt+Rd0xg3QasNh2iC
	S3+kpGtLtgazfhscX09m1gpycm5+Zi8Ve0F1OlqqsSlHad2hBtbFVHqIEhsCDGHU+zI0
	RL7zGU5LSKcAa8VdoxYFu0wOe5wshJmakGvDZmRN9t7GVZ8MPHmCtT4Ghqh4xA5GDG8t
	78I0quyq+VYiVFmItGR7v1+BZW32QYzUFyWGf27YmKR1eM9blpH2+YW4Tuacxji+ONr1
	SjZw==
X-Gm-Message-State: AFeK/H2gBc5KQ8/z7T/T1ByPnesDvngjFYy8b/UB4eu8xYYWqnH2jDFOzJGbJlm9LlMXmg==
X-Received: by 10.55.87.198 with SMTP id l189mr31884818qkb.106.1489433197304; 
	Mon, 13 Mar 2017 12:26:37 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	n130sm12792119qkn.4.2017.03.13.12.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:26:36 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170313184750.429-1-krzk@kernel.org>
	<20170313184750.429-2-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8147e28b-3f6e-c21a-9b25-d2ce6818d65c@amsat.org>
Date: Mon, 13 Mar 2017 16:26:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313184750.429-2-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hw/arm/exynos: Convert fprintf to
 qemu_log_mask/error_report
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
Cc: eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kemeI+sM3VyK

On 03/13/2017 03:47 PM, Krzysztof Kozlowski wrote:
> qemu_log_mask() and error_report() are preferred over fprintf() for
> logging errors.  Also remove square brackets [] and additional new line
> characters in printed messages.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/exynos4_boards.c   |  6 +++---
>  hw/timer/exynos4210_mct.c |  6 ++++--
>  hw/timer/exynos4210_pwm.c | 13 +++++++------
>  hw/timer/exynos4210_rtc.c | 19 ++++++++++---------
>  4 files changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 0efa19405409..0a352815b86d 100644
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
> +        error_report("%s board supports only %d CPU cores, ignoring smp_cpus value",
> +                     mc->name, EXYNOS4210_NCPUS);
>      }
>
>      exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 6069116942a4..e4ef4cfd3625 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -53,6 +53,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu/main-loop.h"
> @@ -1364,8 +1365,9 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>      case L0_TCNTO: case L1_TCNTO:
>      case L0_ICNTO: case L1_ICNTO:
>      case L0_FRCNTO: case L1_FRCNTO:
> -        fprintf(stderr, "\n[exynos4210.mct: write to RO register "
> -                TARGET_FMT_plx "]\n\n", offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "exynos4210.mct: write to RO register " TARGET_FMT_plx,
> +                      offset);
>          break;
>
>      case L0_INT_CSTAT: case L1_INT_CSTAT:
> diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
> index f5765075c720..87f63f057e14 100644
> --- a/hw/timer/exynos4210_pwm.c
> +++ b/hw/timer/exynos4210_pwm.c
> @@ -21,6 +21,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu-common.h"
> @@ -252,9 +253,9 @@ static uint64_t exynos4210_pwm_read(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.pwm: bad read offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "exynos4210.pwm: bad read offset " TARGET_FMT_plx,
> +                      offset);
>          break;
>      }
>      return value;
> @@ -343,9 +344,9 @@ static void exynos4210_pwm_write(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.pwm: bad write offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "exynos4210.pwm: bad write offset " TARGET_FMT_plx,
> +                      offset);
>          break;
>
>      }
> diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
> index 1a648c5d9e67..4607833e3e6f 100644
> --- a/hw/timer/exynos4210_rtc.c
> +++ b/hw/timer/exynos4210_rtc.c
> @@ -26,6 +26,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "qemu-common.h"
> @@ -370,9 +371,9 @@ static uint64_t exynos4210_rtc_read(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.rtc: bad read offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "exynos4210.rtc: bad read offset " TARGET_FMT_plx,
> +                      offset);
>          break;
>      }
>      return value;
> @@ -433,9 +434,9 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
>          if (value > TICNT_THRESHOLD) {
>              s->reg_ticcnt = value;
>          } else {
> -            fprintf(stderr,
> -                    "[exynos4210.rtc: bad TICNT value %u ]\n",
> -                    (uint32_t)value);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "exynos4210.rtc: bad TICNT value %u",
> +                          (uint32_t)value);
>          }
>          break;
>
> @@ -500,9 +501,9 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
>          break;
>
>      default:
> -        fprintf(stderr,
> -                "[exynos4210.rtc: bad write offset " TARGET_FMT_plx "]\n",
> -                offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "exynos4210.rtc: bad write offset " TARGET_FMT_plx,
> +                      offset);
>          break;
>
>      }
>
